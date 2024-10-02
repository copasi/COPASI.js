@echo off

REM change into this directory
pushd "%~dp0"

if not defined BUILD_TYPE set BUILD_TYPE=Debug
if not defined COPASI_BRANCH set COPASI_BRANCH=release/Version-4.45

REM checkout and build copasi-dependencies if they dont exist
if not exist cpp-dependencies\lib\libCombine-static.lib (
    if not exist copasi-dependencies (
        git clone https://github.com/copasi/copasi-dependencies
    )
    
    cmake -G Ninja -B cpp-build-dependencies -S copasi-dependencies ^
          -DCMAKE_INSTALL_PREFIX=cpp-dependencies ^
          -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
          -DBUILD_UI_DEPS=OFF ^
          -DBUILD_zlib=ON ^
          -DBUILD_archive=OFF ^
          -DBUILD_NativeJIT=OFF ^
          -DBUILD_clapack=ON ^
          -DCMAKE_PREFIX_PATH=cpp-dependencies
    cmake --build cpp-build-dependencies --config %BUILD_TYPE%
)

REM build COPASI SE if it doesn't exist
if not exist cpp-dependencies\lib\libcopasise-static.lib (
    if not exist COPASI (
        git clone https://github.com/copasi/COPASI
        cd COPASI && git checkout %COPASI_BRANCH% && cd ..
        cd COPASI && bash gitTools/UpdateCopasiVersion --force && cd ..
    )

    copy COPASI\copasi\lapack\f2c.h cpp-dependencies\include 
    copy COPASI\copasi\lapack\blaswrap.h cpp-dependencies\include
    
    cmake -G Ninja -B cpp-build-copasi -S COPASI ^
        -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
        -DBUILD_GUI=OFF ^
        -DENABLE_JIT:BOOL=OFF ^
        -DCOPASI_INSTALL_C_API=ON ^
        -DCMAKE_INSTALL_PREFIX=cpp-dependencies ^
        -DCOPASI_DEPENDENCY_DIR=cpp-dependencies ^
        -DCMAKE_PREFIX_PATH=cpp-dependencies ^
        -DDISABLE_STACK_PROTECTOR=ON
    
    cmake --build cpp-build-copasi --config %BUILD_TYPE%
    cmake --install cpp-build-copasi --config %BUILD_TYPE%
)

popd
