local ffi = require("ffi")
local lib = ffi.load("libraylib")

local generated = io.open("generated.h", "r")

if generated == nil then
  error("Cannot find generated.h")
end

ffi.cdef(generated:read("*all"))

local mt = {__index = lib}
local rl = setmetatable({}, mt)

-- PI to 20 digits
rl.PI = 3.14159265358979323846
-- Set to show raylib logo at startup
rl.FLAG_SHOW_LOGO           =  1
-- Set to run program in fullscreen
rl.FLAG_FULLSCREEN_MODE     =  2
-- Set to allow resizable window
rl.FLAG_WINDOW_RESIZABLE    =  4
-- Set to disable window decoration (frame and buttons)
rl.FLAG_WINDOW_UNDECORATED  =  8
-- Set to allow transparent window
rl.FLAG_WINDOW_TRANSPARENT  = 16
-- Set to try enabling MSAA 4X
rl.FLAG_MSAA_4X_HINT        = 32
-- Set to try enabling V-Sync on GPU
rl.FLAG_VSYNC_HINT          = 64

-- Key: NULL, used for no key pressed
rl.KEY_NULL            = 0
-- Key: '
rl.KEY_APOSTROPHE      = 39
-- Key: ,
rl.KEY_COMMA           = 44
-- Key: -
rl.KEY_MINUS           = 45
-- Key: .
rl.KEY_PERIOD          = 46
-- Key: /
rl.KEY_SLASH           = 47
-- Key: 0
rl.KEY_ZERO            = 48
-- Key: 1
rl.KEY_ONE             = 49
-- Key: 2
rl.KEY_TWO             = 50
-- Key: 3
rl.KEY_THREE           = 51
-- Key: 4
rl.KEY_FOUR            = 52
-- Key: 5
rl.KEY_FIVE            = 53
-- Key: 6
rl.KEY_SIX             = 54
-- Key: 7
rl.KEY_SEVEN           = 55
-- Key: 8
rl.KEY_EIGHT           = 56
-- Key: 9
rl.KEY_NINE            = 57
-- Key: ;
rl.KEY_SEMICOLON       = 59
-- Key: =
rl.KEY_EQUAL           = 61
-- Key: A | a
rl.KEY_A               = 65
-- Key: B | b
rl.KEY_B               = 66
-- Key: C | c
rl.KEY_C               = 67
-- Key: D | d
rl.KEY_D               = 68
-- Key: E | e
rl.KEY_E               = 69
-- Key: F | f
rl.KEY_F               = 70
-- Key: G | g
rl.KEY_G               = 71
-- Key: H | h
rl.KEY_H               = 72
-- Key: I | i
rl.KEY_I               = 73
-- Key: J | j
rl.KEY_J               = 74
-- Key: K | k
rl.KEY_K               = 75
-- Key: L | l
rl.KEY_L               = 76
-- Key: M | m
rl.KEY_M               = 77
-- Key: N | n
rl.KEY_N               = 78
-- Key: O | o
rl.KEY_O               = 79
-- Key: P | p
rl.KEY_P               = 80
-- Key: Q | q
rl.KEY_Q               = 81
-- Key: R | r
rl.KEY_R               = 82
-- Key: S | s
rl.KEY_S               = 83
-- Key: T | t
rl.KEY_T               = 84
-- Key: U | u
rl.KEY_U               = 85
-- Key: V | v
rl.KEY_V               = 86
-- Key: W | w
rl.KEY_W               = 87
-- Key: X | x
rl.KEY_X               = 88
-- Key: Y | y
rl.KEY_Y               = 89
-- Key: Z | z
rl.KEY_Z               = 90
-- Key: [
rl.KEY_LEFT_BRACKET    = 91
-- Key: '\'
rl.KEY_BACKSLASH       = 92
-- Key: ]
rl.KEY_RIGHT_BRACKET   = 93
-- Key: `
rl.KEY_GRAVE           = 96
-- Key: Space
rl.KEY_SPACE           = 32
-- Key: Esc
rl.KEY_ESCAPE          = 256
-- Key: Enter
rl.KEY_ENTER           = 257
-- Key: Tab
rl.KEY_TAB             = 258
-- Key: Backspace
rl.KEY_BACKSPACE       = 259
-- Key: Ins
rl.KEY_INSERT          = 260
-- Key: Del
rl.KEY_DELETE          = 261
-- Key: Cursor right
rl.KEY_RIGHT           = 262
-- Key: Cursor left
rl.KEY_LEFT            = 263
-- Key: Cursor down
rl.KEY_DOWN            = 264
-- Key: Cursor up
rl.KEY_UP              = 265
-- Key: Page up
rl.KEY_PAGE_UP         = 266
-- Key: Page down
rl.KEY_PAGE_DOWN       = 267
-- Key: Home
rl.KEY_HOME            = 268
-- Key: End
rl.KEY_END             = 269
-- Key: Caps lock
rl.KEY_CAPS_LOCK       = 280
-- Key: Scroll down
rl.KEY_SCROLL_LOCK     = 281
-- Key: Num lock
rl.KEY_NUM_LOCK        = 282
-- Key: Print screen
rl.KEY_PRINT_SCREEN    = 283
-- Key: Pause
rl.KEY_PAUSE           = 284
-- Key: F1
rl.KEY_F1              = 290
-- Key: F2
rl.KEY_F2              = 291
-- Key: F3
rl.KEY_F3              = 292
-- Key: F4
rl.KEY_F4              = 293
-- Key: F5
rl.KEY_F5              = 294
-- Key: F6
rl.KEY_F6              = 295
-- Key: F7
rl.KEY_F7              = 296
-- Key: F8
rl.KEY_F8              = 297
-- Key: F9
rl.KEY_F9              = 298
-- Key: F10
rl.KEY_F10             = 299
-- Key: F11
rl.KEY_F11             = 300
-- Key: F12
rl.KEY_F12             = 301
-- Key: Shift left
rl.KEY_LEFT_SHIFT      = 340
-- Key: Control left
rl.KEY_LEFT_CONTROL    = 341
-- Key: Alt left
rl.KEY_LEFT_ALT        = 342
-- Key: Super left
rl.KEY_LEFT_SUPER      = 343
-- Key: Shift right
rl.KEY_RIGHT_SHIFT     = 344
-- Key: Control right
rl.KEY_RIGHT_CONTROL   = 345
-- Key: Alt right
rl.KEY_RIGHT_ALT       = 346
-- Key: Super right
rl.KEY_RIGHT_SUPER     = 347
-- Key: KB menu
rl.KEY_KB_MENU         = 348
-- Key: Keypad 0
rl.KEY_KP_0            = 320
-- Key: Keypad 1
rl.KEY_KP_1            = 321
-- Key: Keypad 2
rl.KEY_KP_2            = 322
-- Key: Keypad 3
rl.KEY_KP_3            = 323
-- Key: Keypad 4
rl.KEY_KP_4            = 324
-- Key: Keypad 5
rl.KEY_KP_5            = 325
-- Key: Keypad 6
rl.KEY_KP_6            = 326
-- Key: Keypad 7
rl.KEY_KP_7            = 327
-- Key: Keypad 8
rl.KEY_KP_8            = 328
-- Key: Keypad 9
rl.KEY_KP_9            = 329
-- Key: Keypad .
rl.KEY_KP_DECIMAL      = 330
-- Key: Keypad /
rl.KEY_KP_DIVIDE       = 331
-- Key: Keypad *
rl.KEY_KP_MULTIPLY     = 332
-- Key: Keypad -
rl.KEY_KP_SUBTRACT     = 333
-- Key: Keypad +
rl.KEY_KP_ADD          = 334
-- Key: Keypad Enter
rl.KEY_KP_ENTER        = 335
-- Key: Keypad =
rl.KEY_KP_EQUAL        = 336
-- Key: Android back button
rl.KEY_BACK            = 4
-- Key: Android menu button
rl.KEY_MENU            = 82
-- Key: Android volume up button
rl.KEY_VOLUME_UP       = 24
-- Key: Android volume down button
rl.KEY_VOLUME_DOWN     = 25

-- Mouse button left
rl.MOUSE_BUTTON_LEFT    = 0
-- Mouse button right
rl.MOUSE_BUTTON_RIGHT   = 1
-- Mouse button middle (pressed wheel)
rl.MOUSE_BUTTON_MIDDLE  = 2
-- Mouse button side (advanced mouse device)
rl.MOUSE_BUTTON_SIDE    = 3
-- Mouse button extra (advanced mouse device)
rl.MOUSE_BUTTON_EXTRA   = 4
-- Mouse button forward (advanced mouse device)
rl.MOUSE_BUTTON_FORWARD = 5
-- Mouse button back (advanced mouse device)
rl.MOUSE_BUTTON_BACK    = 6
-- Default pointer shape
rl.MOUSE_CURSOR_DEFAULT       = 0
-- Arrow shape
rl.MOUSE_CURSOR_ARROW         = 1
-- Text writing cursor shape
rl.MOUSE_CURSOR_IBEAM         = 2
-- Cross shape
rl.MOUSE_CURSOR_CROSSHAIR     = 3
-- Pointing hand cursor
rl.MOUSE_CURSOR_POINTING_HAND = 4
-- Horizontal resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_EW     = 5
-- Vertical resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_NS     = 6
-- Top-left to bottom-right diagonal resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_NWSE   = 7
-- The top-right to bottom-left diagonal resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_NESW   = 8
-- The omnidirectional resize/move cursor shape
rl.MOUSE_CURSOR_RESIZE_ALL    = 9
-- The operation-not-allowed shape
rl.MOUSE_CURSOR_NOT_ALLOWED   = 10

-- Touch points registered
rl.MAX_TOUCH_POINTS    = 2

-- Gamepad Number
rl.GAMEPAD_PLAYER1     = 0
rl.GAMEPAD_PLAYER2     = 1
rl.GAMEPAD_PLAYER3     = 2
rl.GAMEPAD_PLAYER4     = 3

-- Gamepad Buttons/Axis

-- PS3 USB Controller Buttons
rl.GAMEPAD_PS3_BUTTON_TRIANGLE =  0
rl.GAMEPAD_PS3_BUTTON_CIRCLE   =  1
rl.GAMEPAD_PS3_BUTTON_CROSS    =  2
rl.GAMEPAD_PS3_BUTTON_SQUARE   =  3
rl.GAMEPAD_PS3_BUTTON_L1       =  6
rl.GAMEPAD_PS3_BUTTON_R1       =  7
rl.GAMEPAD_PS3_BUTTON_L2       =  4
rl.GAMEPAD_PS3_BUTTON_R2       =  5
rl.GAMEPAD_PS3_BUTTON_START    =  8
rl.GAMEPAD_PS3_BUTTON_SELECT   =  9
rl.GAMEPAD_PS3_BUTTON_UP       = 24
rl.GAMEPAD_PS3_BUTTON_RIGHT    = 25
rl.GAMEPAD_PS3_BUTTON_DOWN     = 26
rl.GAMEPAD_PS3_BUTTON_LEFT     = 27
rl.GAMEPAD_PS3_BUTTON_PS       = 12

-- PS3 USB Controller Axis
rl.GAMEPAD_PS3_AXIS_LEFT_X   = 0
rl.GAMEPAD_PS3_AXIS_LEFT_Y   = 1
rl.GAMEPAD_PS3_AXIS_RIGHT_X  = 2
rl.GAMEPAD_PS3_AXIS_RIGHT_Y  = 5
rl.GAMEPAD_PS3_AXIS_L2       = 3       -- [1..-1] (pressure-level)
rl.GAMEPAD_PS3_AXIS_R2       = 4       -- [1..-1] (pressure-level)

-- Xbox360 USB Controller Buttons
rl.GAMEPAD_XBOX_BUTTON_A      = 0
rl.GAMEPAD_XBOX_BUTTON_B      = 1
rl.GAMEPAD_XBOX_BUTTON_X      = 2
rl.GAMEPAD_XBOX_BUTTON_Y      = 3
rl.GAMEPAD_XBOX_BUTTON_LB     = 4
rl.GAMEPAD_XBOX_BUTTON_RB     = 5
rl.GAMEPAD_XBOX_BUTTON_SELECT = 6
rl.GAMEPAD_XBOX_BUTTON_START  = 7
rl.GAMEPAD_XBOX_BUTTON_UP     = 10
rl.GAMEPAD_XBOX_BUTTON_RIGHT  = 11
rl.GAMEPAD_XBOX_BUTTON_DOWN   = 12
rl.GAMEPAD_XBOX_BUTTON_LEFT   = 13
rl.GAMEPAD_XBOX_BUTTON_HOME   = 8

-- Android Gamepad Controller (SNES CLASSIC)
rl.GAMEPAD_ANDROID_DPAD_UP      = 19
rl.GAMEPAD_ANDROID_DPAD_DOWN    = 20
rl.GAMEPAD_ANDROID_DPAD_LEFT    = 21
rl.GAMEPAD_ANDROID_DPAD_RIGHT   = 22
rl.GAMEPAD_ANDROID_DPAD_CENTER  = 23

rl.GAMEPAD_ANDROID_BUTTON_A     = 96
rl.GAMEPAD_ANDROID_BUTTON_B     = 97
rl.GAMEPAD_ANDROID_BUTTON_C     = 98
rl.GAMEPAD_ANDROID_BUTTON_X     = 99
rl.GAMEPAD_ANDROID_BUTTON_Y     = 100
rl.GAMEPAD_ANDROID_BUTTON_Z     = 101
rl.GAMEPAD_ANDROID_BUTTON_L1    = 102
rl.GAMEPAD_ANDROID_BUTTON_R1    = 103
rl.GAMEPAD_ANDROID_BUTTON_L2    = 104
rl.GAMEPAD_ANDROID_BUTTON_R2    = 105

-- Xbox360 USB Controller Axis
-- NOTE: For Raspberry Pi, axis must be reconfigured
--#if defined(PLATFORM_RPI)
rl.GAMEPAD_XBOX_AXIS_LEFT_X  = 0   -- [-1..1] (left->right)
rl.GAMEPAD_XBOX_AXIS_LEFT_Y  = 1   -- [-1..1] (up->down)
rl.GAMEPAD_XBOX_AXIS_RIGHT_X = 3   -- [-1..1] (left->right)
rl.GAMEPAD_XBOX_AXIS_RIGHT_Y = 4   -- [-1..1] (up->down)
rl.GAMEPAD_XBOX_AXIS_LT      = 2   -- [-1..1] (pressure-level)
rl.GAMEPAD_XBOX_AXIS_RT      = 5   -- [-1..1] (pressure-level)
--#else
--rl.GAMEPAD_XBOX_AXIS_LEFT_X  = 0   -- [-1..1] (left->right)
--rl.GAMEPAD_XBOX_AXIS_LEFT_Y  = 1   -- [1..-1] (up->down)
--rl.GAMEPAD_XBOX_AXIS_RIGHT_X = 2   -- [-1..1] (left->right)
--rl.GAMEPAD_XBOX_AXIS_RIGHT_Y = 3   -- [1..-1] (up->down)
--rl.GAMEPAD_XBOX_AXIS_LT      = 4   -- [-1..1] (pressure-level)
--rl.GAMEPAD_XBOX_AXIS_RT      = 5   -- [-1..1] (pressure-level)
--#endif

-- Some Basic Colors
-- NOTE: Custom raylib color palette for amazing visuals on WHITE background

-- Light Gray
rl.LIGHTGRAY  = { 200, 200, 200, 255 }
-- Gray
rl.GRAY       = { 130, 130, 130, 255 }
-- Dark Gray
rl.DARKGRAY   = { 80, 80, 80, 255 }
-- Yellow
rl.YELLOW     = { 253, 249, 0, 255 }
-- Gold
rl.GOLD       = { 255, 203, 0, 255 }
-- Orange
rl.ORANGE     = { 255, 161, 0, 255 }
-- Pink
rl.PINK       = { 255, 109, 194, 255 }
-- Red
rl.RED        = { 230, 41, 55, 255 }
-- Maroon
rl.MAROON     = { 190, 33, 55, 255 }
-- Green
rl.GREEN      = { 0, 228, 48, 255 }
-- Lime
rl.LIME       = { 0, 158, 47, 255 }
-- Dark Green
rl.DARKGREEN  = { 0, 117, 44, 255 }
-- Sky Blue
rl.SKYBLUE    = { 102, 191, 255, 255 }
-- Blue
rl.BLUE       = { 0, 121, 241, 255 }
-- Dark Blue
rl.DARKBLUE   = { 0, 82, 172, 255 }
-- Purple
rl.PURPLE     = { 200, 122, 255, 255 }
-- Violet
rl.VIOLET     = { 135, 60, 190, 255 }
-- Dark Purple
rl.DARKPURPLE = { 112, 31, 126, 255 }
-- Beige
rl.BEIGE      = { 211, 176, 131, 255 }
-- Brown
rl.BROWN      = { 127, 106, 79, 255 }
-- Dark Brown
rl.DARKBROWN  = { 76, 63, 47, 255 }
-- White
rl.WHITE      = { 255, 255, 255, 255 }
-- Black
rl.BLACK      = { 0, 0, 0, 255 }
-- Blank (Transparent)
rl.BLANK      = { 0, 0, 0, 0 }
-- Magenta
rl.MAGENTA    = { 255, 0, 255, 255 }
-- My own White (raylib logo)
rl.RAYWHITE   = { 245, 245, 245, 255 }

---@param x integer Vector x component
---@param y integer Vector y component
function rl.Vector2(x, y)
  return ffi.new("Vector2", x, y)
end

---@param x integer Vector x component
---@param y integer Vector y component
---@param z integer Vector z component
function rl.Vector3(x, y, z)
  return ffi.new("Vector3", x, y, z)
end

---@param x integer Vector x component
---@param y integer Vector y component
---@param z integer Vector z component
---@param w integer Vector w component
function rl.Vector4(x, y, z, w)
  return ffi.new("Vector4", x, y, z, w)
end

---@param x integer Vector x component
---@param y integer Vector y component
---@param z integer Vector z component
---@param w integer Vector w component
function rl.Quaternion(x, y, z, w)
  return ffi.new("Vector4", x, y, z, w)
end

function rl.Matrix(...)
  return ffi.new("Matrix", ...)
end
function rl.Color(...)
  return ffi.new("Color", ...)
end
function rl.Rectangle(...)
  return ffi.new("Rectangle", ...)
end
function rl.Image(...)
  return ffi.new("Image", ...)
end
function rl.Texture(...)
  return ffi.new("Texture", ...)
end
function rl.RenderTexture(...)
  return ffi.new("RenderTexture", ...)
end
function rl.NPatchInfo(...)
  return ffi.new("NPatchInfo", ...)
end
function rl.GlyphInfo(...)
  return ffi.new("GlyphInfo", ...)
end
function rl.Font(...)
  return ffi.new("Font", ...)
end
function rl.Camera3D(...)
  return ffi.new("Camera3D", ...)
end
function rl.Camera2D(...)
  return ffi.new("Camera2D", ...)
end
function rl.Mesh(...)
  return ffi.new("Mesh", ...)
end
function rl.Shader(...)
  return ffi.new("Shader", ...)
end
function rl.MaterialMap(...)
  return ffi.new("MaterialMap", ...)
end
function rl.Material(...)
  return ffi.new("Material", ...)
end
function rl.Transform(...)
  return ffi.new("Transform", ...)
end
function rl.BoneInfo(...)
  return ffi.new("BoneInfo", ...)
end
function rl.Model(...)
  return ffi.new("Model", ...)
end
function rl.ModelAnimation(...)
  return ffi.new("ModelAnimation", ...)
end
function rl.Ray(...)
  return ffi.new("Ray", ...)
end
function rl.RayCollision(...)
  return ffi.new("RayCollision", ...)
end
function rl.BoundingBox(...)
  return ffi.new("BoundingBox", ...)
end
function rl.Wave(...)
  return ffi.new("Wave", ...)
end
function rl.rAudioBuffer(...)
  return ffi.new("rAudioBuffer", ...)
end
function rl.rAudioProcessor(...)
  return ffi.new("rAudioProcessor", ...)
end
function rl.AudioStream(...)
  return ffi.new("AudioStream", ...)
end
function rl.Sound(...)
  return ffi.new("Sound", ...)
end
function rl.Music(...)
  return ffi.new("Music", ...)
end
function rl.VrDeviceInfo(...)
  return ffi.new("VrDeviceInfo", ...)
end
function rl.VrStereoConfig(...)
  return ffi.new("VrStereoConfig", ...)
end
function rl.FilePathList(...)
  return ffi.new("FilePathList", ...)
end
function rl.AutomationEvent(...)
  return ffi.new("AutomationEvent", ...)
end
function rl.AutomationEventList(...)
  return ffi.new("AutomationEventList", ...)
end

--- Initialize a window with the specified dimensions and title.
---@param width integer The width of the window in pixels
---@param height integer The height of the window in pixels
---@param title string The title to display on the window
---@return void
function rl.InitWindow(width, height, title)
  return lib.InitWindow(width, height, title)
end
--- Close the current window and terminate the window context.
rl.CloseWindow = lib.CloseWindow
--- Check if the window should close (typically used in main game loop)
---@return boolean True if the window should close, false otherwise
rl.WindowShouldClose = lib.WindowShouldClose
--- Check if the window has been initialized and is ready
---@return boolean True if the window is ready, false otherwise
rl.IsWindowReady = lib.IsWindowReady
--- Check if the window is currently in fullscreen mode
---@return boolean True if fullscreen, false otherwise
rl.IsWindowFullscreen = lib.IsWindowFullscreen
--- Check if the window is currently hidden
---@return boolean True if hidden, false otherwise
rl.IsWindowHidden = lib.IsWindowHidden
--- Check if the window is currently minimized
---@return boolean True if minimized, false otherwise
rl.IsWindowMinimized = lib.IsWindowMinimized
--- Check if the window is currently maximized
---@return boolean True if maximized, false otherwise
rl.IsWindowMaximized = lib.IsWindowMaximized
--- Check if the window is currently focused
---@return boolean True if focused, false otherwise
rl.IsWindowFocused = lib.IsWindowFocused
--- Check if the window has been resized
---@return boolean True if resized, false otherwise
rl.IsWindowResized = lib.IsWindowResized
--- Check if a specific window state flag is set
---@param flag The state flag to check
---@return boolean True if the flag is set, false otherwise
rl.IsWindowState = lib.IsWindowState
--- Set specific window state flags
---@param flags The window state flags to set
rl.SetWindowState = lib.SetWindowState
--- Clear specific window state flags
---@param flags The window state flags to clear
rl.ClearWindowState = lib.ClearWindowState
--- Toggle between fullscreen and windowed mode
rl.ToggleFullscreen = lib.ToggleFullscreen
--- Toggle borderless windowed mode
rl.ToggleBorderlessWindowed = lib.ToggleBorderlessWindowed
--- Maximize the window to fill the screen
rl.MaximizeWindow = lib.MaximizeWindow
--- Minimize the window (typically to taskbar/dock)
rl.MinimizeWindow = lib.MinimizeWindow
--- Restore the window to its previous size and position
rl.RestoreWindow = lib.RestoreWindow
--- Set a single window icon
---@param icon The Image struct representing the icon
rl.SetWindowIcon = lib.SetWindowIcon
--- Set multiple window icons
---@param icons Pointer to an array of Image structs
---@param count Number of icons in the array
rl.SetWindowIcons = lib.SetWindowIcons
--- Set the window title
---@param title The new title for the window
rl.SetWindowTitle = lib.SetWindowTitle
--- Set the window's position on the screen
---@param x The x-coordinate of the window's top-left corner
---@param y The y-coordinate of the window's top-left corner
rl.SetWindowPosition = lib.SetWindowPosition
--- Set the monitor for the window
---@param monitor The monitor index to display the window on
rl.SetWindowMonitor = lib.SetWindowMonitor
--- Set the minimum size the window can be resized to
---@param width Minimum window width in pixels
---@param height Minimum window height in pixels
rl.SetWindowMinSize = lib.SetWindowMinSize
--- Set the maximum size the window can be resized to
---@param width Maximum window width in pixels
---@param height Maximum window height in pixels
rl.SetWindowMaxSize = lib.SetWindowMaxSize
--- Set the window's size
---@param width New window width in pixels
---@param height New window height in pixels
rl.SetWindowSize = lib.SetWindowSize
--- Set the window's opacity
---@param opacity Opacity value between 0.0 (transparent) and 1.0 (fully opaque)
rl.SetWindowOpacity = lib.SetWindowOpacity
--- Bring the window to focus
rl.SetWindowFocused = lib.SetWindowFocused
--- Get the native window handle
---@return pointer to the native window handle
rl.GetWindowHandle = lib.GetWindowHandle

rl.GetScreenWidth = lib.GetScreenWidth
rl.GetScreenHeight = lib.GetScreenHeight
rl.GetRenderWidth = lib.GetRenderWidth
rl.GetRenderHeight = lib.GetRenderHeight
rl.GetMonitorCount = lib.GetMonitorCount
rl.GetCurrentMonitor = lib.GetCurrentMonitor
rl.GetMonitorPosition = lib.GetMonitorPosition
rl.GetMonitorWidth = lib.GetMonitorWidth
rl.GetMonitorHeight = lib.GetMonitorHeight
rl.GetMonitorPhysicalWidth = lib.GetMonitorPhysicalWidth
rl.GetMonitorPhysicalHeight = lib.GetMonitorPhysicalHeight
rl.GetMonitorRefreshRate = lib.GetMonitorRefreshRate
rl.GetWindowPosition = lib.GetWindowPosition
rl.GetWindowScaleDPI = lib.GetWindowScaleDPI
function rl.GetMonitorName(monitor)
  return ffi.string(lib.GetMonitorName(monitor))
end
rl.SetClipboardText = lib.SetClipboardText
function rl.GetClipboardText()
  return ffi.string(lib.GetClipboardText())
end
rl.EnableEventWaiting = lib.EnableEventWaiting
rl.DisableEventWaiting = lib.DisableEventWaiting
rl.ShowCursor = lib.ShowCursor
rl.HideCursor = lib.HideCursor
rl.IsCursorHidden = lib.IsCursorHidden
rl.EnableCursor = lib.EnableCursor
rl.DisableCursor = lib.DisableCursor
rl.IsCursorOnScreen = lib.IsCursorOnScreen

---@param Color
rl.ClearBackground = lib.ClearBackground

rl.BeginDrawing = lib.BeginDrawing
rl.EndDrawing = lib.EndDrawing
rl.BeginMode2D = lib.BeginMode2D
rl.EndMode2D = lib.EndMode2D
rl.BeginMode3D = lib.BeginMode3D
rl.EndMode3D = lib.EndMode3D
rl.BeginTextureMode = lib.BeginTextureMode
rl.EndTextureMode = lib.EndTextureMode
rl.BeginShaderMode = lib.BeginShaderMode
rl.EndShaderMode = lib.EndShaderMode
rl.BeginBlendMode = lib.BeginBlendMode
rl.EndBlendMode = lib.EndBlendMode
rl.BeginScissorMode = lib.BeginScissorMode
rl.EndScissorMode = lib.EndScissorMode
rl.BeginVrStereoMode = lib.BeginVrStereoMode
rl.EndVrStereoMode = lib.EndVrStereoMode
rl.LoadVrStereoConfig = lib.LoadVrStereoConfig
rl.UnloadVrStereoConfig = lib.UnloadVrStereoConfig
rl.LoadShader = lib.LoadShader
rl.LoadShaderFromMemory = lib.LoadShaderFromMemory
rl.GetShaderLocation = lib.GetShaderLocation
rl.GetShaderLocationAttrib = lib.GetShaderLocationAttrib
rl.SetShaderValue = lib.SetShaderValue
rl.SetShaderValueV = lib.SetShaderValueV
rl.SetShaderValueMatrix = lib.SetShaderValueMatrix
rl.SetShaderValueTexture = lib.SetShaderValueTexture
rl.UnloadShader = lib.UnloadShader
rl.GetCameraMatrix = lib.GetCameraMatrix
rl.GetCameraMatrix2D = lib.GetCameraMatrix2D
rl.GetWorldToScreen = lib.GetWorldToScreen
rl.GetScreenToWorld2D = lib.GetScreenToWorld2D
rl.GetWorldToScreenEx = lib.GetWorldToScreenEx
rl.GetWorldToScreen2D = lib.GetWorldToScreen2D
rl.SetTargetFPS = lib.SetTargetFPS
rl.GetFrameTime = lib.GetFrameTime
rl.GetTime = lib.GetTime
rl.GetFPS = lib.GetFPS
rl.SwapScreenBuffer = lib.SwapScreenBuffer
rl.PollInputEvents = lib.PollInputEvents
rl.WaitTime = lib.WaitTime
rl.SetRandomSeed = lib.SetRandomSeed
rl.GetRandomValue = lib.GetRandomValue
rl.LoadRandomSequence = lib.LoadRandomSequence
rl.UnloadRandomSequence = lib.UnloadRandomSequence
rl.TakeScreenshot = lib.TakeScreenshot
---@param config integer
rl.SetConfigFlags = lib.SetConfigFlags
rl.OpenURL = lib.OpenURL
rl.TraceLog = lib.TraceLog
rl.SetTraceLogLevel = lib.SetTraceLogLevel
rl.MemAlloc = lib.MemAlloc
rl.MemRealloc = lib.MemRealloc
rl.MemFree = lib.MemFree
rl.LoadFileData = lib.LoadFileData
rl.UnloadFileData = lib.UnloadFileData
rl.SaveFileData = lib.SaveFileData
rl.ExportDataAsCode = lib.ExportDataAsCode
function rl.LoadFileText(fileName)
  return ffi.string(lib.LoadFileText(fileName))
end
rl.UnloadFileText = lib.UnloadFileText
rl.SaveFileText = lib.SaveFileText
rl.FileExists = lib.FileExists
rl.DirectoryExists = lib.DirectoryExists
rl.IsFileExtension = lib.IsFileExtension
rl.GetFileLength = lib.GetFileLength
function rl.GetFileExtension(fileName)
  return ffi.string(lib.GetFileExtension(fileName))
end
function rl.GetFileName(filePath)
  return ffi.string(lib.GetFileName(filePath))
end
function rl.GetFileNameWithoutExt(filePath)
  return ffi.string(lib.GetFileNameWithoutExt(filePath))
end
function rl.GetDirectoryPath(filePath)
  return ffi.string(lib.GetDirectoryPath(filePath))
end
function rl.GetPrevDirectoryPath(dirPath)
  return ffi.string(lib.GetPrevDirectoryPath(dirPath))
end
function rl.GetWorkingDirectory()
  return ffi.string(lib.GetWorkingDirectory())
end
function rl.GetApplicationDirectory()
  return ffi.string(lib.GetApplicationDirectory())
end
rl.ChangeDirectory = lib.ChangeDirectory
rl.IsPathFile = lib.IsPathFile
rl.LoadDirectoryFiles = lib.LoadDirectoryFiles
rl.LoadDirectoryFilesEx = lib.LoadDirectoryFilesEx
rl.UnloadDirectoryFiles = lib.UnloadDirectoryFiles
rl.IsFileDropped = lib.IsFileDropped
rl.LoadDroppedFiles = lib.LoadDroppedFiles
rl.UnloadDroppedFiles = lib.UnloadDroppedFiles
rl.GetFileModTime = lib.GetFileModTime
rl.CompressData = lib.CompressData
rl.DecompressData = lib.DecompressData
function rl.EncodeDataBase64(data, dataSize, outputSize)
  return ffi.string(lib.EncodeDataBase64(data, dataSize, outputSize))
end
rl.DecodeDataBase64 = lib.DecodeDataBase64
rl.LoadAutomationEventList = lib.LoadAutomationEventList
rl.UnloadAutomationEventList = lib.UnloadAutomationEventList
rl.ExportAutomationEventList = lib.ExportAutomationEventList
rl.SetAutomationEventList = lib.SetAutomationEventList
rl.SetAutomationEventBaseFrame = lib.SetAutomationEventBaseFrame
rl.StartAutomationEventRecording = lib.StartAutomationEventRecording
rl.StopAutomationEventRecording = lib.StopAutomationEventRecording
rl.PlayAutomationEvent = lib.PlayAutomationEvent
rl.IsKeyPressed = lib.IsKeyPressed
rl.IsKeyPressedRepeat = lib.IsKeyPressedRepeat
rl.IsKeyDown = lib.IsKeyDown
rl.IsKeyReleased = lib.IsKeyReleased
rl.IsKeyUp = lib.IsKeyUp
rl.GetKeyPressed = lib.GetKeyPressed
rl.GetCharPressed = lib.GetCharPressed
rl.SetExitKey = lib.SetExitKey
rl.IsGamepadAvailable = lib.IsGamepadAvailable
function rl.GetGamepadName(gamepad)
  return ffi.string(lib.GetGamepadName(gamepad))
end
rl.IsGamepadButtonPressed = lib.IsGamepadButtonPressed
rl.IsGamepadButtonDown = lib.IsGamepadButtonDown
rl.IsGamepadButtonReleased = lib.IsGamepadButtonReleased
rl.IsGamepadButtonUp = lib.IsGamepadButtonUp
rl.GetGamepadButtonPressed = lib.GetGamepadButtonPressed
rl.GetGamepadAxisCount = lib.GetGamepadAxisCount
rl.GetGamepadAxisMovement = lib.GetGamepadAxisMovement
rl.SetGamepadMappings = lib.SetGamepadMappings
rl.IsMouseButtonPressed = lib.IsMouseButtonPressed
rl.IsMouseButtonDown = lib.IsMouseButtonDown
rl.IsMouseButtonReleased = lib.IsMouseButtonReleased
rl.IsMouseButtonUp = lib.IsMouseButtonUp
rl.GetMouseX = lib.GetMouseX
rl.GetMouseY = lib.GetMouseY
rl.GetMousePosition = lib.GetMousePosition
rl.GetMouseDelta = lib.GetMouseDelta
rl.SetMousePosition = lib.SetMousePosition
rl.SetMouseOffset = lib.SetMouseOffset
rl.SetMouseScale = lib.SetMouseScale
rl.GetMouseWheelMove = lib.GetMouseWheelMove
rl.GetMouseWheelMoveV = lib.GetMouseWheelMoveV
rl.SetMouseCursor = lib.SetMouseCursor
rl.GetTouchX = lib.GetTouchX
rl.GetTouchY = lib.GetTouchY
rl.GetTouchPosition = lib.GetTouchPosition
rl.GetTouchPointId = lib.GetTouchPointId
rl.GetTouchPointCount = lib.GetTouchPointCount
rl.SetGesturesEnabled = lib.SetGesturesEnabled
rl.IsGestureDetected = lib.IsGestureDetected
rl.GetGestureDetected = lib.GetGestureDetected
rl.GetGestureHoldDuration = lib.GetGestureHoldDuration
rl.GetGestureDragVector = lib.GetGestureDragVector
rl.GetGestureDragAngle = lib.GetGestureDragAngle
rl.GetGesturePinchVector = lib.GetGesturePinchVector
rl.GetGesturePinchAngle = lib.GetGesturePinchAngle
rl.UpdateCamera = lib.UpdateCamera
rl.UpdateCameraPro = lib.UpdateCameraPro
rl.SetShapesTexture = lib.SetShapesTexture
rl.DrawPixel = lib.DrawPixel
rl.DrawPixelV = lib.DrawPixelV
rl.DrawLine = lib.DrawLine
rl.DrawLineV = lib.DrawLineV
rl.DrawLineEx = lib.DrawLineEx
rl.DrawLineStrip = lib.DrawLineStrip
rl.DrawLineBezier = lib.DrawLineBezier
rl.DrawCircle = lib.DrawCircle
rl.DrawCircleSector = lib.DrawCircleSector
rl.DrawCircleSectorLines = lib.DrawCircleSectorLines
rl.DrawCircleGradient = lib.DrawCircleGradient
rl.DrawCircleV = lib.DrawCircleV
rl.DrawCircleLines = lib.DrawCircleLines
rl.DrawCircleLinesV = lib.DrawCircleLinesV
rl.DrawEllipse = lib.DrawEllipse
rl.DrawEllipseLines = lib.DrawEllipseLines
rl.DrawRing = lib.DrawRing
rl.DrawRingLines = lib.DrawRingLines
rl.DrawRectangle = lib.DrawRectangle
rl.DrawRectangleV = lib.DrawRectangleV
rl.DrawRectangleRec = lib.DrawRectangleRec
rl.DrawRectanglePro = lib.DrawRectanglePro
rl.DrawRectangleGradientV = lib.DrawRectangleGradientV
rl.DrawRectangleGradientH = lib.DrawRectangleGradientH
rl.DrawRectangleGradientEx = lib.DrawRectangleGradientEx
rl.DrawRectangleLines = lib.DrawRectangleLines
rl.DrawRectangleLinesEx = lib.DrawRectangleLinesEx
rl.DrawRectangleRounded = lib.DrawRectangleRounded
rl.DrawRectangleRoundedLines = lib.DrawRectangleRoundedLines
rl.DrawTriangle = lib.DrawTriangle
rl.DrawTriangleLines = lib.DrawTriangleLines
rl.DrawTriangleFan = lib.DrawTriangleFan
rl.DrawTriangleStrip = lib.DrawTriangleStrip
rl.DrawPoly = lib.DrawPoly
rl.DrawPolyLines = lib.DrawPolyLines
rl.DrawPolyLinesEx = lib.DrawPolyLinesEx
rl.DrawSplineLinear = lib.DrawSplineLinear
rl.DrawSplineBasis = lib.DrawSplineBasis
rl.DrawSplineCatmullRom = lib.DrawSplineCatmullRom
rl.DrawSplineBezierQuadratic = lib.DrawSplineBezierQuadratic
rl.DrawSplineBezierCubic = lib.DrawSplineBezierCubic
rl.DrawSplineSegmentLinear = lib.DrawSplineSegmentLinear
rl.DrawSplineSegmentBasis = lib.DrawSplineSegmentBasis
rl.DrawSplineSegmentCatmullRom = lib.DrawSplineSegmentCatmullRom
rl.DrawSplineSegmentBezierQuadratic = lib.DrawSplineSegmentBezierQuadratic
rl.DrawSplineSegmentBezierCubic = lib.DrawSplineSegmentBezierCubic
rl.GetSplinePointLinear = lib.GetSplinePointLinear
rl.GetSplinePointBasis = lib.GetSplinePointBasis
rl.GetSplinePointCatmullRom = lib.GetSplinePointCatmullRom
rl.GetSplinePointBezierQuad = lib.GetSplinePointBezierQuad
rl.GetSplinePointBezierCubic = lib.GetSplinePointBezierCubic
rl.CheckCollisionRecs = lib.CheckCollisionRecs
rl.CheckCollisionCircles = lib.CheckCollisionCircles
rl.CheckCollisionCircleRec = lib.CheckCollisionCircleRec
rl.CheckCollisionPointRec = lib.CheckCollisionPointRec
rl.CheckCollisionPointCircle = lib.CheckCollisionPointCircle
rl.CheckCollisionPointTriangle = lib.CheckCollisionPointTriangle
rl.CheckCollisionPointPoly = lib.CheckCollisionPointPoly
rl.CheckCollisionLines = lib.CheckCollisionLines
rl.CheckCollisionPointLine = lib.CheckCollisionPointLine
rl.GetCollisionRec = lib.GetCollisionRec
rl.LoadImage = lib.LoadImage
rl.LoadImageRaw = lib.LoadImageRaw
rl.LoadImageAnim = lib.LoadImageAnim
rl.LoadImageFromMemory = lib.LoadImageFromMemory
rl.LoadImageFromTexture = lib.LoadImageFromTexture
rl.LoadImageFromScreen = lib.LoadImageFromScreen
rl.UnloadImage = lib.UnloadImage
rl.ExportImage = lib.ExportImage
rl.ExportImageToMemory = lib.ExportImageToMemory
rl.ExportImageAsCode = lib.ExportImageAsCode
rl.GenImageColor = lib.GenImageColor
rl.GenImageGradientLinear = lib.GenImageGradientLinear
rl.GenImageGradientRadial = lib.GenImageGradientRadial
rl.GenImageGradientSquare = lib.GenImageGradientSquare
rl.GenImageChecked = lib.GenImageChecked
rl.GenImageWhiteNoise = lib.GenImageWhiteNoise
rl.GenImagePerlinNoise = lib.GenImagePerlinNoise
rl.GenImageCellular = lib.GenImageCellular
rl.GenImageText = lib.GenImageText
rl.ImageCopy = lib.ImageCopy
rl.ImageFromImage = lib.ImageFromImage
rl.ImageText = lib.ImageText
rl.ImageTextEx = lib.ImageTextEx
rl.ImageFormat = lib.ImageFormat
rl.ImageToPOT = lib.ImageToPOT
rl.ImageCrop = lib.ImageCrop
rl.ImageAlphaCrop = lib.ImageAlphaCrop
rl.ImageAlphaClear = lib.ImageAlphaClear
rl.ImageAlphaMask = lib.ImageAlphaMask
rl.ImageAlphaPremultiply = lib.ImageAlphaPremultiply
rl.ImageBlurGaussian = lib.ImageBlurGaussian
rl.ImageResize = lib.ImageResize
rl.ImageResizeNN = lib.ImageResizeNN
rl.ImageResizeCanvas = lib.ImageResizeCanvas
rl.ImageMipmaps = lib.ImageMipmaps
rl.ImageDither = lib.ImageDither
rl.ImageFlipVertical = lib.ImageFlipVertical
rl.ImageFlipHorizontal = lib.ImageFlipHorizontal
rl.ImageRotate = lib.ImageRotate
rl.ImageRotateCW = lib.ImageRotateCW
rl.ImageRotateCCW = lib.ImageRotateCCW
rl.ImageColorTint = lib.ImageColorTint
rl.ImageColorInvert = lib.ImageColorInvert
rl.ImageColorGrayscale = lib.ImageColorGrayscale
rl.ImageColorContrast = lib.ImageColorContrast
rl.ImageColorBrightness = lib.ImageColorBrightness
rl.ImageColorReplace = lib.ImageColorReplace
rl.LoadImageColors = lib.LoadImageColors
rl.LoadImagePalette = lib.LoadImagePalette
rl.UnloadImageColors = lib.UnloadImageColors
rl.UnloadImagePalette = lib.UnloadImagePalette
rl.GetImageAlphaBorder = lib.GetImageAlphaBorder
rl.GetImageColor = lib.GetImageColor
rl.ImageClearBackground = lib.ImageClearBackground
rl.ImageDrawPixel = lib.ImageDrawPixel
rl.ImageDrawPixelV = lib.ImageDrawPixelV
rl.ImageDrawLine = lib.ImageDrawLine
rl.ImageDrawLineV = lib.ImageDrawLineV
rl.ImageDrawCircle = lib.ImageDrawCircle
rl.ImageDrawCircleV = lib.ImageDrawCircleV
rl.ImageDrawCircleLines = lib.ImageDrawCircleLines
rl.ImageDrawCircleLinesV = lib.ImageDrawCircleLinesV
rl.ImageDrawRectangle = lib.ImageDrawRectangle
rl.ImageDrawRectangleV = lib.ImageDrawRectangleV
rl.ImageDrawRectangleRec = lib.ImageDrawRectangleRec
rl.ImageDrawRectangleLines = lib.ImageDrawRectangleLines
rl.ImageDraw = lib.ImageDraw
rl.ImageDrawText = lib.ImageDrawText
rl.ImageDrawTextEx = lib.ImageDrawTextEx
rl.LoadTexture = lib.LoadTexture
rl.LoadTextureFromImage = lib.LoadTextureFromImage
rl.LoadTextureCubemap = lib.LoadTextureCubemap
rl.LoadRenderTexture = lib.LoadRenderTexture
rl.UnloadTexture = lib.UnloadTexture
rl.UnloadRenderTexture = lib.UnloadRenderTexture
rl.UpdateTexture = lib.UpdateTexture
rl.UpdateTextureRec = lib.UpdateTextureRec
rl.GenTextureMipmaps = lib.GenTextureMipmaps
rl.SetTextureFilter = lib.SetTextureFilter
rl.SetTextureWrap = lib.SetTextureWrap
rl.DrawTexture = lib.DrawTexture
rl.DrawTextureV = lib.DrawTextureV
rl.DrawTextureEx = lib.DrawTextureEx
rl.DrawTextureRec = lib.DrawTextureRec
rl.DrawTexturePro = lib.DrawTexturePro
rl.DrawTextureNPatch = lib.DrawTextureNPatch
rl.Fade = lib.Fade
rl.ColorToInt = lib.ColorToInt
rl.ColorNormalize = lib.ColorNormalize
rl.ColorFromNormalized = lib.ColorFromNormalized
rl.ColorToHSV = lib.ColorToHSV
rl.ColorFromHSV = lib.ColorFromHSV
rl.ColorTint = lib.ColorTint
rl.ColorBrightness = lib.ColorBrightness
rl.ColorContrast = lib.ColorContrast
rl.ColorAlpha = lib.ColorAlpha
rl.ColorAlphaBlend = lib.ColorAlphaBlend
rl.GetColor = lib.GetColor
rl.GetPixelColor = lib.GetPixelColor
rl.SetPixelColor = lib.SetPixelColor
rl.GetPixelDataSize = lib.GetPixelDataSize
rl.GetFontDefault = lib.GetFontDefault
rl.LoadFont = lib.LoadFont
rl.LoadFontEx = lib.LoadFontEx
rl.LoadFontFromImage = lib.LoadFontFromImage
rl.LoadFontFromMemory = lib.LoadFontFromMemory
rl.LoadFontData = lib.LoadFontData
rl.GenImageFontAtlas = lib.GenImageFontAtlas
rl.UnloadFontData = lib.UnloadFontData
rl.UnloadFont = lib.UnloadFont
rl.ExportFontAsCode = lib.ExportFontAsCode
rl.DrawFPS = lib.DrawFPS

---@param text string
---@param posX integer
---@param posY integer
---@param fontSize integer
---@param color Color
---@return void
function rl.DrawText(text, posX, posY, fontSize, color)
  return lib.DrawText(text, posX, posY, fontSize, color)
end

rl.DrawTextEx = lib.DrawTextEx
rl.DrawTextPro = lib.DrawTextPro
rl.DrawTextCodepoint = lib.DrawTextCodepoint
rl.DrawTextCodepoints = lib.DrawTextCodepoints
rl.SetTextLineSpacing = lib.SetTextLineSpacing
rl.MeasureText = lib.MeasureText
rl.MeasureTextEx = lib.MeasureTextEx
rl.GetGlyphIndex = lib.GetGlyphIndex
rl.GetGlyphInfo = lib.GetGlyphInfo
rl.GetGlyphAtlasRec = lib.GetGlyphAtlasRec
function rl.LoadUTF8(codepoints, length)
  return ffi.string(lib.LoadUTF8(codepoints, length))
end
rl.UnloadUTF8 = lib.UnloadUTF8
rl.LoadCodepoints = lib.LoadCodepoints
rl.UnloadCodepoints = lib.UnloadCodepoints
rl.GetCodepointCount = lib.GetCodepointCount
rl.GetCodepoint = lib.GetCodepoint
rl.GetCodepointNext = lib.GetCodepointNext
rl.GetCodepointPrevious = lib.GetCodepointPrevious
function rl.CodepointToUTF8(codepoint, utf8Size)
  return ffi.string(lib.CodepointToUTF8(codepoint, utf8Size))
end
rl.TextCopy = lib.TextCopy
rl.TextIsEqual = lib.TextIsEqual
rl.TextLength = lib.TextLength
function rl.TextFormat(text, args)
  return ffi.string(lib.TextFormat(text, args))
end
function rl.TextSubtext(text, position, length)
  return ffi.string(lib.TextSubtext(text, position, length))
end
function rl.TextReplace(text, replace, by)
  return ffi.string(lib.TextReplace(text, replace, by))
end
function rl.TextInsert(text, insert, position)
  return ffi.string(lib.TextInsert(text, insert, position))
end
function rl.TextJoin(textList, count, delimiter)
  return ffi.string(lib.TextJoin(textList, count, delimiter))
end
rl.TextSplit = lib.TextSplit
rl.TextAppend = lib.TextAppend
rl.TextFindIndex = lib.TextFindIndex
function rl.TextToUpper(text)
  return ffi.string(lib.TextToUpper(text))
end
function rl.TextToLower(text)
  return ffi.string(lib.TextToLower(text))
end
function rl.TextToPascal(text)
  return ffi.string(lib.TextToPascal(text))
end
rl.TextToInteger = lib.TextToInteger
rl.DrawLine3D = lib.DrawLine3D
rl.DrawPoint3D = lib.DrawPoint3D
rl.DrawCircle3D = lib.DrawCircle3D
rl.DrawTriangle3D = lib.DrawTriangle3D
rl.DrawTriangleStrip3D = lib.DrawTriangleStrip3D
rl.DrawCube = lib.DrawCube
rl.DrawCubeV = lib.DrawCubeV
rl.DrawCubeWires = lib.DrawCubeWires
rl.DrawCubeWiresV = lib.DrawCubeWiresV
rl.DrawSphere = lib.DrawSphere
rl.DrawSphereEx = lib.DrawSphereEx
rl.DrawSphereWires = lib.DrawSphereWires
rl.DrawCylinder = lib.DrawCylinder
rl.DrawCylinderEx = lib.DrawCylinderEx
rl.DrawCylinderWires = lib.DrawCylinderWires
rl.DrawCylinderWiresEx = lib.DrawCylinderWiresEx
rl.DrawCapsule = lib.DrawCapsule
rl.DrawCapsuleWires = lib.DrawCapsuleWires
rl.DrawPlane = lib.DrawPlane
rl.DrawRay = lib.DrawRay
rl.DrawGrid = lib.DrawGrid
rl.LoadModel = lib.LoadModel
rl.LoadModelFromMesh = lib.LoadModelFromMesh
rl.UnloadModel = lib.UnloadModel
rl.GetModelBoundingBox = lib.GetModelBoundingBox
rl.DrawModel = lib.DrawModel
rl.DrawModelEx = lib.DrawModelEx
rl.DrawModelWires = lib.DrawModelWires
rl.DrawModelWiresEx = lib.DrawModelWiresEx
rl.DrawBoundingBox = lib.DrawBoundingBox
rl.DrawBillboard = lib.DrawBillboard
rl.DrawBillboardRec = lib.DrawBillboardRec
rl.DrawBillboardPro = lib.DrawBillboardPro
rl.UploadMesh = lib.UploadMesh
rl.UpdateMeshBuffer = lib.UpdateMeshBuffer
rl.UnloadMesh = lib.UnloadMesh
rl.DrawMesh = lib.DrawMesh
rl.DrawMeshInstanced = lib.DrawMeshInstanced
rl.ExportMesh = lib.ExportMesh
rl.GetMeshBoundingBox = lib.GetMeshBoundingBox
rl.GenMeshTangents = lib.GenMeshTangents
rl.GenMeshPoly = lib.GenMeshPoly
rl.GenMeshPlane = lib.GenMeshPlane
rl.GenMeshCube = lib.GenMeshCube
rl.GenMeshSphere = lib.GenMeshSphere
rl.GenMeshHemiSphere = lib.GenMeshHemiSphere
rl.GenMeshCylinder = lib.GenMeshCylinder
rl.GenMeshCone = lib.GenMeshCone
rl.GenMeshTorus = lib.GenMeshTorus
rl.GenMeshKnot = lib.GenMeshKnot
rl.GenMeshHeightmap = lib.GenMeshHeightmap
rl.GenMeshCubicmap = lib.GenMeshCubicmap
rl.LoadMaterials = lib.LoadMaterials
rl.LoadMaterialDefault = lib.LoadMaterialDefault
rl.UnloadMaterial = lib.UnloadMaterial
rl.SetMaterialTexture = lib.SetMaterialTexture
rl.SetModelMeshMaterial = lib.SetModelMeshMaterial
rl.LoadModelAnimations = lib.LoadModelAnimations
rl.UpdateModelAnimation = lib.UpdateModelAnimation
rl.UnloadModelAnimation = lib.UnloadModelAnimation
rl.UnloadModelAnimations = lib.UnloadModelAnimations
rl.IsModelAnimationValid = lib.IsModelAnimationValid
rl.CheckCollisionSpheres = lib.CheckCollisionSpheres
rl.CheckCollisionBoxes = lib.CheckCollisionBoxes
rl.CheckCollisionBoxSphere = lib.CheckCollisionBoxSphere
rl.GetRayCollisionSphere = lib.GetRayCollisionSphere
rl.GetRayCollisionBox = lib.GetRayCollisionBox
rl.GetRayCollisionMesh = lib.GetRayCollisionMesh
rl.GetRayCollisionTriangle = lib.GetRayCollisionTriangle
rl.GetRayCollisionQuad = lib.GetRayCollisionQuad
rl.InitAudioDevice = lib.InitAudioDevice
rl.CloseAudioDevice = lib.CloseAudioDevice
rl.SetMasterVolume = lib.SetMasterVolume
rl.GetMasterVolume = lib.GetMasterVolume
rl.LoadWave = lib.LoadWave
rl.LoadWaveFromMemory = lib.LoadWaveFromMemory
rl.UnloadWave = lib.UnloadWave
rl.ExportWave = lib.ExportWave
rl.ExportWaveAsCode = lib.ExportWaveAsCode
rl.WaveCopy = lib.WaveCopy
rl.WaveCrop = lib.WaveCrop
rl.WaveFormat = lib.WaveFormat
rl.LoadWaveSamples = lib.LoadWaveSamples
rl.UnloadWaveSamples = lib.UnloadWaveSamples
rl.LoadMusicStream = lib.LoadMusicStream
rl.LoadMusicStreamFromMemory = lib.LoadMusicStreamFromMemory
rl.UnloadMusicStream = lib.UnloadMusicStream
rl.PlayMusicStream = lib.PlayMusicStream
rl.IsMusicStreamPlaying = lib.IsMusicStreamPlaying
rl.UpdateMusicStream = lib.UpdateMusicStream
rl.StopMusicStream = lib.StopMusicStream
rl.PauseMusicStream = lib.PauseMusicStream
rl.ResumeMusicStream = lib.ResumeMusicStream
rl.SeekMusicStream = lib.SeekMusicStream
rl.SetMusicVolume = lib.SetMusicVolume
rl.SetMusicPitch = lib.SetMusicPitch
rl.SetMusicPan = lib.SetMusicPan
rl.GetMusicTimeLength = lib.GetMusicTimeLength
rl.GetMusicTimePlayed = lib.GetMusicTimePlayed
rl.LoadAudioStream = lib.LoadAudioStream
rl.UnloadAudioStream = lib.UnloadAudioStream
rl.UpdateAudioStream = lib.UpdateAudioStream
rl.IsAudioStreamProcessed = lib.IsAudioStreamProcessed
rl.PlayAudioStream = lib.PlayAudioStream
rl.PauseAudioStream = lib.PauseAudioStream
rl.ResumeAudioStream = lib.ResumeAudioStream
rl.IsAudioStreamPlaying = lib.IsAudioStreamPlaying
rl.StopAudioStream = lib.StopAudioStream
rl.SetAudioStreamVolume = lib.SetAudioStreamVolume
rl.SetAudioStreamPitch = lib.SetAudioStreamPitch
rl.SetAudioStreamPan = lib.SetAudioStreamPan
rl.SetAudioStreamBufferSizeDefault = lib.SetAudioStreamBufferSizeDefault
rl.rlMatrixMode = lib.rlMatrixMode
rl.rlPushMatrix = lib.rlPushMatrix
rl.rlPopMatrix = lib.rlPopMatrix
rl.rlLoadIdentity = lib.rlLoadIdentity
rl.rlTranslatef = lib.rlTranslatef
rl.rlRotatef = lib.rlRotatef
rl.rlScalef = lib.rlScalef
rl.rlMultMatrixf = lib.rlMultMatrixf
rl.rlFrustum = lib.rlFrustum
rl.rlOrtho = lib.rlOrtho
rl.rlViewport = lib.rlViewport
rl.rlBegin = lib.rlBegin
rl.rlEnd = lib.rlEnd
rl.rlVertex2i = lib.rlVertex2i
rl.rlVertex2f = lib.rlVertex2f
rl.rlVertex3f = lib.rlVertex3f
rl.rlTexCoord2f = lib.rlTexCoord2f
rl.rlNormal3f = lib.rlNormal3f
rl.rlColor4ub = lib.rlColor4ub
rl.rlColor3f = lib.rlColor3f
rl.rlColor4f = lib.rlColor4f
rl.rlEnableVertexArray = lib.rlEnableVertexArray
rl.rlDisableVertexArray = lib.rlDisableVertexArray
rl.rlEnableVertexBuffer = lib.rlEnableVertexBuffer
rl.rlDisableVertexBuffer = lib.rlDisableVertexBuffer
rl.rlEnableVertexBufferElement = lib.rlEnableVertexBufferElement
rl.rlDisableVertexBufferElement = lib.rlDisableVertexBufferElement
rl.rlEnableVertexAttribute = lib.rlEnableVertexAttribute
rl.rlDisableVertexAttribute = lib.rlDisableVertexAttribute
rl.rlActiveTextureSlot = lib.rlActiveTextureSlot
rl.rlEnableTexture = lib.rlEnableTexture
rl.rlDisableTexture = lib.rlDisableTexture
rl.rlEnableTextureCubemap = lib.rlEnableTextureCubemap
rl.rlDisableTextureCubemap = lib.rlDisableTextureCubemap
rl.rlTextureParameters = lib.rlTextureParameters
rl.rlCubemapParameters = lib.rlCubemapParameters
rl.rlEnableShader = lib.rlEnableShader
rl.rlDisableShader = lib.rlDisableShader
rl.rlEnableFramebuffer = lib.rlEnableFramebuffer
rl.rlDisableFramebuffer = lib.rlDisableFramebuffer
rl.rlActiveDrawBuffers = lib.rlActiveDrawBuffers
rl.rlBlitFramebuffer = lib.rlBlitFramebuffer
rl.rlEnableColorBlend = lib.rlEnableColorBlend
rl.rlDisableColorBlend = lib.rlDisableColorBlend
rl.rlEnableDepthTest = lib.rlEnableDepthTest
rl.rlDisableDepthTest = lib.rlDisableDepthTest
rl.rlEnableDepthMask = lib.rlEnableDepthMask
rl.rlDisableDepthMask = lib.rlDisableDepthMask
rl.rlEnableBackfaceCulling = lib.rlEnableBackfaceCulling
rl.rlDisableBackfaceCulling = lib.rlDisableBackfaceCulling
rl.rlSetCullFace = lib.rlSetCullFace
rl.rlEnableScissorTest = lib.rlEnableScissorTest
rl.rlDisableScissorTest = lib.rlDisableScissorTest
rl.rlScissor = lib.rlScissor
rl.rlEnableWireMode = lib.rlEnableWireMode
rl.rlEnablePointMode = lib.rlEnablePointMode
rl.rlDisableWireMode = lib.rlDisableWireMode
rl.rlSetLineWidth = lib.rlSetLineWidth
rl.rlGetLineWidth = lib.rlGetLineWidth
rl.rlEnableSmoothLines = lib.rlEnableSmoothLines
rl.rlDisableSmoothLines = lib.rlDisableSmoothLines
rl.rlEnableStereoRender = lib.rlEnableStereoRender
rl.rlDisableStereoRender = lib.rlDisableStereoRender
rl.rlIsStereoRenderEnabled = lib.rlIsStereoRenderEnabled
rl.rlClearColor = lib.rlClearColor
rl.rlClearScreenBuffers = lib.rlClearScreenBuffers
rl.rlCheckErrors = lib.rlCheckErrors
rl.rlSetBlendMode = lib.rlSetBlendMode
rl.rlSetBlendFactors = lib.rlSetBlendFactors
rl.rlSetBlendFactorsSeparate = lib.rlSetBlendFactorsSeparate
rl.rlglInit = lib.rlglInit
rl.rlglClose = lib.rlglClose
rl.rlLoadExtensions = lib.rlLoadExtensions
rl.rlGetVersion = lib.rlGetVersion
rl.rlSetFramebufferWidth = lib.rlSetFramebufferWidth
rl.rlGetFramebufferWidth = lib.rlGetFramebufferWidth
rl.rlSetFramebufferHeight = lib.rlSetFramebufferHeight
rl.rlGetFramebufferHeight = lib.rlGetFramebufferHeight
rl.rlGetTextureIdDefault = lib.rlGetTextureIdDefault
rl.rlGetShaderIdDefault = lib.rlGetShaderIdDefault
rl.rlGetShaderLocsDefault = lib.rlGetShaderLocsDefault
rl.rlLoadRenderBatch = lib.rlLoadRenderBatch
rl.rlUnloadRenderBatch = lib.rlUnloadRenderBatch
rl.rlDrawRenderBatch = lib.rlDrawRenderBatch
rl.rlSetRenderBatchActive = lib.rlSetRenderBatchActive
rl.rlDrawRenderBatchActive = lib.rlDrawRenderBatchActive
rl.rlCheckRenderBatchLimit = lib.rlCheckRenderBatchLimit
rl.rlSetTexture = lib.rlSetTexture
rl.rlLoadVertexArray = lib.rlLoadVertexArray
rl.rlLoadVertexBuffer = lib.rlLoadVertexBuffer
rl.rlLoadVertexBufferElement = lib.rlLoadVertexBufferElement
rl.rlUpdateVertexBuffer = lib.rlUpdateVertexBuffer
rl.rlUpdateVertexBufferElements = lib.rlUpdateVertexBufferElements
rl.rlUnloadVertexArray = lib.rlUnloadVertexArray
rl.rlUnloadVertexBuffer = lib.rlUnloadVertexBuffer
rl.rlSetVertexAttribute = lib.rlSetVertexAttribute
rl.rlSetVertexAttributeDivisor = lib.rlSetVertexAttributeDivisor
rl.rlSetVertexAttributeDefault = lib.rlSetVertexAttributeDefault
rl.rlDrawVertexArray = lib.rlDrawVertexArray
rl.rlDrawVertexArrayElements = lib.rlDrawVertexArrayElements
rl.rlDrawVertexArrayInstanced = lib.rlDrawVertexArrayInstanced
rl.rlDrawVertexArrayElementsInstanced = lib.rlDrawVertexArrayElementsInstanced
rl.rlLoadTexture = lib.rlLoadTexture
rl.rlLoadTextureDepth = lib.rlLoadTextureDepth
rl.rlLoadTextureCubemap = lib.rlLoadTextureCubemap
rl.rlUpdateTexture = lib.rlUpdateTexture
rl.rlGetGlTextureFormats = lib.rlGetGlTextureFormats
function rl.rlGetPixelFormatName(format)
  return ffi.string(lib.rlGetPixelFormatName(format))
end
rl.rlUnloadTexture = lib.rlUnloadTexture
rl.rlGenTextureMipmaps = lib.rlGenTextureMipmaps
rl.rlReadTexturePixels = lib.rlReadTexturePixels
rl.rlReadScreenPixels = lib.rlReadScreenPixels
rl.rlLoadFramebuffer = lib.rlLoadFramebuffer
rl.rlFramebufferAttach = lib.rlFramebufferAttach
rl.rlFramebufferComplete = lib.rlFramebufferComplete
rl.rlUnloadFramebuffer = lib.rlUnloadFramebuffer
rl.rlLoadShaderCode = lib.rlLoadShaderCode
rl.rlCompileShader = lib.rlCompileShader
rl.rlLoadShaderProgram = lib.rlLoadShaderProgram
rl.rlUnloadShaderProgram = lib.rlUnloadShaderProgram
rl.rlGetLocationUniform = lib.rlGetLocationUniform
rl.rlGetLocationAttrib = lib.rlGetLocationAttrib
rl.rlSetUniform = lib.rlSetUniform
rl.rlSetUniformMatrix = lib.rlSetUniformMatrix
rl.rlSetUniformSampler = lib.rlSetUniformSampler
rl.rlSetShader = lib.rlSetShader
rl.rlLoadComputeShaderProgram = lib.rlLoadComputeShaderProgram
rl.rlComputeShaderDispatch = lib.rlComputeShaderDispatch
rl.rlLoadShaderBuffer = lib.rlLoadShaderBuffer
rl.rlUnloadShaderBuffer = lib.rlUnloadShaderBuffer
rl.rlUpdateShaderBuffer = lib.rlUpdateShaderBuffer
rl.rlBindShaderBuffer = lib.rlBindShaderBuffer
rl.rlReadShaderBuffer = lib.rlReadShaderBuffer
rl.rlCopyShaderBuffer = lib.rlCopyShaderBuffer
rl.rlGetShaderBufferSize = lib.rlGetShaderBufferSize
rl.rlBindImageTexture = lib.rlBindImageTexture
rl.rlGetMatrixModelview = lib.rlGetMatrixModelview
rl.rlGetMatrixProjection = lib.rlGetMatrixProjection
rl.rlGetMatrixTransform = lib.rlGetMatrixTransform
rl.rlGetMatrixProjectionStereo = lib.rlGetMatrixProjectionStereo
rl.rlGetMatrixViewOffsetStereo = lib.rlGetMatrixViewOffsetStereo
rl.rlSetMatrixProjection = lib.rlSetMatrixProjection
rl.rlSetMatrixModelview = lib.rlSetMatrixModelview
rl.rlSetMatrixProjectionStereo = lib.rlSetMatrixProjectionStereo
rl.rlSetMatrixViewOffsetStereo = lib.rlSetMatrixViewOffsetStereo
rl.rlLoadDrawCube = lib.rlLoadDrawCube
rl.rlLoadDrawQuad = lib.rlLoadDrawQuad
rl.rlGetMatrixProjectionStereo = lib.rlGetMatrixProjectionStereo
rl.rlGetMatrixViewOffsetStereo = lib.rlGetMatrixViewOffsetStereo
return rl
