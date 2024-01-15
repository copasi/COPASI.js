# Copyright (C) 2019 - 2023 by Pedro Mendes, Rector and Visitors of the 
# University of Virginia, University of Heidelberg, and University 
# of Connecticut School of Medicine. 
# All rights reserved. 

# Copyright (C) 2017 - 2018 by Pedro Mendes, Virginia Tech Intellectual 
# Properties, Inc., University of Heidelberg, and University of 
# of Connecticut School of Medicine. 
# All rights reserved. 

# Copyright (C) 2016 by Pedro Mendes, Virginia Tech Intellectual 
# Properties, Inc., University of Heidelberg, and The University 
# of Manchester. 
# All rights reserved. 

#
# Locate LibCOPASISE (and dependent libraries)
#
# This module defines:
#
# LibCOPASISE_INCLUDE_DIR, where to find the headers
# LibCOPASISE_LIBRARY, the libraries to link against to use LibCOPASISE
# LibCOPASISE_FOUND, If false, do not try to use LibCOPASISE
# LibCOPASISE_VERSION, the version of LibCOPASISE found
#

set(LibCOPASISE_LIBRARY_NAME)
if (UNIX)
  set(LibCOPASISE_LIBRARY_NAME COPASISE-static)
else()
  set(LibCOPASISE_LIBRARY_NAME libCOPASISE-static)
endif()

find_package(${LibCOPASISE_LIBRARY_NAME} CONFIG QUIET)

string(TOUPPER ${PROJECT_NAME} _UPPER_PROJECT_NAME)
set(_PROJECT_DEPENDENCY_DIR ${_UPPER_PROJECT_NAME}_DEPENDENCY_DIR)

if (NOT ${LibCOPASISE_LIBRARY_NAME}_FOUND)
  find_package(${LibCOPASISE_LIBRARY_NAME} CONFIG QUIET
  CONFIGS ${LibCOPASISE_LIBRARY_NAME}-config.cmake
  PATHS $ENV{LibCOPASISE_DIR}/${CMAKE_INSTALL_LIBDIR}/cmake
        $ENV{LibCOPASISE_DIR}/lib/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/${CMAKE_INSTALL_LIBDIR}/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/lib/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/lib64/cmake
        /usr/${CMAKE_INSTALL_LIBDIR}/cmake
        $ENV{LibCOPASISE_DIR}/lib/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/lib/cmake
        /usr/lib/cmake
        ${CONAN_LIB_DIRS_LibCOPASISE}/cmake
        CMAKE_FIND_ROOT_PATH_BOTH
  )
endif()

if (${LibCOPASISE_LIBRARY_NAME}_FOUND)

get_target_property(LibCOPASISE_INCLUDE_DIR ${LibCOPASISE_LIBRARY_NAME} INTERFACE_INCLUDE_DIRECTORIES)
get_target_property(LibCOPASISE_LIBRARY ${LibCOPASISE_LIBRARY_NAME} IMPORTED_LOCATION_RELEASE)

if (NOT LibCOPASISE_LIBRARY)
  get_target_property(LibCOPASISE_LIBRARY ${LibCOPASISE_LIBRARY_NAME} IMPORTED_LOCATION_DEBUG)
endif(NOT LibCOPASISE_LIBRARY)

if (NOT LibCOPASISE_LIBRARY)
  set(LibCOPASISE_LIBRARY)
endif(NOT LibCOPASISE_LIBRARY)

get_target_property(LibCOPASISE_INTERFACE_LINK_LIBRARIES ${LibCOPASISE_LIBRARY_NAME} INTERFACE_LINK_LIBRARIES)


if (NOT LibCOPASISE_INTERFACE_LINK_LIBRARIES)
  get_target_property(LibCOPASISE_INTERFACE_LINK_LIBRARIES ${LibCOPASISE_LIBRARY_NAME} IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE)
endif()

if (NOT LibCOPASISE_INTERFACE_LINK_LIBRARIES)
  get_target_property(LibCOPASISE_INTERFACE_LINK_LIBRARIES ${LibCOPASISE_LIBRARY_NAME} IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG)
endif()

if (NOT LibCOPASISE_INTERFACE_LINK_LIBRARIES)
  get_target_property(LibCOPASISE_INTERFACE_LINK_LIBRARIES ${LibCOPASISE_LIBRARY_NAME} IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG)
endif()

