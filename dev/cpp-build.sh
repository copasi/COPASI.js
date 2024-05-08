
export BUILD_DIR="${BUILD_DIR:-cpp-build}"
export COPASIJS_DEPENDENCY_DIR="${COPASIJS_DEPENDENCY_DIR:-dev/cpp-dependencies}"
export BUILD_TYPE="${BUILD_TYPE:-Debug}"
export INSTALL_PREFIX="${INSTALL_PREFIX:-cpp-dist}"

cmake -B $BUILD_DIR \
        -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
        -DCOPASIJS_DEPENDENCY_DIR=$COPASIJS_DEPENDENCY_DIR \
        -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
        -DCOPASIJS_INCLUDE_EXAMPLE_FILES=ON

cmake --build $BUILD_DIR --config $BUILD_TYPE
cmake --install $BUILD_DIR --config $BUILD_TYPE
