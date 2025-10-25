#!/usr/bin/env bash


# act sdf

rm -rf build

: > build.log
# Force CMake to use the currently active Python interpreter (from your conda env)
cmake . -B build -DPython_EXECUTABLE="$(which python)" >> build.log 2>&1
cmake --build build --config RelWithDebInfo -j $(nproc) >> build.log 2>&1