set (COPASI_DEPENDENCY_TARGTES)

# remove dependent projects from link library list
foreach (library ${LibCOPASISE_INTERFACE_LINK_LIBRARIES})
  
    string(FIND "${library}" "::" index)

    if (${index} GREATER 0)
      # found dependent library
      string(SUBSTRING "${library}" 0 ${index} DEPENDENT_NAME)
      message(VERBOSE "Looking for dependent library: ${DEPENDENT_NAME}")
      find_package(${DEPENDENT_NAME})
      if (NOT ${DEPENDENT_NAME}_FOUND)
      find_package(${DEPENDENT_NAME} CONFIG QUIET
      PATHS $ENV{LibCOPASISE_DIR}/${CMAKE_INSTALL_LIBDIR}/cmake
        $ENV{LibCOPASISE_DIR}/lib/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/${CMAKE_INSTALL_LIBDIR}/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/lib/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/lib64/cmake
        /usr/${CMAKE_INSTALL_LIBDIR}/cmake
        $ENV{LibCOPASISE_DIR}/lib/cmake
        ${${_PROJECT_DEPENDENCY_DIR}}/lib/cmake
        /usr/lib/cmake
        ${CONAN_LIB_DIRS_LibCOPASISE}/cmake
        CMAKE_FIND_ROOT_PATH_BOTH
      )
      endif()
    else()
      # if library is one of 'libsbml', 'libsedml', 'libCombine-static'
      # then we can try to find it
      if (${library} STREQUAL "libsbml" OR ${library} STREQUAL "libsbml-static")
        find_package(LIBSBML)
      elseif (${library} STREQUAL "libsedml")
        if (NOT TARGET LibSEDML)
          find_package(LIBSEDML)
        endif()
      elseif (${library} STREQUAL "libCombine-static")
        find_package(LIBCOMBINE)
      elseif (${library} STREQUAL "CodeGen")
        find_package(NATIVEJIT)
      elseif(NOT EXISTS "${library}")
        message(WARNING "Could not find dependent library: ${library}")
        # remove library from list        
      endif()

    endif()

    list(REMOVE_ITEM LibCOPASISE_INTERFACE_LINK_LIBRARIES ${library})
    list(APPEND COPASI_DEPENDENCY_TARGTES ${library})

  endforeach()

  # set library to include dependencies
  if (LibCOPASISE_INTERFACE_LINK_LIBRARIES)
  set(LibCOPASISE_LIBRARY ${LibCOPASISE_LIBRARY} ${LibCOPASISE_INTERFACE_LINK_LIBRARIES})
  endif (LibCOPASISE_INTERFACE_LINK_LIBRARIES)



