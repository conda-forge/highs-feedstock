cmake -G "Ninja" ^
      %CMAKE_ARGS% ^
      -DBUILD_SHARED_LIBS=ON ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_UNITY_BUILD=ON ^
      -S %SRC_DIR% -B build
if errorlevel 1 exit 1

cmake --build build --target install
if errorlevel 1 exit 1

ctest --test-dir build
if errorlevel 1 exit 1
