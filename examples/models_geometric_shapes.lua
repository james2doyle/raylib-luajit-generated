local rl = require("raylib")

local screenWidth = 800
local screenHeight = 450

rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)
rl.InitWindow(screenWidth, screenHeight, "raylua [models] example - geometric shapes")

local camera = rl.Camera3D(rl.Vector3(0, 10, 10), rl.Vector3(0, 0, 0), rl.Vector3(0, 1, 0), 45, rl.CAMERA_PERSPECTIVE)

while not rl.WindowShouldClose() do
  rl.BeginDrawing()
  rl.ClearBackground(rl.RAYWHITE)

  rl.BeginMode3D(camera)

  -- Ideally, you should cache Vector3 structures to avoid reallocating them
  -- over and over. For readability here, they are inlined to the code.

  rl.DrawCube(rl.Vector3(-4, 0, 2), 2, 5, 2, rl.RED)
  rl.DrawCubeWires(rl.Vector3(-4, 0, 2), 2, 5, 2, rl.GOLD)
  rl.DrawCubeWires(rl.Vector3(-4, 0, -2), 3, 6, 2, rl.MAROON)

  rl.DrawSphere(rl.Vector3(1, 0, -2), 1, rl.GREEN)
  rl.DrawSphereWires(rl.Vector3(1, 0, 2), 2, 16, 16, rl.LIME)

  rl.DrawCylinder(rl.Vector3(4, 0, -2), 1, 2, 3, 4, rl.SKYBLUE)
  rl.DrawCylinderWires(rl.Vector3(4, 0, -2), 1, 2, 3, 4, rl.DARKBLUE)
  rl.DrawCylinderWires(rl.Vector3(4.5, -1, 2), 1, 1, 2, 6, rl.BROWN)

  rl.DrawCylinder(rl.Vector3(1, 0, -4), 0, 1.5, 3, 8, rl.GOLD)
  rl.DrawCylinderWires(rl.Vector3(1, 0, -4), 0, 1.5, 3, 8, rl.PINK)

  rl.DrawGrid(10, 1)

  rl.EndMode3D()

  rl.DrawFPS(10, 10)
  rl.EndDrawing()
end

rl.CloseWindow()
