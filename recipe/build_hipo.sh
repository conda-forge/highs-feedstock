#!/bin/bash

# Set BLA_VENDOR depending on blas_impl
BLA_VENDOR=OpenBLAS
if [[ "$blas_impl" == "mkl" ]]; then
    BLA_VENDOR=Intel10_64lp
fi

cmake ${CMAKE_ARGS} \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DHIPO=ON \
      -DBLA_VENDOR=$BLA_VENDOR \
      -S $SRC_DIR -B build
cmake --build build --config Release
cmake --install build --config Release

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  cd build
  ctest -C Release
fi
