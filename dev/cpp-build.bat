@echo off

if not defined BUILD_DIR set BUILD_DIR=cpp-build
if not defined COPASIJS_DEPENDENCY_DIR set COPASIJS_DEPENDENCY_DIR=dev\cpp-dependencies
if not defined BUILD_TYPE set BUILD_TYPE=Debug
if not defined INSTALL_PREFIX set INSTALL_PREFIX=cpp-dist


cmake -B %BUILD_DIR% ^
        -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
        -DCOPASIJS_DEPENDENCY_DIR=%COPASIJS_DEPENDENCY_DIR% ^
        -DCMAKE_INSTALL_PREFIX=%INSTALL_PREFIX% ^
        -DCOPASIJS_INCLUDE_EXAMPLE_FILES=ON

cmake --build %BUILD_DIR% --config %BUILD_TYPE%
cmake --install %BUILD_DIR% --config %BUILD_TYPE%
