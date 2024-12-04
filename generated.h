
// Vector2, 2 components
typedef struct Vector2 {
    float x;                // Vector x component
    float y;                // Vector y component
} Vector2;

// Vector3, 3 components
typedef struct Vector3 {
    float x;                // Vector x component
    float y;                // Vector y component
    float z;                // Vector z component
} Vector3;

// Vector4, 4 components
typedef struct Vector4 {
    float x;                // Vector x component
    float y;                // Vector y component
    float z;                // Vector z component
    float w;                // Vector w component
} Vector4;

// Quaternion, 4 components (Vector4 alias)
typedef Vector4 Quaternion;

// Matrix, 4x4 components, column major, OpenGL style, right-handed
typedef struct Matrix {
    float m0, m4, m8, m12;  // Matrix first row (4 components)
    float m1, m5, m9, m13;  // Matrix second row (4 components)
    float m2, m6, m10, m14; // Matrix third row (4 components)
    float m3, m7, m11, m15; // Matrix fourth row (4 components)
} Matrix;

// Color, 4 components, R8G8B8A8 (32bit)
typedef struct Color {
    unsigned char r;        // Color red value
    unsigned char g;        // Color green value
    unsigned char b;        // Color blue value
    unsigned char a;        // Color alpha value
} Color;

// Rectangle, 4 components
typedef struct Rectangle {
    float x;                // Rectangle top-left corner position x
    float y;                // Rectangle top-left corner position y
    float width;            // Rectangle width
    float height;           // Rectangle height
} Rectangle;

