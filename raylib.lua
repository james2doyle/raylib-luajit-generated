local ffi = require("ffi")
local lib = ffi.load("libraylib")

local generated = io.open("generated.h", "r")

if generated == nil then
  error("Cannot find generated.h")
end

ffi.cdef(generated:read("*all"))

local mt = {__index = lib}
local rl = setmetatable({}, mt)

--- 
rl.RAYLIB_VERSION_MAJOR = 5

--- 
rl.RAYLIB_VERSION_MINOR = 0

--- 
rl.RAYLIB_VERSION_PATCH = 0

--- 
rl.RAYLIB_VERSION = 5.0

--- 
rl.PI = 3.141592653589793

--- Light Gray
rl.LIGHTGRAY = { 200, 200, 200, 255 }

--- Gray
rl.GRAY = { 130, 130, 130, 255 }

--- Dark Gray
rl.DARKGRAY = { 80, 80, 80, 255 }

--- Yellow
rl.YELLOW = { 253, 249, 0, 255 }

--- Gold
rl.GOLD = { 255, 203, 0, 255 }

--- Orange
rl.ORANGE = { 255, 161, 0, 255 }

--- Pink
rl.PINK = { 255, 109, 194, 255 }

--- Red
rl.RED = { 230, 41, 55, 255 }

--- Maroon
rl.MAROON = { 190, 33, 55, 255 }

--- Green
rl.GREEN = { 0, 228, 48, 255 }

--- Lime
rl.LIME = { 0, 158, 47, 255 }

--- Dark Green
rl.DARKGREEN = { 0, 117, 44, 255 }

--- Sky Blue
rl.SKYBLUE = { 102, 191, 255, 255 }

--- Blue
rl.BLUE = { 0, 121, 241, 255 }

--- Dark Blue
rl.DARKBLUE = { 0, 82, 172, 255 }

--- Purple
rl.PURPLE = { 200, 122, 255, 255 }

--- Violet
rl.VIOLET = { 135, 60, 190, 255 }

--- Dark Purple
rl.DARKPURPLE = { 112, 31, 126, 255 }

--- Beige
rl.BEIGE = { 211, 176, 131, 255 }

--- Brown
rl.BROWN = { 127, 106, 79, 255 }

--- Dark Brown
rl.DARKBROWN = { 76, 63, 47, 255 }

--- White
rl.WHITE = { 255, 255, 255, 255 }

--- Black
rl.BLACK = { 0, 0, 0, 255 }

--- Blank (Transparent)
rl.BLANK = { 0, 0, 0, 0 }

--- Magenta
rl.MAGENTA = { 255, 0, 255, 255 }

--- My own White (raylib logo)
rl.RAYWHITE = { 245, 245, 245, 255 }


--- Vector2, 2 components
---@param x number Vector x component
---@param y number Vector y component
function rl.Vector2(x, y)
  return ffi.new("Vector2", x, y)
end


--- Vector3, 3 components
---@param x number Vector x component
---@param y number Vector y component
---@param z number Vector z component
function rl.Vector3(x, y, z)
  return ffi.new("Vector3", x, y, z)
end


--- Vector4, 4 components
---@param x number Vector x component
---@param y number Vector y component
---@param z number Vector z component
---@param w number Vector w component
function rl.Vector4(x, y, z, w)
  return ffi.new("Vector4", x, y, z, w)
end


--- Matrix, 4x4 components, column major, OpenGL style, right-handed
---@param m0 number Matrix first row (4 components)
---@param m4 number Matrix first row (4 components)
---@param m8 number Matrix first row (4 components)
---@param m12 number Matrix first row (4 components)
---@param m1 number Matrix second row (4 components)
---@param m5 number Matrix second row (4 components)
---@param m9 number Matrix second row (4 components)
---@param m13 number Matrix second row (4 components)
---@param m2 number Matrix third row (4 components)
---@param m6 number Matrix third row (4 components)
---@param m10 number Matrix third row (4 components)
---@param m14 number Matrix third row (4 components)
---@param m3 number Matrix fourth row (4 components)
---@param m7 number Matrix fourth row (4 components)
---@param m11 number Matrix fourth row (4 components)
---@param m15 number Matrix fourth row (4 components)
function rl.Matrix(m0, m4, m8, m12, m1, m5, m9, m13, m2, m6, m10, m14, m3, m7, m11, m15)
  return ffi.new("Matrix", m0, m4, m8, m12, m1, m5, m9, m13, m2, m6, m10, m14, m3, m7, m11, m15)
end


--- Color, 4 components, R8G8B8A8 (32bit)
---@param r string Color red value
---@param g string Color green value
---@param b string Color blue value
---@param a string Color alpha value
function rl.Color(r, g, b, a)
  return ffi.new("Color", r, g, b, a)
end


--- Rectangle, 4 components
---@param x number Rectangle top-left corner position x
---@param y number Rectangle top-left corner position y
---@param width number Rectangle width
---@param height number Rectangle height
function rl.Rectangle(x, y, width, height)
  return ffi.new("Rectangle", x, y, width, height)
end


--- Image, pixel data stored in CPU memory (RAM)
---@param data void Image raw data
---@param width integer Image base width
---@param height integer Image base height
---@param mipmaps integer Mipmap levels, 1 by default
---@param format integer Data format (PixelFormat type)
function rl.Image(data, width, height, mipmaps, format)
  return ffi.new("Image", data, width, height, mipmaps, format)
end


--- Texture, tex data stored in GPU memory (VRAM)
---@param id integer OpenGL texture id
---@param width integer Texture base width
---@param height integer Texture base height
---@param mipmaps integer Mipmap levels, 1 by default
---@param format integer Data format (PixelFormat type)
function rl.Texture(id, width, height, mipmaps, format)
  return ffi.new("Texture", id, width, height, mipmaps, format)
end


--- RenderTexture, fbo for texture rendering
---@param id integer OpenGL framebuffer object id
---@param texture Texture Color buffer attachment texture
---@param depth Texture Depth buffer attachment texture
function rl.RenderTexture(id, texture, depth)
  return ffi.new("RenderTexture", id, texture, depth)
end


--- NPatchInfo, n-patch layout info
---@param source Rectangle Texture source rectangle
---@param left integer Left border offset
---@param top integer Top border offset
---@param right integer Right border offset
---@param bottom integer Bottom border offset
---@param layout integer Layout of the n-patch: 3x3, 1x3 or 3x1
function rl.NPatchInfo(source, left, top, right, bottom, layout)
  return ffi.new("NPatchInfo", source, left, top, right, bottom, layout)
end


--- GlyphInfo, font characters glyphs info
---@param value integer Character value (Unicode)
---@param offsetX integer Character offset X when drawing
---@param offsetY integer Character offset Y when drawing
---@param advanceX integer Character advance position X
---@param image Image Character image data
function rl.GlyphInfo(value, offsetX, offsetY, advanceX, image)
  return ffi.new("GlyphInfo", value, offsetX, offsetY, advanceX, image)
end


--- Font, font texture and GlyphInfo array data
---@param baseSize integer Base size (default chars height)
---@param glyphCount integer Number of glyph characters
---@param glyphPadding integer Padding around the glyph characters
---@param texture Texture2D Texture atlas containing the glyphs
---@param recs Rectangle * Rectangles in texture for the glyphs
---@param glyphs GlyphInfo * Glyphs info data
function rl.Font(baseSize, glyphCount, glyphPadding, texture, recs, glyphs)
  return ffi.new("Font", baseSize, glyphCount, glyphPadding, texture, recs, glyphs)
end


--- Camera, defines position/orientation in 3d space
---@param position Vector3 Camera position
---@param target Vector3 Camera target it looks-at
---@param up Vector3 Camera up vector (rotation over its axis)
---@param fovy number Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
---@param projection integer Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
function rl.Camera3D(position, target, up, fovy, projection)
  return ffi.new("Camera3D", position, target, up, fovy, projection)
end


--- Camera2D, defines position/orientation in 2d space
---@param offset Vector2 Camera offset (displacement from target)
---@param target Vector2 Camera target (rotation and zoom origin)
---@param rotation number Camera rotation in degrees
---@param zoom number Camera zoom (scaling), should be 1.0f by default
function rl.Camera2D(offset, target, rotation, zoom)
  return ffi.new("Camera2D", offset, target, rotation, zoom)
end


--- Mesh, vertex data and vao/vbo
---@param vertexCount integer Number of vertices stored in arrays
---@param triangleCount integer Number of triangles stored (indexed or not)
---@param vertices number Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
---@param texcoords number Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
---@param texcoords2 number Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
---@param normals number Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
---@param tangents number Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
---@param colors string Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
---@param indices string Vertex indices (in case vertex data comes indexed)
---@param animVertices number Animated vertex positions (after bones transformations)
---@param animNormals number Animated normals (after bones transformations)
---@param boneIds string Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
---@param boneWeights number Vertex bone weight, up to 4 bones influence by vertex (skinning)
---@param vaoId integer OpenGL Vertex Array Object id
---@param vboId unsigned int * OpenGL Vertex Buffer Objects id (default vertex data)
function rl.Mesh(vertexCount, triangleCount, vertices, texcoords, texcoords2, normals, tangents, colors, indices, animVertices, animNormals, boneIds, boneWeights, vaoId, vboId)
  return ffi.new("Mesh", vertexCount, triangleCount, vertices, texcoords, texcoords2, normals, tangents, colors, indices, animVertices, animNormals, boneIds, boneWeights, vaoId, vboId)
end


--- Shader
---@param id integer Shader program id
---@param locs integer Shader locations array (RL_MAX_SHADER_LOCATIONS)
function rl.Shader(id, locs)
  return ffi.new("Shader", id, locs)
end


--- MaterialMap
---@param texture Texture2D Material map texture
---@param color Color Material map color
---@param value number Material map value
function rl.MaterialMap(texture, color, value)
  return ffi.new("MaterialMap", texture, color, value)
end


--- Material, includes shader and maps
---@param shader Shader Material shader
---@param maps MaterialMap * Material maps array (MAX_MATERIAL_MAPS)
---@param params float[4] Material generic parameters (if required)
function rl.Material(shader, maps, params)
  return ffi.new("Material", shader, maps, params)
end


--- Transform, vertex transformation data
---@param translation Vector3 Translation
---@param rotation Quaternion Rotation
---@param scale Vector3 Scale
function rl.Transform(translation, rotation, scale)
  return ffi.new("Transform", translation, rotation, scale)
end


--- Bone, skeletal animation bone
---@param name char[32] Bone name
---@param parent integer Bone parent
function rl.BoneInfo(name, parent)
  return ffi.new("BoneInfo", name, parent)
end


--- Model, meshes, materials and animation data
---@param transform Matrix Local transform matrix
---@param meshCount integer Number of meshes
---@param materialCount integer Number of materials
---@param meshes Mesh * Meshes array
---@param materials Material * Materials array
---@param meshMaterial integer Mesh material number
---@param boneCount integer Number of bones
---@param bones BoneInfo * Bones information (skeleton)
---@param bindPose Transform * Bones base transformation (pose)
function rl.Model(transform, meshCount, materialCount, meshes, materials, meshMaterial, boneCount, bones, bindPose)
  return ffi.new("Model", transform, meshCount, materialCount, meshes, materials, meshMaterial, boneCount, bones, bindPose)
end


--- ModelAnimation
---@param boneCount integer Number of bones
---@param frameCount integer Number of animation frames
---@param bones BoneInfo * Bones information (skeleton)
---@param framePoses Transform ** Poses array by frame
---@param name char[32] Animation name
function rl.ModelAnimation(boneCount, frameCount, bones, framePoses, name)
  return ffi.new("ModelAnimation", boneCount, frameCount, bones, framePoses, name)
end


--- Ray, ray for raycasting
---@param position Vector3 Ray position (origin)
---@param direction Vector3 Ray direction
function rl.Ray(position, direction)
  return ffi.new("Ray", position, direction)
end


--- RayCollision, ray hit information
---@param hit bool Did the ray hit something?
---@param distance number Distance to the nearest hit
---@param point Vector3 Point of the nearest hit
---@param normal Vector3 Surface normal of hit
function rl.RayCollision(hit, distance, point, normal)
  return ffi.new("RayCollision", hit, distance, point, normal)
end


--- BoundingBox
---@param min Vector3 Minimum vertex box-corner
---@param max Vector3 Maximum vertex box-corner
function rl.BoundingBox(min, max)
  return ffi.new("BoundingBox", min, max)
end


--- Wave, audio wave data
---@param frameCount integer Total number of frames (considering channels)
---@param sampleRate integer Frequency (samples per second)
---@param sampleSize integer Bit depth (bits per sample): 8, 16, 32 (24 not supported)
---@param channels integer Number of channels (1-mono, 2-stereo, ...)
---@param data void Buffer data pointer
function rl.Wave(frameCount, sampleRate, sampleSize, channels, data)
  return ffi.new("Wave", frameCount, sampleRate, sampleSize, channels, data)
end


--- AudioStream, custom audio stream
---@param buffer rAudioBuffer * Pointer to internal data used by the audio system
---@param processor rAudioProcessor * Pointer to internal data processor, useful for audio effects
---@param sampleRate integer Frequency (samples per second)
---@param sampleSize integer Bit depth (bits per sample): 8, 16, 32 (24 not supported)
---@param channels integer Number of channels (1-mono, 2-stereo, ...)
function rl.AudioStream(buffer, processor, sampleRate, sampleSize, channels)
  return ffi.new("AudioStream", buffer, processor, sampleRate, sampleSize, channels)
end


--- Sound
---@param stream AudioStream Audio stream
---@param frameCount integer Total number of frames (considering channels)
function rl.Sound(stream, frameCount)
  return ffi.new("Sound", stream, frameCount)
end


--- Music, audio stream, anything longer than ~10 seconds should be streamed
---@param stream AudioStream Audio stream
---@param frameCount integer Total number of frames (considering channels)
---@param looping bool Music looping enable
---@param ctxType integer Type of music context (audio filetype)
---@param ctxData void Audio context data, depends on type
function rl.Music(stream, frameCount, looping, ctxType, ctxData)
  return ffi.new("Music", stream, frameCount, looping, ctxType, ctxData)
end


--- VrDeviceInfo, Head-Mounted-Display device parameters
---@param hResolution integer Horizontal resolution in pixels
---@param vResolution integer Vertical resolution in pixels
---@param hScreenSize number Horizontal size in meters
---@param vScreenSize number Vertical size in meters
---@param vScreenCenter number Screen center in meters
---@param eyeToScreenDistance number Distance between eye and display in meters
---@param lensSeparationDistance number Lens separation distance in meters
---@param interpupillaryDistance number IPD (distance between pupils) in meters
---@param lensDistortionValues float[4] Lens distortion constant parameters
---@param chromaAbCorrection float[4] Chromatic aberration correction parameters
function rl.VrDeviceInfo(hResolution, vResolution, hScreenSize, vScreenSize, vScreenCenter, eyeToScreenDistance, lensSeparationDistance, interpupillaryDistance, lensDistortionValues, chromaAbCorrection)
  return ffi.new("VrDeviceInfo", hResolution, vResolution, hScreenSize, vScreenSize, vScreenCenter, eyeToScreenDistance, lensSeparationDistance, interpupillaryDistance, lensDistortionValues, chromaAbCorrection)
end


--- VrStereoConfig, VR stereo rendering configuration for simulator
---@param projection Matrix[2] VR projection matrices (per eye)
---@param viewOffset Matrix[2] VR view offset matrices (per eye)
---@param leftLensCenter float[2] VR left lens center
---@param rightLensCenter float[2] VR right lens center
---@param leftScreenCenter float[2] VR left screen center
---@param rightScreenCenter float[2] VR right screen center
---@param scale float[2] VR distortion scale
---@param scaleIn float[2] VR distortion scale in
function rl.VrStereoConfig(projection, viewOffset, leftLensCenter, rightLensCenter, leftScreenCenter, rightScreenCenter, scale, scaleIn)
  return ffi.new("VrStereoConfig", projection, viewOffset, leftLensCenter, rightLensCenter, leftScreenCenter, rightScreenCenter, scale, scaleIn)
end


--- File path list
---@param capacity integer Filepaths max entries
---@param count integer Filepaths entries count
---@param paths string Filepaths entries
function rl.FilePathList(capacity, count, paths)
  return ffi.new("FilePathList", capacity, count, paths)
end


--- Automation event
---@param frame integer Event frame
---@param type integer Event type (AutomationEventType)
---@param params int[4] Event parameters (if required)
function rl.AutomationEvent(frame, type, params)
  return ffi.new("AutomationEvent", frame, type, params)
end


--- Automation event list
---@param capacity integer Events max entries (MAX_AUTOMATION_EVENTS)
---@param count integer Events entries count
---@param events AutomationEvent * Events entries
function rl.AutomationEventList(capacity, count, events)
  return ffi.new("AutomationEventList", capacity, count, events)
end


--- ConfigFlags System/Window config flags


--- Set to try enabling V-Sync on GPU
rl.FLAG_VSYNC_HINT = 64
--- Set to run program in fullscreen
rl.FLAG_FULLSCREEN_MODE = 2
--- Set to allow resizable window
rl.FLAG_WINDOW_RESIZABLE = 4
--- Set to disable window decoration (frame and buttons)
rl.FLAG_WINDOW_UNDECORATED = 8
--- Set to hide window
rl.FLAG_WINDOW_HIDDEN = 128
--- Set to minimize window (iconify)
rl.FLAG_WINDOW_MINIMIZED = 512
--- Set to maximize window (expanded to monitor)
rl.FLAG_WINDOW_MAXIMIZED = 1024
--- Set to window non focused
rl.FLAG_WINDOW_UNFOCUSED = 2048
--- Set to window always on top
rl.FLAG_WINDOW_TOPMOST = 4096
--- Set to allow windows running while minimized
rl.FLAG_WINDOW_ALWAYS_RUN = 256
--- Set to allow transparent framebuffer
rl.FLAG_WINDOW_TRANSPARENT = 16
--- Set to support HighDPI
rl.FLAG_WINDOW_HIGHDPI = 8192
--- Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
rl.FLAG_WINDOW_MOUSE_PASSTHROUGH = 16384
--- Set to run program in borderless windowed mode
rl.FLAG_BORDERLESS_WINDOWED_MODE = 32768
--- Set to try enabling MSAA 4X
rl.FLAG_MSAA_4X_HINT = 32
--- Set to try enabling interlaced video format (for V3D)
rl.FLAG_INTERLACED_HINT = 65536

--- TraceLogLevel Trace log level


--- Display all logs
rl.LOG_ALL = 0
--- Trace logging, intended for internal use only
rl.LOG_TRACE = 1
--- Debug logging, used for internal debugging, it should be disabled on release builds
rl.LOG_DEBUG = 2
--- Info logging, used for program execution info
rl.LOG_INFO = 3
--- Warning logging, used on recoverable failures
rl.LOG_WARNING = 4
--- Error logging, used on unrecoverable failures
rl.LOG_ERROR = 5
--- Fatal logging, used to abort program: exit(EXIT_FAILURE)
rl.LOG_FATAL = 6
--- Disable logging
rl.LOG_NONE = 7

