cmake_minimum_required(VERSION 3.15)

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/VERSION.txt")

    file(STRINGS "${CMAKE_CURRENT_SOURCE_DIR}/VERSION.txt" VersionString NEWLINE_CONSUME)
    string(STRIP "${VersionString}" VersionString)
    set(COPASIJS_DOTTED_VERSION ${VersionString})
    string(REPLACE "." ";" VersionString "${VersionString}" )
    string(REPLACE "-" ";" VersionString "${VersionString}" )
    list(LENGTH VersionString versionLength)
    list(GET VersionString 0 COPASIJS_VERSION_MAJOR )
    list(GET VersionString 1 COPASIJS_VERSION_MINOR )
    list(GET VersionString 2 COPASIJS_VERSION_PATCH )

    if(${versionLength} GREATER 3)
        list(GET VersionString 3 COPASIJS_VERSION_RELEASE )
    endif()

endif()

# version number needs to be calculated correctly
MATH(EXPR COPASIJS_VERSION_NUMERIC "${COPASIJS_VERSION_MAJOR} * 10000 + ${COPASIJS_VERSION_MINOR} * 100 + ${COPASIJS_VERSION_PATCH}" )


project(copasijs LANGUAGES CXX VERSION ${COPASIJS_DOTTED_VERSION})

enable_testing()

set(CMAKE_CXX_STANDARD 17)

# Specify directory with dependencies
set(COPASIJS_DEPENDENCY_DIR "dependencies" CACHE PATH "Directory with dependencies")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${COPASIJS_DEPENDENCY_DIR}/share/copasi/CMakeModules")

find_package(LibCOPASISE REQUIRED)

# Add library target
if (EMSCRIPTEN)
option(COPASIJS_INCLUDE_EXAMPLE_FILES "Include example files in the build" OFF)
option(COPASIJS_SINGLE_FILE "Build single js (on) or js + wasm (if off)" OFF)
set (COPASIJS_ENVIRONMENT "web" CACHE STRING "Environment for which to build one of: web, node")

set (EXPORTED_FUNCTIONS "ccall,cwrap")
set (PRELOAD_FILE)
set (DATA_FILE)
if (COPASIJS_INCLUDE_EXAMPLE_FILES)
  set (EXPORTED_FUNCTIONS "${EXPORTED_FUNCTIONS},FS")
  set (PRELOAD_FILE "--preload-file ${CMAKE_CURRENT_SOURCE_DIR}/example_files@/")
  set (DATA_FILE "${CMAKE_CURRENT_BINARY_DIR}/copasijs.data") 
endif ()

add_executable(copasijs src/copasijs.cpp src/copasijs.h src/)

target_link_libraries(copasijs PUBLIC embind)
set(CMAKE_EXECUTABLE_SUFFIX ".js")

set(COPASIJS_OPT_FLAGS "-Os -sNO_DISABLE_EXCEPTION_CATCHING -fexceptions")
# set(COPASIJS_OPT_FLAGS "-O3 -g -sASSERTIONS=2 -sNO_DISABLE_EXCEPTION_CATCHING -fexceptions")


set (WASM_FILE)
if (COPASIJS_SINGLE_FILE)
set (SINGLE_FILE "-sSINGLE_FILE=1 ")
else()
set (WASM_FILE ${CMAKE_CURRENT_BINARY_DIR}/copasijs.wasm)
set (SINGLE_FILE "-sSINGLE_FILE=0 ")
endif()

set_target_properties(copasijs PROPERTIES COMPILE_FLAGS "${COPASIJS_OPT_FLAGS}")
set_target_properties(copasijs PROPERTIES LINK_FLAGS    "${COPASIJS_OPT_FLAGS} -s ALLOW_MEMORY_GROWTH=1 -sENVIRONMENT=${COPASIJS_ENVIRONMENT} ${SINGLE_FILE} -sEXPORT_ES6=0 -sUSE_ES6_IMPORT_META=0 -s WASM=1 -s MODULARIZE -s 'EXPORT_NAME=createCpsModule' --no-entry ${PRELOAD_FILE} -sEXPORTED_RUNTIME_METHODS=${EXPORTED_FUNCTIONS}")

install(
  FILES 
    ${CMAKE_CURRENT_BINARY_DIR}/copasijs.js
    ${CMAKE_CURRENT_SOURCE_DIR}/js/copasi.js
    ${CMAKE_CURRENT_SOURCE_DIR}/js/copasi.d.ts
    ${DATA_FILE}
    ${WASM_FILE}

  DESTINATION ${CMAKE_INSTALL_PREFIX}
)

else()
add_library(copasijs src/copasijs.cpp src/copasijs.h src/)
endif()

# Add include directory from dependencies
target_include_directories(copasijs PRIVATE ${CMAKE_SOURCE_DIR}/src)

# Link dependencies
target_link_libraries(copasijs PUBLIC LibCOPASISE)


if (NOT EMSCRIPTEN)
# compile a test executable
Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.4.0 # or a later release
)

FetchContent_MakeAvailable(Catch2)

# These tests can use the Catch2-provided main
add_executable(copasijs_test test/copasijs_test.cpp)
target_include_directories(copasijs_test PUBLIC ${COPASIJS_DEPENDENCY_DIR}/include)
target_include_directories(copasijs_test PRIVATE ${CMAKE_SOURCE_DIR}/src)
target_link_libraries(copasijs_test PRIVATE Catch2::Catch2WithMain copasijs)
if (APPLE)
  target_link_libraries(copasijs_test PRIVATE "-framework CoreFoundation -framework Accelerate")
endif()

add_test(NAME copasijs_test_run COMMAND copasijs_test)
set_tests_properties(copasijs_test_run PROPERTIES 
  ENVIRONMENT "srcdir=${CMAKE_CURRENT_SOURCE_DIR}/test"
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)

endif()


message(STATUS "
----------------------------------------------------------------------
COPASIJS version ${COPASIJS_DOTTED_VERSION}
----------------------------------------------------------------------

   More information and the latest version are available online at
   https://copasi.org

   Please report problems using the issue tracker at
   https://github.com/copasi/COPASI.js/issues

   To contact the developers directly, email copasi-user-forum@googlegroups.com

   Configured on host '${HOSTNAME}'
     host type                       = ${CMAKE_SYSTEM_NAME}
     host operating system           = ${CMAKE_SYSTEM_NAME} ${CMAKE_SYSTEM_VERSION}
     host CPU architecture           = ${CMAKE_SYSTEM_PROCESSOR}

   General build flags:
     CC                              = ${CMAKE_C_COMPILER}
     CXX                             = ${CMAKE_CXX_COMPILER}
     CPPFLAGS                        = ${BUILD_DEFINITIONS}
     CFLAGS                          = ${CMAKE_C_FLAGS}
     CXXFLAGS                        = ${CMAKE_CXX_FLAGS}
     LDFLAGS                         = ${CMAKE_EXE_LINKER_FLAGS}

   Dependencies directory            = ${COPASIJS_DEPENDENCY_DIR}

   COPASISE configuration:
     Version                         = ${LibCOPASISE_VERSION}
     Libraries                       = ${LibCOPASISE_LIBRARY}
     Include directory               = ${LibCOPASISE_INCLUDE_DIR}

     LibSBML                         = ${LIBSBML_VERSION}
     LibSEDML                        = ${LIBSEDML_VERSION}
     LibCOMBINE                      = ${LIBCOMBINE_VERSION}

   Other libSBML configuration settings:
     Installation $prefix            = ${CMAKE_INSTALL_PREFIX}
     
")