// Image, pixel data stored in CPU memory (RAM)
typedef struct Image {
    void *data;             // Image raw data
    int width;              // Image base width
    int height;             // Image base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Image;

// Texture, tex data stored in GPU memory (VRAM)
typedef struct Texture {
    unsigned int id;        // OpenGL texture id
    int width;              // Texture base width
    int height;             // Texture base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Texture;

// Texture2D, same as Texture
typedef Texture Texture2D;

// TextureCubemap, same as Texture
typedef Texture TextureCubemap;

// RenderTexture, fbo for texture rendering
typedef struct RenderTexture {
    unsigned int id;        // OpenGL framebuffer object id
    Texture texture;        // Color buffer attachment texture
    Texture depth;          // Depth buffer attachment texture
} RenderTexture;

// RenderTexture2D, same as RenderTexture
typedef RenderTexture RenderTexture2D;

// NPatchInfo, n-patch layout info
typedef struct NPatchInfo {
    Rectangle source;       // Texture source rectangle
    int left;               // Left border offset
    int top;                // Top border offset
    int right;              // Right border offset
    int bottom;             // Bottom border offset
    int layout;             // Layout of the n-patch: 3x3, 1x3 or 3x1
} NPatchInfo;

// GlyphInfo, font characters glyphs info
typedef struct GlyphInfo {
    int value;              // Character value (Unicode)
    int offsetX;            // Character offset X when drawing
    int offsetY;            // Character offset Y when drawing
    int advanceX;           // Character advance position X
    Image image;            // Character image data
} GlyphInfo;

// Font, font texture and GlyphInfo array data
typedef struct Font {
    int baseSize;           // Base size (default chars height)
    int glyphCount;         // Number of glyph characters
    int glyphPadding;       // Padding around the glyph characters
    Texture2D texture;      // Texture atlas containing the glyphs
    Rectangle *recs;        // Rectangles in texture for the glyphs
    GlyphInfo *glyphs;      // Glyphs info data
} Font;

// Camera, defines position/orientation in 3d space
typedef struct Camera3D {
    Vector3 position;       // Camera position
    Vector3 target;         // Camera target it looks-at
    Vector3 up;             // Camera up vector (rotation over its axis)
    float fovy;             // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
    int projection;         // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
} Camera3D;

typedef Camera3D Camera;    // Camera type fallback, defaults to Camera3D

// Camera2D, defines position/orientation in 2d space
typedef struct Camera2D {
    Vector2 offset;         // Camera offset (displacement from target)
    Vector2 target;         // Camera target (rotation and zoom origin)
    float rotation;         // Camera rotation in degrees
    float zoom;             // Camera zoom (scaling), should be 1.0f by default
} Camera2D;

// Mesh, vertex data and vao/vbo
typedef struct Mesh {
    int vertexCount;        // Number of vertices stored in arrays
    int triangleCount;      // Number of triangles stored (indexed or not)

    // Vertex attributes data
    float *vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    float *texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    float *texcoords2;      // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    float *normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    float *tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    unsigned char *colors;      // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    unsigned short *indices;    // Vertex indices (in case vertex data comes indexed)

    // Animation vertex data
    float *animVertices;    // Animated vertex positions (after bones transformations)
    float *animNormals;     // Animated normals (after bones transformations)
    unsigned char *boneIds; // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
    float *boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning)

    // OpenGL identifiers
    unsigned int vaoId;     // OpenGL Vertex Array Object id
    unsigned int *vboId;    // OpenGL Vertex Buffer Objects id (default vertex data)
} Mesh;

// Shader
typedef struct Shader {
    unsigned int id;        // Shader program id
    int *locs;              // Shader locations array (RL_MAX_SHADER_LOCATIONS)
} Shader;

// MaterialMap
typedef struct MaterialMap {
    Texture2D texture;      // Material map texture
    Color color;            // Material map color
    float value;            // Material map value
} MaterialMap;

// Material, includes shader and maps
typedef struct Material {
    Shader shader;          // Material shader
    MaterialMap *maps;      // Material maps array (MAX_MATERIAL_MAPS)
    float params[4];        // Material generic parameters (if required)
} Material;

// Transform, vertex transformation data
typedef struct Transform {
    Vector3 translation;    // Translation
    Quaternion rotation;    // Rotation
    Vector3 scale;          // Scale
} Transform;

// Bone, skeletal animation bone
typedef struct BoneInfo {
    char name[32];          // Bone name
    int parent;             // Bone parent
} BoneInfo;

// Model, meshes, materials and animation data
typedef struct Model {
    Matrix transform;       // Local transform matrix

    int meshCount;          // Number of meshes
    int materialCount;      // Number of materials
    Mesh *meshes;           // Meshes array
    Material *materials;    // Materials array
    int *meshMaterial;      // Mesh material number

    // Animation data
    int boneCount;          // Number of bones
    BoneInfo *bones;        // Bones information (skeleton)
    Transform *bindPose;    // Bones base transformation (pose)
} Model;

// ModelAnimation
typedef struct ModelAnimation {
    int boneCount;          // Number of bones
    int frameCount;         // Number of animation frames
    BoneInfo *bones;        // Bones information (skeleton)
    Transform **framePoses; // Poses array by frame
    char name[32];          // Animation name
} ModelAnimation;

// Ray, ray for raycasting
typedef struct Ray {
    Vector3 position;       // Ray position (origin)
    Vector3 direction;      // Ray direction
} Ray;

// RayCollision, ray hit information
typedef struct RayCollision {
    bool hit;               // Did the ray hit something?
    float distance;         // Distance to the nearest hit
    Vector3 point;          // Point of the nearest hit
    Vector3 normal;         // Surface normal of hit
} RayCollision;

// BoundingBox
typedef struct BoundingBox {
    Vector3 min;            // Minimum vertex box-corner
    Vector3 max;            // Maximum vertex box-corner
} BoundingBox;

// Wave, audio wave data
typedef struct Wave {
    unsigned int frameCount;    // Total number of frames (considering channels)
    unsigned int sampleRate;    // Frequency (samples per second)
    unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
    void *data;                 // Buffer data pointer
} Wave;

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
typedef struct rAudioBuffer rAudioBuffer;
typedef struct rAudioProcessor rAudioProcessor;

// AudioStream, custom audio stream
typedef struct AudioStream {
    rAudioBuffer *buffer;       // Pointer to internal data used by the audio system
    rAudioProcessor *processor; // Pointer to internal data processor, useful for audio effects

    unsigned int sampleRate;    // Frequency (samples per second)
    unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
} AudioStream;

// Sound
typedef struct Sound {
    AudioStream stream;         // Audio stream
    unsigned int frameCount;    // Total number of frames (considering channels)
} Sound;

// Music, audio stream, anything longer than ~10 seconds should be streamed
typedef struct Music {
    AudioStream stream;         // Audio stream
    unsigned int frameCount;    // Total number of frames (considering channels)
    bool looping;               // Music looping enable

    int ctxType;                // Type of music context (audio filetype)
    void *ctxData;              // Audio context data, depends on type
} Music;

// VrDeviceInfo, Head-Mounted-Display device parameters
typedef struct VrDeviceInfo {
    int hResolution;                // Horizontal resolution in pixels
    int vResolution;                // Vertical resolution in pixels
    float hScreenSize;              // Horizontal size in meters
    float vScreenSize;              // Vertical size in meters
    float vScreenCenter;            // Screen center in meters
    float eyeToScreenDistance;      // Distance between eye and display in meters
    float lensSeparationDistance;   // Lens separation distance in meters
    float interpupillaryDistance;   // IPD (distance between pupils) in meters
    float lensDistortionValues[4];  // Lens distortion constant parameters
    float chromaAbCorrection[4];    // Chromatic aberration correction parameters
} VrDeviceInfo;

// VrStereoConfig, VR stereo rendering configuration for simulator
typedef struct VrStereoConfig {
    Matrix projection[2];           // VR projection matrices (per eye)
    Matrix viewOffset[2];           // VR view offset matrices (per eye)
    float leftLensCenter[2];        // VR left lens center
    float rightLensCenter[2];       // VR right lens center
    float leftScreenCenter[2];      // VR left screen center
    float rightScreenCenter[2];     // VR right screen center
    float scale[2];                 // VR distortion scale
    float scaleIn[2];               // VR distortion scale in
} VrStereoConfig;

// File path list
typedef struct FilePathList {
    unsigned int capacity;          // Filepaths max entries
    unsigned int count;             // Filepaths entries count
    char **paths;                   // Filepaths entries
} FilePathList;

// Automation event
typedef struct AutomationEvent {
    unsigned int frame;             // Event frame
    unsigned int type;              // Event type (AutomationEventType)
    int params[4];                  // Event parameters (if required)
} AutomationEvent;

// Automation event list
typedef struct AutomationEventList {
    unsigned int capacity;          // Events max entries (MAX_AUTOMATION_EVENTS)
    unsigned int count;             // Events entries count
    AutomationEvent *events;        // Events entries
} AutomationEventList;

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
typedef enum {
    FLAG_VSYNC_HINT         = 0x00000040,   // Set to try enabling V-Sync on GPU
    FLAG_FULLSCREEN_MODE    = 0x00000002,   // Set to run program in fullscreen
    FLAG_WINDOW_RESIZABLE   = 0x00000004,   // Set to allow resizable window
    FLAG_WINDOW_UNDECORATED = 0x00000008,   // Set to disable window decoration (frame and buttons)
    FLAG_WINDOW_HIDDEN      = 0x00000080,   // Set to hide window
    FLAG_WINDOW_MINIMIZED   = 0x00000200,   // Set to minimize window (iconify)
    FLAG_WINDOW_MAXIMIZED   = 0x00000400,   // Set to maximize window (expanded to monitor)
    FLAG_WINDOW_UNFOCUSED   = 0x00000800,   // Set to window non focused
    FLAG_WINDOW_TOPMOST     = 0x00001000,   // Set to window always on top
    FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,   // Set to allow windows running while minimized
    FLAG_WINDOW_TRANSPARENT = 0x00000010,   // Set to allow transparent framebuffer
    FLAG_WINDOW_HIGHDPI     = 0x00002000,   // Set to support HighDPI
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000, // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
    FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, // Set to run program in borderless windowed mode
    FLAG_MSAA_4X_HINT       = 0x00000020,   // Set to try enabling MSAA 4X
    FLAG_INTERLACED_HINT    = 0x00010000    // Set to try enabling interlaced video format (for V3D)
} ConfigFlags;

// Trace log level
// NOTE: Organized by priority level
typedef enum {
    LOG_ALL = 0,        // Display all logs
    LOG_TRACE,          // Trace logging, intended for internal use only
    LOG_DEBUG,          // Debug logging, used for internal debugging, it should be disabled on release builds
    LOG_INFO,           // Info logging, used for program execution info
    LOG_WARNING,        // Warning logging, used on recoverable failures
    LOG_ERROR,          // Error logging, used on unrecoverable failures
    LOG_FATAL,          // Fatal logging, used to abort program: exit(EXIT_FAILURE)
    LOG_NONE            // Disable logging
} TraceLogLevel;

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining
// required keys for alternative layouts
typedef enum {
    KEY_NULL            = 0,        // Key: NULL, used for no key pressed
    // Alphanumeric keys
    KEY_APOSTROPHE      = 39,       // Key: '
    KEY_COMMA           = 44,       // Key: ,
    KEY_MINUS           = 45,       // Key: -
    KEY_PERIOD          = 46,       // Key: .
    KEY_SLASH           = 47,       // Key: /
    KEY_ZERO            = 48,       // Key: 0
    KEY_ONE             = 49,       // Key: 1
    KEY_TWO             = 50,       // Key: 2
    KEY_THREE           = 51,       // Key: 3
    KEY_FOUR            = 52,       // Key: 4
    KEY_FIVE            = 53,       // Key: 5
    KEY_SIX             = 54,       // Key: 6
    KEY_SEVEN           = 55,       // Key: 7
    KEY_EIGHT           = 56,       // Key: 8
    KEY_NINE            = 57,       // Key: 9
    KEY_SEMICOLON       = 59,       // Key: ;
    KEY_EQUAL           = 61,       // Key: =
    KEY_A               = 65,       // Key: A | a
    KEY_B               = 66,       // Key: B | b
    KEY_C               = 67,       // Key: C | c
    KEY_D               = 68,       // Key: D | d
    KEY_E               = 69,       // Key: E | e
    KEY_F               = 70,       // Key: F | f
    KEY_G               = 71,       // Key: G | g
    KEY_H               = 72,       // Key: H | h
    KEY_I               = 73,       // Key: I | i
    KEY_J               = 74,       // Key: J | j
    KEY_K               = 75,       // Key: K | k
    KEY_L               = 76,       // Key: L | l
    KEY_M               = 77,       // Key: M | m
    KEY_N               = 78,       // Key: N | n
    KEY_O               = 79,       // Key: O | o
    KEY_P               = 80,       // Key: P | p
    KEY_Q               = 81,       // Key: Q | q
    KEY_R               = 82,       // Key: R | r
    KEY_S               = 83,       // Key: S | s
    KEY_T               = 84,       // Key: T | t
    KEY_U               = 85,       // Key: U | u
    KEY_V               = 86,       // Key: V | v
    KEY_W               = 87,       // Key: W | w
    KEY_X               = 88,       // Key: X | x
    KEY_Y               = 89,       // Key: Y | y
    KEY_Z               = 90,       // Key: Z | z
    KEY_LEFT_BRACKET    = 91,       // Key: [
    KEY_BACKSLASH       = 92,       // Key: '\'
    KEY_RIGHT_BRACKET   = 93,       // Key: ]
    KEY_GRAVE           = 96,       // Key: `
    // Function keys
    KEY_SPACE           = 32,       // Key: Space
    KEY_ESCAPE          = 256,      // Key: Esc
    KEY_ENTER           = 257,      // Key: Enter
    KEY_TAB             = 258,      // Key: Tab
    KEY_BACKSPACE       = 259,      // Key: Backspace
    KEY_INSERT          = 260,      // Key: Ins
    KEY_DELETE          = 261,      // Key: Del
    KEY_RIGHT           = 262,      // Key: Cursor right
    KEY_LEFT            = 263,      // Key: Cursor left
    KEY_DOWN            = 264,      // Key: Cursor down
    KEY_UP              = 265,      // Key: Cursor up
    KEY_PAGE_UP         = 266,      // Key: Page up
    KEY_PAGE_DOWN       = 267,      // Key: Page down
    KEY_HOME            = 268,      // Key: Home
    KEY_END             = 269,      // Key: End
    KEY_CAPS_LOCK       = 280,      // Key: Caps lock
    KEY_SCROLL_LOCK     = 281,      // Key: Scroll down
    KEY_NUM_LOCK        = 282,      // Key: Num lock
    KEY_PRINT_SCREEN    = 283,      // Key: Print screen
    KEY_PAUSE           = 284,      // Key: Pause
    KEY_F1              = 290,      // Key: F1
    KEY_F2              = 291,      // Key: F2
    KEY_F3              = 292,      // Key: F3
    KEY_F4              = 293,      // Key: F4
    KEY_F5              = 294,      // Key: F5
    KEY_F6              = 295,      // Key: F6
    KEY_F7              = 296,      // Key: F7
    KEY_F8              = 297,      // Key: F8
    KEY_F9              = 298,      // Key: F9
    KEY_F10             = 299,      // Key: F10
    KEY_F11             = 300,      // Key: F11
    KEY_F12             = 301,      // Key: F12
    KEY_LEFT_SHIFT      = 340,      // Key: Shift left
    KEY_LEFT_CONTROL    = 341,      // Key: Control left
    KEY_LEFT_ALT        = 342,      // Key: Alt left
    KEY_LEFT_SUPER      = 343,      // Key: Super left
    KEY_RIGHT_SHIFT     = 344,      // Key: Shift right
    KEY_RIGHT_CONTROL   = 345,      // Key: Control right
    KEY_RIGHT_ALT       = 346,      // Key: Alt right
    KEY_RIGHT_SUPER     = 347,      // Key: Super right
    KEY_KB_MENU         = 348,      // Key: KB menu
    // Keypad keys
    KEY_KP_0            = 320,      // Key: Keypad 0
    KEY_KP_1            = 321,      // Key: Keypad 1
    KEY_KP_2            = 322,      // Key: Keypad 2
    KEY_KP_3            = 323,      // Key: Keypad 3
    KEY_KP_4            = 324,      // Key: Keypad 4
    KEY_KP_5            = 325,      // Key: Keypad 5
    KEY_KP_6            = 326,      // Key: Keypad 6
    KEY_KP_7            = 327,      // Key: Keypad 7
    KEY_KP_8            = 328,      // Key: Keypad 8
    KEY_KP_9            = 329,      // Key: Keypad 9
    KEY_KP_DECIMAL      = 330,      // Key: Keypad .
    KEY_KP_DIVIDE       = 331,      // Key: Keypad /
    KEY_KP_MULTIPLY     = 332,      // Key: Keypad *
    KEY_KP_SUBTRACT     = 333,      // Key: Keypad -
    KEY_KP_ADD          = 334,      // Key: Keypad +
    KEY_KP_ENTER        = 335,      // Key: Keypad Enter
    KEY_KP_EQUAL        = 336,      // Key: Keypad =
    // Android key buttons
    KEY_BACK            = 4,        // Key: Android back button
    KEY_MENU            = 82,       // Key: Android menu button
    KEY_VOLUME_UP       = 24,       // Key: Android volume up button
    KEY_VOLUME_DOWN     = 25        // Key: Android volume down button
} KeyboardKey;

// Mouse buttons
typedef enum {
    MOUSE_BUTTON_LEFT    = 0,       // Mouse button left
    MOUSE_BUTTON_RIGHT   = 1,       // Mouse button right
    MOUSE_BUTTON_MIDDLE  = 2,       // Mouse button middle (pressed wheel)
    MOUSE_BUTTON_SIDE    = 3,       // Mouse button side (advanced mouse device)
    MOUSE_BUTTON_EXTRA   = 4,       // Mouse button extra (advanced mouse device)
    MOUSE_BUTTON_FORWARD = 5,       // Mouse button forward (advanced mouse device)
    MOUSE_BUTTON_BACK    = 6,       // Mouse button back (advanced mouse device)
} MouseButton;

// Mouse cursor
typedef enum {
    MOUSE_CURSOR_DEFAULT       = 0,     // Default pointer shape
    MOUSE_CURSOR_ARROW         = 1,     // Arrow shape
    MOUSE_CURSOR_IBEAM         = 2,     // Text writing cursor shape
    MOUSE_CURSOR_CROSSHAIR     = 3,     // Cross shape
    MOUSE_CURSOR_POINTING_HAND = 4,     // Pointing hand cursor
    MOUSE_CURSOR_RESIZE_EW     = 5,     // Horizontal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NS     = 6,     // Vertical resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NWSE   = 7,     // Top-left to bottom-right diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NESW   = 8,     // The top-right to bottom-left diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_ALL    = 9,     // The omnidirectional resize/move cursor shape
    MOUSE_CURSOR_NOT_ALLOWED   = 10     // The operation-not-allowed shape
} MouseCursor;

// Gamepad buttons
typedef enum {
    GAMEPAD_BUTTON_UNKNOWN = 0,         // Unknown button, just for error checking
    GAMEPAD_BUTTON_LEFT_FACE_UP,        // Gamepad left DPAD up button
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT,     // Gamepad left DPAD right button
    GAMEPAD_BUTTON_LEFT_FACE_DOWN,      // Gamepad left DPAD down button
    GAMEPAD_BUTTON_LEFT_FACE_LEFT,      // Gamepad left DPAD left button
    GAMEPAD_BUTTON_RIGHT_FACE_UP,       // Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,    // Gamepad right button right (i.e. PS3: Square, Xbox: X)
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN,     // Gamepad right button down (i.e. PS3: Cross, Xbox: A)
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT,     // Gamepad right button left (i.e. PS3: Circle, Xbox: B)
    GAMEPAD_BUTTON_LEFT_TRIGGER_1,      // Gamepad top/back trigger left (first), it could be a trailing button
    GAMEPAD_BUTTON_LEFT_TRIGGER_2,      // Gamepad top/back trigger left (second), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1,     // Gamepad top/back trigger right (one), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2,     // Gamepad top/back trigger right (second), it could be a trailing button
    GAMEPAD_BUTTON_MIDDLE_LEFT,         // Gamepad center buttons, left one (i.e. PS3: Select)
    GAMEPAD_BUTTON_MIDDLE,              // Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
    GAMEPAD_BUTTON_MIDDLE_RIGHT,        // Gamepad center buttons, right one (i.e. PS3: Start)
    GAMEPAD_BUTTON_LEFT_THUMB,          // Gamepad joystick pressed button left
    GAMEPAD_BUTTON_RIGHT_THUMB          // Gamepad joystick pressed button right
} GamepadButton;

// Gamepad axis
typedef enum {
    GAMEPAD_AXIS_LEFT_X        = 0,     // Gamepad left stick X axis
    GAMEPAD_AXIS_LEFT_Y        = 1,     // Gamepad left stick Y axis
    GAMEPAD_AXIS_RIGHT_X       = 2,     // Gamepad right stick X axis
    GAMEPAD_AXIS_RIGHT_Y       = 3,     // Gamepad right stick Y axis
    GAMEPAD_AXIS_LEFT_TRIGGER  = 4,     // Gamepad back trigger left, pressure level: [1..-1]
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5      // Gamepad back trigger right, pressure level: [1..-1]
} GamepadAxis;

// Material map index
typedef enum {
    MATERIAL_MAP_ALBEDO = 0,        // Albedo material (same as: MATERIAL_MAP_DIFFUSE)
    MATERIAL_MAP_METALNESS,         // Metalness material (same as: MATERIAL_MAP_SPECULAR)
    MATERIAL_MAP_NORMAL,            // Normal material
    MATERIAL_MAP_ROUGHNESS,         // Roughness material
    MATERIAL_MAP_OCCLUSION,         // Ambient occlusion material
    MATERIAL_MAP_EMISSION,          // Emission material
    MATERIAL_MAP_HEIGHT,            // Heightmap material
    MATERIAL_MAP_CUBEMAP,           // Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_IRRADIANCE,        // Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_PREFILTER,         // Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_BRDF               // Brdf material
} MaterialMapIndex;

// Shader location index
typedef enum {
    SHADER_LOC_VERTEX_POSITION = 0, // Shader location: vertex attribute: position
    SHADER_LOC_VERTEX_TEXCOORD01,   // Shader location: vertex attribute: texcoord01
    SHADER_LOC_VERTEX_TEXCOORD02,   // Shader location: vertex attribute: texcoord02
    SHADER_LOC_VERTEX_NORMAL,       // Shader location: vertex attribute: normal
    SHADER_LOC_VERTEX_TANGENT,      // Shader location: vertex attribute: tangent
    SHADER_LOC_VERTEX_COLOR,        // Shader location: vertex attribute: color
    SHADER_LOC_MATRIX_MVP,          // Shader location: matrix uniform: model-view-projection
    SHADER_LOC_MATRIX_VIEW,         // Shader location: matrix uniform: view (camera transform)
    SHADER_LOC_MATRIX_PROJECTION,   // Shader location: matrix uniform: projection
    SHADER_LOC_MATRIX_MODEL,        // Shader location: matrix uniform: model (transform)
    SHADER_LOC_MATRIX_NORMAL,       // Shader location: matrix uniform: normal
    SHADER_LOC_VECTOR_VIEW,         // Shader location: vector uniform: view
    SHADER_LOC_COLOR_DIFFUSE,       // Shader location: vector uniform: diffuse color
    SHADER_LOC_COLOR_SPECULAR,      // Shader location: vector uniform: specular color
    SHADER_LOC_COLOR_AMBIENT,       // Shader location: vector uniform: ambient color
    SHADER_LOC_MAP_ALBEDO,          // Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
    SHADER_LOC_MAP_METALNESS,       // Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
    SHADER_LOC_MAP_NORMAL,          // Shader location: sampler2d texture: normal
    SHADER_LOC_MAP_ROUGHNESS,       // Shader location: sampler2d texture: roughness
    SHADER_LOC_MAP_OCCLUSION,       // Shader location: sampler2d texture: occlusion
    SHADER_LOC_MAP_EMISSION,        // Shader location: sampler2d texture: emission
    SHADER_LOC_MAP_HEIGHT,          // Shader location: sampler2d texture: height
    SHADER_LOC_MAP_CUBEMAP,         // Shader location: samplerCube texture: cubemap
    SHADER_LOC_MAP_IRRADIANCE,      // Shader location: samplerCube texture: irradiance
    SHADER_LOC_MAP_PREFILTER,       // Shader location: samplerCube texture: prefilter
    SHADER_LOC_MAP_BRDF             // Shader location: sampler2d texture: brdf
} ShaderLocationIndex;

// Shader uniform data type
typedef enum {
    SHADER_UNIFORM_FLOAT = 0,       // Shader uniform type: float
    SHADER_UNIFORM_VEC2,            // Shader uniform type: vec2 (2 float)
    SHADER_UNIFORM_VEC3,            // Shader uniform type: vec3 (3 float)
    SHADER_UNIFORM_VEC4,            // Shader uniform type: vec4 (4 float)
    SHADER_UNIFORM_INT,             // Shader uniform type: int
    SHADER_UNIFORM_IVEC2,           // Shader uniform type: ivec2 (2 int)
    SHADER_UNIFORM_IVEC3,           // Shader uniform type: ivec3 (3 int)
    SHADER_UNIFORM_IVEC4,           // Shader uniform type: ivec4 (4 int)
    SHADER_UNIFORM_SAMPLER2D        // Shader uniform type: sampler2d
} ShaderUniformDataType;

// Shader attribute data types
typedef enum {
    SHADER_ATTRIB_FLOAT = 0,        // Shader attribute type: float
    SHADER_ATTRIB_VEC2,             // Shader attribute type: vec2 (2 float)
    SHADER_ATTRIB_VEC3,             // Shader attribute type: vec3 (3 float)
    SHADER_ATTRIB_VEC4              // Shader attribute type: vec4 (4 float)
} ShaderAttributeDataType;

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
typedef enum {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1, // 8 bit per pixel (no alpha)
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,    // 8*2 bpp (2 channels)
    PIXELFORMAT_UNCOMPRESSED_R5G6B5,        // 16 bpp
    PIXELFORMAT_UNCOMPRESSED_R8G8B8,        // 24 bpp
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,      // 16 bpp (1 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,      // 16 bpp (4 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,      // 32 bpp
    PIXELFORMAT_UNCOMPRESSED_R32,           // 32 bpp (1 channel - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32,     // 32*3 bpp (3 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,  // 32*4 bpp (4 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R16,           // 16 bpp (1 channel - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16,     // 16*3 bpp (3 channels - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16,  // 16*4 bpp (4 channels - half float)
    PIXELFORMAT_COMPRESSED_DXT1_RGB,        // 4 bpp (no alpha)
    PIXELFORMAT_COMPRESSED_DXT1_RGBA,       // 4 bpp (1 bit alpha)
    PIXELFORMAT_COMPRESSED_DXT3_RGBA,       // 8 bpp
    PIXELFORMAT_COMPRESSED_DXT5_RGBA,       // 8 bpp
    PIXELFORMAT_COMPRESSED_ETC1_RGB,        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_RGB,        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,   // 8 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGB,        // 4 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGBA,       // 4 bpp
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,   // 8 bpp
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA    // 2 bpp
} PixelFormat;

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
typedef enum {
    TEXTURE_FILTER_POINT = 0,               // No filter, just pixel approximation
    TEXTURE_FILTER_BILINEAR,                // Linear filtering
    TEXTURE_FILTER_TRILINEAR,               // Trilinear filtering (linear with mipmaps)
    TEXTURE_FILTER_ANISOTROPIC_4X,          // Anisotropic filtering 4x
    TEXTURE_FILTER_ANISOTROPIC_8X,          // Anisotropic filtering 8x
    TEXTURE_FILTER_ANISOTROPIC_16X,         // Anisotropic filtering 16x
} TextureFilter;

// Texture parameters: wrap mode
typedef enum {
    TEXTURE_WRAP_REPEAT = 0,                // Repeats texture in tiled mode
    TEXTURE_WRAP_CLAMP,                     // Clamps texture to edge pixel in tiled mode
    TEXTURE_WRAP_MIRROR_REPEAT,             // Mirrors and repeats the texture in tiled mode
    TEXTURE_WRAP_MIRROR_CLAMP               // Mirrors and clamps to border the texture in tiled mode
} TextureWrap;

// Cubemap layouts
typedef enum {
    CUBEMAP_LAYOUT_AUTO_DETECT = 0,         // Automatically detect layout type
    CUBEMAP_LAYOUT_LINE_VERTICAL,           // Layout is defined by a vertical line with faces
    CUBEMAP_LAYOUT_LINE_HORIZONTAL,         // Layout is defined by a horizontal line with faces
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,     // Layout is defined by a 3x4 cross with cubemap faces
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE,     // Layout is defined by a 4x3 cross with cubemap faces
    CUBEMAP_LAYOUT_PANORAMA                 // Layout is defined by a panorama image (equirrectangular map)
} CubemapLayout;

// Font type, defines generation method
typedef enum {
    FONT_DEFAULT = 0,               // Default font generation, anti-aliased
    FONT_BITMAP,                    // Bitmap font generation, no anti-aliasing
    FONT_SDF                        // SDF font generation, requires external shader
} FontType;

// Color blending modes (pre-defined)
typedef enum {
    BLEND_ALPHA = 0,                // Blend textures considering alpha (default)
    BLEND_ADDITIVE,                 // Blend textures adding colors
    BLEND_MULTIPLIED,               // Blend textures multiplying colors
    BLEND_ADD_COLORS,               // Blend textures adding colors (alternative)
    BLEND_SUBTRACT_COLORS,          // Blend textures subtracting colors (alternative)
    BLEND_ALPHA_PREMULTIPLY,        // Blend premultiplied textures considering alpha
    BLEND_CUSTOM,                   // Blend textures using custom src/dst factors (use rlSetBlendFactors())
    BLEND_CUSTOM_SEPARATE           // Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
} BlendMode;

// Gesture
// NOTE: Provided as bit-wise flags to enable only desired gestures
typedef enum {
    GESTURE_NONE        = 0,        // No gesture
    GESTURE_TAP         = 1,        // Tap gesture
    GESTURE_DOUBLETAP   = 2,        // Double tap gesture
    GESTURE_HOLD        = 4,        // Hold gesture
    GESTURE_DRAG        = 8,        // Drag gesture
    GESTURE_SWIPE_RIGHT = 16,       // Swipe right gesture
    GESTURE_SWIPE_LEFT  = 32,       // Swipe left gesture
    GESTURE_SWIPE_UP    = 64,       // Swipe up gesture
    GESTURE_SWIPE_DOWN  = 128,      // Swipe down gesture
    GESTURE_PINCH_IN    = 256,      // Pinch in gesture
    GESTURE_PINCH_OUT   = 512       // Pinch out gesture
} Gesture;

// Camera system modes
typedef enum {
    CAMERA_CUSTOM = 0,              // Custom camera
    CAMERA_FREE,                    // Free camera
    CAMERA_ORBITAL,                 // Orbital camera
    CAMERA_FIRST_PERSON,            // First person camera
    CAMERA_THIRD_PERSON             // Third person camera
} CameraMode;

// Camera projection
typedef enum {
    CAMERA_PERSPECTIVE = 0,         // Perspective projection
    CAMERA_ORTHOGRAPHIC             // Orthographic projection
} CameraProjection;

// N-patch layout
typedef enum {
    NPATCH_NINE_PATCH = 0,          // Npatch layout: 3x3 tiles
    NPATCH_THREE_PATCH_VERTICAL,    // Npatch layout: 1x3 tiles
    NPATCH_THREE_PATCH_HORIZONTAL   // Npatch layout: 3x1 tiles
} NPatchLayout;

void InitWindow(int, int, const char *);
void CloseWindow(void);
bool WindowShouldClose(void);
bool IsWindowReady(void);
bool IsWindowFullscreen(void);
bool IsWindowHidden(void);
bool IsWindowMinimized(void);
bool IsWindowMaximized(void);
bool IsWindowFocused(void);
bool IsWindowResized(void);
bool IsWindowState(unsigned int);
void SetWindowState(unsigned int);
void ClearWindowState(unsigned int);
void ToggleFullscreen(void);
void ToggleBorderlessWindowed(void);
void MaximizeWindow(void);
void MinimizeWindow(void);
void RestoreWindow(void);
void SetWindowIcon(struct Image);
void SetWindowIcons(struct Image *, int);
void SetWindowTitle(const char *);
void SetWindowPosition(int, int);
void SetWindowMonitor(int);
void SetWindowMinSize(int, int);
void SetWindowMaxSize(int, int);
void SetWindowSize(int, int);
void SetWindowOpacity(float);
void SetWindowFocused(void);
void *GetWindowHandle(void);
int GetScreenWidth(void);
int GetScreenHeight(void);
int GetRenderWidth(void);
int GetRenderHeight(void);
int GetMonitorCount(void);
int GetCurrentMonitor(void);
struct Vector2 GetMonitorPosition(int);
int GetMonitorWidth(int);
int GetMonitorHeight(int);
int GetMonitorPhysicalWidth(int);
int GetMonitorPhysicalHeight(int);
int GetMonitorRefreshRate(int);
struct Vector2 GetWindowPosition(void);
struct Vector2 GetWindowScaleDPI(void);
const char *GetMonitorName(int);
void SetClipboardText(const char *);
const char *GetClipboardText(void);
void EnableEventWaiting(void);
void DisableEventWaiting(void);
void ShowCursor(void);
void HideCursor(void);
bool IsCursorHidden(void);
void EnableCursor(void);
void DisableCursor(void);
bool IsCursorOnScreen(void);
void ClearBackground(struct Color);
void BeginDrawing(void);
void EndDrawing(void);
void BeginMode2D(struct Camera2D);
void EndMode2D(void);
void BeginMode3D(struct Camera3D);
void EndMode3D(void);
void BeginTextureMode(struct RenderTexture);
void EndTextureMode(void);
void BeginShaderMode(struct Shader);
void EndShaderMode(void);
void BeginBlendMode(int);
void EndBlendMode(void);
void BeginScissorMode(int, int, int, int);
void EndScissorMode(void);
void BeginVrStereoMode(struct VrStereoConfig);
void EndVrStereoMode(void);
struct VrStereoConfig LoadVrStereoConfig(struct VrDeviceInfo);
void UnloadVrStereoConfig(struct VrStereoConfig);
struct Shader LoadShader(const char *, const char *);
struct Shader LoadShaderFromMemory(const char *, const char *);
bool IsShaderReady(struct Shader);
int GetShaderLocation(struct Shader, const char *);
int GetShaderLocationAttrib(struct Shader, const char *);
void SetShaderValue(struct Shader, int, const void *, int);
void SetShaderValueV(struct Shader, int, const void *, int, int);
void SetShaderValueMatrix(struct Shader, int, struct Matrix);
void SetShaderValueTexture(struct Shader, int, struct Texture);
void UnloadShader(struct Shader);
struct Ray GetMouseRay(struct Vector2, struct Camera3D);
struct Matrix GetCameraMatrix(struct Camera3D);
struct Matrix GetCameraMatrix2D(struct Camera2D);
struct Vector2 GetWorldToScreen(struct Vector3, struct Camera3D);
struct Vector2 GetScreenToWorld2D(struct Vector2, struct Camera2D);
struct Vector2 GetWorldToScreenEx(struct Vector3, struct Camera3D, int, int);
struct Vector2 GetWorldToScreen2D(struct Vector2, struct Camera2D);
void SetTargetFPS(int);
float GetFrameTime(void);
double GetTime(void);
int GetFPS(void);
void SwapScreenBuffer(void);
void PollInputEvents(void);
void WaitTime(double);
void SetRandomSeed(unsigned int);
int GetRandomValue(int, int);
int *LoadRandomSequence(unsigned int, int, int);
void UnloadRandomSequence(int *);
void TakeScreenshot(const char *);
void SetConfigFlags(unsigned int);
void OpenURL(const char *);
void TraceLog(int, const char *, ...);
void SetTraceLogLevel(int);
void *MemAlloc(unsigned int);
void *MemRealloc(void *, unsigned int);
void MemFree(void *);
unsigned char *LoadFileData(const char *, int *);
void UnloadFileData(unsigned char *);
bool SaveFileData(const char *, void *, int);
bool ExportDataAsCode(const unsigned char *, int, const char *);
const char *LoadFileText(const char *);
void UnloadFileText(const char *);
bool SaveFileText(const char *, const char *);
bool FileExists(const char *);
bool DirectoryExists(const char *);
bool IsFileExtension(const char *, const char *);
int GetFileLength(const char *);
const char *GetFileExtension(const char *);
const char *GetFileName(const char *);
const char *GetFileNameWithoutExt(const char *);
const char *GetDirectoryPath(const char *);
const char *GetPrevDirectoryPath(const char *);
const char *GetWorkingDirectory(void);
const char *GetApplicationDirectory(void);
bool ChangeDirectory(const char *);
bool IsPathFile(const char *);
struct FilePathList LoadDirectoryFiles(const char *);
struct FilePathList LoadDirectoryFilesEx(const char *, const char *, bool);
void UnloadDirectoryFiles(struct FilePathList);
bool IsFileDropped(void);
struct FilePathList LoadDroppedFiles(void);
void UnloadDroppedFiles(struct FilePathList);
long GetFileModTime(const char *);
unsigned char *CompressData(const unsigned char *, int, int *);
unsigned char *DecompressData(const unsigned char *, int, int *);
const char *EncodeDataBase64(const unsigned char *, int, int *);
unsigned char *DecodeDataBase64(const unsigned char *, int *);
struct AutomationEventList LoadAutomationEventList(const char *);
void UnloadAutomationEventList(struct AutomationEventList *);
bool ExportAutomationEventList(struct AutomationEventList, const char *);
void SetAutomationEventList(struct AutomationEventList *);
void SetAutomationEventBaseFrame(int);
void StartAutomationEventRecording(void);
void StopAutomationEventRecording(void);
void PlayAutomationEvent(struct AutomationEvent);
bool IsKeyPressed(int);
bool IsKeyPressedRepeat(int);
bool IsKeyDown(int);
bool IsKeyReleased(int);
bool IsKeyUp(int);
int GetKeyPressed(void);
int GetCharPressed(void);
void SetExitKey(int);
bool IsGamepadAvailable(int);
const char *GetGamepadName(int);
bool IsGamepadButtonPressed(int, int);
bool IsGamepadButtonDown(int, int);
bool IsGamepadButtonReleased(int, int);
bool IsGamepadButtonUp(int, int);
int GetGamepadButtonPressed(void);
int GetGamepadAxisCount(int);
float GetGamepadAxisMovement(int, int);
int SetGamepadMappings(const char *);
bool IsMouseButtonPressed(int);
bool IsMouseButtonDown(int);
bool IsMouseButtonReleased(int);
bool IsMouseButtonUp(int);
int GetMouseX(void);
int GetMouseY(void);
struct Vector2 GetMousePosition(void);
struct Vector2 GetMouseDelta(void);
void SetMousePosition(int, int);
void SetMouseOffset(int, int);
void SetMouseScale(float, float);
float GetMouseWheelMove(void);
struct Vector2 GetMouseWheelMoveV(void);
void SetMouseCursor(int);
int GetTouchX(void);
int GetTouchY(void);
struct Vector2 GetTouchPosition(int);
int GetTouchPointId(int);
int GetTouchPointCount(void);
void SetGesturesEnabled(unsigned int);
bool IsGestureDetected(unsigned int);
int GetGestureDetected(void);
float GetGestureHoldDuration(void);
struct Vector2 GetGestureDragVector(void);
float GetGestureDragAngle(void);
struct Vector2 GetGesturePinchVector(void);
float GetGesturePinchAngle(void);
void UpdateCamera(struct Camera3D *, int);
void UpdateCameraPro(struct Camera3D *, struct Vector3, struct Vector3, float);
void SetShapesTexture(struct Texture, struct Rectangle);
void DrawPixel(int, int, struct Color);
void DrawPixelV(struct Vector2, struct Color);
void DrawLine(int, int, int, int, struct Color);
void DrawLineV(struct Vector2, struct Vector2, struct Color);
void DrawLineEx(struct Vector2, struct Vector2, float, struct Color);
void DrawLineStrip(struct Vector2 *, int, struct Color);
void DrawLineBezier(struct Vector2, struct Vector2, float, struct Color);
void DrawCircle(int, int, float, struct Color);
void DrawCircleSector(struct Vector2, float, float, float, int, struct Color);
void DrawCircleSectorLines(struct Vector2, float, float, float, int, struct Color);
void DrawCircleGradient(int, int, float, struct Color, struct Color);
void DrawCircleV(struct Vector2, float, struct Color);
void DrawCircleLines(int, int, float, struct Color);
void DrawCircleLinesV(struct Vector2, float, struct Color);
void DrawEllipse(int, int, float, float, struct Color);
void DrawEllipseLines(int, int, float, float, struct Color);
void DrawRing(struct Vector2, float, float, float, float, int, struct Color);
void DrawRingLines(struct Vector2, float, float, float, float, int, struct Color);
void DrawRectangle(int, int, int, int, struct Color);
void DrawRectangleV(struct Vector2, struct Vector2, struct Color);
void DrawRectangleRec(struct Rectangle, struct Color);
void DrawRectanglePro(struct Rectangle, struct Vector2, float, struct Color);
void DrawRectangleGradientV(int, int, int, int, struct Color, struct Color);
void DrawRectangleGradientH(int, int, int, int, struct Color, struct Color);
void DrawRectangleGradientEx(struct Rectangle, struct Color, struct Color, struct Color, struct Color);
void DrawRectangleLines(int, int, int, int, struct Color);
void DrawRectangleLinesEx(struct Rectangle, float, struct Color);
void DrawRectangleRounded(struct Rectangle, float, int, struct Color);
void DrawRectangleRoundedLines(struct Rectangle, float, int, float, struct Color);
void DrawTriangle(struct Vector2, struct Vector2, struct Vector2, struct Color);
void DrawTriangleLines(struct Vector2, struct Vector2, struct Vector2, struct Color);
void DrawTriangleFan(struct Vector2 *, int, struct Color);
void DrawTriangleStrip(struct Vector2 *, int, struct Color);
void DrawPoly(struct Vector2, int, float, float, struct Color);
void DrawPolyLines(struct Vector2, int, float, float, struct Color);
void DrawPolyLinesEx(struct Vector2, int, float, float, float, struct Color);
void DrawSplineLinear(struct Vector2 *, int, float, struct Color);
void DrawSplineBasis(struct Vector2 *, int, float, struct Color);
void DrawSplineCatmullRom(struct Vector2 *, int, float, struct Color);
void DrawSplineBezierQuadratic(struct Vector2 *, int, float, struct Color);
void DrawSplineBezierCubic(struct Vector2 *, int, float, struct Color);
void DrawSplineSegmentLinear(struct Vector2, struct Vector2, float, struct Color);
void DrawSplineSegmentBasis(struct Vector2, struct Vector2, struct Vector2, struct Vector2, float, struct Color);
void DrawSplineSegmentCatmullRom(struct Vector2, struct Vector2, struct Vector2, struct Vector2, float, struct Color);
void DrawSplineSegmentBezierQuadratic(struct Vector2, struct Vector2, struct Vector2, float, struct Color);
void DrawSplineSegmentBezierCubic(struct Vector2, struct Vector2, struct Vector2, struct Vector2, float, struct Color);
struct Vector2 GetSplinePointLinear(struct Vector2, struct Vector2, float);
struct Vector2 GetSplinePointBasis(struct Vector2, struct Vector2, struct Vector2, struct Vector2, float);
struct Vector2 GetSplinePointCatmullRom(struct Vector2, struct Vector2, struct Vector2, struct Vector2, float);
struct Vector2 GetSplinePointBezierQuad(struct Vector2, struct Vector2, struct Vector2, float);
struct Vector2 GetSplinePointBezierCubic(struct Vector2, struct Vector2, struct Vector2, struct Vector2, float);
bool CheckCollisionRecs(struct Rectangle, struct Rectangle);
bool CheckCollisionCircles(struct Vector2, float, struct Vector2, float);
bool CheckCollisionCircleRec(struct Vector2, float, struct Rectangle);
bool CheckCollisionPointRec(struct Vector2, struct Rectangle);
bool CheckCollisionPointCircle(struct Vector2, struct Vector2, float);
bool CheckCollisionPointTriangle(struct Vector2, struct Vector2, struct Vector2, struct Vector2);
bool CheckCollisionPointPoly(struct Vector2, struct Vector2 *, int);
bool CheckCollisionLines(struct Vector2, struct Vector2, struct Vector2, struct Vector2, struct Vector2 *);
bool CheckCollisionPointLine(struct Vector2, struct Vector2, struct Vector2, int);
struct Rectangle GetCollisionRec(struct Rectangle, struct Rectangle);
struct Image LoadImage(const char *);
struct Image LoadImageRaw(const char *, int, int, int, int);
struct Image LoadImageSvg(const char *, int, int);
struct Image LoadImageAnim(const char *, int *);
struct Image LoadImageFromMemory(const char *, const unsigned char *, int);
struct Image LoadImageFromTexture(struct Texture);
struct Image LoadImageFromScreen(void);
bool IsImageReady(struct Image);
void UnloadImage(struct Image);
bool ExportImage(struct Image, const char *);
unsigned char *ExportImageToMemory(struct Image, const char *, int *);
bool ExportImageAsCode(struct Image, const char *);
struct Image GenImageColor(int, int, struct Color);
struct Image GenImageGradientLinear(int, int, int, struct Color, struct Color);
struct Image GenImageGradientRadial(int, int, float, struct Color, struct Color);
struct Image GenImageGradientSquare(int, int, float, struct Color, struct Color);
struct Image GenImageChecked(int, int, int, int, struct Color, struct Color);
struct Image GenImageWhiteNoise(int, int, float);
struct Image GenImagePerlinNoise(int, int, int, int, float);
struct Image GenImageCellular(int, int, int);
struct Image GenImageText(int, int, const char *);
struct Image ImageCopy(struct Image);
struct Image ImageFromImage(struct Image, struct Rectangle);
struct Image ImageText(const char *, int, struct Color);
struct Image ImageTextEx(struct Font, const char *, float, float, struct Color);
void ImageFormat(struct Image *, int);
void ImageToPOT(struct Image *, struct Color);
void ImageCrop(struct Image *, struct Rectangle);
void ImageAlphaCrop(struct Image *, float);
void ImageAlphaClear(struct Image *, struct Color, float);
void ImageAlphaMask(struct Image *, struct Image);
void ImageAlphaPremultiply(struct Image *);
void ImageBlurGaussian(struct Image *, int);
void ImageResize(struct Image *, int, int);
void ImageResizeNN(struct Image *, int, int);
void ImageResizeCanvas(struct Image *, int, int, int, int, struct Color);
void ImageMipmaps(struct Image *);
void ImageDither(struct Image *, int, int, int, int);
void ImageFlipVertical(struct Image *);
void ImageFlipHorizontal(struct Image *);
void ImageRotate(struct Image *, int);
void ImageRotateCW(struct Image *);
void ImageRotateCCW(struct Image *);
void ImageColorTint(struct Image *, struct Color);
void ImageColorInvert(struct Image *);
void ImageColorGrayscale(struct Image *);
void ImageColorContrast(struct Image *, float);
void ImageColorBrightness(struct Image *, int);
void ImageColorReplace(struct Image *, struct Color, struct Color);
struct Color *LoadImageColors(struct Image);
struct Color *LoadImagePalette(struct Image, int, int *);
void UnloadImageColors(struct Color *);
void UnloadImagePalette(struct Color *);
struct Rectangle GetImageAlphaBorder(struct Image, float);
struct Color GetImageColor(struct Image, int, int);
void ImageClearBackground(struct Image *, struct Color);
void ImageDrawPixel(struct Image *, int, int, struct Color);
void ImageDrawPixelV(struct Image *, struct Vector2, struct Color);
void ImageDrawLine(struct Image *, int, int, int, int, struct Color);
void ImageDrawLineV(struct Image *, struct Vector2, struct Vector2, struct Color);
void ImageDrawCircle(struct Image *, int, int, int, struct Color);
void ImageDrawCircleV(struct Image *, struct Vector2, int, struct Color);
void ImageDrawCircleLines(struct Image *, int, int, int, struct Color);
void ImageDrawCircleLinesV(struct Image *, struct Vector2, int, struct Color);
void ImageDrawRectangle(struct Image *, int, int, int, int, struct Color);
void ImageDrawRectangleV(struct Image *, struct Vector2, struct Vector2, struct Color);
void ImageDrawRectangleRec(struct Image *, struct Rectangle, struct Color);
void ImageDrawRectangleLines(struct Image *, struct Rectangle, int, struct Color);
void ImageDraw(struct Image *, struct Image, struct Rectangle, struct Rectangle, struct Color);
void ImageDrawText(struct Image *, const char *, int, int, int, struct Color);
void ImageDrawTextEx(struct Image *, struct Font, const char *, struct Vector2, float, float, struct Color);
struct Texture LoadTexture(const char *);
struct Texture LoadTextureFromImage(struct Image);
struct Texture LoadTextureCubemap(struct Image, int);
struct RenderTexture LoadRenderTexture(int, int);
bool IsTextureReady(struct Texture);
void UnloadTexture(struct Texture);
bool IsRenderTextureReady(struct RenderTexture);
void UnloadRenderTexture(struct RenderTexture);
void UpdateTexture(struct Texture, const void *);
void UpdateTextureRec(struct Texture, struct Rectangle, const void *);
void GenTextureMipmaps(struct Texture *);
void SetTextureFilter(struct Texture, int);
void SetTextureWrap(struct Texture, int);
void DrawTexture(struct Texture, int, int, struct Color);
void DrawTextureV(struct Texture, struct Vector2, struct Color);
void DrawTextureEx(struct Texture, struct Vector2, float, float, struct Color);
void DrawTextureRec(struct Texture, struct Rectangle, struct Vector2, struct Color);
void DrawTexturePro(struct Texture, struct Rectangle, struct Rectangle, struct Vector2, float, struct Color);
void DrawTextureNPatch(struct Texture, struct NPatchInfo, struct Rectangle, struct Vector2, float, struct Color);
struct Color Fade(struct Color, float);
int ColorToInt(struct Color);
struct Vector4 ColorNormalize(struct Color);
struct Color ColorFromNormalized(struct Vector4);
struct Vector3 ColorToHSV(struct Color);
struct Color ColorFromHSV(float, float, float);
struct Color ColorTint(struct Color, struct Color);
struct Color ColorBrightness(struct Color, float);
struct Color ColorContrast(struct Color, float);
struct Color ColorAlpha(struct Color, float);
struct Color ColorAlphaBlend(struct Color, struct Color, struct Color);
struct Color GetColor(unsigned int);
struct Color GetPixelColor(void *, int);
void SetPixelColor(void *, struct Color, int);
int GetPixelDataSize(int, int, int);
struct Font GetFontDefault(void);
struct Font LoadFont(const char *);
struct Font LoadFontEx(const char *, int, int *, int);
struct Font LoadFontFromImage(struct Image, struct Color, int);
struct Font LoadFontFromMemory(const char *, const unsigned char *, int, int, int *, int);
bool IsFontReady(struct Font);
struct GlyphInfo *LoadFontData(const unsigned char *, int, int, int *, int, int);
struct Image GenImageFontAtlas(const struct GlyphInfo *, struct Rectangle **, int, int, int, int);
void UnloadFontData(struct GlyphInfo *, int);
void UnloadFont(struct Font);
bool ExportFontAsCode(struct Font, const char *);
void DrawFPS(int, int);
void DrawText(const char *, int, int, int, struct Color);
void DrawTextEx(struct Font, const char *, struct Vector2, float, float, struct Color);
void DrawTextPro(struct Font, const char *, struct Vector2, struct Vector2, float, float, float, struct Color);
void DrawTextCodepoint(struct Font, int, struct Vector2, float, struct Color);
void DrawTextCodepoints(struct Font, const int *, int, struct Vector2, float, float, struct Color);
void SetTextLineSpacing(int);
int MeasureText(const char *, int);
struct Vector2 MeasureTextEx(struct Font, const char *, float, float);
int GetGlyphIndex(struct Font, int);
struct GlyphInfo GetGlyphInfo(struct Font, int);
struct Rectangle GetGlyphAtlasRec(struct Font, int);
const char *LoadUTF8(const int *, int);
void UnloadUTF8(const char *);
int *LoadCodepoints(const char *, int *);
void UnloadCodepoints(int *);
int GetCodepointCount(const char *);
int GetCodepoint(const char *, int *);
int GetCodepointNext(const char *, int *);
int GetCodepointPrevious(const char *, int *);
const char *CodepointToUTF8(int, int *);
int TextCopy(const char *, const char *);
bool TextIsEqual(const char *, const char *);
unsigned int TextLength(const char *);
const char *TextFormat(const char *, ...);
const char *TextSubtext(const char *, int, int);
const char *TextReplace(const char *, const char *, const char *);
const char *TextInsert(const char *, const char *, int);
const char *TextJoin(const char **, int, const char *);
const char **TextSplit(const char *, char, int *);
void TextAppend(const char *, const char *, int *);
int TextFindIndex(const char *, const char *);
const char *TextToUpper(const char *);
const char *TextToLower(const char *);
const char *TextToPascal(const char *);
int TextToInteger(const char *);
void DrawLine3D(struct Vector3, struct Vector3, struct Color);
void DrawPoint3D(struct Vector3, struct Color);
void DrawCircle3D(struct Vector3, float, struct Vector3, float, struct Color);
void DrawTriangle3D(struct Vector3, struct Vector3, struct Vector3, struct Color);
void DrawTriangleStrip3D(struct Vector3 *, int, struct Color);
void DrawCube(struct Vector3, float, float, float, struct Color);
void DrawCubeV(struct Vector3, struct Vector3, struct Color);
void DrawCubeWires(struct Vector3, float, float, float, struct Color);
void DrawCubeWiresV(struct Vector3, struct Vector3, struct Color);
void DrawSphere(struct Vector3, float, struct Color);
void DrawSphereEx(struct Vector3, float, int, int, struct Color);
void DrawSphereWires(struct Vector3, float, int, int, struct Color);
void DrawCylinder(struct Vector3, float, float, float, int, struct Color);
void DrawCylinderEx(struct Vector3, struct Vector3, float, float, int, struct Color);
void DrawCylinderWires(struct Vector3, float, float, float, int, struct Color);
void DrawCylinderWiresEx(struct Vector3, struct Vector3, float, float, int, struct Color);
void DrawCapsule(struct Vector3, struct Vector3, float, int, int, struct Color);
void DrawCapsuleWires(struct Vector3, struct Vector3, float, int, int, struct Color);
void DrawPlane(struct Vector3, struct Vector2, struct Color);
void DrawRay(struct Ray, struct Color);
void DrawGrid(int, float);
struct Model LoadModel(const char *);
struct Model LoadModelFromMesh(struct Mesh);
bool IsModelReady(struct Model);
void UnloadModel(struct Model);
struct BoundingBox GetModelBoundingBox(struct Model);
void DrawModel(struct Model, struct Vector3, float, struct Color);
void DrawModelEx(struct Model, struct Vector3, struct Vector3, float, struct Vector3, struct Color);
void DrawModelWires(struct Model, struct Vector3, float, struct Color);
void DrawModelWiresEx(struct Model, struct Vector3, struct Vector3, float, struct Vector3, struct Color);
void DrawBoundingBox(struct BoundingBox, struct Color);
void DrawBillboard(struct Camera3D, struct Texture, struct Vector3, float, struct Color);
void DrawBillboardRec(struct Camera3D, struct Texture, struct Rectangle, struct Vector3, struct Vector2, struct Color);
void DrawBillboardPro(struct Camera3D, struct Texture, struct Rectangle, struct Vector3, struct Vector3, struct Vector2, struct Vector2, float, struct Color);
void UploadMesh(struct Mesh *, bool);
void UpdateMeshBuffer(struct Mesh, int, const void *, int, int);
void UnloadMesh(struct Mesh);
void DrawMesh(struct Mesh, struct Material, struct Matrix);
void DrawMeshInstanced(struct Mesh, struct Material, const struct Matrix *, int);
bool ExportMesh(struct Mesh, const char *);
struct BoundingBox GetMeshBoundingBox(struct Mesh);
void GenMeshTangents(struct Mesh *);
struct Mesh GenMeshPoly(int, float);
struct Mesh GenMeshPlane(float, float, int, int);
struct Mesh GenMeshCube(float, float, float);
struct Mesh GenMeshSphere(float, int, int);
struct Mesh GenMeshHemiSphere(float, int, int);
struct Mesh GenMeshCylinder(float, float, int);
struct Mesh GenMeshCone(float, float, int);
struct Mesh GenMeshTorus(float, float, int, int);
struct Mesh GenMeshKnot(float, float, int, int);
struct Mesh GenMeshHeightmap(struct Image, struct Vector3);
struct Mesh GenMeshCubicmap(struct Image, struct Vector3);
struct Material *LoadMaterials(const char *, int *);
struct Material LoadMaterialDefault(void);
bool IsMaterialReady(struct Material);
void UnloadMaterial(struct Material);
void SetMaterialTexture(struct Material *, int, struct Texture);
void SetModelMeshMaterial(struct Model *, int, int);
struct ModelAnimation *LoadModelAnimations(const char *, int *);
void UpdateModelAnimation(struct Model, struct ModelAnimation, int);
void UnloadModelAnimation(struct ModelAnimation);
void UnloadModelAnimations(struct ModelAnimation *, int);
bool IsModelAnimationValid(struct Model, struct ModelAnimation);
bool CheckCollisionSpheres(struct Vector3, float, struct Vector3, float);
bool CheckCollisionBoxes(struct BoundingBox, struct BoundingBox);
bool CheckCollisionBoxSphere(struct BoundingBox, struct Vector3, float);
struct RayCollision GetRayCollisionSphere(struct Ray, struct Vector3, float);
struct RayCollision GetRayCollisionBox(struct Ray, struct BoundingBox);
struct RayCollision GetRayCollisionMesh(struct Ray, struct Mesh, struct Matrix);
struct RayCollision GetRayCollisionTriangle(struct Ray, struct Vector3, struct Vector3, struct Vector3);
struct RayCollision GetRayCollisionQuad(struct Ray, struct Vector3, struct Vector3, struct Vector3, struct Vector3);
void InitAudioDevice(void);
void CloseAudioDevice(void);
bool IsAudioDeviceReady(void);
void SetMasterVolume(float);
float GetMasterVolume(void);
struct Wave LoadWave(const char *);
struct Wave LoadWaveFromMemory(const char *, const unsigned char *, int);
bool IsWaveReady(struct Wave);
void UnloadWave(struct Wave);
bool ExportWave(struct Wave, const char *);
bool ExportWaveAsCode(struct Wave, const char *);
struct Wave WaveCopy(struct Wave);
void WaveCrop(struct Wave *, int, int);
void WaveFormat(struct Wave *, int, int, int);
float *LoadWaveSamples(struct Wave);
void UnloadWaveSamples(float *);
struct Music LoadMusicStream(const char *);
struct Music LoadMusicStreamFromMemory(const char *, const unsigned char *, int);
bool IsMusicReady(struct Music);
void UnloadMusicStream(struct Music);
void PlayMusicStream(struct Music);
bool IsMusicStreamPlaying(struct Music);
void UpdateMusicStream(struct Music);
void StopMusicStream(struct Music);
void PauseMusicStream(struct Music);
void ResumeMusicStream(struct Music);
void SeekMusicStream(struct Music, float);
void SetMusicVolume(struct Music, float);
void SetMusicPitch(struct Music, float);
void SetMusicPan(struct Music, float);
float GetMusicTimeLength(struct Music);
float GetMusicTimePlayed(struct Music);
struct AudioStream LoadAudioStream(unsigned int, unsigned int, unsigned int);
bool IsAudioStreamReady(struct AudioStream);
void UnloadAudioStream(struct AudioStream);
void UpdateAudioStream(struct AudioStream, const void *, int);
bool IsAudioStreamProcessed(struct AudioStream);
void PlayAudioStream(struct AudioStream);
void PauseAudioStream(struct AudioStream);
void ResumeAudioStream(struct AudioStream);
bool IsAudioStreamPlaying(struct AudioStream);
void StopAudioStream(struct AudioStream);
void SetAudioStreamVolume(struct AudioStream, float);
void SetAudioStreamPitch(struct AudioStream, float);
void SetAudioStreamPan(struct AudioStream, float);
void SetAudioStreamBufferSizeDefault(int);
void rlMatrixMode(int);
void rlPushMatrix(void);
void rlPopMatrix(void);
void rlLoadIdentity(void);
void rlTranslatef(float, float, float);
void rlRotatef(float, float, float, float);
void rlScalef(float, float, float);
void rlMultMatrixf(const float *);
void rlFrustum(double, double, double, double, double, double);
void rlOrtho(double, double, double, double, double, double);
void rlViewport(int, int, int, int);
void rlBegin(int);
void rlEnd(void);
void rlVertex2i(int, int);
void rlVertex2f(float, float);
void rlVertex3f(float, float, float);
void rlTexCoord2f(float, float);
void rlNormal3f(float, float, float);
void rlColor4ub(unsigned char, unsigned char, unsigned char, unsigned char);
void rlColor3f(float, float, float);
void rlColor4f(float, float, float, float);
bool rlEnableVertexArray(unsigned int);
void rlDisableVertexArray(void);
void rlEnableVertexBuffer(unsigned int);
void rlDisableVertexBuffer(void);
void rlEnableVertexBufferElement(unsigned int);
void rlDisableVertexBufferElement(void);
void rlEnableVertexAttribute(unsigned int);
void rlDisableVertexAttribute(unsigned int);
void rlEnableStatePointer(int, void *);
void rlDisableStatePointer(int);
void rlActiveTextureSlot(int);
void rlEnableTexture(unsigned int);
void rlDisableTexture(void);
void rlEnableTextureCubemap(unsigned int);
void rlDisableTextureCubemap(void);
void rlTextureParameters(unsigned int, int, int);
void rlCubemapParameters(unsigned int, int, int);
void rlEnableShader(unsigned int);
void rlDisableShader(void);
void rlEnableFramebuffer(unsigned int);
void rlDisableFramebuffer(void);
void rlActiveDrawBuffers(int);
void rlBlitFramebuffer(int, int, int, int, int, int, int, int, int);
void rlEnableColorBlend(void);
void rlDisableColorBlend(void);
void rlEnableDepthTest(void);
void rlDisableDepthTest(void);
void rlEnableDepthMask(void);
void rlDisableDepthMask(void);
void rlEnableBackfaceCulling(void);
void rlDisableBackfaceCulling(void);
void rlSetCullFace(int);
void rlEnableScissorTest(void);
void rlDisableScissorTest(void);
void rlScissor(int, int, int, int);
void rlEnableWireMode(void);
void rlEnablePointMode(void);
void rlDisableWireMode(void);
void rlSetLineWidth(float);
float rlGetLineWidth(void);
void rlEnableSmoothLines(void);
void rlDisableSmoothLines(void);
void rlEnableStereoRender(void);
void rlDisableStereoRender(void);
bool rlIsStereoRenderEnabled(void);
void rlClearColor(unsigned char, unsigned char, unsigned char, unsigned char);
void rlClearScreenBuffers(void);
void rlCheckErrors(void);
void rlSetBlendMode(int);
void rlSetBlendFactors(int, int, int);
void rlSetBlendFactorsSeparate(int, int, int, int, int, int);
void rlglInit(int, int);
void rlglClose(void);
void rlLoadExtensions(void *);
int rlGetVersion(void);
void rlSetFramebufferWidth(int);
int rlGetFramebufferWidth(void);
void rlSetFramebufferHeight(int);
int rlGetFramebufferHeight(void);
unsigned int rlGetTextureIdDefault(void);
unsigned int rlGetShaderIdDefault(void);
int *rlGetShaderLocsDefault(void);
struct rlRenderBatch rlLoadRenderBatch(int, int);
void rlUnloadRenderBatch(struct rlRenderBatch);
void rlDrawRenderBatch(struct rlRenderBatch *);
void rlSetRenderBatchActive(struct rlRenderBatch *);
void rlDrawRenderBatchActive(void);
bool rlCheckRenderBatchLimit(int);
void rlSetTexture(unsigned int);
unsigned int rlLoadVertexArray(void);
unsigned int rlLoadVertexBuffer(const void *, int, bool);
unsigned int rlLoadVertexBufferElement(const void *, int, bool);
void rlUpdateVertexBuffer(unsigned int, const void *, int, int);
void rlUpdateVertexBufferElements(unsigned int, const void *, int, int);
void rlUnloadVertexArray(unsigned int);
void rlUnloadVertexBuffer(unsigned int);
void rlSetVertexAttribute(unsigned int, int, int, bool, int, const void *);
void rlSetVertexAttributeDivisor(unsigned int, int);
void rlSetVertexAttributeDefault(int, const void *, int, int);
void rlDrawVertexArray(int, int);
void rlDrawVertexArrayElements(int, int, const void *);
void rlDrawVertexArrayInstanced(int, int, int);
void rlDrawVertexArrayElementsInstanced(int, int, const void *, int);
unsigned int rlLoadTexture(const void *, int, int, int, int);
unsigned int rlLoadTextureDepth(int, int, bool);
unsigned int rlLoadTextureCubemap(const void *, int, int);
void rlUpdateTexture(unsigned int, int, int, int, int, int, const void *);
void rlGetGlTextureFormats(int, unsigned int *, unsigned int *, unsigned int *);
const char *rlGetPixelFormatName(unsigned int);
void rlUnloadTexture(unsigned int);
void rlGenTextureMipmaps(unsigned int, int, int, int, int *);
void *rlReadTexturePixels(unsigned int, int, int, int);
unsigned char *rlReadScreenPixels(int, int);
unsigned int rlLoadFramebuffer(int, int);
void rlFramebufferAttach(unsigned int, unsigned int, int, int, int);
bool rlFramebufferComplete(unsigned int);
void rlUnloadFramebuffer(unsigned int);
unsigned int rlLoadShaderCode(const char *, const char *);
unsigned int rlCompileShader(const char *, int);
unsigned int rlLoadShaderProgram(unsigned int, unsigned int);
void rlUnloadShaderProgram(unsigned int);
int rlGetLocationUniform(unsigned int, const char *);
int rlGetLocationAttrib(unsigned int, const char *);
void rlSetUniform(int, const void *, int, int);
void rlSetUniformMatrix(int, struct Matrix);
void rlSetUniformSampler(int, unsigned int);
void rlSetShader(unsigned int, int *);
unsigned int rlLoadComputeShaderProgram(unsigned int);
void rlComputeShaderDispatch(unsigned int, unsigned int, unsigned int);
unsigned int rlLoadShaderBuffer(unsigned int, const void *, int);
void rlUnloadShaderBuffer(unsigned int);
void rlUpdateShaderBuffer(unsigned int, const void *, unsigned int, unsigned int);
void rlBindShaderBuffer(unsigned int, unsigned int);
void rlReadShaderBuffer(unsigned int, void *, unsigned int, unsigned int);
void rlCopyShaderBuffer(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
unsigned int rlGetShaderBufferSize(unsigned int);
void rlBindImageTexture(unsigned int, unsigned int, int, bool);
struct Matrix rlGetMatrixModelview(void);
struct Matrix rlGetMatrixProjection(void);
struct Matrix rlGetMatrixTransform(void);
struct Matrix rlGetMatrixProjectionStereo(int);
struct Matrix rlGetMatrixViewOffsetStereo(int);
void rlSetMatrixProjection(struct Matrix);
void rlSetMatrixModelview(struct Matrix);
void rlSetMatrixProjectionStereo(struct Matrix, struct Matrix);
void rlSetMatrixViewOffsetStereo(struct Matrix, struct Matrix);
void rlLoadDrawCube(void);
void rlLoadDrawQuad(void);
struct Matrix rlGetMatrixProjectionStereo(int);
struct Matrix rlGetMatrixViewOffsetStereo(int);
