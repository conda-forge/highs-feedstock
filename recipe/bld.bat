echo Start
echo %PREFIX%/build
mkdir %PREFIX%/build
chdir %PREFIX%/build
echo Folders created

cmake -S %SRC_DIR% -B %PREFIX%/build
if errorlevel 1 exit 1
echo Files created

cmake --install %PREFIX%/build
if errorlevel 1 exit 1
echo installation complete