else()
  # Fallback if no CONFIG is found

  find_path(LibCOPASISE_INCLUDE_DIR combine/combinearchive.h
    PATHS $ENV{LibCOPASISE_DIR}/include
          $ENV{LibCOPASISE_DIR}
          ${${_PROJECT_DEPENDENCY_DIR}}/include
          ${${_PROJECT_DEPENDENCY_DIR}}
          
    NO_DEFAULT_PATH)

  if (NOT LibCOPASISE_INCLUDE_DIR)
    find_path(LibCOPASISE_INCLUDE_DIR combine/combinearchive.h
          $ENV{LibCOPASISE_DIR}/include
          $ENV{LibCOPASISE_DIR}
          ${${_PROJECT_DEPENDENCY_DIR}}/include
          ${${_PROJECT_DEPENDENCY_DIR}}
          ~/Library/Frameworks
          /Library/Frameworks
          /sw/include        # Fink
          /opt/local/include # MacPorts
          /opt/csw/include   # Blastwave
          /opt/include
          /usr/freeware/include
          CMAKE_FIND_ROOT_PATH_BOTH)
  endif (NOT LibCOPASISE_INCLUDE_DIR)

  if (NOT LibCOPASISE_INCLUDE_DIR)
    message(FATAL_ERROR "LibCOPASISE include dir not found not found! Consider defining ${_PROJECT_DEPENDENCY_DIR} variable: ${${_PROJECT_DEPENDENCY_DIR}}")
  endif (NOT LibCOPASISE_INCLUDE_DIR)

  find_library(LibCOPASISE_LIBRARY 
    NAMES ${LibCOPASISE_LIBRARY_NAME}
    PATHS $ENV{LibCOPASISE_DIR}/lib
          $ENV{LibCOPASISE_DIR}
          ${${_PROJECT_DEPENDENCY_DIR}}/${CMAKE_INSTALL_LIBDIR}
          ${${_PROJECT_DEPENDENCY_DIR}}/lib
          ${${_PROJECT_DEPENDENCY_DIR}}
          ${CONAN_LIB_DIRS_LibCOPASISE}
          ~/Library/Frameworks
          /Library/Frameworks
          /sw/lib         Fink
          /opt/local/lib  MacPorts
          /opt/csw/lib    Blastwave
          /opt/lib
          /usr/freeware/lib64
          CMAKE_FIND_ROOT_PATH_BOTH
    NO_DEFAULT_PATH)
    
  if (NOT LibCOPASISE_LIBRARY)
    find_library(LibCOPASISE_LIBRARY 
        NAMES ${LibCOPASISE_LIBRARY_NAME}
        PATHS $ENV{LibCOPASISE_DIR}/lib
        $ENV{LibCOPASISE_DIR}
        ${${_PROJECT_DEPENDENCY_DIR}}/${CMAKE_INSTALL_LIBDIR}
        ${${_PROJECT_DEPENDENCY_DIR}}/lib
        ${${_PROJECT_DEPENDENCY_DIR}}
        ${CONAN_LIB_DIRS_LibCOPASISE}
        ~/Library/Frameworks
        /Library/Frameworks
        /sw/lib         Fink
        /opt/local/lib  MacPorts
        /opt/csw/lib    Blastwave
        /opt/lib
        /usr/freeware/lib64
        CMAKE_FIND_ROOT_PATH_BOTH)
  endif (NOT LibCOPASISE_LIBRARY)
endif(${LibCOPASISE_LIBRARY_NAME}_FOUND)

if (NOT LibCOPASISE_LIBRARY)
    message(FATAL_ERROR "LibCOPASISE library not found! Consider defining ${_PROJECT_DEPENDENCY_DIR} variable: ${${_PROJECT_DEPENDENCY_DIR}}")
endif (NOT LibCOPASISE_LIBRARY)

if (NOT TARGET LibCOPASISE)
add_library(LibCOPASISE UNKNOWN IMPORTED)
set_target_properties(LibCOPASISE PROPERTIES
  IMPORTED_LOCATION "${LibCOPASISE_LIBRARY}"
  INTERFACE_INCLUDE_DIRECTORIES "${LibCOPASISE_INCLUDE_DIR}")

foreach(depenent_target ${COPASI_DEPENDENCY_TARGTES})
  target_link_libraries(LibCOPASISE INTERFACE ${depenent_target})
endforeach()

endif()


if (LibCOPASISE_INCLUDE_DIR AND EXISTS "${LibCOPASISE_INCLUDE_DIR}/copasi/CopasiVersion.h")
file(STRINGS "${LibCOPASISE_INCLUDE_DIR}/copasi/CopasiVersion.h" copasi_version_str
     REGEX "^#[\t ]*define[\t ]+COPASI_VERSION_(MAJOR|MINOR|BUILD)[\t ]+[0-9]+$")
unset(LibCOPASISE_VERSION CACHE)
set(_STARTED FALSE)
foreach(VPART MAJOR MINOR BUILD)
    foreach(VLINE ${copasi_version_str})
      if(VLINE MATCHES "^#[\t ]*define[\t ]+COPASI_VERSION_${VPART}[\t ]+([0-9]+)$")
        set(COPASI_VERSION_PART "${CMAKE_MATCH_1}")
        if(_STARTED)
            string(APPEND LibCOPASISE_VERSION ".${COPASI_VERSION_PART}")
        else()
            set(LibCOPASISE_VERSION "${COPASI_VERSION_PART}")
            set(_STARTED TRUE)
        endif()
      endif()
    endforeach()
endforeach()
unset(_STARTED)
endif ()

if (LibCOPASISE_VERSION)
    message(VERBOSE "LibCOPASISE library ${LibCOPASISE_VERSION} found!")
endif (LibCOPASISE_VERSION)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibCOPASISE 
  VERSION_VAR LibCOPASISE_VERSION
  REQUIRED_VARS LibCOPASISE_LIBRARY LibCOPASISE_INCLUDE_DIR  
)

mark_as_advanced(LibCOPASISE_VERSION)
