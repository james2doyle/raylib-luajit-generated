local rl = require("raylib")

rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)
rl.InitWindow(800, 450, "raylib [shapes] example - mouse tracking square")
rl.SetTargetFPS(60)

local square_position = rl.Vector2(-100, -100)
local current_square_size = 80
local target_square_size = 80
local lerp_speed = 0.1
local square_color = rl.DARKBLUE

--- Linear interpolation between two values
---@param start number
---@param finish number
---@param amount number
---@return number
local function lerp(start, finish, amount)
  return start + amount * (finish - start)
end

--- Clamps a value between min and max
---@param value number
---@param min number
---@param max number
---@return number
local function clamp(value, min, max)
  return math.max(min, math.min(max, value))
end

while not rl.WindowShouldClose() do
  square_position.x = rl.GetMouseX() - current_square_size / 2
  square_position.y = rl.GetMouseY() - current_square_size / 2

  local mouse_wheel_move = rl.GetMouseWheelMove()
  if mouse_wheel_move ~= 0 then
    target_square_size = target_square_size + mouse_wheel_move * 10
    if target_square_size < 10 then
      target_square_size = 10
    end
    if target_square_size > 300 then
      target_square_size = 300
    end
  end

  current_square_size = lerp(current_square_size, target_square_size, lerp_speed)
  current_square_size = clamp(current_square_size, 10, 300)

  if rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT) then
    square_color = rl.MAROON
  elseif rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_MIDDLE) then
    square_color = rl.LIME
  elseif rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_RIGHT) then
    square_color = rl.DARKBLUE
  end

  rl.BeginDrawing()

  rl.ClearBackground(rl.RAYWHITE)
  rl.DrawRectangle(square_position.x, square_position.y, current_square_size, current_square_size, square_color)
  rl.DrawText("move square with mouse and click mouse button to change color", 10, 10, 20, rl.DARKGRAY)

  rl.EndDrawing()
end

rl.CloseWindow()
