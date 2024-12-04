Raylib LuaJit 5.5
=================

> [Raylib](https://www.raylib.com) LuaJit bindings that are generated from the raylib-parser API docs

# !! INCOMPLETE AND WORK IN PROGRESS !!

- [x] `raylib.h` code-gen to lua using `raylib_api.lua`
- [ ] `config.h` code-gen to lua using `config_api.lua`
- [ ] `raymath.h` code-gen to lua using `raymath_api.lua`
- [ ] `rlgl.h` code-gen to lua using `rlgl_api.lua`
- [ ] `raygui.h` code-gen to lua using `raygui_api.lua`

##### PROS:

- Single file (except for the compiled Raylib binaries/libraries)
- Works as an actual lib instead of a runner

##### CONS:

- You need the LuaJIT and Raylib compiled binaries/libraries

## Running

1. Download your Raylib release and toss everything from `lib` into the root of this folder
1. Run `luajit main.lua`

## Generating API files

You can use [the Raylib parser](https://github.com/raysan5/raylib/tree/master/parser) to generate `.lua` files that document the API:

```sh
./raylib_parser -i ../src/config.h -f LUA -o config_api.lua
./raylib_parser -i ../src/raylib.h -f LUA -o raylib_api.lua
./raylib_parser -i ../src/raymath.h -f LUA -o raymath_api.lua
./raylib_parser -i ../src/rlgl.h -f LUA -o rlgl_api.lua
./raylib_parser -i ../src/raygui.h -f LUA -o raygui_api.lua
```

## Building `raylib.lua` from API files

This is a work in progress as well. It uses [Lune (a luau script runtime)](https://lune-org.github.io/docs) to generate the file as it allows for string interpolation and a few other nice additions.

It is super rough right now but it does work and generates a `raylib.lua` file with comments and docblocks!

You don't need Lune or Luau installed to use this library

```sh
lune run generate.luau
```

### Thank you to the following projects

Thank you to these projects that acted as a reference for this implementation

- [/alexander-matz/f8ee4eb9fdf676203d70c1e5e329a6ec](https://gist.github.com/alexander-matz/f8ee4eb9fdf676203d70c1e5e329a6ec)
- [/darltrash/raylib-luajit](https://github.com/darltrash/raylib-luajit)
- [/RequiemSouls/raylua](https://github.com/RequiemSouls/raylua)
- [/temperlang/temper-raylib/tree/main/vendor/raylib-luajit](https://github.com/temperlang/temper-raylib/tree/main/vendor/raylib-luajit)