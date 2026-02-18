set BLA_VENDOR=OpenBLAS
if "%blas_impl%" == "mkl" set BLA_VENDOR=Intel10_64lp

cmake -G "Ninja" ^
      %CMAKE_ARGS% ^
      -DBUILD_SHARED_LIBS=ON ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DHIPO=ON ^
      -DALL_TESTS=ON ^
      -DBLA_VENDOR=%BLA_VENDOR% ^
      -S %SRC_DIR% -B build
if errorlevel 1 exit 1

cmake --build build --config Release
if errorlevel 1 exit 1

cmake --install build --config Release
if errorlevel 1 exit 1

chdir build
ctest -C Release
if errorlevel 1 exit 1
