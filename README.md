Raylib LuaJit 5.5
=================

**!!INCOMPLETE AND WORK IN PROGRESS!!**

> A really simple [Raylib](https://www.raylib.com) LuaJIT binding! (that will do the job for most cases).

Based on [this gist](https://gist.github.com/alexander-matz/f8ee4eb9fdf676203d70c1e5e329a6ec)
And [this repo](https://github.com/darltrash/raylib-luajit/)
And also [this repo](https://github.com/RequiemSouls/raylua)
And also [this repo](https://github.com/temperlang/temper-raylib/tree/main/vendor/raylib-luajit)

##### PROS:

- It works great in LuaJIT 2+
- Single file (except for the compiled Raylib binaries)
- Works as an actual lib instead of a runner
- Everything is saved into a table
- Mostly everything should work properly

##### CONS:

- You need the LuaJIT and Raylib compiled binaries/libraries

## Running

1. Download your Raylib release and toss everything from `lib` into the root of this folder
1. Run `luajit main.lua`

## Generating API files

You can use [the Raylib parser](https://github.com/raysan5/raylib/tree/master/parser) to generate `.lua` files that document the API:

```sh
./raylib_parser -i ../src/config.h -f LUA -o ../../config_api.lua
./raylib_parser -i ../src/raylib.h -f LUA -o ../../raylib_api.lua
./raylib_parser -i ../src/raymath.h -f LUA -o ../../raymath_api.lua
./raylib_parser -i ../src/rlgl.h -f LUA -o ../../rlgl_api.lua
./raylib_parser -i ../src/raygui.h -f LUA -o ../../raygui_api.lua
```

## Building `raylib.lua` from API files

This is a work in progress as well. It uses [Lune](https://lune-org.github.io/docs) to generate the file as it allows for string intepolation and a few other nice additions.

You don't need Lune or Luau installed to use this library

```sh
lune run generate.luau
```