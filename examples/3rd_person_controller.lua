local rl = require("raylib")

rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)

-- Define constants
local SCREEN_WIDTH = 800
local SCREEN_HEIGHT = 450
local PLAYER_SIZE = 1.0
local CAMERA_DISTANCE = 5.0
local PLAYER_SPEED = 5.0
local CAMERA_ROTATION_SPEED = 0.5
local CAMERA_HEIGHT_OFFSET = 2.0

-- Game state variables
-- Using the shorthand constructor rl.Vector3(x, y, z)
local playerPosition = rl.Vector3(0.0, PLAYER_SIZE / 2.0, 0.0)
local camera = rl.Camera3D(
  rl.Vector3(0.0, CAMERA_HEIGHT_OFFSET, CAMERA_DISTANCE), -- position
  playerPosition, -- target (looks at player)
  rl.Vector3(0.0, 1.0, 0.0), -- up
  45.0, -- fovy
  rl.CAMERA_PERSPECTIVE -- projection
)
local cameraYaw = 0.0 -- Rotation around the Y-axis (left/right)
local cameraPitch = 20.0 -- Vertical angle (up/down)

-- Initialization
rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Raylib 5.5 Luajit 3rd Person Controller")
rl.SetTargetFPS(60)
rl.DisableCursor() -- Lock and hide the cursor for Mouselook

-- Main game loop
while not rl.WindowShouldClose() do
  local deltaTime = rl.GetFrameTime()

  -- 1. Handle Input (Mouse/Camera)
  local mouseDelta = rl.GetMouseDelta()

  -- Update yaw (horizontal rotation)
  cameraYaw = cameraYaw - (mouseDelta.x * CAMERA_ROTATION_SPEED * deltaTime)

  -- Update pitch (vertical rotation) and clamp it
  cameraPitch = cameraPitch + (mouseDelta.y * CAMERA_ROTATION_SPEED * deltaTime)
  if cameraPitch > 89.0 then
    cameraPitch = 89.0
  end
  if cameraPitch < -45.0 then
    cameraPitch = -45.0
  end

  -- 2. Calculate Camera Position

  -- Convert yaw and pitch to radians
  local yawRad = cameraYaw * rl.DEG2RAD
  local pitchRad = cameraPitch * rl.DEG2RAD

  -- Calculate horizontal and vertical distance components
  local horizontalDist = CAMERA_DISTANCE * math.cos(pitchRad)
  local verticalDist = CAMERA_DISTANCE * math.sin(pitchRad)

  -- Calculate camera relative position on the horizontal plane (XZ)
  local camX = horizontalDist * math.sin(yawRad)
  local camZ = horizontalDist * math.cos(yawRad)

  -- Update camera position, offset from player's position
  camera.position.x = playerPosition.x - camX
  camera.position.y = playerPosition.y + CAMERA_HEIGHT_OFFSET + verticalDist
  camera.position.z = playerPosition.z - camZ

  -- The camera always looks at the player's position (target)
  camera.target = playerPosition

  -- 3. Handle Input (Keyboard/Player Movement)
  local forward = rl.Vector3(0.0, 0.0, 0.0)
  local right = rl.Vector3(0.0, 0.0, 0.0)
  local moveDir = rl.Vector3(0.0, 0.0, 0.0)

  -- Get the camera's forward direction (Target - Position)
  local targetDir = rl.Vector3Subtract(camera.target, camera.position)

  targetDir.y = 0.0 -- Ignore vertical component for movement on a flat plane

  -- Normalize the forward vector
  forward = rl.Vector3Normalize(targetDir)

  -- Get the camera's right direction using the cross product
  right = rl.Vector3Normalize(rl.Vector3Cross(forward, camera.up))

  -- Accumulate movement input based on normalized vectors
  if rl.IsKeyDown(rl.KEY_UP) then
    moveDir = rl.Vector3Add(moveDir, forward)
  end
  if rl.IsKeyDown(rl.KEY_DOWN) then
    moveDir = rl.Vector3Subtract(moveDir, forward)
  end
  if rl.IsKeyDown(rl.KEY_LEFT) then
    moveDir = rl.Vector3Subtract(moveDir, right)
  end
  if rl.IsKeyDown(rl.KEY_RIGHT) then
    moveDir = rl.Vector3Add(moveDir, right)
  end

  -- Apply movement
  if rl.Vector3Length(moveDir) > 0.0 then
    moveDir = rl.Vector3Normalize(moveDir)
    -- Must use the official C-style function name: Vector3Scale
    local moveVector = rl.Vector3Scale(moveDir, PLAYER_SPEED * deltaTime)

    -- Apply the final movement vector
    playerPosition = rl.Vector3Add(playerPosition, moveVector)
  end

  -- 4. Drawing
  rl.BeginDrawing()
  rl.ClearBackground(rl.SKYBLUE)

  rl.BeginMode3D(camera)

  -- Draw the ground plane
  rl.DrawGrid(10, 1.0)

  -- Draw the player (a simple cube)
  rl.DrawCube(playerPosition, PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE, rl.RED)
  rl.DrawCubeWires(playerPosition, PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE, rl.MAROON)

  rl.EndMode3D()

  -- Draw instructions
  rl.DrawText("3rd Person Controller Example (Raylib 5.5 + LuaJIT)", 10, 10, 20, rl.DARKGRAY)
  rl.DrawText("- Use Arrow to move the player", 10, 40, 10, rl.DARKGRAY)
  rl.DrawText("- Use Mouse to rotate the camera orbit", 10, 60, 10, rl.DARKGRAY)
  rl.DrawText(
    string.format("Player Position: (%.2f, %.2f, %.2f)", playerPosition.x, playerPosition.y, playerPosition.z),
    10,
    80,
    10,
    rl.DARKGRAY
  )

  rl.DrawFPS(SCREEN_WIDTH - 80, 10)

  rl.EndDrawing()
end

-- De-initialization
rl.CloseWindow()
