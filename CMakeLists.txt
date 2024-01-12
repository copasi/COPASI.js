cmake_minimum_required(VERSION 3.15)

project(copasijs LANGUAGES CXX)

enable_testing()

set(CMAKE_CXX_STANDARD 17)

# Specify directory with dependencies
set(DEPENDENCIES_DIR "dependencies" CACHE PATH "Directory with dependencies")

# current setup: 
# /Users/frank/Development/emscripten/install_dependencies
# /Users/frank/Development/copasi-dependencies/bin
# /Users/frank/Development/se-dependencies/dependencies

# Add library target
add_library(copasijs src/copasijs.cpp src/copasijs.h src/)

# glob all .a files from dependencies/lib 
file(GLOB DEPENDENCIES_LIBS ${DEPENDENCIES_DIR}/lib/*.a)

# Add include directory from dependencies
target_include_directories(copasijs PUBLIC ${DEPENDENCIES_DIR}/include)
target_include_directories(copasijs PRIVATE ${CMAKE_SOURCE_DIR}/src)

# Link dependencies
target_link_libraries(copasijs PUBLIC ${DEPENDENCIES_LIBS})


if (EMSCRIPTEN)
else()
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
target_include_directories(copasijs_test PUBLIC ${DEPENDENCIES_DIR}/include)
target_include_directories(copasijs_test PRIVATE ${CMAKE_SOURCE_DIR}/src)
target_link_libraries(copasijs_test PRIVATE Catch2::Catch2WithMain copasijs)
if (APPLE)
  target_link_libraries(copasijs_test PRIVATE "-framework CoreFoundation -framework Accelerate")
endif()

add_test(NAME copasijs_test_run COMMAND copasijs_test)
set_tests_properties(copasijs_test_run PROPERTIES ENVIRONMENT 
	"srcdir=${CMAKE_CURRENT_SOURCE_DIR}")

endif()