#!/bin/bash

cmake ${CMAKE_ARGS} \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_UNITY_BUILD=ON \
      -S $SRC_DIR -B build
cmake --build build --target install --config Release -j${CPU_COUNT}

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  ctest -C Release --test-dir build
fi
