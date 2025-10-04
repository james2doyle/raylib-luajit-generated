Raylib LuaJit 5.5
=================

> [Raylib](https://www.raylib.com) LuaJit bindings that are generated from the raylib-parser API docs

# !! INCOMPLETE AND WORK IN PROGRESS !!

- [x] `raylib.h` code-gen to lua using `raylib_api.lua`
- [x] `rlgl.h` code-gen to lua using `rlgl_api.lua`
- [x] `raygui.h` code-gen to lua using `raygui_api.lua`
- [x] `raymath.h` code-gen to lua using `raymath_api.lua`
- [x] `config.h` code-gen to lua using `config_api.lua`
- [x] `physac.h` ffi bindings to lua using `physac.lua`

### PROS:

- Simple lua files (except for the compiled Raylib binaries/libraries/header)
- Works as an actual lib instead of a runner
- No build required in order to use this
- Really easy to update

### CONS:

- You need the LuaJIT and Raylib compiled binaries/libraries
- Building a binary to distribute is a chore

## Running

- Install Raylib globally. I used `brew install raylib` on OSX, or
- Download your Raylib release and toss everything from `lib/` into the `./raylib` folder
- Create a file in the root with the following code:

```lua
-- save as main.lua
-- run with `luajit main.lua`
local rl = require('raylib')

rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)

rl.InitWindow(800, 450, "raylib [core] example - basic window")

while not rl.WindowShouldClose() do
  rl.BeginDrawing()
  rl.ClearBackground(rl.RAYWHITE)
  rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LIGHTGRAY)
  rl.EndDrawing()
end

rl.CloseWindow()

```

- Run `luajit main.lua`

## Examples

*Examples are pulled from [TSnake41/raylib-lua](https://github.com/TSnake41/raylib-lua/tree/master/examples)*

Run `luajit examples/core_basic_window.lua`

## Generating API files

You can use [the Raylib parser](https://github.com/raysan5/raylib/tree/master/parser) to generate `.lua` files that document the API:

```sh
./raylib_parser -i ../src/config.h -f LUA -o config_api.lua
./raylib_parser -i ../src/raylib.h -f LUA -o raylib_api.lua
./raylib_parser -i ../src/raymath.h -f LUA -o raymath_api.lua
./raylib_parser -i ../src/rlgl.h -f LUA -o rlgl_api.lua
# requires the raygui in the raylib source folder
./raylib_parser -i ../raygui/src/raygui.h -f LUA -o raygui_api.lua
```

## Building `raylib/init.lua` from API files

This is a work in progress as well. It uses regular Lua 5.4 to generate the file. Make sure `lpeg` is installed. You can install it with `luarocks install lpeg`.

It is super rough right now but it does work and generates a `init.lua` file with comments and [docblocks](https://stevedonovan.github.io/ldoc/manual/doc.md.html)!

```sh
cd raylib/
luarocks install lpeg
lua generate.lua
```

## Building Physac:

Copy `physac.h` from [victorfisac/Physac](https://github.com/victorfisac/Physac) to `raylib/physac.h`.

Create a `pyhsac.c` in `raylib/`:

```c
// raylib/physac.c
#define PHYSAC_IMPLEMENTATION
#define PHYSAC_STANDALONE
// from: https://github.com/victorfisac/Physac
#include "physac.h"
```

Build the `libphysac.dylib`:

```sh
# Assuming physac.c and libraylib.dylib are accessible (from: https://github.com/victorfisac/Physac)
# Use clang (the default C compiler on macOS)
cd raylib
clang -o ../libphysac.dylib physac.c -dynamiclib \
  -I. -I/opt/homebrew/Cellar/raylib/5.5/include/ \
  -L/opt/homebrew/Cellar/raylib/5.5/lib/ -lraylib \
  -lpthread
```

### Thank you to the following projects

Thank you to these projects that acted as a reference for this implementation

- [/alexander-matz/f8ee4eb9fdf676203d70c1e5e329a6ec](https://gist.github.com/alexander-matz/f8ee4eb9fdf676203d70c1e5e329a6ec)
- [/darltrash/raylib-luajit](https://github.com/darltrash/raylib-luajit)
- [/RequiemSouls/raylua](https://github.com/RequiemSouls/raylua)
- [/temperlang/temper-raylib/tree/main/vendor/raylib-luajit](https://github.com/temperlang/temper-raylib/tree/main/vendor/raylib-luajit)