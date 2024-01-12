# COPASI.js
 Emscripten COPASI Javascript Bindings

## Dependencies
The best way to set this up, is to just install the COPASI dependencies first into a dependency directory, then compile the COPASISE library, and install it also into that directory: 

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

Additionally this project uses: 

* <https://github.com/nlohmann/json> and
* <https://github.com/catchorg/Catch2>

## Testing
It is possible to compile the simulation wrapper as C++ library, that is also used for testing using the [catch2 framework](https://github.com/catchorg/Catch2). For this, you can just use: 

```bash
cmake -DDEPENDENCIES_DIR=<path to where the dependencies are>
```