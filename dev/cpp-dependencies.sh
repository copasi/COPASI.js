#!/bin/bash

# change into this directory
pushd "$(dirname "$0")"


# build uuid lib if it doesn't exist
# if [ ! -f cpp-dependencies/lib/libuuid.a ]; then

#     # download if not already downloaded
#     if [ ! -f libuuid-1.0.3.tar.gz ]; then
#         curl -L -O http://downloads.sourceforge.net/libuuid/libuuid-1.0.3.tar.gz 
#         tar -zxf libuuid-1.0.3.tar.gz
#     fi
#     cd libuuid-1.0.3
#     ./configure --prefix=$PWD/../cpp-dependencies --disable-dependency-tracking --with-pic --enable-static=yes --enable-shared=no CFLAGS='-fPIC'
#     make
#     make install
#     cd ..
#     rm cpp-dependencies/lib/libuuid.la
# fi

# checkout and build copasi-dependencies if they dont exist
if [ ! -f cpp-dependencies/lib/libCombine-static.a ]; then
    if [ ! -d copasi-dependencies ]; then
        git clone https://github.com/copasi/copasi-dependencies
    fi
    
    cmake -G Ninja -B cpp-build-dependencies -S copasi-dependencies \
          -DCMAKE_INSTALL_PREFIX=cpp-dependencies \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_UI_DEPS=OFF \
          -DBUILD_zlib=ON \
          -DBUILD_archive=OFF \
          -DBUILD_NativeJIT=OFF \
          -DBUILD_clapack=ON \
          -DCMAKE_PREFIX_PATH=cpp-dependencies
    cmake --build cpp-build-dependencies --config=Release
fi

# build COPASI SE if it doesn't exist
if [ ! -f cpp-dependencies/lib/libcopasise-static.a ]; then
    if [ ! -d COPASI ]; then
        git clone https://github.com/copasi/COPASI
        cd COPASI && gitTools/UpdateCopasiVersion --force && cd ..
        cd COPASI && git checkout release/Version-4.43 && cd ..
    fi

    cp COPASI/copasi/lapack/f2c.h cpp-dependencies/include 
    cp COPASI/copasi/lapack/blaswrap.h cpp-dependencies/include
    
    cmake -G Ninja -B cpp-build-copasi -S COPASI \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_GUI=OFF \
        -DENABLE_JIT:BOOL=OFF \
        -DDATAVALUE_NEEDS_SIZE_T_MEMBERS=1 \
        -DCOPASI_INSTALL_C_API=ON \
        -DCMAKE_INSTALL_PREFIX=cpp-dependencies \
        -DCOPASI_DEPENDENCY_DIR=cpp-dependencies \
        -DCMAKE_PREFIX_PATH=cpp-dependencies \
        -DDISABLE_STACK_PROTECTOR=ON \
        -DF2C_INTEGER=int \
        -DF2C_LOGICAL=int
    
    cmake --build cpp-build-copasi --config=Release
    cmake --install cpp-build-copasi --config=Release
fi

popd

