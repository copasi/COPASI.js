# COPASI.js
This project hosts a simplification of the COPASI API used
primarily for running simulations and steady state analysis 
of SBML/COPASI models. 

Main use of this project is as JavaScript wrapper of the
simulation API. For that we use Emscripten. 

## Emscripten build
To build from a clone we use the following (ensuring that you first have initialized the [Emscripten sdk](https://emscripten.org/docs/getting_started/downloads.html)): 

### dependencies
```bash

curl -L -O http://downloads.sourceforge.net/libuuid/libuuid-1.0.3.tar.gz 
tar -zxf libuuid-1.0.3.tar.gz
cd libuuid-1.0.3
emconfigure ./configure --prefix=$PWD/../em-dependencies --disable-dependency-tracking --with-pic --enable-static=yes --enable-shared=no CFLAGS='-fPIC'
emmake make
emmake make install
cd ..
rm em-dependencies/lib/libuuid.la*

git clone https://github.com/copasi/copasi-dependencies
emcmake cmake -G Ninja -B em-build-dependencies -S copasi-dependencies \
 -DCMAKE_INSTALL_PREFIX=em-dependencies \
 -DCMAKE_BUILD_TYPE=Release \
 -DBUILD_UI_DEPS=OFF \
 -DBUILD_zlib=ON \
 -DBUILD_archive=OFF \
 -DBUILD_NativeJIT=OFF \
 -DBUILD_clapack=ON \
 -DCMAKE_PREFIX_PATH=em-dependencies
cmake --build em-build-dependencies --config=Release

cp COPASI/copasi/lapack/f2c.h em-dependencies/include 
cp COPASI/copasi/lapack/blaswrap.h em-dependencies/include

git clone https://github.com/copasi/COPASI
emcmake cmake -G Ninja -B em-build-copasi -S COPASI \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_GUI=OFF \
      -DENABLE_JIT:BOOL=OFF \
      -DDATAVALUE_NEEDS_SIZE_T_MEMBERS=1 \
      -DCOPASI_INSTALL_C_API=ON \
      -DCMAKE_INSTALL_PREFIX=em-dependencies \
      -DCOPASI_DEPENDENCY_DIR=em-dependencies \
      -DCMAKE_PREFIX_PATH=em-dependencies \
      -DDISABLE_STACK_PROTECTOR=ON \
      -DF2C_INTEGER=int \
      -DF2C_LOGICAL=int

cmake --build em-build-copasi --config=Release
cmake --install em-build-copasi --config=Release
```

### JavaScript Library

```bash
git clone https://github.com/copasi/COPASI.js.git
emcmake -DCOPASIJS_DEPENDENCY_DIR=em-dependencies -S COPASI.js -B em-build-copasijs
emcmake --build em-build-copasijs --config=Release
cd em-build-copasijs && ctest -V

```

## Dependencies
This project requires: 

* [COPASI](https://github.com/copasi/COPASI)
* [copasi-dependencies](https://github.com/copasi/copasi-dependencies)
* <https://github.com/nlohmann/json> and
* <https://github.com/catchorg/Catch2> (on standalone builds)



## Building the standalone library
The best way to set this up, is to just install the COPASI dependencies first into a dependency directory, then compile the COPASISE library, and install it also into that directory. The code below can be used to test the library standalone on any system: 

```bash
git clone https://github.com/copasi/copasi-dependencies
cmake -G Ninja -B build-dependencies -S copasi-dependencies \
 -DCMAKE_INSTALL_PREFIX=dependencies \
 -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_UI_DEPS=OFF \
        -DBUILD_zlib=ON \
        -DBUILD_archive=OFF \
        -DBUILD_NativeJIT=OFF \
        -DBUILD_clapack=ON
cmake --build build-dependencies --config=Release

cp COPASI/copasi/lapack/f2c.h dependencies/include 
cp COPASI/copasi/lapack/blaswrap.h dependencies/include

git clone https://github.com/copasi/COPASI
cmake -G Ninja -B build-copasi -S COPASI \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_GUI=OFF \
      -DENABLE_JIT:BOOL=OFF \
      -DDATAVALUE_NEEDS_SIZE_T_MEMBERS=0 \
      -DCOPASI_INSTALL_C_API=ON \
      -DCMAKE_INSTALL_PREFIX=dependencies \
      -DCOPASI_DEPENDENCY_DIR=dependencies \
      -DCMAKE_PREFIX_PATH=dependencies \
      -DF2C_INTEGER=int \
      -DF2C_LOGICAL=int

cmake --build build-copasi --config=Release
cmake --install build-copasi --config=Release
```

### Testing
Once the dependencies are compiled as above and installed into `dependencies`, you can
run the standalone test runner like so: 

```bash
git clone https://github.com/copasi/COPASI.js.git
cmake -DCOPASIJS_DEPENDENCY_DIR=dependencies -S COPASI.js -B build-copasijs
cmake --build build-copasijs --config=Release
cd build-copasijs && ctest -V
```