--- KeyboardKey Keyboard keys (US keyboard layout)


--- Key: NULL, used for no key pressed
rl.KEY_NULL = 0
--- Key: '
rl.KEY_APOSTROPHE = 39
--- Key: ,
rl.KEY_COMMA = 44
--- Key: -
rl.KEY_MINUS = 45
--- Key: .
rl.KEY_PERIOD = 46
--- Key: /
rl.KEY_SLASH = 47
--- Key: 0
rl.KEY_ZERO = 48
--- Key: 1
rl.KEY_ONE = 49
--- Key: 2
rl.KEY_TWO = 50
--- Key: 3
rl.KEY_THREE = 51
--- Key: 4
rl.KEY_FOUR = 52
--- Key: 5
rl.KEY_FIVE = 53
--- Key: 6
rl.KEY_SIX = 54
--- Key: 7
rl.KEY_SEVEN = 55
--- Key: 8
rl.KEY_EIGHT = 56
--- Key: 9
rl.KEY_NINE = 57
--- Key: ;
rl.KEY_SEMICOLON = 59
--- Key: =
rl.KEY_EQUAL = 61
--- Key: A | a
rl.KEY_A = 65
--- Key: B | b
rl.KEY_B = 66
--- Key: C | c
rl.KEY_C = 67
--- Key: D | d
rl.KEY_D = 68
--- Key: E | e
rl.KEY_E = 69
--- Key: F | f
rl.KEY_F = 70
--- Key: G | g
rl.KEY_G = 71
--- Key: H | h
rl.KEY_H = 72
--- Key: I | i
rl.KEY_I = 73
--- Key: J | j
rl.KEY_J = 74
--- Key: K | k
rl.KEY_K = 75
--- Key: L | l
rl.KEY_L = 76
--- Key: M | m
rl.KEY_M = 77
--- Key: N | n
rl.KEY_N = 78
--- Key: O | o
rl.KEY_O = 79
--- Key: P | p
rl.KEY_P = 80
--- Key: Q | q
rl.KEY_Q = 81
--- Key: R | r
rl.KEY_R = 82
--- Key: S | s
rl.KEY_S = 83
--- Key: T | t
rl.KEY_T = 84
--- Key: U | u
rl.KEY_U = 85
--- Key: V | v
rl.KEY_V = 86
--- Key: W | w
rl.KEY_W = 87
--- Key: X | x
rl.KEY_X = 88
--- Key: Y | y
rl.KEY_Y = 89
--- Key: Z | z
rl.KEY_Z = 90
--- Key: [
rl.KEY_LEFT_BRACKET = 91
--- Key: '\'
rl.KEY_BACKSLASH = 92
--- Key: ]
rl.KEY_RIGHT_BRACKET = 93
--- Key: `
rl.KEY_GRAVE = 96
--- Key: Space
rl.KEY_SPACE = 32
--- Key: Esc
rl.KEY_ESCAPE = 256
--- Key: Enter
rl.KEY_ENTER = 257
--- Key: Tab
rl.KEY_TAB = 258
--- Key: Backspace
rl.KEY_BACKSPACE = 259
--- Key: Ins
rl.KEY_INSERT = 260
--- Key: Del
rl.KEY_DELETE = 261
--- Key: Cursor right
rl.KEY_RIGHT = 262
--- Key: Cursor left
rl.KEY_LEFT = 263
--- Key: Cursor down
rl.KEY_DOWN = 264
--- Key: Cursor up
rl.KEY_UP = 265
--- Key: Page up
rl.KEY_PAGE_UP = 266
--- Key: Page down
rl.KEY_PAGE_DOWN = 267
--- Key: Home
rl.KEY_HOME = 268
--- Key: End
rl.KEY_END = 269
--- Key: Caps lock
rl.KEY_CAPS_LOCK = 280
--- Key: Scroll down
rl.KEY_SCROLL_LOCK = 281
--- Key: Num lock
rl.KEY_NUM_LOCK = 282
--- Key: Print screen
rl.KEY_PRINT_SCREEN = 283
--- Key: Pause
rl.KEY_PAUSE = 284
--- Key: F1
rl.KEY_F1 = 290
--- Key: F2
rl.KEY_F2 = 291
--- Key: F3
rl.KEY_F3 = 292
--- Key: F4
rl.KEY_F4 = 293
--- Key: F5
rl.KEY_F5 = 294
--- Key: F6
rl.KEY_F6 = 295
--- Key: F7
rl.KEY_F7 = 296
--- Key: F8
rl.KEY_F8 = 297
--- Key: F9
rl.KEY_F9 = 298
--- Key: F10
rl.KEY_F10 = 299
--- Key: F11
rl.KEY_F11 = 300
--- Key: F12
rl.KEY_F12 = 301
--- Key: Shift left
rl.KEY_LEFT_SHIFT = 340
--- Key: Control left
rl.KEY_LEFT_CONTROL = 341
--- Key: Alt left
rl.KEY_LEFT_ALT = 342
--- Key: Super left
rl.KEY_LEFT_SUPER = 343
--- Key: Shift right
rl.KEY_RIGHT_SHIFT = 344
--- Key: Control right
rl.KEY_RIGHT_CONTROL = 345
--- Key: Alt right
rl.KEY_RIGHT_ALT = 346
--- Key: Super right
rl.KEY_RIGHT_SUPER = 347
--- Key: KB menu
rl.KEY_KB_MENU = 348
--- Key: Keypad 0
rl.KEY_KP_0 = 320
--- Key: Keypad 1
rl.KEY_KP_1 = 321
--- Key: Keypad 2
rl.KEY_KP_2 = 322
--- Key: Keypad 3
rl.KEY_KP_3 = 323
--- Key: Keypad 4
rl.KEY_KP_4 = 324
--- Key: Keypad 5
rl.KEY_KP_5 = 325
--- Key: Keypad 6
rl.KEY_KP_6 = 326
--- Key: Keypad 7
rl.KEY_KP_7 = 327
--- Key: Keypad 8
rl.KEY_KP_8 = 328
--- Key: Keypad 9
rl.KEY_KP_9 = 329
--- Key: Keypad .
rl.KEY_KP_DECIMAL = 330
--- Key: Keypad /
rl.KEY_KP_DIVIDE = 331
--- Key: Keypad *
rl.KEY_KP_MULTIPLY = 332
--- Key: Keypad -
rl.KEY_KP_SUBTRACT = 333
--- Key: Keypad +
rl.KEY_KP_ADD = 334
--- Key: Keypad Enter
rl.KEY_KP_ENTER = 335
--- Key: Keypad =
rl.KEY_KP_EQUAL = 336
--- Key: Android back button
rl.KEY_BACK = 4
--- Key: Android menu button
rl.KEY_MENU = 82
--- Key: Android volume up button
rl.KEY_VOLUME_UP = 24
--- Key: Android volume down button
rl.KEY_VOLUME_DOWN = 25

--- MouseButton Mouse buttons


--- Mouse button left
rl.MOUSE_BUTTON_LEFT = 0
--- Mouse button right
rl.MOUSE_BUTTON_RIGHT = 1
--- Mouse button middle (pressed wheel)
rl.MOUSE_BUTTON_MIDDLE = 2
--- Mouse button side (advanced mouse device)
rl.MOUSE_BUTTON_SIDE = 3
--- Mouse button extra (advanced mouse device)
rl.MOUSE_BUTTON_EXTRA = 4
--- Mouse button forward (advanced mouse device)
rl.MOUSE_BUTTON_FORWARD = 5
--- Mouse button back (advanced mouse device)
rl.MOUSE_BUTTON_BACK = 6

--- MouseCursor Mouse cursor


--- Default pointer shape
rl.MOUSE_CURSOR_DEFAULT = 0
--- Arrow shape
rl.MOUSE_CURSOR_ARROW = 1
--- Text writing cursor shape
rl.MOUSE_CURSOR_IBEAM = 2
--- Cross shape
rl.MOUSE_CURSOR_CROSSHAIR = 3
--- Pointing hand cursor
rl.MOUSE_CURSOR_POINTING_HAND = 4
--- Horizontal resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_EW = 5
--- Vertical resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_NS = 6
--- Top-left to bottom-right diagonal resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_NWSE = 7
--- The top-right to bottom-left diagonal resize/move arrow shape
rl.MOUSE_CURSOR_RESIZE_NESW = 8
--- The omnidirectional resize/move cursor shape
rl.MOUSE_CURSOR_RESIZE_ALL = 9
--- The operation-not-allowed shape
rl.MOUSE_CURSOR_NOT_ALLOWED = 10

--- GamepadButton Gamepad buttons


--- Unknown button, just for error checking
rl.GAMEPAD_BUTTON_UNKNOWN = 0
--- Gamepad left DPAD up button
rl.GAMEPAD_BUTTON_LEFT_FACE_UP = 1
--- Gamepad left DPAD right button
rl.GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2
--- Gamepad left DPAD down button
rl.GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3
--- Gamepad left DPAD left button
rl.GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4
--- Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
rl.GAMEPAD_BUTTON_RIGHT_FACE_UP = 5
--- Gamepad right button right (i.e. PS3: Square, Xbox: X)
rl.GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6
--- Gamepad right button down (i.e. PS3: Cross, Xbox: A)
rl.GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7
--- Gamepad right button left (i.e. PS3: Circle, Xbox: B)
rl.GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8
--- Gamepad top/back trigger left (first), it could be a trailing button
rl.GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9
--- Gamepad top/back trigger left (second), it could be a trailing button
rl.GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10
--- Gamepad top/back trigger right (one), it could be a trailing button
rl.GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11
--- Gamepad top/back trigger right (second), it could be a trailing button
rl.GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12
--- Gamepad center buttons, left one (i.e. PS3: Select)
rl.GAMEPAD_BUTTON_MIDDLE_LEFT = 13
--- Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
rl.GAMEPAD_BUTTON_MIDDLE = 14
--- Gamepad center buttons, right one (i.e. PS3: Start)
rl.GAMEPAD_BUTTON_MIDDLE_RIGHT = 15
--- Gamepad joystick pressed button left
rl.GAMEPAD_BUTTON_LEFT_THUMB = 16
--- Gamepad joystick pressed button right
rl.GAMEPAD_BUTTON_RIGHT_THUMB = 17

--- GamepadAxis Gamepad axis


--- Gamepad left stick X axis
rl.GAMEPAD_AXIS_LEFT_X = 0
--- Gamepad left stick Y axis
rl.GAMEPAD_AXIS_LEFT_Y = 1
--- Gamepad right stick X axis
rl.GAMEPAD_AXIS_RIGHT_X = 2
--- Gamepad right stick Y axis
rl.GAMEPAD_AXIS_RIGHT_Y = 3
--- Gamepad back trigger left, pressure level: [1..-1]
rl.GAMEPAD_AXIS_LEFT_TRIGGER = 4
--- Gamepad back trigger right, pressure level: [1..-1]
rl.GAMEPAD_AXIS_RIGHT_TRIGGER = 5

--- MaterialMapIndex Material map index


--- Albedo material (same as: MATERIAL_MAP_DIFFUSE)
rl.MATERIAL_MAP_ALBEDO = 0
--- Metalness material (same as: MATERIAL_MAP_SPECULAR)
rl.MATERIAL_MAP_METALNESS = 1
--- Normal material
rl.MATERIAL_MAP_NORMAL = 2
--- Roughness material
rl.MATERIAL_MAP_ROUGHNESS = 3
--- Ambient occlusion material
rl.MATERIAL_MAP_OCCLUSION = 4
--- Emission material
rl.MATERIAL_MAP_EMISSION = 5
--- Heightmap material
rl.MATERIAL_MAP_HEIGHT = 6
--- Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
rl.MATERIAL_MAP_CUBEMAP = 7
--- Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
rl.MATERIAL_MAP_IRRADIANCE = 8
--- Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
rl.MATERIAL_MAP_PREFILTER = 9
--- Brdf material
rl.MATERIAL_MAP_BRDF = 10

--- ShaderLocationIndex Shader location index


--- Shader location: vertex attribute: position
rl.SHADER_LOC_VERTEX_POSITION = 0
--- Shader location: vertex attribute: texcoord01
rl.SHADER_LOC_VERTEX_TEXCOORD01 = 1
--- Shader location: vertex attribute: texcoord02
rl.SHADER_LOC_VERTEX_TEXCOORD02 = 2
--- Shader location: vertex attribute: normal
rl.SHADER_LOC_VERTEX_NORMAL = 3
--- Shader location: vertex attribute: tangent
rl.SHADER_LOC_VERTEX_TANGENT = 4
--- Shader location: vertex attribute: color
rl.SHADER_LOC_VERTEX_COLOR = 5
--- Shader location: matrix uniform: model-view-projection
rl.SHADER_LOC_MATRIX_MVP = 6
--- Shader location: matrix uniform: view (camera transform)
rl.SHADER_LOC_MATRIX_VIEW = 7
--- Shader location: matrix uniform: projection
rl.SHADER_LOC_MATRIX_PROJECTION = 8
--- Shader location: matrix uniform: model (transform)
rl.SHADER_LOC_MATRIX_MODEL = 9
--- Shader location: matrix uniform: normal
rl.SHADER_LOC_MATRIX_NORMAL = 10
--- Shader location: vector uniform: view
rl.SHADER_LOC_VECTOR_VIEW = 11
--- Shader location: vector uniform: diffuse color
rl.SHADER_LOC_COLOR_DIFFUSE = 12
--- Shader location: vector uniform: specular color
rl.SHADER_LOC_COLOR_SPECULAR = 13
--- Shader location: vector uniform: ambient color
rl.SHADER_LOC_COLOR_AMBIENT = 14
--- Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
rl.SHADER_LOC_MAP_ALBEDO = 15
--- Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
rl.SHADER_LOC_MAP_METALNESS = 16
--- Shader location: sampler2d texture: normal
rl.SHADER_LOC_MAP_NORMAL = 17
--- Shader location: sampler2d texture: roughness
rl.SHADER_LOC_MAP_ROUGHNESS = 18
--- Shader location: sampler2d texture: occlusion
rl.SHADER_LOC_MAP_OCCLUSION = 19
--- Shader location: sampler2d texture: emission
rl.SHADER_LOC_MAP_EMISSION = 20
--- Shader location: sampler2d texture: height
rl.SHADER_LOC_MAP_HEIGHT = 21
--- Shader location: samplerCube texture: cubemap
rl.SHADER_LOC_MAP_CUBEMAP = 22
--- Shader location: samplerCube texture: irradiance
rl.SHADER_LOC_MAP_IRRADIANCE = 23
--- Shader location: samplerCube texture: prefilter
rl.SHADER_LOC_MAP_PREFILTER = 24
--- Shader location: sampler2d texture: brdf
rl.SHADER_LOC_MAP_BRDF = 25

--- ShaderUniformDataType Shader uniform data type


--- Shader uniform type: float
rl.SHADER_UNIFORM_FLOAT = 0
--- Shader uniform type: vec2 (2 float)
rl.SHADER_UNIFORM_VEC2 = 1
--- Shader uniform type: vec3 (3 float)
rl.SHADER_UNIFORM_VEC3 = 2
--- Shader uniform type: vec4 (4 float)
rl.SHADER_UNIFORM_VEC4 = 3
--- Shader uniform type: int
rl.SHADER_UNIFORM_INT = 4
--- Shader uniform type: ivec2 (2 int)
rl.SHADER_UNIFORM_IVEC2 = 5
--- Shader uniform type: ivec3 (3 int)
rl.SHADER_UNIFORM_IVEC3 = 6
--- Shader uniform type: ivec4 (4 int)
rl.SHADER_UNIFORM_IVEC4 = 7
--- Shader uniform type: sampler2d
rl.SHADER_UNIFORM_SAMPLER2D = 8

--- ShaderAttributeDataType Shader attribute data types


--- Shader attribute type: float
rl.SHADER_ATTRIB_FLOAT = 0
--- Shader attribute type: vec2 (2 float)
rl.SHADER_ATTRIB_VEC2 = 1
--- Shader attribute type: vec3 (3 float)
rl.SHADER_ATTRIB_VEC3 = 2
--- Shader attribute type: vec4 (4 float)
rl.SHADER_ATTRIB_VEC4 = 3

--- PixelFormat Pixel formats


--- 8 bit per pixel (no alpha)
rl.PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1
--- 8*2 bpp (2 channels)
rl.PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2
--- 16 bpp
rl.PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3
--- 24 bpp
rl.PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4
--- 16 bpp (1 bit alpha)
rl.PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5
--- 16 bpp (4 bit alpha)
rl.PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6
--- 32 bpp
rl.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7
--- 32 bpp (1 channel - float)
rl.PIXELFORMAT_UNCOMPRESSED_R32 = 8
--- 32*3 bpp (3 channels - float)
rl.PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9
--- 32*4 bpp (4 channels - float)
rl.PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10
--- 16 bpp (1 channel - half float)
rl.PIXELFORMAT_UNCOMPRESSED_R16 = 11
--- 16*3 bpp (3 channels - half float)
rl.PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12
--- 16*4 bpp (4 channels - half float)
rl.PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13
--- 4 bpp (no alpha)
rl.PIXELFORMAT_COMPRESSED_DXT1_RGB = 14
--- 4 bpp (1 bit alpha)
rl.PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15
--- 8 bpp
rl.PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16
--- 8 bpp
rl.PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17
--- 4 bpp
rl.PIXELFORMAT_COMPRESSED_ETC1_RGB = 18
--- 4 bpp
rl.PIXELFORMAT_COMPRESSED_ETC2_RGB = 19
--- 8 bpp
rl.PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20
--- 4 bpp
rl.PIXELFORMAT_COMPRESSED_PVRT_RGB = 21
--- 4 bpp
rl.PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22
--- 8 bpp
rl.PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 23
--- 2 bpp
rl.PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 24

--- TextureFilter Texture parameters: filter mode


--- No filter, just pixel approximation
rl.TEXTURE_FILTER_POINT = 0
--- Linear filtering
rl.TEXTURE_FILTER_BILINEAR = 1
--- Trilinear filtering (linear with mipmaps)
rl.TEXTURE_FILTER_TRILINEAR = 2
--- Anisotropic filtering 4x
rl.TEXTURE_FILTER_ANISOTROPIC_4X = 3
--- Anisotropic filtering 8x
rl.TEXTURE_FILTER_ANISOTROPIC_8X = 4
--- Anisotropic filtering 16x
rl.TEXTURE_FILTER_ANISOTROPIC_16X = 5

--- TextureWrap Texture parameters: wrap mode


--- Repeats texture in tiled mode
rl.TEXTURE_WRAP_REPEAT = 0
--- Clamps texture to edge pixel in tiled mode
rl.TEXTURE_WRAP_CLAMP = 1
--- Mirrors and repeats the texture in tiled mode
rl.TEXTURE_WRAP_MIRROR_REPEAT = 2
--- Mirrors and clamps to border the texture in tiled mode
rl.TEXTURE_WRAP_MIRROR_CLAMP = 3

--- CubemapLayout Cubemap layouts


--- Automatically detect layout type
rl.CUBEMAP_LAYOUT_AUTO_DETECT = 0
--- Layout is defined by a vertical line with faces
rl.CUBEMAP_LAYOUT_LINE_VERTICAL = 1
--- Layout is defined by a horizontal line with faces
rl.CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2
--- Layout is defined by a 3x4 cross with cubemap faces
rl.CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3
--- Layout is defined by a 4x3 cross with cubemap faces
rl.CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4
--- Layout is defined by a panorama image (equirrectangular map)
rl.CUBEMAP_LAYOUT_PANORAMA = 5

--- FontType Font type, defines generation method


--- Default font generation, anti-aliased
rl.FONT_DEFAULT = 0
--- Bitmap font generation, no anti-aliasing
rl.FONT_BITMAP = 1
--- SDF font generation, requires external shader
rl.FONT_SDF = 2

--- BlendMode Color blending modes (pre-defined)


--- Blend textures considering alpha (default)
rl.BLEND_ALPHA = 0
--- Blend textures adding colors
rl.BLEND_ADDITIVE = 1
--- Blend textures multiplying colors
rl.BLEND_MULTIPLIED = 2
--- Blend textures adding colors (alternative)
rl.BLEND_ADD_COLORS = 3
--- Blend textures subtracting colors (alternative)
rl.BLEND_SUBTRACT_COLORS = 4
--- Blend premultiplied textures considering alpha
rl.BLEND_ALPHA_PREMULTIPLY = 5
--- Blend textures using custom src/dst factors (use rlSetBlendFactors())
rl.BLEND_CUSTOM = 6
--- Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
rl.BLEND_CUSTOM_SEPARATE = 7

--- Gesture Gesture


--- No gesture
rl.GESTURE_NONE = 0
--- Tap gesture
rl.GESTURE_TAP = 1
--- Double tap gesture
rl.GESTURE_DOUBLETAP = 2
--- Hold gesture
rl.GESTURE_HOLD = 4
--- Drag gesture
rl.GESTURE_DRAG = 8
--- Swipe right gesture
rl.GESTURE_SWIPE_RIGHT = 16
--- Swipe left gesture
rl.GESTURE_SWIPE_LEFT = 32
--- Swipe up gesture
rl.GESTURE_SWIPE_UP = 64
--- Swipe down gesture
rl.GESTURE_SWIPE_DOWN = 128
--- Pinch in gesture
rl.GESTURE_PINCH_IN = 256
--- Pinch out gesture
rl.GESTURE_PINCH_OUT = 512

--- CameraMode Camera system modes


--- Custom camera
rl.CAMERA_CUSTOM = 0
--- Free camera
rl.CAMERA_FREE = 1
--- Orbital camera
rl.CAMERA_ORBITAL = 2
--- First person camera
rl.CAMERA_FIRST_PERSON = 3
--- Third person camera
rl.CAMERA_THIRD_PERSON = 4

--- CameraProjection Camera projection


--- Perspective projection
rl.CAMERA_PERSPECTIVE = 0
--- Orthographic projection
rl.CAMERA_ORTHOGRAPHIC = 1

--- NPatchLayout N-patch layout


--- Npatch layout: 3x3 tiles
rl.NPATCH_NINE_PATCH = 0
--- Npatch layout: 1x3 tiles
rl.NPATCH_THREE_PATCH_VERTICAL = 1
--- Npatch layout: 3x1 tiles
rl.NPATCH_THREE_PATCH_HORIZONTAL = 2
--- Initialize window and OpenGL context
---@param width integer
---@param height integer
---@param title string
---@return void
function rl.InitWindow(width, height, title)
  return lib.InitWindow(width, height, title)
end

--- Close window and unload OpenGL context
---@return void
function rl.CloseWindow()
  return lib.CloseWindow()
end

--- Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
---@return bool
function rl.WindowShouldClose()
  return lib.WindowShouldClose()
end

--- Check if window has been initialized successfully
---@return bool
function rl.IsWindowReady()
  return lib.IsWindowReady()
end

--- Check if window is currently fullscreen
---@return bool
function rl.IsWindowFullscreen()
  return lib.IsWindowFullscreen()
end

--- Check if window is currently hidden (only PLATFORM_DESKTOP)
---@return bool
function rl.IsWindowHidden()
  return lib.IsWindowHidden()
end

--- Check if window is currently minimized (only PLATFORM_DESKTOP)
---@return bool
function rl.IsWindowMinimized()
  return lib.IsWindowMinimized()
end

--- Check if window is currently maximized (only PLATFORM_DESKTOP)
---@return bool
function rl.IsWindowMaximized()
  return lib.IsWindowMaximized()
end

--- Check if window is currently focused (only PLATFORM_DESKTOP)
---@return bool
function rl.IsWindowFocused()
  return lib.IsWindowFocused()
end

--- Check if window has been resized last frame
---@return bool
function rl.IsWindowResized()
  return lib.IsWindowResized()
end

--- Check if one specific window flag is enabled
---@param flag integer
---@return bool
function rl.IsWindowState(flag)
  return lib.IsWindowState(flag)
end

--- Set window configuration state using flags (only PLATFORM_DESKTOP)
---@param flags integer
---@return void
function rl.SetWindowState(flags)
  return lib.SetWindowState(flags)
end

--- Clear window configuration state flags
---@param flags integer
---@return void
function rl.ClearWindowState(flags)
  return lib.ClearWindowState(flags)
end

--- Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
---@return void
function rl.ToggleFullscreen()
  return lib.ToggleFullscreen()
end

--- Toggle window state: borderless windowed (only PLATFORM_DESKTOP)
---@return void
function rl.ToggleBorderlessWindowed()
  return lib.ToggleBorderlessWindowed()
end

--- Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
---@return void
function rl.MaximizeWindow()
  return lib.MaximizeWindow()
end

--- Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
---@return void
function rl.MinimizeWindow()
  return lib.MinimizeWindow()
end

--- Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
---@return void
function rl.RestoreWindow()
  return lib.RestoreWindow()
end

--- Set icon for window (single image, RGBA 32bit, only PLATFORM_DESKTOP)
---@param image Image
---@return void
function rl.SetWindowIcon(image)
  return lib.SetWindowIcon(image)
end

--- Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)
---@param images Image *
---@param count integer
---@return void
function rl.SetWindowIcons(images, count)
  return lib.SetWindowIcons(images, count)
end

--- Set title for window (only PLATFORM_DESKTOP and PLATFORM_WEB)
---@param title string
---@return void
function rl.SetWindowTitle(title)
  return lib.SetWindowTitle(title)
end

--- Set window position on screen (only PLATFORM_DESKTOP)
---@param x integer
---@param y integer
---@return void
function rl.SetWindowPosition(x, y)
  return lib.SetWindowPosition(x, y)
end

--- Set monitor for the current window
---@param monitor integer
---@return void
function rl.SetWindowMonitor(monitor)
  return lib.SetWindowMonitor(monitor)
end

--- Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
---@param width integer
---@param height integer
---@return void
function rl.SetWindowMinSize(width, height)
  return lib.SetWindowMinSize(width, height)
end

--- Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
---@param width integer
---@param height integer
---@return void
function rl.SetWindowMaxSize(width, height)
  return lib.SetWindowMaxSize(width, height)
end

--- Set window dimensions
---@param width integer
---@param height integer
---@return void
function rl.SetWindowSize(width, height)
  return lib.SetWindowSize(width, height)
end

--- Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
---@param opacity number
---@return void
function rl.SetWindowOpacity(opacity)
  return lib.SetWindowOpacity(opacity)
end

--- Set window focused (only PLATFORM_DESKTOP)
---@return void
function rl.SetWindowFocused()
  return lib.SetWindowFocused()
end

--- Get native window handle
---@return void *
function rl.GetWindowHandle()
  return lib.GetWindowHandle()
end

--- Get current screen width
---@return int
function rl.GetScreenWidth()
  return lib.GetScreenWidth()
end

--- Get current screen height
---@return int
function rl.GetScreenHeight()
  return lib.GetScreenHeight()
end

--- Get current render width (it considers HiDPI)
---@return int
function rl.GetRenderWidth()
  return lib.GetRenderWidth()
end

--- Get current render height (it considers HiDPI)
---@return int
function rl.GetRenderHeight()
  return lib.GetRenderHeight()
end

--- Get number of connected monitors
---@return int
function rl.GetMonitorCount()
  return lib.GetMonitorCount()
end

--- Get current connected monitor
---@return int
function rl.GetCurrentMonitor()
  return lib.GetCurrentMonitor()
end

--- Get specified monitor position
---@param monitor integer
---@return Vector2
function rl.GetMonitorPosition(monitor)
  return lib.GetMonitorPosition(monitor)
end

--- Get specified monitor width (current video mode used by monitor)
---@param monitor integer
---@return int
function rl.GetMonitorWidth(monitor)
  return lib.GetMonitorWidth(monitor)
end

--- Get specified monitor height (current video mode used by monitor)
---@param monitor integer
---@return int
function rl.GetMonitorHeight(monitor)
  return lib.GetMonitorHeight(monitor)
end

--- Get specified monitor physical width in millimetres
---@param monitor integer
---@return int
function rl.GetMonitorPhysicalWidth(monitor)
  return lib.GetMonitorPhysicalWidth(monitor)
end

--- Get specified monitor physical height in millimetres
---@param monitor integer
---@return int
function rl.GetMonitorPhysicalHeight(monitor)
  return lib.GetMonitorPhysicalHeight(monitor)
end

--- Get specified monitor refresh rate
---@param monitor integer
---@return int
function rl.GetMonitorRefreshRate(monitor)
  return lib.GetMonitorRefreshRate(monitor)
end

--- Get window position XY on monitor
---@return Vector2
function rl.GetWindowPosition()
  return lib.GetWindowPosition()
end

--- Get window scale DPI factor
---@return Vector2
function rl.GetWindowScaleDPI()
  return lib.GetWindowScaleDPI()
end

--- Get the human-readable, UTF-8 encoded name of the specified monitor
---@param monitor integer
---@return const char *
function rl.GetMonitorName(monitor)
  return lib.GetMonitorName(monitor)
end

--- Set clipboard text content
---@param text string
---@return void
function rl.SetClipboardText(text)
  return lib.SetClipboardText(text)
end

--- Get clipboard text content
---@return const char *
function rl.GetClipboardText()
  return lib.GetClipboardText()
end

--- Enable waiting for events on EndDrawing(), no automatic event polling
---@return void
function rl.EnableEventWaiting()
  return lib.EnableEventWaiting()
end

--- Disable waiting for events on EndDrawing(), automatic events polling
---@return void
function rl.DisableEventWaiting()
  return lib.DisableEventWaiting()
end

--- Shows cursor
---@return void
function rl.ShowCursor()
  return lib.ShowCursor()
end

--- Hides cursor
---@return void
function rl.HideCursor()
  return lib.HideCursor()
end

--- Check if cursor is not visible
---@return bool
function rl.IsCursorHidden()
  return lib.IsCursorHidden()
end

--- Enables cursor (unlock cursor)
---@return void
function rl.EnableCursor()
  return lib.EnableCursor()
end

--- Disables cursor (lock cursor)
---@return void
function rl.DisableCursor()
  return lib.DisableCursor()
end

--- Check if cursor is on the screen
---@return bool
function rl.IsCursorOnScreen()
  return lib.IsCursorOnScreen()
end

--- Set background color (framebuffer clear color)
---@param color Color
---@return void
function rl.ClearBackground(color)
  return lib.ClearBackground(color)
end

--- Setup canvas (framebuffer) to start drawing
---@return void
function rl.BeginDrawing()
  return lib.BeginDrawing()
end

--- End canvas drawing and swap buffers (double buffering)
---@return void
function rl.EndDrawing()
  return lib.EndDrawing()
end

--- Begin 2D mode with custom camera (2D)
---@param camera Camera2D
---@return void
function rl.BeginMode2D(camera)
  return lib.BeginMode2D(camera)
end

--- Ends 2D mode with custom camera
---@return void
function rl.EndMode2D()
  return lib.EndMode2D()
end

--- Begin 3D mode with custom camera (3D)
---@param camera Camera3D
---@return void
function rl.BeginMode3D(camera)
  return lib.BeginMode3D(camera)
end

--- Ends 3D mode and returns to default 2D orthographic mode
---@return void
function rl.EndMode3D()
  return lib.EndMode3D()
end

--- Begin drawing to render texture
---@param target RenderTexture2D
---@return void
function rl.BeginTextureMode(target)
  return lib.BeginTextureMode(target)
end

--- Ends drawing to render texture
---@return void
function rl.EndTextureMode()
  return lib.EndTextureMode()
end

--- Begin custom shader drawing
---@param shader Shader
---@return void
function rl.BeginShaderMode(shader)
  return lib.BeginShaderMode(shader)
end

--- End custom shader drawing (use default shader)
---@return void
function rl.EndShaderMode()
  return lib.EndShaderMode()
end

--- Begin blending mode (alpha, additive, multiplied, subtract, custom)
---@param mode integer
---@return void
function rl.BeginBlendMode(mode)
  return lib.BeginBlendMode(mode)
end

--- End blending mode (reset to default: alpha blending)
---@return void
function rl.EndBlendMode()
  return lib.EndBlendMode()
end

--- Begin scissor mode (define screen area for following drawing)
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@return void
function rl.BeginScissorMode(x, y, width, height)
  return lib.BeginScissorMode(x, y, width, height)
end

--- End scissor mode
---@return void
function rl.EndScissorMode()
  return lib.EndScissorMode()
end

--- Begin stereo rendering (requires VR simulator)
---@param config VrStereoConfig
---@return void
function rl.BeginVrStereoMode(config)
  return lib.BeginVrStereoMode(config)
end

--- End stereo rendering (requires VR simulator)
---@return void
function rl.EndVrStereoMode()
  return lib.EndVrStereoMode()
end

--- Load VR stereo config for VR simulator device parameters
---@param device VrDeviceInfo
---@return VrStereoConfig
function rl.LoadVrStereoConfig(device)
  return lib.LoadVrStereoConfig(device)
end

--- Unload VR stereo config
---@param config VrStereoConfig
---@return void
function rl.UnloadVrStereoConfig(config)
  return lib.UnloadVrStereoConfig(config)
end

--- Load shader from files and bind default locations
---@param vsFileName string
---@param fsFileName string
---@return Shader
function rl.LoadShader(vsFileName, fsFileName)
  return lib.LoadShader(vsFileName, fsFileName)
end

--- Load shader from code strings and bind default locations
---@param vsCode string
---@param fsCode string
---@return Shader
function rl.LoadShaderFromMemory(vsCode, fsCode)
  return lib.LoadShaderFromMemory(vsCode, fsCode)
end

--- Check if a shader is ready
---@param shader Shader
---@return bool
function rl.IsShaderReady(shader)
  return lib.IsShaderReady(shader)
end

--- Get shader uniform location
---@param shader Shader
---@param uniformName string
---@return int
function rl.GetShaderLocation(shader, uniformName)
  return lib.GetShaderLocation(shader, uniformName)
end

--- Get shader attribute location
---@param shader Shader
---@param attribName string
---@return int
function rl.GetShaderLocationAttrib(shader, attribName)
  return lib.GetShaderLocationAttrib(shader, attribName)
end

--- Set shader uniform value
---@param shader Shader
---@param locIndex integer
---@param value const void *
---@param uniformType integer
---@return void
function rl.SetShaderValue(shader, locIndex, value, uniformType)
  return lib.SetShaderValue(shader, locIndex, value, uniformType)
end

--- Set shader uniform value vector
---@param shader Shader
---@param locIndex integer
---@param value const void *
---@param uniformType integer
---@param count integer
---@return void
function rl.SetShaderValueV(shader, locIndex, value, uniformType, count)
  return lib.SetShaderValueV(shader, locIndex, value, uniformType, count)
end

--- Set shader uniform value (matrix 4x4)
---@param shader Shader
---@param locIndex integer
---@param mat Matrix
---@return void
function rl.SetShaderValueMatrix(shader, locIndex, mat)
  return lib.SetShaderValueMatrix(shader, locIndex, mat)
end

--- Set shader uniform value for texture (sampler2d)
---@param shader Shader
---@param locIndex integer
---@param texture Texture2D
---@return void
function rl.SetShaderValueTexture(shader, locIndex, texture)
  return lib.SetShaderValueTexture(shader, locIndex, texture)
end

--- Unload shader from GPU memory (VRAM)
---@param shader Shader
---@return void
function rl.UnloadShader(shader)
  return lib.UnloadShader(shader)
end

--- Get a ray trace from mouse position
---@param mousePosition Vector2
---@param camera Camera
---@return Ray
function rl.GetMouseRay(mousePosition, camera)
  return lib.GetMouseRay(mousePosition, camera)
end

--- Get camera transform matrix (view matrix)
---@param camera Camera
---@return Matrix
function rl.GetCameraMatrix(camera)
  return lib.GetCameraMatrix(camera)
end

--- Get camera 2d transform matrix
---@param camera Camera2D
---@return Matrix
function rl.GetCameraMatrix2D(camera)
  return lib.GetCameraMatrix2D(camera)
end

--- Get the screen space position for a 3d world space position
---@param position Vector3
---@param camera Camera
---@return Vector2
function rl.GetWorldToScreen(position, camera)
  return lib.GetWorldToScreen(position, camera)
end

--- Get the world space position for a 2d camera screen space position
---@param position Vector2
---@param camera Camera2D
---@return Vector2
function rl.GetScreenToWorld2D(position, camera)
  return lib.GetScreenToWorld2D(position, camera)
end

--- Get size position for a 3d world space position
---@param position Vector3
---@param camera Camera
---@param width integer
---@param height integer
---@return Vector2
function rl.GetWorldToScreenEx(position, camera, width, height)
  return lib.GetWorldToScreenEx(position, camera, width, height)
end

--- Get the screen space position for a 2d camera world space position
---@param position Vector2
---@param camera Camera2D
---@return Vector2
function rl.GetWorldToScreen2D(position, camera)
  return lib.GetWorldToScreen2D(position, camera)
end

--- Set target FPS (maximum)
---@param fps integer
---@return void
function rl.SetTargetFPS(fps)
  return lib.SetTargetFPS(fps)
end

--- Get time in seconds for last frame drawn (delta time)
---@return float
function rl.GetFrameTime()
  return lib.GetFrameTime()
end

--- Get elapsed time in seconds since InitWindow()
---@return double
function rl.GetTime()
  return lib.GetTime()
end

--- Get current FPS
---@return int
function rl.GetFPS()
  return lib.GetFPS()
end

--- Swap back buffer with front buffer (screen drawing)
---@return void
function rl.SwapScreenBuffer()
  return lib.SwapScreenBuffer()
end

--- Register all input events
---@return void
function rl.PollInputEvents()
  return lib.PollInputEvents()
end

--- Wait for some time (halt program execution)
---@param seconds double
---@return void
function rl.WaitTime(seconds)
  return lib.WaitTime(seconds)
end

--- Set the seed for the random number generator
---@param seed integer
---@return void
function rl.SetRandomSeed(seed)
  return lib.SetRandomSeed(seed)
end

--- Get a random value between min and max (both included)
---@param min integer
---@param max integer
---@return int
function rl.GetRandomValue(min, max)
  return lib.GetRandomValue(min, max)
end

--- Load random values sequence, no values repeated
---@param count integer
---@param min integer
---@param max integer
---@return int *
function rl.LoadRandomSequence(count, min, max)
  return lib.LoadRandomSequence(count, min, max)
end

--- Unload random values sequence
---@param sequence integer
---@return void
function rl.UnloadRandomSequence(sequence)
  return lib.UnloadRandomSequence(sequence)
end

--- Takes a screenshot of current screen (filename extension defines format)
---@param fileName string
---@return void
function rl.TakeScreenshot(fileName)
  return lib.TakeScreenshot(fileName)
end

--- Setup init configuration flags (view FLAGS)
---@param flags integer
---@return void
function rl.SetConfigFlags(flags)
  return lib.SetConfigFlags(flags)
end

--- Open URL with default system browser (if available)
---@param url string
---@return void
function rl.OpenURL(url)
  return lib.OpenURL(url)
end

--- Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
---@param logLevel integer
---@param text string
---@param args ...
---@return void
function rl.TraceLog(logLevel, text, args)
  return lib.TraceLog(logLevel, text, args)
end

--- Set the current threshold (minimum) log level
---@param logLevel integer
---@return void
function rl.SetTraceLogLevel(logLevel)
  return lib.SetTraceLogLevel(logLevel)
end

--- Internal memory allocator
---@param size integer
---@return void *
function rl.MemAlloc(size)
  return lib.MemAlloc(size)
end

--- Internal memory reallocator
---@param ptr void
---@param size integer
---@return void *
function rl.MemRealloc(ptr, size)
  return lib.MemRealloc(ptr, size)
end

--- Internal memory free
---@param ptr void
---@return void
function rl.MemFree(ptr)
  return lib.MemFree(ptr)
end

--- Set custom trace log
---@param callback TraceLogCallback
---@return void
function rl.SetTraceLogCallback(callback)
  return lib.SetTraceLogCallback(callback)
end

--- Set custom file binary data loader
---@param callback LoadFileDataCallback
---@return void
function rl.SetLoadFileDataCallback(callback)
  return lib.SetLoadFileDataCallback(callback)
end

--- Set custom file binary data saver
---@param callback SaveFileDataCallback
---@return void
function rl.SetSaveFileDataCallback(callback)
  return lib.SetSaveFileDataCallback(callback)
end

--- Set custom file text data loader
---@param callback LoadFileTextCallback
---@return void
function rl.SetLoadFileTextCallback(callback)
  return lib.SetLoadFileTextCallback(callback)
end

--- Set custom file text data saver
---@param callback SaveFileTextCallback
---@return void
function rl.SetSaveFileTextCallback(callback)
  return lib.SetSaveFileTextCallback(callback)
end

--- Load file data as byte array (read)
---@param fileName string
---@param dataSize integer
---@return unsigned char *
function rl.LoadFileData(fileName, dataSize)
  return lib.LoadFileData(fileName, dataSize)
end

--- Unload file data allocated by LoadFileData()
---@param data string
---@return void
function rl.UnloadFileData(data)
  return lib.UnloadFileData(data)
end

--- Save data to file from byte array (write), returns true on success
---@param fileName string
---@param data void
---@param dataSize integer
---@return bool
function rl.SaveFileData(fileName, data, dataSize)
  return lib.SaveFileData(fileName, data, dataSize)
end

--- Export data to code (.h), returns true on success
---@param data string
---@param dataSize integer
---@param fileName string
---@return bool
function rl.ExportDataAsCode(data, dataSize, fileName)
  return lib.ExportDataAsCode(data, dataSize, fileName)
end

--- Load text data from file (read), returns a '\0' terminated string
---@param fileName string
---@return char *
function rl.LoadFileText(fileName)
  return lib.LoadFileText(fileName)
end

--- Unload file text data allocated by LoadFileText()
---@param text string
---@return void
function rl.UnloadFileText(text)
  return lib.UnloadFileText(text)
end

--- Save text data to file (write), string must be '\0' terminated, returns true on success
---@param fileName string
---@param text string
---@return bool
function rl.SaveFileText(fileName, text)
  return lib.SaveFileText(fileName, text)
end

--- Check if file exists
---@param fileName string
---@return bool
function rl.FileExists(fileName)
  return lib.FileExists(fileName)
end

--- Check if a directory path exists
---@param dirPath string
---@return bool
function rl.DirectoryExists(dirPath)
  return lib.DirectoryExists(dirPath)
end

--- Check file extension (including point: .png, .wav)
---@param fileName string
---@param ext string
---@return bool
function rl.IsFileExtension(fileName, ext)
  return lib.IsFileExtension(fileName, ext)
end

--- Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
---@param fileName string
---@return int
function rl.GetFileLength(fileName)
  return lib.GetFileLength(fileName)
end

--- Get pointer to extension for a filename string (includes dot: '.png')
---@param fileName string
---@return const char *
function rl.GetFileExtension(fileName)
  return lib.GetFileExtension(fileName)
end

--- Get pointer to filename for a path string
---@param filePath string
---@return const char *
function rl.GetFileName(filePath)
  return lib.GetFileName(filePath)
end

--- Get filename string without extension (uses static string)
---@param filePath string
---@return const char *
function rl.GetFileNameWithoutExt(filePath)
  return lib.GetFileNameWithoutExt(filePath)
end

--- Get full path for a given fileName with path (uses static string)
---@param filePath string
---@return const char *
function rl.GetDirectoryPath(filePath)
  return lib.GetDirectoryPath(filePath)
end

--- Get previous directory path for a given path (uses static string)
---@param dirPath string
---@return const char *
function rl.GetPrevDirectoryPath(dirPath)
  return lib.GetPrevDirectoryPath(dirPath)
end

--- Get current working directory (uses static string)
---@return const char *
function rl.GetWorkingDirectory()
  return lib.GetWorkingDirectory()
end

--- Get the directory of the running application (uses static string)
---@return const char *
function rl.GetApplicationDirectory()
  return lib.GetApplicationDirectory()
end

--- Change working directory, return true on success
---@param dir string
---@return bool
function rl.ChangeDirectory(dir)
  return lib.ChangeDirectory(dir)
end

--- Check if a given path is a file or a directory
---@param path string
---@return bool
function rl.IsPathFile(path)
  return lib.IsPathFile(path)
end

--- Load directory filepaths
---@param dirPath string
---@return FilePathList
function rl.LoadDirectoryFiles(dirPath)
  return lib.LoadDirectoryFiles(dirPath)
end

--- Load directory filepaths with extension filtering and recursive directory scan
---@param basePath string
---@param filter string
---@param scanSubdirs bool
---@return FilePathList
function rl.LoadDirectoryFilesEx(basePath, filter, scanSubdirs)
  return lib.LoadDirectoryFilesEx(basePath, filter, scanSubdirs)
end

--- Unload filepaths
---@param files FilePathList
---@return void
function rl.UnloadDirectoryFiles(files)
  return lib.UnloadDirectoryFiles(files)
end

--- Check if a file has been dropped into window
---@return bool
function rl.IsFileDropped()
  return lib.IsFileDropped()
end

--- Load dropped filepaths
---@return FilePathList
function rl.LoadDroppedFiles()
  return lib.LoadDroppedFiles()
end

--- Unload dropped filepaths
---@param files FilePathList
---@return void
function rl.UnloadDroppedFiles(files)
  return lib.UnloadDroppedFiles(files)
end

--- Get file modification time (last write time)
---@param fileName string
---@return long
function rl.GetFileModTime(fileName)
  return lib.GetFileModTime(fileName)
end

--- Compress data (DEFLATE algorithm), memory must be MemFree()
---@param data string
---@param dataSize integer
---@param compDataSize integer
---@return unsigned char *
function rl.CompressData(data, dataSize, compDataSize)
  return lib.CompressData(data, dataSize, compDataSize)
end

--- Decompress data (DEFLATE algorithm), memory must be MemFree()
---@param compData string
---@param compDataSize integer
---@param dataSize integer
---@return unsigned char *
function rl.DecompressData(compData, compDataSize, dataSize)
  return lib.DecompressData(compData, compDataSize, dataSize)
end

--- Encode data to Base64 string, memory must be MemFree()
---@param data string
---@param dataSize integer
---@param outputSize integer
---@return char *
function rl.EncodeDataBase64(data, dataSize, outputSize)
  return lib.EncodeDataBase64(data, dataSize, outputSize)
end

--- Decode Base64 string data, memory must be MemFree()
---@param data string
---@param outputSize integer
---@return unsigned char *
function rl.DecodeDataBase64(data, outputSize)
  return lib.DecodeDataBase64(data, outputSize)
end

--- Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
---@param fileName string
---@return AutomationEventList
function rl.LoadAutomationEventList(fileName)
  return lib.LoadAutomationEventList(fileName)
end

--- Unload automation events list from file
---@param list AutomationEventList *
---@return void
function rl.UnloadAutomationEventList(list)
  return lib.UnloadAutomationEventList(list)
end

--- Export automation events list as text file
---@param list AutomationEventList
---@param fileName string
---@return bool
function rl.ExportAutomationEventList(list, fileName)
  return lib.ExportAutomationEventList(list, fileName)
end

--- Set automation event list to record to
---@param list AutomationEventList *
---@return void
function rl.SetAutomationEventList(list)
  return lib.SetAutomationEventList(list)
end

--- Set automation event internal base frame to start recording
---@param frame integer
---@return void
function rl.SetAutomationEventBaseFrame(frame)
  return lib.SetAutomationEventBaseFrame(frame)
end

--- Start recording automation events (AutomationEventList must be set)
---@return void
function rl.StartAutomationEventRecording()
  return lib.StartAutomationEventRecording()
end

--- Stop recording automation events
---@return void
function rl.StopAutomationEventRecording()
  return lib.StopAutomationEventRecording()
end

--- Play a recorded automation event
---@param event AutomationEvent
---@return void
function rl.PlayAutomationEvent(event)
  return lib.PlayAutomationEvent(event)
end

--- Check if a key has been pressed once
---@param key integer
---@return bool
function rl.IsKeyPressed(key)
  return lib.IsKeyPressed(key)
end

--- Check if a key has been pressed again (Only PLATFORM_DESKTOP)
---@param key integer
---@return bool
function rl.IsKeyPressedRepeat(key)
  return lib.IsKeyPressedRepeat(key)
end

--- Check if a key is being pressed
---@param key integer
---@return bool
function rl.IsKeyDown(key)
  return lib.IsKeyDown(key)
end

--- Check if a key has been released once
---@param key integer
---@return bool
function rl.IsKeyReleased(key)
  return lib.IsKeyReleased(key)
end

--- Check if a key is NOT being pressed
---@param key integer
---@return bool
function rl.IsKeyUp(key)
  return lib.IsKeyUp(key)
end

--- Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
---@return int
function rl.GetKeyPressed()
  return lib.GetKeyPressed()
end

--- Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
---@return int
function rl.GetCharPressed()
  return lib.GetCharPressed()
end

--- Set a custom key to exit program (default is ESC)
---@param key integer
---@return void
function rl.SetExitKey(key)
  return lib.SetExitKey(key)
end

--- Check if a gamepad is available
---@param gamepad integer
---@return bool
function rl.IsGamepadAvailable(gamepad)
  return lib.IsGamepadAvailable(gamepad)
end

--- Get gamepad internal name id
---@param gamepad integer
---@return const char *
function rl.GetGamepadName(gamepad)
  return lib.GetGamepadName(gamepad)
end

--- Check if a gamepad button has been pressed once
---@param gamepad integer
---@param button integer
---@return bool
function rl.IsGamepadButtonPressed(gamepad, button)
  return lib.IsGamepadButtonPressed(gamepad, button)
end

--- Check if a gamepad button is being pressed
---@param gamepad integer
---@param button integer
---@return bool
function rl.IsGamepadButtonDown(gamepad, button)
  return lib.IsGamepadButtonDown(gamepad, button)
end

--- Check if a gamepad button has been released once
---@param gamepad integer
---@param button integer
---@return bool
function rl.IsGamepadButtonReleased(gamepad, button)
  return lib.IsGamepadButtonReleased(gamepad, button)
end

--- Check if a gamepad button is NOT being pressed
---@param gamepad integer
---@param button integer
---@return bool
function rl.IsGamepadButtonUp(gamepad, button)
  return lib.IsGamepadButtonUp(gamepad, button)
end

--- Get the last gamepad button pressed
---@return int
function rl.GetGamepadButtonPressed()
  return lib.GetGamepadButtonPressed()
end

--- Get gamepad axis count for a gamepad
---@param gamepad integer
---@return int
function rl.GetGamepadAxisCount(gamepad)
  return lib.GetGamepadAxisCount(gamepad)
end

--- Get axis movement value for a gamepad axis
---@param gamepad integer
---@param axis integer
---@return float
function rl.GetGamepadAxisMovement(gamepad, axis)
  return lib.GetGamepadAxisMovement(gamepad, axis)
end

--- Set internal gamepad mappings (SDL_GameControllerDB)
---@param mappings string
---@return int
function rl.SetGamepadMappings(mappings)
  return lib.SetGamepadMappings(mappings)
end

--- Check if a mouse button has been pressed once
---@param button integer
---@return bool
function rl.IsMouseButtonPressed(button)
  return lib.IsMouseButtonPressed(button)
end

--- Check if a mouse button is being pressed
---@param button integer
---@return bool
function rl.IsMouseButtonDown(button)
  return lib.IsMouseButtonDown(button)
end

--- Check if a mouse button has been released once
---@param button integer
---@return bool
function rl.IsMouseButtonReleased(button)
  return lib.IsMouseButtonReleased(button)
end

--- Check if a mouse button is NOT being pressed
---@param button integer
---@return bool
function rl.IsMouseButtonUp(button)
  return lib.IsMouseButtonUp(button)
end

--- Get mouse position X
---@return int
function rl.GetMouseX()
  return lib.GetMouseX()
end

--- Get mouse position Y
---@return int
function rl.GetMouseY()
  return lib.GetMouseY()
end

--- Get mouse position XY
---@return Vector2
function rl.GetMousePosition()
  return lib.GetMousePosition()
end

--- Get mouse delta between frames
---@return Vector2
function rl.GetMouseDelta()
  return lib.GetMouseDelta()
end

--- Set mouse position XY
---@param x integer
---@param y integer
---@return void
function rl.SetMousePosition(x, y)
  return lib.SetMousePosition(x, y)
end

--- Set mouse offset
---@param offsetX integer
---@param offsetY integer
---@return void
function rl.SetMouseOffset(offsetX, offsetY)
  return lib.SetMouseOffset(offsetX, offsetY)
end

--- Set mouse scaling
---@param scaleX number
---@param scaleY number
---@return void
function rl.SetMouseScale(scaleX, scaleY)
  return lib.SetMouseScale(scaleX, scaleY)
end

--- Get mouse wheel movement for X or Y, whichever is larger
---@return float
function rl.GetMouseWheelMove()
  return lib.GetMouseWheelMove()
end

--- Get mouse wheel movement for both X and Y
---@return Vector2
function rl.GetMouseWheelMoveV()
  return lib.GetMouseWheelMoveV()
end

--- Set mouse cursor
---@param cursor integer
---@return void
function rl.SetMouseCursor(cursor)
  return lib.SetMouseCursor(cursor)
end

--- Get touch position X for touch point 0 (relative to screen size)
---@return int
function rl.GetTouchX()
  return lib.GetTouchX()
end

--- Get touch position Y for touch point 0 (relative to screen size)
---@return int
function rl.GetTouchY()
  return lib.GetTouchY()
end

--- Get touch position XY for a touch point index (relative to screen size)
---@param index integer
---@return Vector2
function rl.GetTouchPosition(index)
  return lib.GetTouchPosition(index)
end

--- Get touch point identifier for given index
---@param index integer
---@return int
function rl.GetTouchPointId(index)
  return lib.GetTouchPointId(index)
end

--- Get number of touch points
---@return int
function rl.GetTouchPointCount()
  return lib.GetTouchPointCount()
end

--- Enable a set of gestures using flags
---@param flags integer
---@return void
function rl.SetGesturesEnabled(flags)
  return lib.SetGesturesEnabled(flags)
end

--- Check if a gesture have been detected
---@param gesture integer
---@return bool
function rl.IsGestureDetected(gesture)
  return lib.IsGestureDetected(gesture)
end

--- Get latest detected gesture
---@return int
function rl.GetGestureDetected()
  return lib.GetGestureDetected()
end

--- Get gesture hold time in milliseconds
---@return float
function rl.GetGestureHoldDuration()
  return lib.GetGestureHoldDuration()
end

--- Get gesture drag vector
---@return Vector2
function rl.GetGestureDragVector()
  return lib.GetGestureDragVector()
end

--- Get gesture drag angle
---@return float
function rl.GetGestureDragAngle()
  return lib.GetGestureDragAngle()
end

--- Get gesture pinch delta
---@return Vector2
function rl.GetGesturePinchVector()
  return lib.GetGesturePinchVector()
end

--- Get gesture pinch angle
---@return float
function rl.GetGesturePinchAngle()
  return lib.GetGesturePinchAngle()
end

--- Update camera position for selected mode
---@param camera Camera *
---@param mode integer
---@return void
function rl.UpdateCamera(camera, mode)
  return lib.UpdateCamera(camera, mode)
end

--- Update camera movement/rotation
---@param camera Camera *
---@param movement Vector3
---@param rotation Vector3
---@param zoom number
---@return void
function rl.UpdateCameraPro(camera, movement, rotation, zoom)
  return lib.UpdateCameraPro(camera, movement, rotation, zoom)
end

--- Set texture and rectangle to be used on shapes drawing
---@param texture Texture2D
---@param source Rectangle
---@return void
function rl.SetShapesTexture(texture, source)
  return lib.SetShapesTexture(texture, source)
end

--- Draw a pixel
---@param posX integer
---@param posY integer
---@param color Color
---@return void
function rl.DrawPixel(posX, posY, color)
  return lib.DrawPixel(posX, posY, color)
end

--- Draw a pixel (Vector version)
---@param position Vector2
---@param color Color
---@return void
function rl.DrawPixelV(position, color)
  return lib.DrawPixelV(position, color)
end

--- Draw a line
---@param startPosX integer
---@param startPosY integer
---@param endPosX integer
---@param endPosY integer
---@param color Color
---@return void
function rl.DrawLine(startPosX, startPosY, endPosX, endPosY, color)
  return lib.DrawLine(startPosX, startPosY, endPosX, endPosY, color)
end

--- Draw a line (using gl lines)
---@param startPos Vector2
---@param endPos Vector2
---@param color Color
---@return void
function rl.DrawLineV(startPos, endPos, color)
  return lib.DrawLineV(startPos, endPos, color)
end

--- Draw a line (using triangles/quads)
---@param startPos Vector2
---@param endPos Vector2
---@param thick number
---@param color Color
---@return void
function rl.DrawLineEx(startPos, endPos, thick, color)
  return lib.DrawLineEx(startPos, endPos, thick, color)
end

--- Draw lines sequence (using gl lines)
---@param points Vector2 *
---@param pointCount integer
---@param color Color
---@return void
function rl.DrawLineStrip(points, pointCount, color)
  return lib.DrawLineStrip(points, pointCount, color)
end

--- Draw line segment cubic-bezier in-out interpolation
---@param startPos Vector2
---@param endPos Vector2
---@param thick number
---@param color Color
---@return void
function rl.DrawLineBezier(startPos, endPos, thick, color)
  return lib.DrawLineBezier(startPos, endPos, thick, color)
end

--- Draw a color-filled circle
---@param centerX integer
---@param centerY integer
---@param radius number
---@param color Color
---@return void
function rl.DrawCircle(centerX, centerY, radius, color)
  return lib.DrawCircle(centerX, centerY, radius, color)
end

--- Draw a piece of a circle
---@param center Vector2
---@param radius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Color
---@return void
function rl.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
  return lib.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
end

--- Draw circle sector outline
---@param center Vector2
---@param radius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Color
---@return void
function rl.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
  return lib.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
end

--- Draw a gradient-filled circle
---@param centerX integer
---@param centerY integer
---@param radius number
---@param color1 Color
---@param color2 Color
---@return void
function rl.DrawCircleGradient(centerX, centerY, radius, color1, color2)
  return lib.DrawCircleGradient(centerX, centerY, radius, color1, color2)
end

--- Draw a color-filled circle (Vector version)
---@param center Vector2
---@param radius number
---@param color Color
---@return void
function rl.DrawCircleV(center, radius, color)
  return lib.DrawCircleV(center, radius, color)
end

--- Draw circle outline
---@param centerX integer
---@param centerY integer
---@param radius number
---@param color Color
---@return void
function rl.DrawCircleLines(centerX, centerY, radius, color)
  return lib.DrawCircleLines(centerX, centerY, radius, color)
end

--- Draw circle outline (Vector version)
---@param center Vector2
---@param radius number
---@param color Color
---@return void
function rl.DrawCircleLinesV(center, radius, color)
  return lib.DrawCircleLinesV(center, radius, color)
end

--- Draw ellipse
---@param centerX integer
---@param centerY integer
---@param radiusH number
---@param radiusV number
---@param color Color
---@return void
function rl.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
  return lib.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
end

--- Draw ellipse outline
---@param centerX integer
---@param centerY integer
---@param radiusH number
---@param radiusV number
---@param color Color
---@return void
function rl.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
  return lib.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
end

--- Draw ring
---@param center Vector2
---@param innerRadius number
---@param outerRadius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Color
---@return void
function rl.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
  return lib.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
end

--- Draw ring outline
---@param center Vector2
---@param innerRadius number
---@param outerRadius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Color
---@return void
function rl.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
  return lib.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
end

--- Draw a color-filled rectangle
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color Color
---@return void
function rl.DrawRectangle(posX, posY, width, height, color)
  return lib.DrawRectangle(posX, posY, width, height, color)
end

--- Draw a color-filled rectangle (Vector version)
---@param position Vector2
---@param size Vector2
---@param color Color
---@return void
function rl.DrawRectangleV(position, size, color)
  return lib.DrawRectangleV(position, size, color)
end

--- Draw a color-filled rectangle
---@param rec Rectangle
---@param color Color
---@return void
function rl.DrawRectangleRec(rec, color)
  return lib.DrawRectangleRec(rec, color)
end

--- Draw a color-filled rectangle with pro parameters
---@param rec Rectangle
---@param origin Vector2
---@param rotation number
---@param color Color
---@return void
function rl.DrawRectanglePro(rec, origin, rotation, color)
  return lib.DrawRectanglePro(rec, origin, rotation, color)
end

--- Draw a vertical-gradient-filled rectangle
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color1 Color
---@param color2 Color
---@return void
function rl.DrawRectangleGradientV(posX, posY, width, height, color1, color2)
  return lib.DrawRectangleGradientV(posX, posY, width, height, color1, color2)
end

--- Draw a horizontal-gradient-filled rectangle
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color1 Color
---@param color2 Color
---@return void
function rl.DrawRectangleGradientH(posX, posY, width, height, color1, color2)
  return lib.DrawRectangleGradientH(posX, posY, width, height, color1, color2)
end

--- Draw a gradient-filled rectangle with custom vertex colors
---@param rec Rectangle
---@param col1 Color
---@param col2 Color
---@param col3 Color
---@param col4 Color
---@return void
function rl.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
  return lib.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
end

--- Draw rectangle outline
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color Color
---@return void
function rl.DrawRectangleLines(posX, posY, width, height, color)
  return lib.DrawRectangleLines(posX, posY, width, height, color)
end

--- Draw rectangle outline with extended parameters
---@param rec Rectangle
---@param lineThick number
---@param color Color
---@return void
function rl.DrawRectangleLinesEx(rec, lineThick, color)
  return lib.DrawRectangleLinesEx(rec, lineThick, color)
end

--- Draw rectangle with rounded edges
---@param rec Rectangle
---@param roundness number
---@param segments integer
---@param color Color
---@return void
function rl.DrawRectangleRounded(rec, roundness, segments, color)
  return lib.DrawRectangleRounded(rec, roundness, segments, color)
end

--- Draw rectangle with rounded edges outline
---@param rec Rectangle
---@param roundness number
---@param segments integer
---@param lineThick number
---@param color Color
---@return void
function rl.DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
  return lib.DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
end

--- Draw a color-filled triangle (vertex in counter-clockwise order!)
---@param v1 Vector2
---@param v2 Vector2
---@param v3 Vector2
---@param color Color
---@return void
function rl.DrawTriangle(v1, v2, v3, color)
  return lib.DrawTriangle(v1, v2, v3, color)
end

--- Draw triangle outline (vertex in counter-clockwise order!)
---@param v1 Vector2
---@param v2 Vector2
---@param v3 Vector2
---@param color Color
---@return void
function rl.DrawTriangleLines(v1, v2, v3, color)
  return lib.DrawTriangleLines(v1, v2, v3, color)
end

--- Draw a triangle fan defined by points (first vertex is the center)
---@param points Vector2 *
---@param pointCount integer
---@param color Color
---@return void
function rl.DrawTriangleFan(points, pointCount, color)
  return lib.DrawTriangleFan(points, pointCount, color)
end

--- Draw a triangle strip defined by points
---@param points Vector2 *
---@param pointCount integer
---@param color Color
---@return void
function rl.DrawTriangleStrip(points, pointCount, color)
  return lib.DrawTriangleStrip(points, pointCount, color)
end

--- Draw a regular polygon (Vector version)
---@param center Vector2
---@param sides integer
---@param radius number
---@param rotation number
---@param color Color
---@return void
function rl.DrawPoly(center, sides, radius, rotation, color)
  return lib.DrawPoly(center, sides, radius, rotation, color)
end

--- Draw a polygon outline of n sides
---@param center Vector2
---@param sides integer
---@param radius number
---@param rotation number
---@param color Color
---@return void
function rl.DrawPolyLines(center, sides, radius, rotation, color)
  return lib.DrawPolyLines(center, sides, radius, rotation, color)
end

--- Draw a polygon outline of n sides with extended parameters
---@param center Vector2
---@param sides integer
---@param radius number
---@param rotation number
---@param lineThick number
---@param color Color
---@return void
function rl.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
  return lib.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
end

--- Draw spline: Linear, minimum 2 points
---@param points Vector2 *
---@param pointCount integer
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineLinear(points, pointCount, thick, color)
  return lib.DrawSplineLinear(points, pointCount, thick, color)
end

--- Draw spline: B-Spline, minimum 4 points
---@param points Vector2 *
---@param pointCount integer
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineBasis(points, pointCount, thick, color)
  return lib.DrawSplineBasis(points, pointCount, thick, color)
end

--- Draw spline: Catmull-Rom, minimum 4 points
---@param points Vector2 *
---@param pointCount integer
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineCatmullRom(points, pointCount, thick, color)
  return lib.DrawSplineCatmullRom(points, pointCount, thick, color)
end

--- Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
---@param points Vector2 *
---@param pointCount integer
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineBezierQuadratic(points, pointCount, thick, color)
  return lib.DrawSplineBezierQuadratic(points, pointCount, thick, color)
end

--- Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
---@param points Vector2 *
---@param pointCount integer
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineBezierCubic(points, pointCount, thick, color)
  return lib.DrawSplineBezierCubic(points, pointCount, thick, color)
end

--- Draw spline segment: Linear, 2 points
---@param p1 Vector2
---@param p2 Vector2
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineSegmentLinear(p1, p2, thick, color)
  return lib.DrawSplineSegmentLinear(p1, p2, thick, color)
end

--- Draw spline segment: B-Spline, 4 points
---@param p1 Vector2
---@param p2 Vector2
---@param p3 Vector2
---@param p4 Vector2
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color)
  return lib.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color)
end

--- Draw spline segment: Catmull-Rom, 4 points
---@param p1 Vector2
---@param p2 Vector2
---@param p3 Vector2
---@param p4 Vector2
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color)
  return lib.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color)
end

--- Draw spline segment: Quadratic Bezier, 2 points, 1 control point
---@param p1 Vector2
---@param c2 Vector2
---@param p3 Vector2
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color)
  return lib.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color)
end

--- Draw spline segment: Cubic Bezier, 2 points, 2 control points
---@param p1 Vector2
---@param c2 Vector2
---@param c3 Vector2
---@param p4 Vector2
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color)
  return lib.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color)
end

--- Get (evaluate) spline point: Linear
---@param startPos Vector2
---@param endPos Vector2
---@param t number
---@return Vector2
function rl.GetSplinePointLinear(startPos, endPos, t)
  return lib.GetSplinePointLinear(startPos, endPos, t)
end

--- Get (evaluate) spline point: B-Spline
---@param p1 Vector2
---@param p2 Vector2
---@param p3 Vector2
---@param p4 Vector2
---@param t number
---@return Vector2
function rl.GetSplinePointBasis(p1, p2, p3, p4, t)
  return lib.GetSplinePointBasis(p1, p2, p3, p4, t)
end

--- Get (evaluate) spline point: Catmull-Rom
---@param p1 Vector2
---@param p2 Vector2
---@param p3 Vector2
---@param p4 Vector2
---@param t number
---@return Vector2
function rl.GetSplinePointCatmullRom(p1, p2, p3, p4, t)
  return lib.GetSplinePointCatmullRom(p1, p2, p3, p4, t)
end

--- Get (evaluate) spline point: Quadratic Bezier
---@param p1 Vector2
---@param c2 Vector2
---@param p3 Vector2
---@param t number
---@return Vector2
function rl.GetSplinePointBezierQuad(p1, c2, p3, t)
  return lib.GetSplinePointBezierQuad(p1, c2, p3, t)
end

--- Get (evaluate) spline point: Cubic Bezier
---@param p1 Vector2
---@param c2 Vector2
---@param c3 Vector2
---@param p4 Vector2
---@param t number
---@return Vector2
function rl.GetSplinePointBezierCubic(p1, c2, c3, p4, t)
  return lib.GetSplinePointBezierCubic(p1, c2, c3, p4, t)
end

--- Check collision between two rectangles
---@param rec1 Rectangle
---@param rec2 Rectangle
---@return bool
function rl.CheckCollisionRecs(rec1, rec2)
  return lib.CheckCollisionRecs(rec1, rec2)
end

--- Check collision between two circles
---@param center1 Vector2
---@param radius1 number
---@param center2 Vector2
---@param radius2 number
---@return bool
function rl.CheckCollisionCircles(center1, radius1, center2, radius2)
  return lib.CheckCollisionCircles(center1, radius1, center2, radius2)
end

--- Check collision between circle and rectangle
---@param center Vector2
---@param radius number
---@param rec Rectangle
---@return bool
function rl.CheckCollisionCircleRec(center, radius, rec)
  return lib.CheckCollisionCircleRec(center, radius, rec)
end

--- Check if point is inside rectangle
---@param point Vector2
---@param rec Rectangle
---@return bool
function rl.CheckCollisionPointRec(point, rec)
  return lib.CheckCollisionPointRec(point, rec)
end

--- Check if point is inside circle
---@param point Vector2
---@param center Vector2
---@param radius number
---@return bool
function rl.CheckCollisionPointCircle(point, center, radius)
  return lib.CheckCollisionPointCircle(point, center, radius)
end

--- Check if point is inside a triangle
---@param point Vector2
---@param p1 Vector2
---@param p2 Vector2
---@param p3 Vector2
---@return bool
function rl.CheckCollisionPointTriangle(point, p1, p2, p3)
  return lib.CheckCollisionPointTriangle(point, p1, p2, p3)
end

--- Check if point is within a polygon described by array of vertices
---@param point Vector2
---@param points Vector2 *
---@param pointCount integer
---@return bool
function rl.CheckCollisionPointPoly(point, points, pointCount)
  return lib.CheckCollisionPointPoly(point, points, pointCount)
end

--- Check the collision between two lines defined by two points each, returns collision point by reference
---@param startPos1 Vector2
---@param endPos1 Vector2
---@param startPos2 Vector2
---@param endPos2 Vector2
---@param collisionPoint Vector2 *
---@return bool
function rl.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
  return lib.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
end

--- Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
---@param point Vector2
---@param p1 Vector2
---@param p2 Vector2
---@param threshold integer
---@return bool
function rl.CheckCollisionPointLine(point, p1, p2, threshold)
  return lib.CheckCollisionPointLine(point, p1, p2, threshold)
end

--- Get collision rectangle for two rectangles collision
---@param rec1 Rectangle
---@param rec2 Rectangle
---@return Rectangle
function rl.GetCollisionRec(rec1, rec2)
  return lib.GetCollisionRec(rec1, rec2)
end

--- Load image from file into CPU memory (RAM)
---@param fileName string
---@return Image
function rl.LoadImage(fileName)
  return lib.LoadImage(fileName)
end

--- Load image from RAW file data
---@param fileName string
---@param width integer
---@param height integer
---@param format integer
---@param headerSize integer
---@return Image
function rl.LoadImageRaw(fileName, width, height, format, headerSize)
  return lib.LoadImageRaw(fileName, width, height, format, headerSize)
end

--- Load image from SVG file data or string with specified size
---@param fileNameOrString string
---@param width integer
---@param height integer
---@return Image
function rl.LoadImageSvg(fileNameOrString, width, height)
  return lib.LoadImageSvg(fileNameOrString, width, height)
end

--- Load image sequence from file (frames appended to image.data)
---@param fileName string
---@param frames integer
---@return Image
function rl.LoadImageAnim(fileName, frames)
  return lib.LoadImageAnim(fileName, frames)
end

--- Load image from memory buffer, fileType refers to extension: i.e. '.png'
---@param fileType string
---@param fileData string
---@param dataSize integer
---@return Image
function rl.LoadImageFromMemory(fileType, fileData, dataSize)
  return lib.LoadImageFromMemory(fileType, fileData, dataSize)
end

--- Load image from GPU texture data
---@param texture Texture2D
---@return Image
function rl.LoadImageFromTexture(texture)
  return lib.LoadImageFromTexture(texture)
end

--- Load image from screen buffer and (screenshot)
---@return Image
function rl.LoadImageFromScreen()
  return lib.LoadImageFromScreen()
end

--- Check if an image is ready
---@param image Image
---@return bool
function rl.IsImageReady(image)
  return lib.IsImageReady(image)
end

--- Unload image from CPU memory (RAM)
---@param image Image
---@return void
function rl.UnloadImage(image)
  return lib.UnloadImage(image)
end

--- Export image data to file, returns true on success
---@param image Image
---@param fileName string
---@return bool
function rl.ExportImage(image, fileName)
  return lib.ExportImage(image, fileName)
end

--- Export image to memory buffer
---@param image Image
---@param fileType string
---@param fileSize integer
---@return unsigned char *
function rl.ExportImageToMemory(image, fileType, fileSize)
  return lib.ExportImageToMemory(image, fileType, fileSize)
end

--- Export image as code file defining an array of bytes, returns true on success
---@param image Image
---@param fileName string
---@return bool
function rl.ExportImageAsCode(image, fileName)
  return lib.ExportImageAsCode(image, fileName)
end

--- Generate image: plain color
---@param width integer
---@param height integer
---@param color Color
---@return Image
function rl.GenImageColor(width, height, color)
  return lib.GenImageColor(width, height, color)
end

--- Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
---@param width integer
---@param height integer
---@param direction integer
---@param start Color
---@param ending Color
---@return Image
function rl.GenImageGradientLinear(width, height, direction, start, ending)
  return lib.GenImageGradientLinear(width, height, direction, start, ending)
end

--- Generate image: radial gradient
---@param width integer
---@param height integer
---@param density number
---@param inner Color
---@param outer Color
---@return Image
function rl.GenImageGradientRadial(width, height, density, inner, outer)
  return lib.GenImageGradientRadial(width, height, density, inner, outer)
end

--- Generate image: square gradient
---@param width integer
---@param height integer
---@param density number
---@param inner Color
---@param outer Color
---@return Image
function rl.GenImageGradientSquare(width, height, density, inner, outer)
  return lib.GenImageGradientSquare(width, height, density, inner, outer)
end

--- Generate image: checked
---@param width integer
---@param height integer
---@param checksX integer
---@param checksY integer
---@param col1 Color
---@param col2 Color
---@return Image
function rl.GenImageChecked(width, height, checksX, checksY, col1, col2)
  return lib.GenImageChecked(width, height, checksX, checksY, col1, col2)
end

--- Generate image: white noise
---@param width integer
---@param height integer
---@param factor number
---@return Image
function rl.GenImageWhiteNoise(width, height, factor)
  return lib.GenImageWhiteNoise(width, height, factor)
end

--- Generate image: perlin noise
---@param width integer
---@param height integer
---@param offsetX integer
---@param offsetY integer
---@param scale number
---@return Image
function rl.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
  return lib.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
end

--- Generate image: cellular algorithm, bigger tileSize means bigger cells
---@param width integer
---@param height integer
---@param tileSize integer
---@return Image
function rl.GenImageCellular(width, height, tileSize)
  return lib.GenImageCellular(width, height, tileSize)
end

--- Generate image: grayscale image from text data
---@param width integer
---@param height integer
---@param text string
---@return Image
function rl.GenImageText(width, height, text)
  return lib.GenImageText(width, height, text)
end

--- Create an image duplicate (useful for transformations)
---@param image Image
---@return Image
function rl.ImageCopy(image)
  return lib.ImageCopy(image)
end

--- Create an image from another image piece
---@param image Image
---@param rec Rectangle
---@return Image
function rl.ImageFromImage(image, rec)
  return lib.ImageFromImage(image, rec)
end

--- Create an image from text (default font)
---@param text string
---@param fontSize integer
---@param color Color
---@return Image
function rl.ImageText(text, fontSize, color)
  return lib.ImageText(text, fontSize, color)
end

--- Create an image from text (custom sprite font)
---@param font Font
---@param text string
---@param fontSize number
---@param spacing number
---@param tint Color
---@return Image
function rl.ImageTextEx(font, text, fontSize, spacing, tint)
  return lib.ImageTextEx(font, text, fontSize, spacing, tint)
end

--- Convert image data to desired format
---@param image Image *
---@param newFormat integer
---@return void
function rl.ImageFormat(image, newFormat)
  return lib.ImageFormat(image, newFormat)
end

--- Convert image to POT (power-of-two)
---@param image Image *
---@param fill Color
---@return void
function rl.ImageToPOT(image, fill)
  return lib.ImageToPOT(image, fill)
end

--- Crop an image to a defined rectangle
---@param image Image *
---@param crop Rectangle
---@return void
function rl.ImageCrop(image, crop)
  return lib.ImageCrop(image, crop)
end

--- Crop image depending on alpha value
---@param image Image *
---@param threshold number
---@return void
function rl.ImageAlphaCrop(image, threshold)
  return lib.ImageAlphaCrop(image, threshold)
end

--- Clear alpha channel to desired color
---@param image Image *
---@param color Color
---@param threshold number
---@return void
function rl.ImageAlphaClear(image, color, threshold)
  return lib.ImageAlphaClear(image, color, threshold)
end

--- Apply alpha mask to image
---@param image Image *
---@param alphaMask Image
---@return void
function rl.ImageAlphaMask(image, alphaMask)
  return lib.ImageAlphaMask(image, alphaMask)
end

--- Premultiply alpha channel
---@param image Image *
---@return void
function rl.ImageAlphaPremultiply(image)
  return lib.ImageAlphaPremultiply(image)
end

--- Apply Gaussian blur using a box blur approximation
---@param image Image *
---@param blurSize integer
---@return void
function rl.ImageBlurGaussian(image, blurSize)
  return lib.ImageBlurGaussian(image, blurSize)
end

--- Resize image (Bicubic scaling algorithm)
---@param image Image *
---@param newWidth integer
---@param newHeight integer
---@return void
function rl.ImageResize(image, newWidth, newHeight)
  return lib.ImageResize(image, newWidth, newHeight)
end

--- Resize image (Nearest-Neighbor scaling algorithm)
---@param image Image *
---@param newWidth integer
---@param newHeight integer
---@return void
function rl.ImageResizeNN(image, newWidth, newHeight)
  return lib.ImageResizeNN(image, newWidth, newHeight)
end

--- Resize canvas and fill with color
---@param image Image *
---@param newWidth integer
---@param newHeight integer
---@param offsetX integer
---@param offsetY integer
---@param fill Color
---@return void
function rl.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
  return lib.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
end

--- Compute all mipmap levels for a provided image
---@param image Image *
---@return void
function rl.ImageMipmaps(image)
  return lib.ImageMipmaps(image)
end

--- Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
---@param image Image *
---@param rBpp integer
---@param gBpp integer
---@param bBpp integer
---@param aBpp integer
---@return void
function rl.ImageDither(image, rBpp, gBpp, bBpp, aBpp)
  return lib.ImageDither(image, rBpp, gBpp, bBpp, aBpp)
end

--- Flip image vertically
---@param image Image *
---@return void
function rl.ImageFlipVertical(image)
  return lib.ImageFlipVertical(image)
end

--- Flip image horizontally
---@param image Image *
---@return void
function rl.ImageFlipHorizontal(image)
  return lib.ImageFlipHorizontal(image)
end

--- Rotate image by input angle in degrees (-359 to 359)
---@param image Image *
---@param degrees integer
---@return void
function rl.ImageRotate(image, degrees)
  return lib.ImageRotate(image, degrees)
end

--- Rotate image clockwise 90deg
---@param image Image *
---@return void
function rl.ImageRotateCW(image)
  return lib.ImageRotateCW(image)
end

--- Rotate image counter-clockwise 90deg
---@param image Image *
---@return void
function rl.ImageRotateCCW(image)
  return lib.ImageRotateCCW(image)
end

--- Modify image color: tint
---@param image Image *
---@param color Color
---@return void
function rl.ImageColorTint(image, color)
  return lib.ImageColorTint(image, color)
end

--- Modify image color: invert
---@param image Image *
---@return void
function rl.ImageColorInvert(image)
  return lib.ImageColorInvert(image)
end

--- Modify image color: grayscale
---@param image Image *
---@return void
function rl.ImageColorGrayscale(image)
  return lib.ImageColorGrayscale(image)
end

--- Modify image color: contrast (-100 to 100)
---@param image Image *
---@param contrast number
---@return void
function rl.ImageColorContrast(image, contrast)
  return lib.ImageColorContrast(image, contrast)
end

--- Modify image color: brightness (-255 to 255)
---@param image Image *
---@param brightness integer
---@return void
function rl.ImageColorBrightness(image, brightness)
  return lib.ImageColorBrightness(image, brightness)
end

--- Modify image color: replace color
---@param image Image *
---@param color Color
---@param replace Color
---@return void
function rl.ImageColorReplace(image, color, replace)
  return lib.ImageColorReplace(image, color, replace)
end

--- Load color data from image as a Color array (RGBA - 32bit)
---@param image Image
---@return Color *
function rl.LoadImageColors(image)
  return lib.LoadImageColors(image)
end

--- Load colors palette from image as a Color array (RGBA - 32bit)
---@param image Image
---@param maxPaletteSize integer
---@param colorCount integer
---@return Color *
function rl.LoadImagePalette(image, maxPaletteSize, colorCount)
  return lib.LoadImagePalette(image, maxPaletteSize, colorCount)
end

--- Unload color data loaded with LoadImageColors()
---@param colors Color *
---@return void
function rl.UnloadImageColors(colors)
  return lib.UnloadImageColors(colors)
end

--- Unload colors palette loaded with LoadImagePalette()
---@param colors Color *
---@return void
function rl.UnloadImagePalette(colors)
  return lib.UnloadImagePalette(colors)
end

--- Get image alpha border rectangle
---@param image Image
---@param threshold number
---@return Rectangle
function rl.GetImageAlphaBorder(image, threshold)
  return lib.GetImageAlphaBorder(image, threshold)
end

--- Get image pixel color at (x, y) position
---@param image Image
---@param x integer
---@param y integer
---@return Color
function rl.GetImageColor(image, x, y)
  return lib.GetImageColor(image, x, y)
end

--- Clear image background with given color
---@param dst Image *
---@param color Color
---@return void
function rl.ImageClearBackground(dst, color)
  return lib.ImageClearBackground(dst, color)
end

--- Draw pixel within an image
---@param dst Image *
---@param posX integer
---@param posY integer
---@param color Color
---@return void
function rl.ImageDrawPixel(dst, posX, posY, color)
  return lib.ImageDrawPixel(dst, posX, posY, color)
end

--- Draw pixel within an image (Vector version)
---@param dst Image *
---@param position Vector2
---@param color Color
---@return void
function rl.ImageDrawPixelV(dst, position, color)
  return lib.ImageDrawPixelV(dst, position, color)
end

--- Draw line within an image
---@param dst Image *
---@param startPosX integer
---@param startPosY integer
---@param endPosX integer
---@param endPosY integer
---@param color Color
---@return void
function rl.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
  return lib.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
end

--- Draw line within an image (Vector version)
---@param dst Image *
---@param start Vector2
---@param ending Vector2
---@param color Color
---@return void
function rl.ImageDrawLineV(dst, start, ending, color)
  return lib.ImageDrawLineV(dst, start, ending, color)
end

--- Draw a filled circle within an image
---@param dst Image *
---@param centerX integer
---@param centerY integer
---@param radius integer
---@param color Color
---@return void
function rl.ImageDrawCircle(dst, centerX, centerY, radius, color)
  return lib.ImageDrawCircle(dst, centerX, centerY, radius, color)
end

--- Draw a filled circle within an image (Vector version)
---@param dst Image *
---@param center Vector2
---@param radius integer
---@param color Color
---@return void
function rl.ImageDrawCircleV(dst, center, radius, color)
  return lib.ImageDrawCircleV(dst, center, radius, color)
end

--- Draw circle outline within an image
---@param dst Image *
---@param centerX integer
---@param centerY integer
---@param radius integer
---@param color Color
---@return void
function rl.ImageDrawCircleLines(dst, centerX, centerY, radius, color)
  return lib.ImageDrawCircleLines(dst, centerX, centerY, radius, color)
end

--- Draw circle outline within an image (Vector version)
---@param dst Image *
---@param center Vector2
---@param radius integer
---@param color Color
---@return void
function rl.ImageDrawCircleLinesV(dst, center, radius, color)
  return lib.ImageDrawCircleLinesV(dst, center, radius, color)
end

--- Draw rectangle within an image
---@param dst Image *
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color Color
---@return void
function rl.ImageDrawRectangle(dst, posX, posY, width, height, color)
  return lib.ImageDrawRectangle(dst, posX, posY, width, height, color)
end

--- Draw rectangle within an image (Vector version)
---@param dst Image *
---@param position Vector2
---@param size Vector2
---@param color Color
---@return void
function rl.ImageDrawRectangleV(dst, position, size, color)
  return lib.ImageDrawRectangleV(dst, position, size, color)
end

--- Draw rectangle within an image
---@param dst Image *
---@param rec Rectangle
---@param color Color
---@return void
function rl.ImageDrawRectangleRec(dst, rec, color)
  return lib.ImageDrawRectangleRec(dst, rec, color)
end

--- Draw rectangle lines within an image
---@param dst Image *
---@param rec Rectangle
---@param thick integer
---@param color Color
---@return void
function rl.ImageDrawRectangleLines(dst, rec, thick, color)
  return lib.ImageDrawRectangleLines(dst, rec, thick, color)
end

--- Draw a source image within a destination image (tint applied to source)
---@param dst Image *
---@param src Image
---@param srcRec Rectangle
---@param dstRec Rectangle
---@param tint Color
---@return void
function rl.ImageDraw(dst, src, srcRec, dstRec, tint)
  return lib.ImageDraw(dst, src, srcRec, dstRec, tint)
end

--- Draw text (using default font) within an image (destination)
---@param dst Image *
---@param text string
---@param posX integer
---@param posY integer
---@param fontSize integer
---@param color Color
---@return void
function rl.ImageDrawText(dst, text, posX, posY, fontSize, color)
  return lib.ImageDrawText(dst, text, posX, posY, fontSize, color)
end

--- Draw text (custom sprite font) within an image (destination)
---@param dst Image *
---@param font Font
---@param text string
---@param position Vector2
---@param fontSize number
---@param spacing number
---@param tint Color
---@return void
function rl.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint)
  return lib.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint)
end

--- Load texture from file into GPU memory (VRAM)
---@param fileName string
---@return Texture2D
function rl.LoadTexture(fileName)
  return lib.LoadTexture(fileName)
end

--- Load texture from image data
---@param image Image
---@return Texture2D
function rl.LoadTextureFromImage(image)
  return lib.LoadTextureFromImage(image)
end

--- Load cubemap from image, multiple image cubemap layouts supported
---@param image Image
---@param layout integer
---@return TextureCubemap
function rl.LoadTextureCubemap(image, layout)
  return lib.LoadTextureCubemap(image, layout)
end

--- Load texture for rendering (framebuffer)
---@param width integer
---@param height integer
---@return RenderTexture2D
function rl.LoadRenderTexture(width, height)
  return lib.LoadRenderTexture(width, height)
end

--- Check if a texture is ready
---@param texture Texture2D
---@return bool
function rl.IsTextureReady(texture)
  return lib.IsTextureReady(texture)
end

--- Unload texture from GPU memory (VRAM)
---@param texture Texture2D
---@return void
function rl.UnloadTexture(texture)
  return lib.UnloadTexture(texture)
end

--- Check if a render texture is ready
---@param target RenderTexture2D
---@return bool
function rl.IsRenderTextureReady(target)
  return lib.IsRenderTextureReady(target)
end

--- Unload render texture from GPU memory (VRAM)
---@param target RenderTexture2D
---@return void
function rl.UnloadRenderTexture(target)
  return lib.UnloadRenderTexture(target)
end

--- Update GPU texture with new data
---@param texture Texture2D
---@param pixels const void *
---@return void
function rl.UpdateTexture(texture, pixels)
  return lib.UpdateTexture(texture, pixels)
end

--- Update GPU texture rectangle with new data
---@param texture Texture2D
---@param rec Rectangle
---@param pixels const void *
---@return void
function rl.UpdateTextureRec(texture, rec, pixels)
  return lib.UpdateTextureRec(texture, rec, pixels)
end

--- Generate GPU mipmaps for a texture
---@param texture Texture2D *
---@return void
function rl.GenTextureMipmaps(texture)
  return lib.GenTextureMipmaps(texture)
end

--- Set texture scaling filter mode
---@param texture Texture2D
---@param filter integer
---@return void
function rl.SetTextureFilter(texture, filter)
  return lib.SetTextureFilter(texture, filter)
end

--- Set texture wrapping mode
---@param texture Texture2D
---@param wrap integer
---@return void
function rl.SetTextureWrap(texture, wrap)
  return lib.SetTextureWrap(texture, wrap)
end

--- Draw a Texture2D
---@param texture Texture2D
---@param posX integer
---@param posY integer
---@param tint Color
---@return void
function rl.DrawTexture(texture, posX, posY, tint)
  return lib.DrawTexture(texture, posX, posY, tint)
end

--- Draw a Texture2D with position defined as Vector2
---@param texture Texture2D
---@param position Vector2
---@param tint Color
---@return void
function rl.DrawTextureV(texture, position, tint)
  return lib.DrawTextureV(texture, position, tint)
end

--- Draw a Texture2D with extended parameters
---@param texture Texture2D
---@param position Vector2
---@param rotation number
---@param scale number
---@param tint Color
---@return void
function rl.DrawTextureEx(texture, position, rotation, scale, tint)
  return lib.DrawTextureEx(texture, position, rotation, scale, tint)
end

--- Draw a part of a texture defined by a rectangle
---@param texture Texture2D
---@param source Rectangle
---@param position Vector2
---@param tint Color
---@return void
function rl.DrawTextureRec(texture, source, position, tint)
  return lib.DrawTextureRec(texture, source, position, tint)
end

--- Draw a part of a texture defined by a rectangle with 'pro' parameters
---@param texture Texture2D
---@param source Rectangle
---@param dest Rectangle
---@param origin Vector2
---@param rotation number
---@param tint Color
---@return void
function rl.DrawTexturePro(texture, source, dest, origin, rotation, tint)
  return lib.DrawTexturePro(texture, source, dest, origin, rotation, tint)
end

--- Draws a texture (or part of it) that stretches or shrinks nicely
---@param texture Texture2D
---@param nPatchInfo NPatchInfo
---@param dest Rectangle
---@param origin Vector2
---@param rotation number
---@param tint Color
---@return void
function rl.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint)
  return lib.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint)
end

--- Get color with alpha applied, alpha goes from 0.0f to 1.0f
---@param color Color
---@param alpha number
---@return Color
function rl.Fade(color, alpha)
  return lib.Fade(color, alpha)
end

--- Get hexadecimal value for a Color
---@param color Color
---@return int
function rl.ColorToInt(color)
  return lib.ColorToInt(color)
end

--- Get Color normalized as float [0..1]
---@param color Color
---@return Vector4
function rl.ColorNormalize(color)
  return lib.ColorNormalize(color)
end

--- Get Color from normalized values [0..1]
---@param normalized Vector4
---@return Color
function rl.ColorFromNormalized(normalized)
  return lib.ColorFromNormalized(normalized)
end

--- Get HSV values for a Color, hue [0..360], saturation/value [0..1]
---@param color Color
---@return Vector3
function rl.ColorToHSV(color)
  return lib.ColorToHSV(color)
end

--- Get a Color from HSV values, hue [0..360], saturation/value [0..1]
---@param hue number
---@param saturation number
---@param value number
---@return Color
function rl.ColorFromHSV(hue, saturation, value)
  return lib.ColorFromHSV(hue, saturation, value)
end

--- Get color multiplied with another color
---@param color Color
---@param tint Color
---@return Color
function rl.ColorTint(color, tint)
  return lib.ColorTint(color, tint)
end

--- Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
---@param color Color
---@param factor number
---@return Color
function rl.ColorBrightness(color, factor)
  return lib.ColorBrightness(color, factor)
end

--- Get color with contrast correction, contrast values between -1.0f and 1.0f
---@param color Color
---@param contrast number
---@return Color
function rl.ColorContrast(color, contrast)
  return lib.ColorContrast(color, contrast)
end

--- Get color with alpha applied, alpha goes from 0.0f to 1.0f
---@param color Color
---@param alpha number
---@return Color
function rl.ColorAlpha(color, alpha)
  return lib.ColorAlpha(color, alpha)
end

--- Get src alpha-blended into dst color with tint
---@param dst Color
---@param src Color
---@param tint Color
---@return Color
function rl.ColorAlphaBlend(dst, src, tint)
  return lib.ColorAlphaBlend(dst, src, tint)
end

--- Get Color structure from hexadecimal value
---@param hexValue integer
---@return Color
function rl.GetColor(hexValue)
  return lib.GetColor(hexValue)
end

--- Get Color from a source pixel pointer of certain format
---@param srcPtr void
---@param format integer
---@return Color
function rl.GetPixelColor(srcPtr, format)
  return lib.GetPixelColor(srcPtr, format)
end

--- Set color formatted into destination pixel pointer
---@param dstPtr void
---@param color Color
---@param format integer
---@return void
function rl.SetPixelColor(dstPtr, color, format)
  return lib.SetPixelColor(dstPtr, color, format)
end

--- Get pixel data size in bytes for certain format
---@param width integer
---@param height integer
---@param format integer
---@return int
function rl.GetPixelDataSize(width, height, format)
  return lib.GetPixelDataSize(width, height, format)
end

--- Get the default Font
---@return Font
function rl.GetFontDefault()
  return lib.GetFontDefault()
end

--- Load font from file into GPU memory (VRAM)
---@param fileName string
---@return Font
function rl.LoadFont(fileName)
  return lib.LoadFont(fileName)
end

--- Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character setFont
---@param fileName string
---@param fontSize integer
---@param codepoints integer
---@param codepointCount integer
---@return Font
function rl.LoadFontEx(fileName, fontSize, codepoints, codepointCount)
  return lib.LoadFontEx(fileName, fontSize, codepoints, codepointCount)
end

--- Load font from Image (XNA style)
---@param image Image
---@param key Color
---@param firstChar integer
---@return Font
function rl.LoadFontFromImage(image, key, firstChar)
  return lib.LoadFontFromImage(image, key, firstChar)
end

--- Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
---@param fileType string
---@param fileData string
---@param dataSize integer
---@param fontSize integer
---@param codepoints integer
---@param codepointCount integer
---@return Font
function rl.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount)
  return lib.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount)
end

--- Check if a font is ready
---@param font Font
---@return bool
function rl.IsFontReady(font)
  return lib.IsFontReady(font)
end

--- Load font data for further use
---@param fileData string
---@param dataSize integer
---@param fontSize integer
---@param codepoints integer
---@param codepointCount integer
---@param type integer
---@return GlyphInfo *
function rl.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type)
  return lib.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type)
end

--- Generate image font atlas using chars info
---@param glyphs const GlyphInfo *
---@param glyphRecs Rectangle **
---@param glyphCount integer
---@param fontSize integer
---@param padding integer
---@param packMethod integer
---@return Image
function rl.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod)
  return lib.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod)
end

--- Unload font chars info data (RAM)
---@param glyphs GlyphInfo *
---@param glyphCount integer
---@return void
function rl.UnloadFontData(glyphs, glyphCount)
  return lib.UnloadFontData(glyphs, glyphCount)
end

--- Unload font from GPU memory (VRAM)
---@param font Font
---@return void
function rl.UnloadFont(font)
  return lib.UnloadFont(font)
end

--- Export font as code file, returns true on success
---@param font Font
---@param fileName string
---@return bool
function rl.ExportFontAsCode(font, fileName)
  return lib.ExportFontAsCode(font, fileName)
end

--- Draw current FPS
---@param posX integer
---@param posY integer
---@return void
function rl.DrawFPS(posX, posY)
  return lib.DrawFPS(posX, posY)
end

--- Draw text (using default font)
---@param text string
---@param posX integer
---@param posY integer
---@param fontSize integer
---@param color Color
---@return void
function rl.DrawText(text, posX, posY, fontSize, color)
  return lib.DrawText(text, posX, posY, fontSize, color)
end

--- Draw text using font and additional parameters
---@param font Font
---@param text string
---@param position Vector2
---@param fontSize number
---@param spacing number
---@param tint Color
---@return void
function rl.DrawTextEx(font, text, position, fontSize, spacing, tint)
  return lib.DrawTextEx(font, text, position, fontSize, spacing, tint)
end

--- Draw text using Font and pro parameters (rotation)
---@param font Font
---@param text string
---@param position Vector2
---@param origin Vector2
---@param rotation number
---@param fontSize number
---@param spacing number
---@param tint Color
---@return void
function rl.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint)
  return lib.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint)
end

--- Draw one character (codepoint)
---@param font Font
---@param codepoint integer
---@param position Vector2
---@param fontSize number
---@param tint Color
---@return void
function rl.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
  return lib.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
end

--- Draw multiple character (codepoint)
---@param font Font
---@param codepoints const int *
---@param codepointCount integer
---@param position Vector2
---@param fontSize number
---@param spacing number
---@param tint Color
---@return void
function rl.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint)
  return lib.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint)
end

--- Set vertical line spacing when drawing with line-breaks
---@param spacing integer
---@return void
function rl.SetTextLineSpacing(spacing)
  return lib.SetTextLineSpacing(spacing)
end

--- Measure string width for default font
---@param text string
---@param fontSize integer
---@return int
function rl.MeasureText(text, fontSize)
  return lib.MeasureText(text, fontSize)
end

--- Measure string size for Font
---@param font Font
---@param text string
---@param fontSize number
---@param spacing number
---@return Vector2
function rl.MeasureTextEx(font, text, fontSize, spacing)
  return lib.MeasureTextEx(font, text, fontSize, spacing)
end

--- Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
---@param font Font
---@param codepoint integer
---@return int
function rl.GetGlyphIndex(font, codepoint)
  return lib.GetGlyphIndex(font, codepoint)
end

--- Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
---@param font Font
---@param codepoint integer
---@return GlyphInfo
function rl.GetGlyphInfo(font, codepoint)
  return lib.GetGlyphInfo(font, codepoint)
end

--- Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
---@param font Font
---@param codepoint integer
---@return Rectangle
function rl.GetGlyphAtlasRec(font, codepoint)
  return lib.GetGlyphAtlasRec(font, codepoint)
end

--- Load UTF-8 text encoded from codepoints array
---@param codepoints const int *
---@param length integer
---@return char *
function rl.LoadUTF8(codepoints, length)
  return lib.LoadUTF8(codepoints, length)
end

--- Unload UTF-8 text encoded from codepoints array
---@param text string
---@return void
function rl.UnloadUTF8(text)
  return lib.UnloadUTF8(text)
end

--- Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
---@param text string
---@param count integer
---@return int *
function rl.LoadCodepoints(text, count)
  return lib.LoadCodepoints(text, count)
end

--- Unload codepoints data from memory
---@param codepoints integer
---@return void
function rl.UnloadCodepoints(codepoints)
  return lib.UnloadCodepoints(codepoints)
end

--- Get total number of codepoints in a UTF-8 encoded string
---@param text string
---@return int
function rl.GetCodepointCount(text)
  return lib.GetCodepointCount(text)
end

--- Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
---@param text string
---@param codepointSize integer
---@return int
function rl.GetCodepoint(text, codepointSize)
  return lib.GetCodepoint(text, codepointSize)
end

--- Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
---@param text string
---@param codepointSize integer
---@return int
function rl.GetCodepointNext(text, codepointSize)
  return lib.GetCodepointNext(text, codepointSize)
end

--- Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
---@param text string
---@param codepointSize integer
---@return int
function rl.GetCodepointPrevious(text, codepointSize)
  return lib.GetCodepointPrevious(text, codepointSize)
end

--- Encode one codepoint into UTF-8 byte array (array length returned as parameter)
---@param codepoint integer
---@param utf8Size integer
---@return const char *
function rl.CodepointToUTF8(codepoint, utf8Size)
  return lib.CodepointToUTF8(codepoint, utf8Size)
end

--- Copy one string to another, returns bytes copied
---@param dst string
---@param src string
---@return int
function rl.TextCopy(dst, src)
  return lib.TextCopy(dst, src)
end

--- Check if two text string are equal
---@param text1 string
---@param text2 string
---@return bool
function rl.TextIsEqual(text1, text2)
  return lib.TextIsEqual(text1, text2)
end

--- Get text length, checks for '\0' ending
---@param text string
---@return unsigned int
function rl.TextLength(text)
  return lib.TextLength(text)
end

--- Text formatting with variables (sprintf() style)
---@param text string
---@param args ...
---@return const char *
function rl.TextFormat(text, args)
  return lib.TextFormat(text, args)
end

--- Get a piece of a text string
---@param text string
---@param position integer
---@param length integer
---@return const char *
function rl.TextSubtext(text, position, length)
  return lib.TextSubtext(text, position, length)
end

--- Replace text string (WARNING: memory must be freed!)
---@param text string
---@param replace string
---@param by string
---@return char *
function rl.TextReplace(text, replace, by)
  return lib.TextReplace(text, replace, by)
end

--- Insert text in a position (WARNING: memory must be freed!)
---@param text string
---@param insert string
---@param position integer
---@return char *
function rl.TextInsert(text, insert, position)
  return lib.TextInsert(text, insert, position)
end

--- Join text strings with delimiter
---@param textList string
---@param count integer
---@param delimiter string
---@return const char *
function rl.TextJoin(textList, count, delimiter)
  return lib.TextJoin(textList, count, delimiter)
end

--- Split text into multiple strings
---@param text string
---@param delimiter char
---@param count integer
---@return const char **
function rl.TextSplit(text, delimiter, count)
  return lib.TextSplit(text, delimiter, count)
end

--- Append text at specific position and move cursor!
---@param text string
---@param append string
---@param position integer
---@return void
function rl.TextAppend(text, append, position)
  return lib.TextAppend(text, append, position)
end

--- Find first text occurrence within a string
---@param text string
---@param find string
---@return int
function rl.TextFindIndex(text, find)
  return lib.TextFindIndex(text, find)
end

--- Get upper case version of provided string
---@param text string
---@return const char *
function rl.TextToUpper(text)
  return lib.TextToUpper(text)
end

--- Get lower case version of provided string
---@param text string
---@return const char *
function rl.TextToLower(text)
  return lib.TextToLower(text)
end

--- Get Pascal case notation version of provided string
---@param text string
---@return const char *
function rl.TextToPascal(text)
  return lib.TextToPascal(text)
end

--- Get integer value from text (negative values not supported)
---@param text string
---@return int
function rl.TextToInteger(text)
  return lib.TextToInteger(text)
end

--- Draw a line in 3D world space
---@param startPos Vector3
---@param endPos Vector3
---@param color Color
---@return void
function rl.DrawLine3D(startPos, endPos, color)
  return lib.DrawLine3D(startPos, endPos, color)
end

--- Draw a point in 3D space, actually a small line
---@param position Vector3
---@param color Color
---@return void
function rl.DrawPoint3D(position, color)
  return lib.DrawPoint3D(position, color)
end

--- Draw a circle in 3D world space
---@param center Vector3
---@param radius number
---@param rotationAxis Vector3
---@param rotationAngle number
---@param color Color
---@return void
function rl.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
  return lib.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
end

--- Draw a color-filled triangle (vertex in counter-clockwise order!)
---@param v1 Vector3
---@param v2 Vector3
---@param v3 Vector3
---@param color Color
---@return void
function rl.DrawTriangle3D(v1, v2, v3, color)
  return lib.DrawTriangle3D(v1, v2, v3, color)
end

--- Draw a triangle strip defined by points
---@param points Vector3 *
---@param pointCount integer
---@param color Color
---@return void
function rl.DrawTriangleStrip3D(points, pointCount, color)
  return lib.DrawTriangleStrip3D(points, pointCount, color)
end

--- Draw cube
---@param position Vector3
---@param width number
---@param height number
---@param length number
---@param color Color
---@return void
function rl.DrawCube(position, width, height, length, color)
  return lib.DrawCube(position, width, height, length, color)
end

--- Draw cube (Vector version)
---@param position Vector3
---@param size Vector3
---@param color Color
---@return void
function rl.DrawCubeV(position, size, color)
  return lib.DrawCubeV(position, size, color)
end

--- Draw cube wires
---@param position Vector3
---@param width number
---@param height number
---@param length number
---@param color Color
---@return void
function rl.DrawCubeWires(position, width, height, length, color)
  return lib.DrawCubeWires(position, width, height, length, color)
end

--- Draw cube wires (Vector version)
---@param position Vector3
---@param size Vector3
---@param color Color
---@return void
function rl.DrawCubeWiresV(position, size, color)
  return lib.DrawCubeWiresV(position, size, color)
end

--- Draw sphere
---@param centerPos Vector3
---@param radius number
---@param color Color
---@return void
function rl.DrawSphere(centerPos, radius, color)
  return lib.DrawSphere(centerPos, radius, color)
end

--- Draw sphere with extended parameters
---@param centerPos Vector3
---@param radius number
---@param rings integer
---@param slices integer
---@param color Color
---@return void
function rl.DrawSphereEx(centerPos, radius, rings, slices, color)
  return lib.DrawSphereEx(centerPos, radius, rings, slices, color)
end

--- Draw sphere wires
---@param centerPos Vector3
---@param radius number
---@param rings integer
---@param slices integer
---@param color Color
---@return void
function rl.DrawSphereWires(centerPos, radius, rings, slices, color)
  return lib.DrawSphereWires(centerPos, radius, rings, slices, color)
end

--- Draw a cylinder/cone
---@param position Vector3
---@param radiusTop number
---@param radiusBottom number
---@param height number
---@param slices integer
---@param color Color
---@return void
function rl.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
  return lib.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
end

--- Draw a cylinder with base at startPos and top at endPos
---@param startPos Vector3
---@param endPos Vector3
---@param startRadius number
---@param endRadius number
---@param sides integer
---@param color Color
---@return void
function rl.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color)
  return lib.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color)
end

--- Draw a cylinder/cone wires
---@param position Vector3
---@param radiusTop number
---@param radiusBottom number
---@param height number
---@param slices integer
---@param color Color
---@return void
function rl.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
  return lib.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
end

--- Draw a cylinder wires with base at startPos and top at endPos
---@param startPos Vector3
---@param endPos Vector3
---@param startRadius number
---@param endRadius number
---@param sides integer
---@param color Color
---@return void
function rl.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
  return lib.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
end

--- Draw a capsule with the center of its sphere caps at startPos and endPos
---@param startPos Vector3
---@param endPos Vector3
---@param radius number
---@param slices integer
---@param rings integer
---@param color Color
---@return void
function rl.DrawCapsule(startPos, endPos, radius, slices, rings, color)
  return lib.DrawCapsule(startPos, endPos, radius, slices, rings, color)
end

--- Draw capsule wireframe with the center of its sphere caps at startPos and endPos
---@param startPos Vector3
---@param endPos Vector3
---@param radius number
---@param slices integer
---@param rings integer
---@param color Color
---@return void
function rl.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color)
  return lib.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color)
end

--- Draw a plane XZ
---@param centerPos Vector3
---@param size Vector2
---@param color Color
---@return void
function rl.DrawPlane(centerPos, size, color)
  return lib.DrawPlane(centerPos, size, color)
end

--- Draw a ray line
---@param ray Ray
---@param color Color
---@return void
function rl.DrawRay(ray, color)
  return lib.DrawRay(ray, color)
end

--- Draw a grid (centered at (0, 0, 0))
---@param slices integer
---@param spacing number
---@return void
function rl.DrawGrid(slices, spacing)
  return lib.DrawGrid(slices, spacing)
end

--- Load model from files (meshes and materials)
---@param fileName string
---@return Model
function rl.LoadModel(fileName)
  return lib.LoadModel(fileName)
end

--- Load model from generated mesh (default material)
---@param mesh Mesh
---@return Model
function rl.LoadModelFromMesh(mesh)
  return lib.LoadModelFromMesh(mesh)
end

--- Check if a model is ready
---@param model Model
---@return bool
function rl.IsModelReady(model)
  return lib.IsModelReady(model)
end

--- Unload model (including meshes) from memory (RAM and/or VRAM)
---@param model Model
---@return void
function rl.UnloadModel(model)
  return lib.UnloadModel(model)
end

--- Compute model bounding box limits (considers all meshes)
---@param model Model
---@return BoundingBox
function rl.GetModelBoundingBox(model)
  return lib.GetModelBoundingBox(model)
end

--- Draw a model (with texture if set)
---@param model Model
---@param position Vector3
---@param scale number
---@param tint Color
---@return void
function rl.DrawModel(model, position, scale, tint)
  return lib.DrawModel(model, position, scale, tint)
end

--- Draw a model with extended parameters
---@param model Model
---@param position Vector3
---@param rotationAxis Vector3
---@param rotationAngle number
---@param scale Vector3
---@param tint Color
---@return void
function rl.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
  return lib.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
end

--- Draw a model wires (with texture if set)
---@param model Model
---@param position Vector3
---@param scale number
---@param tint Color
---@return void
function rl.DrawModelWires(model, position, scale, tint)
  return lib.DrawModelWires(model, position, scale, tint)
end

--- Draw a model wires (with texture if set) with extended parameters
---@param model Model
---@param position Vector3
---@param rotationAxis Vector3
---@param rotationAngle number
---@param scale Vector3
---@param tint Color
---@return void
function rl.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
  return lib.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
end

--- Draw bounding box (wires)
---@param box BoundingBox
---@param color Color
---@return void
function rl.DrawBoundingBox(box, color)
  return lib.DrawBoundingBox(box, color)
end

--- Draw a billboard texture
---@param camera Camera
---@param texture Texture2D
---@param position Vector3
---@param size number
---@param tint Color
---@return void
function rl.DrawBillboard(camera, texture, position, size, tint)
  return lib.DrawBillboard(camera, texture, position, size, tint)
end

--- Draw a billboard texture defined by source
---@param camera Camera
---@param texture Texture2D
---@param source Rectangle
---@param position Vector3
---@param size Vector2
---@param tint Color
---@return void
function rl.DrawBillboardRec(camera, texture, source, position, size, tint)
  return lib.DrawBillboardRec(camera, texture, source, position, size, tint)
end

--- Draw a billboard texture defined by source and rotation
---@param camera Camera
---@param texture Texture2D
---@param source Rectangle
---@param position Vector3
---@param up Vector3
---@param size Vector2
---@param origin Vector2
---@param rotation number
---@param tint Color
---@return void
function rl.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint)
  return lib.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint)
end

--- Upload mesh vertex data in GPU and provide VAO/VBO ids
---@param mesh Mesh *
---@param dynamic bool
---@return void
function rl.UploadMesh(mesh, dynamic)
  return lib.UploadMesh(mesh, dynamic)
end

--- Update mesh vertex data in GPU for a specific buffer index
---@param mesh Mesh
---@param index integer
---@param data const void *
---@param dataSize integer
---@param offset integer
---@return void
function rl.UpdateMeshBuffer(mesh, index, data, dataSize, offset)
  return lib.UpdateMeshBuffer(mesh, index, data, dataSize, offset)
end

--- Unload mesh data from CPU and GPU
---@param mesh Mesh
---@return void
function rl.UnloadMesh(mesh)
  return lib.UnloadMesh(mesh)
end

--- Draw a 3d mesh with material and transform
---@param mesh Mesh
---@param material Material
---@param transform Matrix
---@return void
function rl.DrawMesh(mesh, material, transform)
  return lib.DrawMesh(mesh, material, transform)
end

--- Draw multiple mesh instances with material and different transforms
---@param mesh Mesh
---@param material Material
---@param transforms const Matrix *
---@param instances integer
---@return void
function rl.DrawMeshInstanced(mesh, material, transforms, instances)
  return lib.DrawMeshInstanced(mesh, material, transforms, instances)
end

--- Export mesh data to file, returns true on success
---@param mesh Mesh
---@param fileName string
---@return bool
function rl.ExportMesh(mesh, fileName)
  return lib.ExportMesh(mesh, fileName)
end

--- Compute mesh bounding box limits
---@param mesh Mesh
---@return BoundingBox
function rl.GetMeshBoundingBox(mesh)
  return lib.GetMeshBoundingBox(mesh)
end

--- Compute mesh tangents
---@param mesh Mesh *
---@return void
function rl.GenMeshTangents(mesh)
  return lib.GenMeshTangents(mesh)
end

--- Generate polygonal mesh
---@param sides integer
---@param radius number
---@return Mesh
function rl.GenMeshPoly(sides, radius)
  return lib.GenMeshPoly(sides, radius)
end

--- Generate plane mesh (with subdivisions)
---@param width number
---@param length number
---@param resX integer
---@param resZ integer
---@return Mesh
function rl.GenMeshPlane(width, length, resX, resZ)
  return lib.GenMeshPlane(width, length, resX, resZ)
end

--- Generate cuboid mesh
---@param width number
---@param height number
---@param length number
---@return Mesh
function rl.GenMeshCube(width, height, length)
  return lib.GenMeshCube(width, height, length)
end

--- Generate sphere mesh (standard sphere)
---@param radius number
---@param rings integer
---@param slices integer
---@return Mesh
function rl.GenMeshSphere(radius, rings, slices)
  return lib.GenMeshSphere(radius, rings, slices)
end

--- Generate half-sphere mesh (no bottom cap)
---@param radius number
---@param rings integer
---@param slices integer
---@return Mesh
function rl.GenMeshHemiSphere(radius, rings, slices)
  return lib.GenMeshHemiSphere(radius, rings, slices)
end

--- Generate cylinder mesh
---@param radius number
---@param height number
---@param slices integer
---@return Mesh
function rl.GenMeshCylinder(radius, height, slices)
  return lib.GenMeshCylinder(radius, height, slices)
end

--- Generate cone/pyramid mesh
---@param radius number
---@param height number
---@param slices integer
---@return Mesh
function rl.GenMeshCone(radius, height, slices)
  return lib.GenMeshCone(radius, height, slices)
end

--- Generate torus mesh
---@param radius number
---@param size number
---@param radSeg integer
---@param sides integer
---@return Mesh
function rl.GenMeshTorus(radius, size, radSeg, sides)
  return lib.GenMeshTorus(radius, size, radSeg, sides)
end

--- Generate trefoil knot mesh
---@param radius number
---@param size number
---@param radSeg integer
---@param sides integer
---@return Mesh
function rl.GenMeshKnot(radius, size, radSeg, sides)
  return lib.GenMeshKnot(radius, size, radSeg, sides)
end

--- Generate heightmap mesh from image data
---@param heightmap Image
---@param size Vector3
---@return Mesh
function rl.GenMeshHeightmap(heightmap, size)
  return lib.GenMeshHeightmap(heightmap, size)
end

--- Generate cubes-based map mesh from image data
---@param cubicmap Image
---@param cubeSize Vector3
---@return Mesh
function rl.GenMeshCubicmap(cubicmap, cubeSize)
  return lib.GenMeshCubicmap(cubicmap, cubeSize)
end

--- Load materials from model file
---@param fileName string
---@param materialCount integer
---@return Material *
function rl.LoadMaterials(fileName, materialCount)
  return lib.LoadMaterials(fileName, materialCount)
end

--- Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
---@return Material
function rl.LoadMaterialDefault()
  return lib.LoadMaterialDefault()
end

--- Check if a material is ready
---@param material Material
---@return bool
function rl.IsMaterialReady(material)
  return lib.IsMaterialReady(material)
end

--- Unload material from GPU memory (VRAM)
---@param material Material
---@return void
function rl.UnloadMaterial(material)
  return lib.UnloadMaterial(material)
end

--- Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
---@param material Material *
---@param mapType integer
---@param texture Texture2D
---@return void
function rl.SetMaterialTexture(material, mapType, texture)
  return lib.SetMaterialTexture(material, mapType, texture)
end

--- Set material for a mesh
---@param model Model *
---@param meshId integer
---@param materialId integer
---@return void
function rl.SetModelMeshMaterial(model, meshId, materialId)
  return lib.SetModelMeshMaterial(model, meshId, materialId)
end

--- Load model animations from file
---@param fileName string
---@param animCount integer
---@return ModelAnimation *
function rl.LoadModelAnimations(fileName, animCount)
  return lib.LoadModelAnimations(fileName, animCount)
end

--- Update model animation pose
---@param model Model
---@param anim ModelAnimation
---@param frame integer
---@return void
function rl.UpdateModelAnimation(model, anim, frame)
  return lib.UpdateModelAnimation(model, anim, frame)
end

--- Unload animation data
---@param anim ModelAnimation
---@return void
function rl.UnloadModelAnimation(anim)
  return lib.UnloadModelAnimation(anim)
end

--- Unload animation array data
---@param animations ModelAnimation *
---@param animCount integer
---@return void
function rl.UnloadModelAnimations(animations, animCount)
  return lib.UnloadModelAnimations(animations, animCount)
end

--- Check model animation skeleton match
---@param model Model
---@param anim ModelAnimation
---@return bool
function rl.IsModelAnimationValid(model, anim)
  return lib.IsModelAnimationValid(model, anim)
end

--- Check collision between two spheres
---@param center1 Vector3
---@param radius1 number
---@param center2 Vector3
---@param radius2 number
---@return bool
function rl.CheckCollisionSpheres(center1, radius1, center2, radius2)
  return lib.CheckCollisionSpheres(center1, radius1, center2, radius2)
end

--- Check collision between two bounding boxes
---@param box1 BoundingBox
---@param box2 BoundingBox
---@return bool
function rl.CheckCollisionBoxes(box1, box2)
  return lib.CheckCollisionBoxes(box1, box2)
end

--- Check collision between box and sphere
---@param box BoundingBox
---@param center Vector3
---@param radius number
---@return bool
function rl.CheckCollisionBoxSphere(box, center, radius)
  return lib.CheckCollisionBoxSphere(box, center, radius)
end

--- Get collision info between ray and sphere
---@param ray Ray
---@param center Vector3
---@param radius number
---@return RayCollision
function rl.GetRayCollisionSphere(ray, center, radius)
  return lib.GetRayCollisionSphere(ray, center, radius)
end

--- Get collision info between ray and box
---@param ray Ray
---@param box BoundingBox
---@return RayCollision
function rl.GetRayCollisionBox(ray, box)
  return lib.GetRayCollisionBox(ray, box)
end

--- Get collision info between ray and mesh
---@param ray Ray
---@param mesh Mesh
---@param transform Matrix
---@return RayCollision
function rl.GetRayCollisionMesh(ray, mesh, transform)
  return lib.GetRayCollisionMesh(ray, mesh, transform)
end

--- Get collision info between ray and triangle
---@param ray Ray
---@param p1 Vector3
---@param p2 Vector3
---@param p3 Vector3
---@return RayCollision
function rl.GetRayCollisionTriangle(ray, p1, p2, p3)
  return lib.GetRayCollisionTriangle(ray, p1, p2, p3)
end

--- Get collision info between ray and quad
---@param ray Ray
---@param p1 Vector3
---@param p2 Vector3
---@param p3 Vector3
---@param p4 Vector3
---@return RayCollision
function rl.GetRayCollisionQuad(ray, p1, p2, p3, p4)
  return lib.GetRayCollisionQuad(ray, p1, p2, p3, p4)
end

--- Initialize audio device and context
---@return void
function rl.InitAudioDevice()
  return lib.InitAudioDevice()
end

--- Close the audio device and context
---@return void
function rl.CloseAudioDevice()
  return lib.CloseAudioDevice()
end

--- Check if audio device has been initialized successfully
---@return bool
function rl.IsAudioDeviceReady()
  return lib.IsAudioDeviceReady()
end

--- Set master volume (listener)
---@param volume number
---@return void
function rl.SetMasterVolume(volume)
  return lib.SetMasterVolume(volume)
end

--- Get master volume (listener)
---@return float
function rl.GetMasterVolume()
  return lib.GetMasterVolume()
end

--- Load wave data from file
---@param fileName string
---@return Wave
function rl.LoadWave(fileName)
  return lib.LoadWave(fileName)
end

--- Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
---@param fileType string
---@param fileData string
---@param dataSize integer
---@return Wave
function rl.LoadWaveFromMemory(fileType, fileData, dataSize)
  return lib.LoadWaveFromMemory(fileType, fileData, dataSize)
end

--- Checks if wave data is ready
---@param wave Wave
---@return bool
function rl.IsWaveReady(wave)
  return lib.IsWaveReady(wave)
end

--- Load sound from file
---@param fileName string
---@return Sound
function rl.LoadSound(fileName)
  return lib.LoadSound(fileName)
end

--- Load sound from wave data
---@param wave Wave
---@return Sound
function rl.LoadSoundFromWave(wave)
  return lib.LoadSoundFromWave(wave)
end

--- Create a new sound that shares the same sample data as the source sound, does not own the sound data
---@param source Sound
---@return Sound
function rl.LoadSoundAlias(source)
  return lib.LoadSoundAlias(source)
end

--- Checks if a sound is ready
---@param sound Sound
---@return bool
function rl.IsSoundReady(sound)
  return lib.IsSoundReady(sound)
end

--- Update sound buffer with new data
---@param sound Sound
---@param data const void *
---@param sampleCount integer
---@return void
function rl.UpdateSound(sound, data, sampleCount)
  return lib.UpdateSound(sound, data, sampleCount)
end

--- Unload wave data
---@param wave Wave
---@return void
function rl.UnloadWave(wave)
  return lib.UnloadWave(wave)
end

--- Unload sound
---@param sound Sound
---@return void
function rl.UnloadSound(sound)
  return lib.UnloadSound(sound)
end

--- Unload a sound alias (does not deallocate sample data)
---@param alias Sound
---@return void
function rl.UnloadSoundAlias(alias)
  return lib.UnloadSoundAlias(alias)
end

--- Export wave data to file, returns true on success
---@param wave Wave
---@param fileName string
---@return bool
function rl.ExportWave(wave, fileName)
  return lib.ExportWave(wave, fileName)
end

--- Export wave sample data to code (.h), returns true on success
---@param wave Wave
---@param fileName string
---@return bool
function rl.ExportWaveAsCode(wave, fileName)
  return lib.ExportWaveAsCode(wave, fileName)
end

--- Play a sound
---@param sound Sound
---@return void
function rl.PlaySound(sound)
  return lib.PlaySound(sound)
end

--- Stop playing a sound
---@param sound Sound
---@return void
function rl.StopSound(sound)
  return lib.StopSound(sound)
end

--- Pause a sound
---@param sound Sound
---@return void
function rl.PauseSound(sound)
  return lib.PauseSound(sound)
end

--- Resume a paused sound
---@param sound Sound
---@return void
function rl.ResumeSound(sound)
  return lib.ResumeSound(sound)
end

--- Check if a sound is currently playing
---@param sound Sound
---@return bool
function rl.IsSoundPlaying(sound)
  return lib.IsSoundPlaying(sound)
end

--- Set volume for a sound (1.0 is max level)
---@param sound Sound
---@param volume number
---@return void
function rl.SetSoundVolume(sound, volume)
  return lib.SetSoundVolume(sound, volume)
end

--- Set pitch for a sound (1.0 is base level)
---@param sound Sound
---@param pitch number
---@return void
function rl.SetSoundPitch(sound, pitch)
  return lib.SetSoundPitch(sound, pitch)
end

--- Set pan for a sound (0.5 is center)
---@param sound Sound
---@param pan number
---@return void
function rl.SetSoundPan(sound, pan)
  return lib.SetSoundPan(sound, pan)
end

--- Copy a wave to a new wave
---@param wave Wave
---@return Wave
function rl.WaveCopy(wave)
  return lib.WaveCopy(wave)
end

--- Crop a wave to defined samples range
---@param wave Wave *
---@param initSample integer
---@param finalSample integer
---@return void
function rl.WaveCrop(wave, initSample, finalSample)
  return lib.WaveCrop(wave, initSample, finalSample)
end

--- Convert wave data to desired format
---@param wave Wave *
---@param sampleRate integer
---@param sampleSize integer
---@param channels integer
---@return void
function rl.WaveFormat(wave, sampleRate, sampleSize, channels)
  return lib.WaveFormat(wave, sampleRate, sampleSize, channels)
end

--- Load samples data from wave as a 32bit float data array
---@param wave Wave
---@return float *
function rl.LoadWaveSamples(wave)
  return lib.LoadWaveSamples(wave)
end

--- Unload samples data loaded with LoadWaveSamples()
---@param samples number
---@return void
function rl.UnloadWaveSamples(samples)
  return lib.UnloadWaveSamples(samples)
end

--- Load music stream from file
---@param fileName string
---@return Music
function rl.LoadMusicStream(fileName)
  return lib.LoadMusicStream(fileName)
end

--- Load music stream from data
---@param fileType string
---@param data string
---@param dataSize integer
---@return Music
function rl.LoadMusicStreamFromMemory(fileType, data, dataSize)
  return lib.LoadMusicStreamFromMemory(fileType, data, dataSize)
end

--- Checks if a music stream is ready
---@param music Music
---@return bool
function rl.IsMusicReady(music)
  return lib.IsMusicReady(music)
end

--- Unload music stream
---@param music Music
---@return void
function rl.UnloadMusicStream(music)
  return lib.UnloadMusicStream(music)
end

--- Start music playing
---@param music Music
---@return void
function rl.PlayMusicStream(music)
  return lib.PlayMusicStream(music)
end

--- Check if music is playing
---@param music Music
---@return bool
function rl.IsMusicStreamPlaying(music)
  return lib.IsMusicStreamPlaying(music)
end

--- Updates buffers for music streaming
---@param music Music
---@return void
function rl.UpdateMusicStream(music)
  return lib.UpdateMusicStream(music)
end

--- Stop music playing
---@param music Music
---@return void
function rl.StopMusicStream(music)
  return lib.StopMusicStream(music)
end

--- Pause music playing
---@param music Music
---@return void
function rl.PauseMusicStream(music)
  return lib.PauseMusicStream(music)
end

--- Resume playing paused music
---@param music Music
---@return void
function rl.ResumeMusicStream(music)
  return lib.ResumeMusicStream(music)
end

--- Seek music to a position (in seconds)
---@param music Music
---@param position number
---@return void
function rl.SeekMusicStream(music, position)
  return lib.SeekMusicStream(music, position)
end

--- Set volume for music (1.0 is max level)
---@param music Music
---@param volume number
---@return void
function rl.SetMusicVolume(music, volume)
  return lib.SetMusicVolume(music, volume)
end

--- Set pitch for a music (1.0 is base level)
---@param music Music
---@param pitch number
---@return void
function rl.SetMusicPitch(music, pitch)
  return lib.SetMusicPitch(music, pitch)
end

--- Set pan for a music (0.5 is center)
---@param music Music
---@param pan number
---@return void
function rl.SetMusicPan(music, pan)
  return lib.SetMusicPan(music, pan)
end

--- Get music time length (in seconds)
---@param music Music
---@return float
function rl.GetMusicTimeLength(music)
  return lib.GetMusicTimeLength(music)
end

--- Get current music time played (in seconds)
---@param music Music
---@return float
function rl.GetMusicTimePlayed(music)
  return lib.GetMusicTimePlayed(music)
end

--- Load audio stream (to stream raw audio pcm data)
---@param sampleRate integer
---@param sampleSize integer
---@param channels integer
---@return AudioStream
function rl.LoadAudioStream(sampleRate, sampleSize, channels)
  return lib.LoadAudioStream(sampleRate, sampleSize, channels)
end

--- Checks if an audio stream is ready
---@param stream AudioStream
---@return bool
function rl.IsAudioStreamReady(stream)
  return lib.IsAudioStreamReady(stream)
end

--- Unload audio stream and free memory
---@param stream AudioStream
---@return void
function rl.UnloadAudioStream(stream)
  return lib.UnloadAudioStream(stream)
end

--- Update audio stream buffers with data
---@param stream AudioStream
---@param data const void *
---@param frameCount integer
---@return void
function rl.UpdateAudioStream(stream, data, frameCount)
  return lib.UpdateAudioStream(stream, data, frameCount)
end

--- Check if any audio stream buffers requires refill
---@param stream AudioStream
---@return bool
function rl.IsAudioStreamProcessed(stream)
  return lib.IsAudioStreamProcessed(stream)
end

--- Play audio stream
---@param stream AudioStream
---@return void
function rl.PlayAudioStream(stream)
  return lib.PlayAudioStream(stream)
end

--- Pause audio stream
---@param stream AudioStream
---@return void
function rl.PauseAudioStream(stream)
  return lib.PauseAudioStream(stream)
end

--- Resume audio stream
---@param stream AudioStream
---@return void
function rl.ResumeAudioStream(stream)
  return lib.ResumeAudioStream(stream)
end

--- Check if audio stream is playing
---@param stream AudioStream
---@return bool
function rl.IsAudioStreamPlaying(stream)
  return lib.IsAudioStreamPlaying(stream)
end

--- Stop audio stream
---@param stream AudioStream
---@return void
function rl.StopAudioStream(stream)
  return lib.StopAudioStream(stream)
end

--- Set volume for audio stream (1.0 is max level)
---@param stream AudioStream
---@param volume number
---@return void
function rl.SetAudioStreamVolume(stream, volume)
  return lib.SetAudioStreamVolume(stream, volume)
end

--- Set pitch for audio stream (1.0 is base level)
---@param stream AudioStream
---@param pitch number
---@return void
function rl.SetAudioStreamPitch(stream, pitch)
  return lib.SetAudioStreamPitch(stream, pitch)
end

--- Set pan for audio stream (0.5 is centered)
---@param stream AudioStream
---@param pan number
---@return void
function rl.SetAudioStreamPan(stream, pan)
  return lib.SetAudioStreamPan(stream, pan)
end

--- Default size for new audio streams
---@param size integer
---@return void
function rl.SetAudioStreamBufferSizeDefault(size)
  return lib.SetAudioStreamBufferSizeDefault(size)
end

--- Audio thread callback to request new data
---@param stream AudioStream
---@param callback AudioCallback
---@return void
function rl.SetAudioStreamCallback(stream, callback)
  return lib.SetAudioStreamCallback(stream, callback)
end

--- Attach audio stream processor to stream, receives the samples as <float>s
---@param stream AudioStream
---@param processor AudioCallback
---@return void
function rl.AttachAudioStreamProcessor(stream, processor)
  return lib.AttachAudioStreamProcessor(stream, processor)
end

--- Detach audio stream processor from stream
---@param stream AudioStream
---@param processor AudioCallback
---@return void
function rl.DetachAudioStreamProcessor(stream, processor)
  return lib.DetachAudioStreamProcessor(stream, processor)
end

--- Attach audio stream processor to the entire audio pipeline, receives the samples as <float>s
---@param processor AudioCallback
---@return void
function rl.AttachAudioMixedProcessor(processor)
  return lib.AttachAudioMixedProcessor(processor)
end

--- Detach audio stream processor from the entire audio pipeline
---@param processor AudioCallback
---@return void
function rl.DetachAudioMixedProcessor(processor)
  return lib.DetachAudioMixedProcessor(processor)
end

return rl
