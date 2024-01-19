
export BUILD_DIR="${BUILD_DIR:-em-build}"
export COPASIJS_DEPENDENCY_DIR="${COPASIJS_DEPENDENCY_DIR:-dev/em-dependencies}"
export BUILD_TYPE="${BUILD_TYPE:-Release}"
export ENVIRONMENT="${ENVIRONMENT:-node}"
export INSTALL_PREFIX="${INSTALL_PREFIX:-dist-$ENVIRONMENT}"

emcmake cmake -B $BUILD_DIR \
        -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
        -DCOPASIJS_DEPENDENCY_DIR=$COPASIJS_DEPENDENCY_DIR \
        -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
        -DCOPASIJS_ENVIRONMENT=$ENVIRONMENT \
        -DCOPASIJS_INCLUDE_EXAMPLE_FILES=ON

cmake --build $BUILD_DIR --config $BUILD_TYPE
cmake --install $BUILD_DIR --config $BUILD_TYPE
