@echo off
setlocal
cd /d "%~dp0"

git pull --ff-only || exit /b 1
cmake -S . -B build -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM=C:/msys64/ucrt64/bin/mingw32-make.exe -DCMAKE_C_COMPILER=C:/msys64/ucrt64/bin/gcc.exe -DCMAKE_CXX_COMPILER=C:/msys64/ucrt64/bin/g++.exe -DCMAKE_BUILD_TYPE=Debug || exit /b 1
cmake --build build || exit /b 1
build\hello.exe