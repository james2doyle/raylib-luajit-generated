# AGENTS.md

This file outlines the build, lint, test, and code style guidelines for this LuaJIT 2.1 and Raylib 5.5 project.

## Preferences

- Always require raylib as `local rl = require("raylib")`
- Prefer arrow keys to WASD movement
- Be sure to include `rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)` in any files that call `rl.InitWindow`
- Be sure to include `rl.SetTargetFPS(60)` in any files that call `rl.InitWindow`
- Avoid defining static variables or functions in the drawing loop
- Do not edit files under `./raylib` when creating new examples or fixing any examples
- Ignore the `./example-build` directory

## Commands

- **Build**: `cd raylib/ && luarocks install lpeg && lua generate.lua`
  - This command generates `raylib/init.lua` from the API files.
- **Lint**: `selene target_file.lua`
  - This command uses `selene` (configured by `selene.toml`) to check for linting issues across the project.
- **Format**: `stylua target_file.lua`
  - This command uses `stylua` (configured by `stylua.toml`) to format the project.
- **Test**: No dedicated test commands found. Examples are run with `luajit examples/example_name.lua`.

## Code Style Guidelines

Code style is enforced primarily through `stylua` and `selene`.

- **Formatting**:
  - Line endings: Unix
  - Indentation: 2 spaces
  - Column width: 120
  - Quote style: Auto-prefer double quotes
  - Function calls: Parentheses always present
  - Simple statements: Never collapsed
  - Spaces: No space after function names
- **Imports**: No explicit guidelines beyond standard Lua `require` usage.
- **Naming Conventions**: No explicit guidelines found. Follow existing patterns.
- **Error Handling**: No explicit guidelines found.
- **Types**: Lua 5.1 standard with Luajit 2.1 is used. Refer to existing docblocks in `raylib/init.lua` for type hints.
