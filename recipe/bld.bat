mkdir build
chdir build

cmake -S . -B build
if errorlevel 1 exit 1

ctest
if errorlevel 1 exit 1

cmake --install build
if errorlevel 1 exit 1