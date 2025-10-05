#!/usr/bin/env bash

# Check if 'luastatic' command is available after attempting installation
if ! command -v luastatic &> /dev/null; then
    echo "Error: 'luastatic' command not found even after attempting installation with LuaRocks."
    echo "This might indicate an issue with the LuaRocks installation, or that the directory containing 'luastatic' is not in your shell's PATH."
    echo "You may need to manually add the LuaRocks binary directory to your PATH, or investigate why 'luarocks install luastatic' failed."
    exit 1
fi

# Check if libphysac.dylib exists in the parent directory
if [ ! -f "$PWD/../libphysac.dylib" ]; then
    echo "Error: libphysac.dylib not found at $PWD/../libphysac.dylib."
    echo "Please ensure that libphysac.dylib is present in the parent directory before running this script."
    echo "There are instructions for building libphysac.dylib in the README.md"
    exit 1
fi

rm 3rd_person_controller
rm 3rd_person_controller.luastatic.c
rm libraylib.dylib
rm libphysac.dylib
rm raylib

ln -s $(brew --prefix raylib)/lib/libraylib.dylib
ln -s "$PWD/../libphysac.dylib"
ln -s "$PWD/../raylib"

cd "$PWD/../"

# see https://github.com/ers35/luastatic
luastatic "$PWD/examples/3rd_person_controller.lua" -lraylib $(brew --prefix luajit)/lib/libluajit-5.1.a -I$(brew --prefix luajit)/include/luajit-2.1 -I$(brew --prefix raylib)/lib

mv 3rd_person_controller example-build/3rd_person_controller
mv 3rd_person_controller.luastatic.c example-build/3rd_person_controller.luastatic.c

cd "$PWD/example-build"