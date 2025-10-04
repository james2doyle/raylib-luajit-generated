local rl = require("raylib")

local screenWidth = 800
local screenHeight = 450

rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)
rl.SetConfigFlags(rl.FLAG_MSAA_4X_HINT)
rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - infinite ground grid")
rl.SetTargetFPS(60)

local camera = rl.Camera3D(
  rl.Vector3(0.0, 10.0, 10.0),
  rl.Vector3(0.0, 0.0, 0.0),
  rl.Vector3(0.0, 1.0, 0.0),
  45.0,
  rl.CAMERA_PERSPECTIVE
)

local cameraSpeed = 0.1
local gridSize = 100 -- The grid size

while not rl.WindowShouldClose() do
  camera.position.z = camera.position.z - cameraSpeed
  camera.target.z = camera.target.z - cameraSpeed

  -- Check if camera has moved beyond the 0,0,0 point and reset its position to create a seamless loop
  if camera.position.z < -10 then
    camera.position.z = -5
    camera.target.z = -15
  end

  -- Draw
  rl.BeginDrawing()
  rl.ClearBackground(rl.RAYWHITE)

  rl.BeginMode3D(camera)
  rl.DrawGrid(gridSize, 1) -- Draw a 100x100 grid with 1 unit spacing
  rl.EndMode3D()

  rl.DrawFPS(screenWidth - 80, 10)

  rl.EndDrawing()
end

rl.CloseWindow()
