local ffi = require("ffi")
local lib = ffi.load("libraylib")

local generated = assert(io.open("raylib/generated.h", "r"), "Cannot find generated.h")

ffi.cdef(generated:read("*all"))

local mt = { __index = lib }
local rl = setmetatable({}, mt)

local raygui = require("raylib/raygui")
rl = raygui(rl)

rl.RAYLIB_VERSION_MAJOR = 5

rl.RAYLIB_VERSION_MINOR = 5

rl.RAYLIB_VERSION_PATCH = 0

rl.RAYLIB_VERSION = "5.5"

rl.PI = 3.1415926535898

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

rl.RLGL_VERSION = "5.0"

rl.RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 8192

--- Default number of batch buffers (multi-buffering)
rl.RL_DEFAULT_BATCH_BUFFERS = 1

--- Default number of batch draw calls (by state changes: mode, texture)
rl.RL_DEFAULT_BATCH_DRAWCALLS = 256

--- Maximum number of textures units that can be activated on batch drawing (SetShaderValueTexture())
rl.RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS = 4

--- Maximum size of Matrix stack
rl.RL_MAX_MATRIX_STACK_SIZE = 32

--- Maximum number of shader locations supported
rl.RL_MAX_SHADER_LOCATIONS = 32

--- Default near cull distance
rl.RL_CULL_DISTANCE_NEAR = 0.01

--- Default far cull distance
rl.RL_CULL_DISTANCE_FAR = 1000.0

--- GL_TEXTURE_WRAP_S
rl.RL_TEXTURE_WRAP_S = 10242

--- GL_TEXTURE_WRAP_T
rl.RL_TEXTURE_WRAP_T = 10243

--- GL_TEXTURE_MAG_FILTER
rl.RL_TEXTURE_MAG_FILTER = 10240

--- GL_TEXTURE_MIN_FILTER
rl.RL_TEXTURE_MIN_FILTER = 10241

--- GL_NEAREST
rl.RL_TEXTURE_FILTER_NEAREST = 9728

--- GL_LINEAR
rl.RL_TEXTURE_FILTER_LINEAR = 9729

--- GL_NEAREST_MIPMAP_NEAREST
rl.RL_TEXTURE_FILTER_MIP_NEAREST = 9984

--- GL_NEAREST_MIPMAP_LINEAR
rl.RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = 9986

--- GL_LINEAR_MIPMAP_NEAREST
rl.RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = 9985

--- GL_LINEAR_MIPMAP_LINEAR
rl.RL_TEXTURE_FILTER_MIP_LINEAR = 9987

--- Anisotropic filter (custom identifier)
rl.RL_TEXTURE_FILTER_ANISOTROPIC = 12288

--- Texture mipmap bias, percentage ratio (custom identifier)
rl.RL_TEXTURE_MIPMAP_BIAS_RATIO = 16384

--- GL_REPEAT
rl.RL_TEXTURE_WRAP_REPEAT = 10497

--- GL_CLAMP_TO_EDGE
rl.RL_TEXTURE_WRAP_CLAMP = 33071

--- GL_MIRRORED_REPEAT
rl.RL_TEXTURE_WRAP_MIRROR_REPEAT = 33648

--- GL_MIRROR_CLAMP_EXT
rl.RL_TEXTURE_WRAP_MIRROR_CLAMP = 34626

--- GL_MODELVIEW
rl.RL_MODELVIEW = 5888

--- GL_PROJECTION
rl.RL_PROJECTION = 5889

--- GL_TEXTURE
rl.RL_TEXTURE = 5890

--- GL_LINES
rl.RL_LINES = 1

--- GL_TRIANGLES
rl.RL_TRIANGLES = 4

--- GL_QUADS
rl.RL_QUADS = 7

--- GL_UNSIGNED_BYTE
rl.RL_UNSIGNED_BYTE = 5121

--- GL_FLOAT
rl.RL_FLOAT = 5126

--- GL_STREAM_DRAW
rl.RL_STREAM_DRAW = 35040

--- GL_STREAM_READ
rl.RL_STREAM_READ = 35041

--- GL_STREAM_COPY
rl.RL_STREAM_COPY = 35042

--- GL_STATIC_DRAW
rl.RL_STATIC_DRAW = 35044

--- GL_STATIC_READ
rl.RL_STATIC_READ = 35045

--- GL_STATIC_COPY
rl.RL_STATIC_COPY = 35046

--- GL_DYNAMIC_DRAW
rl.RL_DYNAMIC_DRAW = 35048

--- GL_DYNAMIC_READ
rl.RL_DYNAMIC_READ = 35049

--- GL_DYNAMIC_COPY
rl.RL_DYNAMIC_COPY = 35050

--- GL_FRAGMENT_SHADER
rl.RL_FRAGMENT_SHADER = 35632

--- GL_VERTEX_SHADER
rl.RL_VERTEX_SHADER = 35633

--- GL_COMPUTE_SHADER
rl.RL_COMPUTE_SHADER = 37305

--- GL_ZERO
rl.RL_ZERO = 0

--- GL_ONE
rl.RL_ONE = 1

--- GL_SRC_COLOR
rl.RL_SRC_COLOR = 768

--- GL_ONE_MINUS_SRC_COLOR
rl.RL_ONE_MINUS_SRC_COLOR = 769

--- GL_SRC_ALPHA
rl.RL_SRC_ALPHA = 770

--- GL_ONE_MINUS_SRC_ALPHA
rl.RL_ONE_MINUS_SRC_ALPHA = 771

--- GL_DST_ALPHA
rl.RL_DST_ALPHA = 772

--- GL_ONE_MINUS_DST_ALPHA
rl.RL_ONE_MINUS_DST_ALPHA = 773

--- GL_DST_COLOR
rl.RL_DST_COLOR = 774

--- GL_ONE_MINUS_DST_COLOR
rl.RL_ONE_MINUS_DST_COLOR = 775

--- GL_SRC_ALPHA_SATURATE
rl.RL_SRC_ALPHA_SATURATE = 776

--- GL_CONSTANT_COLOR
rl.RL_CONSTANT_COLOR = 32769

--- GL_ONE_MINUS_CONSTANT_COLOR
rl.RL_ONE_MINUS_CONSTANT_COLOR = 32770

--- GL_CONSTANT_ALPHA
rl.RL_CONSTANT_ALPHA = 32771

--- GL_ONE_MINUS_CONSTANT_ALPHA
rl.RL_ONE_MINUS_CONSTANT_ALPHA = 32772

--- GL_FUNC_ADD
rl.RL_FUNC_ADD = 32774

--- GL_MIN
rl.RL_MIN = 32775

--- GL_MAX
rl.RL_MAX = 32776

--- GL_FUNC_SUBTRACT
rl.RL_FUNC_SUBTRACT = 32778

--- GL_FUNC_REVERSE_SUBTRACT
rl.RL_FUNC_REVERSE_SUBTRACT = 32779

--- GL_BLEND_EQUATION
rl.RL_BLEND_EQUATION = 32777

--- GL_BLEND_EQUATION_RGB   // (Same as BLEND_EQUATION)
rl.RL_BLEND_EQUATION_RGB = 32777

--- GL_BLEND_EQUATION_ALPHA
rl.RL_BLEND_EQUATION_ALPHA = 34877

--- GL_BLEND_DST_RGB
rl.RL_BLEND_DST_RGB = 32968

--- GL_BLEND_SRC_RGB
rl.RL_BLEND_SRC_RGB = 32969

--- GL_BLEND_DST_ALPHA
rl.RL_BLEND_DST_ALPHA = 32970

--- GL_BLEND_SRC_ALPHA
rl.RL_BLEND_SRC_ALPHA = 32971

--- GL_BLEND_COLOR
rl.RL_BLEND_COLOR = 32773

--- GL_READ_FRAMEBUFFER
rl.RL_READ_FRAMEBUFFER = 36008

--- GL_DRAW_FRAMEBUFFER
rl.RL_DRAW_FRAMEBUFFER = 36009

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION = 0

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD = 1

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL = 2

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR = 3

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT = 4

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 = 5

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES = 6

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS = 7

rl.RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS = 8

rl.PI = 3.1415926535898

rl.GL_SHADING_LANGUAGE_VERSION = 35724

rl.GL_COMPRESSED_RGB_S3TC_DXT1_EXT = 33776

rl.GL_COMPRESSED_RGBA_S3TC_DXT1_EXT = 33777

rl.GL_COMPRESSED_RGBA_S3TC_DXT3_EXT = 33778

rl.GL_COMPRESSED_RGBA_S3TC_DXT5_EXT = 33779

rl.GL_ETC1_RGB8_OES = 36196

rl.GL_COMPRESSED_RGB8_ETC2 = 37492

rl.GL_COMPRESSED_RGBA8_ETC2_EAC = 37496

rl.GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG = 35840

rl.GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG = 35842

rl.GL_COMPRESSED_RGBA_ASTC_4x4_KHR = 37808

rl.GL_COMPRESSED_RGBA_ASTC_8x8_KHR = 37815

rl.GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = 34047

rl.GL_TEXTURE_MAX_ANISOTROPY_EXT = 34046

rl.GL_PROGRAM_POINT_SIZE = 34370

rl.GL_LINE_WIDTH = 2849

rl.GL_UNSIGNED_SHORT_5_6_5 = 33635

rl.GL_UNSIGNED_SHORT_5_5_5_1 = 32820

rl.GL_UNSIGNED_SHORT_4_4_4_4 = 32819

rl.GL_LUMINANCE = 6409

rl.GL_LUMINANCE_ALPHA = 6410

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_POSITION
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_POSITION = "vertexPosition"

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD = "vertexTexCoord"

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_NORMAL
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_NORMAL = "vertexNormal"

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_COLOR
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_COLOR = "vertexColor"

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_TANGENT
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_TANGENT = "vertexTangent"

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD2
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD2 = "vertexTexCoord2"

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_BONEIDS
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_BONEIDS = "vertexBoneIds"

--- Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_NAME_BONEWEIGHTS
rl.RL_DEFAULT_SHADER_ATTRIB_NAME_BONEWEIGHTS = "vertexBoneWeights"

--- model-view-projection matrix
rl.RL_DEFAULT_SHADER_UNIFORM_NAME_MVP = "mvp"

--- view matrix
rl.RL_DEFAULT_SHADER_UNIFORM_NAME_VIEW = "matView"

--- projection matrix
rl.RL_DEFAULT_SHADER_UNIFORM_NAME_PROJECTION = "matProjection"

--- model matrix
rl.RL_DEFAULT_SHADER_UNIFORM_NAME_MODEL = "matModel"

--- normal matrix (transpose(inverse(matModelView))
rl.RL_DEFAULT_SHADER_UNIFORM_NAME_NORMAL = "matNormal"

--- color diffuse (base tint color, multiplied by texture color)
rl.RL_DEFAULT_SHADER_UNIFORM_NAME_COLOR = "colDiffuse"

--- bone matrices
rl.RL_DEFAULT_SHADER_UNIFORM_NAME_BONE_MATRICES = "boneMatrices"

--- texture0 (texture slot active 0)
rl.RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE0 = "texture0"

--- texture1 (texture slot active 1)
rl.RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE1 = "texture1"

--- texture2 (texture slot active 2)
rl.RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE2 = "texture2"

---@class Vector2
---@field x number
---@field y number

--- Vector2, 2 components
---@param x number
---@param y number
---@return Vector2
function rl.Vector2(x, y)
  return ffi.new("Vector2", x, y)
end

---@class Vector3
---@field x number
---@field y number
---@field z number

--- Vector3, 3 components
---@param x number
---@param y number
---@param z number
---@return Vector3
function rl.Vector3(x, y, z)
  return ffi.new("Vector3", x, y, z)
end

---@class Vector4
---@field x number
---@field y number
---@field z number
---@field w number

--- Vector4, 4 components
---@param x number
---@param y number
---@param z number
---@param w number
---@return Vector4
function rl.Vector4(x, y, z, w)
  return ffi.new("Vector4", x, y, z, w)
end

---@class Matrix
---@field m0 number
---@field m4 number
---@field m8 number
---@field m12 number
---@field m1 number
---@field m5 number
---@field m9 number
---@field m13 number
---@field m2 number
---@field m6 number
---@field m10 number
---@field m14 number
---@field m3 number
---@field m7 number
---@field m11 number
---@field m15 number

--- Matrix, 4x4 components, column major, OpenGL style, right-handed
---@param m0 number
---@param m4 number
---@param m8 number
---@param m12 number
---@param m1 number
---@param m5 number
---@param m9 number
---@param m13 number
---@param m2 number
---@param m6 number
---@param m10 number
---@param m14 number
---@param m3 number
---@param m7 number
---@param m11 number
---@param m15 number
---@return Matrix
function rl.Matrix(m0, m4, m8, m12, m1, m5, m9, m13, m2, m6, m10, m14, m3, m7, m11, m15)
  return ffi.new("Matrix", m0, m4, m8, m12, m1, m5, m9, m13, m2, m6, m10, m14, m3, m7, m11, m15)
end

---@class Color
---@field r string
---@field g string
---@field b string
---@field a string

--- Color, 4 components, R8G8B8A8 (32bit)
---@param r string
---@param g string
---@param b string
---@param a string
---@return Color
function rl.Color(r, g, b, a)
  return ffi.new("Color", r, g, b, a)
end

---@class Rectangle
---@field x number
---@field y number
---@field width number
---@field height number

--- Rectangle, 4 components
---@param x number
---@param y number
---@param width number
---@param height number
---@return Rectangle
function rl.Rectangle(x, y, width, height)
  return ffi.new("Rectangle", x, y, width, height)
end

---@class Image
---@field data void
---@field width number
---@field height number
---@field mipmaps number
---@field format number

--- Image, pixel data stored in CPU memory (RAM)
---@param data void
---@param width number
---@param height number
---@param mipmaps number
---@param format number
---@return Image
function rl.Image(data, width, height, mipmaps, format)
  return ffi.new("Image", data, width, height, mipmaps, format)
end

---@class Texture
---@field id number
---@field width number
---@field height number
---@field mipmaps number
---@field format number

--- Texture, tex data stored in GPU memory (VRAM)
---@param id number
---@param width number
---@param height number
---@param mipmaps number
---@param format number
---@return Texture
function rl.Texture(id, width, height, mipmaps, format)
  return ffi.new("Texture", id, width, height, mipmaps, format)
end

---@class RenderTexture
---@field id number
---@field texture Texture
---@field depth Texture

--- RenderTexture, fbo for texture rendering
---@param id number
---@param texture Texture
---@param depth Texture
---@return RenderTexture
function rl.RenderTexture(id, texture, depth)
  return ffi.new("RenderTexture", id, texture, depth)
end

---@class NPatchInfo
---@field source Rectangle
---@field left number
---@field top number
---@field right number
---@field bottom number
---@field layout number

--- NPatchInfo, n-patch layout info
---@param source Rectangle
---@param left number
---@param top number
---@param right number
---@param bottom number
---@param layout number
---@return NPatchInfo
function rl.NPatchInfo(source, left, top, right, bottom, layout)
  return ffi.new("NPatchInfo", source, left, top, right, bottom, layout)
end

---@class GlyphInfo
---@field value number
---@field offsetX number
---@field offsetY number
---@field advanceX number
---@field image Image

--- GlyphInfo, font characters glyphs info
---@param value number
---@param offsetX number
---@param offsetY number
---@param advanceX number
---@param image Image
---@return GlyphInfo
function rl.GlyphInfo(value, offsetX, offsetY, advanceX, image)
  return ffi.new("GlyphInfo", value, offsetX, offsetY, advanceX, image)
end

---@class Font
---@field baseSize number
---@field glyphCount number
---@field glyphPadding number
---@field texture Texture2D
---@field recs Rectangle
---@field glyphs GlyphInfo

--- Font, font texture and GlyphInfo array data
---@param baseSize number
---@param glyphCount number
---@param glyphPadding number
---@param texture Texture2D
---@param recs Rectangle
---@param glyphs GlyphInfo
---@return Font
function rl.Font(baseSize, glyphCount, glyphPadding, texture, recs, glyphs)
  return ffi.new("Font", baseSize, glyphCount, glyphPadding, texture, recs, glyphs)
end

---@class Camera3D
---@field position Vector3
---@field target Vector3
---@field up Vector3
---@field fovy number
---@field projection number

--- Camera, defines position/orientation in 3d space
---@param position Vector3
---@param target Vector3
---@param up Vector3
---@param fovy number
---@param projection number
---@return Camera3D
function rl.Camera3D(position, target, up, fovy, projection)
  return ffi.new("Camera3D", position, target, up, fovy, projection)
end

---@class Camera2D
---@field offset Vector2
---@field target Vector2
---@field rotation number
---@field zoom number

--- Camera2D, defines position/orientation in 2d space
---@param offset Vector2
---@param target Vector2
---@param rotation number
---@param zoom number
---@return Camera2D
function rl.Camera2D(offset, target, rotation, zoom)
  return ffi.new("Camera2D", offset, target, rotation, zoom)
end

---@class Mesh
---@field vertexCount number
---@field triangleCount number
---@field vertices number
---@field texcoords number
---@field texcoords2 number
---@field normals number
---@field tangents number
---@field colors string
---@field indices string
---@field animVertices number
---@field animNormals number
---@field boneIds string
---@field boneWeights number
---@field boneMatrices Matrix
---@field boneCount number
---@field vaoId number
---@field vboId number

--- Mesh, vertex data and vao/vbo
---@param vertexCount number
---@param triangleCount number
---@param vertices number
---@param texcoords number
---@param texcoords2 number
---@param normals number
---@param tangents number
---@param colors string
---@param indices string
---@param animVertices number
---@param animNormals number
---@param boneIds string
---@param boneWeights number
---@param boneMatrices Matrix
---@param boneCount number
---@param vaoId number
---@param vboId number
---@return Mesh
function rl.Mesh(
  vertexCount,
  triangleCount,
  vertices,
  texcoords,
  texcoords2,
  normals,
  tangents,
  colors,
  indices,
  animVertices,
  animNormals,
  boneIds,
  boneWeights,
  boneMatrices,
  boneCount,
  vaoId,
  vboId
)
  return ffi.new(
    "Mesh",
    vertexCount,
    triangleCount,
    vertices,
    texcoords,
    texcoords2,
    normals,
    tangents,
    colors,
    indices,
    animVertices,
    animNormals,
    boneIds,
    boneWeights,
    boneMatrices,
    boneCount,
    vaoId,
    vboId
  )
end

---@class Shader
---@field id number
---@field locs number

--- Shader
---@param id number
---@param locs number
---@return Shader
function rl.Shader(id, locs)
  return ffi.new("Shader", id, locs)
end

---@class MaterialMap
---@field texture Texture2D
---@field color Color
---@field value number

--- MaterialMap
---@param texture Texture2D
---@param color Color
---@param value number
---@return MaterialMap
function rl.MaterialMap(texture, color, value)
  return ffi.new("MaterialMap", texture, color, value)
end

---@class Material
---@field shader Shader
---@field maps MaterialMap
---@field params number[] {number, number, number, number}

--- Material, includes shader and maps
---@param shader Shader
---@param maps MaterialMap
---@param params number[] {number, number, number, number}
---@return Material
function rl.Material(shader, maps, params)
  return ffi.new("Material", shader, maps, params)
end

---@class Transform
---@field translation Vector3
---@field rotation Quaternion
---@field scale Vector3

--- Transform, vertex transformation data
---@param translation Vector3
---@param rotation Quaternion
---@param scale Vector3
---@return Transform
function rl.Transform(translation, rotation, scale)
  return ffi.new("Transform", translation, rotation, scale)
end

---@class BoneInfo
---@field name string
---@field parent number

--- Bone, skeletal animation bone
---@param name string
---@param parent number
---@return BoneInfo
function rl.BoneInfo(name, parent)
  return ffi.new("BoneInfo", name, parent)
end

---@class Model
---@field transform Matrix
---@field meshCount number
---@field materialCount number
---@field meshes Mesh
---@field materials Material
---@field meshMaterial number
---@field boneCount number
---@field bones BoneInfo
---@field bindPose Transform

--- Model, meshes, materials and animation data
---@param transform Matrix
---@param meshCount number
---@param materialCount number
---@param meshes Mesh
---@param materials Material
---@param meshMaterial number
---@param boneCount number
---@param bones BoneInfo
---@param bindPose Transform
---@return Model
function rl.Model(transform, meshCount, materialCount, meshes, materials, meshMaterial, boneCount, bones, bindPose)
  return ffi.new(
    "Model",
    transform,
    meshCount,
    materialCount,
    meshes,
    materials,
    meshMaterial,
    boneCount,
    bones,
    bindPose
  )
end

---@class ModelAnimation
---@field boneCount number
---@field frameCount number
---@field bones BoneInfo
---@field framePoses Transform
---@field name string

--- ModelAnimation
---@param boneCount number
---@param frameCount number
---@param bones BoneInfo
---@param framePoses Transform
---@param name string
---@return ModelAnimation
function rl.ModelAnimation(boneCount, frameCount, bones, framePoses, name)
  return ffi.new("ModelAnimation", boneCount, frameCount, bones, framePoses, name)
end

---@class Ray
---@field position Vector3
---@field direction Vector3

--- Ray, ray for raycasting
---@param position Vector3
---@param direction Vector3
---@return Ray
function rl.Ray(position, direction)
  return ffi.new("Ray", position, direction)
end

---@class RayCollision
---@field hit boolean
---@field distance number
---@field point Vector3
---@field normal Vector3

--- RayCollision, ray hit information
---@param hit boolean
---@param distance number
---@param point Vector3
---@param normal Vector3
---@return RayCollision
function rl.RayCollision(hit, distance, point, normal)
  return ffi.new("RayCollision", hit, distance, point, normal)
end

---@class BoundingBox
---@field min Vector3
---@field max Vector3

--- BoundingBox
---@param min Vector3
---@param max Vector3
---@return BoundingBox
function rl.BoundingBox(min, max)
  return ffi.new("BoundingBox", min, max)
end

---@class Wave
---@field frameCount number
---@field sampleRate number
---@field sampleSize number
---@field channels number
---@field data void

--- Wave, audio wave data
---@param frameCount number
---@param sampleRate number
---@param sampleSize number
---@param channels number
---@param data void
---@return Wave
function rl.Wave(frameCount, sampleRate, sampleSize, channels, data)
  return ffi.new("Wave", frameCount, sampleRate, sampleSize, channels, data)
end

---@class AudioStream
---@field buffer rAudioBuffer
---@field processor rAudioProcessor
---@field sampleRate number
---@field sampleSize number
---@field channels number

--- AudioStream, custom audio stream
---@param buffer rAudioBuffer
---@param processor rAudioProcessor
---@param sampleRate number
---@param sampleSize number
---@param channels number
---@return AudioStream
function rl.AudioStream(buffer, processor, sampleRate, sampleSize, channels)
  return ffi.new("AudioStream", buffer, processor, sampleRate, sampleSize, channels)
end

---@class Sound
---@field stream AudioStream
---@field frameCount number

--- Sound
---@param stream AudioStream
---@param frameCount number
---@return Sound
function rl.Sound(stream, frameCount)
  return ffi.new("Sound", stream, frameCount)
end

---@class Music
---@field stream AudioStream
---@field frameCount number
---@field looping boolean
---@field ctxType number
---@field ctxData void

--- Music, audio stream, anything longer than ~10 seconds should be streamed
---@param stream AudioStream
---@param frameCount number
---@param looping boolean
---@param ctxType number
---@param ctxData void
---@return Music
function rl.Music(stream, frameCount, looping, ctxType, ctxData)
  return ffi.new("Music", stream, frameCount, looping, ctxType, ctxData)
end

---@class VrDeviceInfo
---@field hResolution number
---@field vResolution number
---@field hScreenSize number
---@field vScreenSize number
---@field eyeToScreenDistance number
---@field lensSeparationDistance number
---@field interpupillaryDistance number
---@field lensDistortionValues number[] {number, number, number, number}
---@field chromaAbCorrection number[] {number, number, number, number}

--- VrDeviceInfo, Head-Mounted-Display device parameters
---@param hResolution number
---@param vResolution number
---@param hScreenSize number
---@param vScreenSize number
---@param eyeToScreenDistance number
---@param lensSeparationDistance number
---@param interpupillaryDistance number
---@param lensDistortionValues number[] {number, number, number, number}
---@param chromaAbCorrection number[] {number, number, number, number}
---@return VrDeviceInfo
function rl.VrDeviceInfo(
  hResolution,
  vResolution,
  hScreenSize,
  vScreenSize,
  eyeToScreenDistance,
  lensSeparationDistance,
  interpupillaryDistance,
  lensDistortionValues,
  chromaAbCorrection
)
  return ffi.new(
    "VrDeviceInfo",
    hResolution,
    vResolution,
    hScreenSize,
    vScreenSize,
    eyeToScreenDistance,
    lensSeparationDistance,
    interpupillaryDistance,
    lensDistortionValues,
    chromaAbCorrection
  )
end

---@class VrStereoConfig
---@field projection Matrix[] {Matrix, Matrix}
---@field viewOffset Matrix[] {Matrix, Matrix}
---@field leftLensCenter number[] {number, number}
---@field rightLensCenter number[] {number, number}
---@field leftScreenCenter number[] {number, number}
---@field rightScreenCenter number[] {number, number}
---@field scale number[] {number, number}
---@field scaleIn number[] {number, number}

--- VrStereoConfig, VR stereo rendering configuration for simulator
---@param projection Matrix[] {Matrix, Matrix}
---@param viewOffset Matrix[] {Matrix, Matrix}
---@param leftLensCenter number[] {number, number}
---@param rightLensCenter number[] {number, number}
---@param leftScreenCenter number[] {number, number}
---@param rightScreenCenter number[] {number, number}
---@param scale number[] {number, number}
---@param scaleIn number[] {number, number}
---@return VrStereoConfig
function rl.VrStereoConfig(
  projection,
  viewOffset,
  leftLensCenter,
  rightLensCenter,
  leftScreenCenter,
  rightScreenCenter,
  scale,
  scaleIn
)
  return ffi.new(
    "VrStereoConfig",
    projection,
    viewOffset,
    leftLensCenter,
    rightLensCenter,
    leftScreenCenter,
    rightScreenCenter,
    scale,
    scaleIn
  )
end

---@class FilePathList
---@field capacity number
---@field count number
---@field paths string

--- File path list
---@param capacity number
---@param count number
---@param paths string
---@return FilePathList
function rl.FilePathList(capacity, count, paths)
  return ffi.new("FilePathList", capacity, count, paths)
end

---@class AutomationEvent
---@field frame number
---@field type number
---@field params number[] {number, number, number, number}

--- Automation event
---@param frame number
---@param type number
---@param params number[] {number, number, number, number}
---@return AutomationEvent
function rl.AutomationEvent(frame, type, params)
  return ffi.new("AutomationEvent", frame, type, params)
end

---@class AutomationEventList
---@field capacity number
---@field count number
---@field events AutomationEvent

--- Automation event list
---@param capacity number
---@param count number
---@param events AutomationEvent
---@return AutomationEventList
function rl.AutomationEventList(capacity, count, events)
  return ffi.new("AutomationEventList", capacity, count, events)
end

---@class rlVertexBuffer
---@field elementCount number
---@field vertices number
---@field texcoords number
---@field normals number
---@field colors string
---@field indices #if defined(GRAPHICS_API_OPENGL_11) || defined(GRAPHICS_API_OPENunsigned int
---@field indices number
---@field indices #endif
---@field indices #if defined(GRAPHICS_API_OPENGL_ES2)
---@field indices string
---@field vaoId #endif
---@field vaoId number
---@field vboId number[] {number, number, number, number, number}

--- Dynamic vertex buffers (position + texcoords + colors + indices arrays)
---@param elementCount number
---@param vertices number
---@param texcoords number
---@param normals number
---@param colors string
---@param indices #if defined(GRAPHICS_API_OPENGL_11) || defined(GRAPHICS_API_OPENunsigned int
---@param indices number
---@param indices #endif
---@param indices #if defined(GRAPHICS_API_OPENGL_ES2)
---@param indices string
---@param vaoId #endif
---@param vaoId number
---@param vboId number[] {number, number, number, number, number}
---@return rlVertexBuffer
function rl.rlVertexBuffer(
  elementCount,
  vertices,
  texcoords,
  normals,
  colors,
  indices,
  indices,
  indices,
  indices,
  indices,
  vaoId,
  vaoId,
  vboId
)
  return ffi.new(
    "rlVertexBuffer",
    elementCount,
    vertices,
    texcoords,
    normals,
    colors,
    indices,
    indices,
    indices,
    indices,
    indices,
    vaoId,
    vaoId,
    vboId
  )
end

---@class rlDrawCall
---@field mode number
---@field vertexCount number
---@field vertexAlignment number
---@field textureId number

--- of those state-change happens (this is done in core module)
---@param mode number
---@param vertexCount number
---@param vertexAlignment number
---@param textureId number
---@return rlDrawCall
function rl.rlDrawCall(mode, vertexCount, vertexAlignment, textureId)
  return ffi.new("rlDrawCall", mode, vertexCount, vertexAlignment, textureId)
end

---@class rlRenderBatch
---@field bufferCount number
---@field currentBuffer number
---@field vertexBuffer rlVertexBuffer
---@field draws rlDrawCall
---@field drawCounter number
---@field currentDepth number

--- rlRenderBatch type
---@param bufferCount number
---@param currentBuffer number
---@param vertexBuffer rlVertexBuffer
---@param draws rlDrawCall
---@param drawCounter number
---@param currentDepth number
---@return rlRenderBatch
function rl.rlRenderBatch(bufferCount, currentBuffer, vertexBuffer, draws, drawCounter, currentDepth)
  return ffi.new("rlRenderBatch", bufferCount, currentBuffer, vertexBuffer, draws, drawCounter, currentDepth)
end

---@class rlglData
---@field currentBatch rlRenderBatch
---@field defaultBatch rlRenderBatch
---@field vertexCounter number
---@field texcoordx number
---@field texcoordy number
---@field normalx number
---@field normaly number
---@field normalz number
---@field colorr string
---@field colorg string
---@field colorb string
---@field colora string
---@field currentMatrixMode number
---@field currentMatrix Matrix
---@field modelview Matrix
---@field projection Matrix
---@field transform Matrix
---@field transformRequired boolean
---@field stack Matrix[RL_MAX_MATRIX_STACK_SIZE]
---@field stackCounter number
---@field defaultTextureId number
---@field activeTextureId unsigned int[RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS]
---@field defaultVShaderId number
---@field defaultFShaderId number
---@field defaultShaderId number
---@field defaultShaderLocs number
---@field currentShaderId number
---@field currentShaderLocs number
---@field stereoRender boolean
---@field projectionStereo Matrix[] {Matrix, Matrix}
---@field viewOffsetStereo Matrix[] {Matrix, Matrix}
---@field currentBlendMode number
---@field glBlendSrcFactor number
---@field glBlendDstFactor number
---@field glBlendEquation number
---@field glBlendSrcFactorRGB number
---@field glBlendDestFactorRGB number
---@field glBlendSrcFactorAlpha number
---@field glBlendDestFactorAlpha number
---@field glBlendEquationRGB number
---@field glBlendEquationAlpha number
---@field glCustomBlendModeModified boolean
---@field framebufferWidth number
---@field framebufferHeight number

---
---@param currentBatch rlRenderBatch
---@param defaultBatch rlRenderBatch
---@param vertexCounter number
---@param texcoordx number
---@param texcoordy number
---@param normalx number
---@param normaly number
---@param normalz number
---@param colorr string
---@param colorg string
---@param colorb string
---@param colora string
---@param currentMatrixMode number
---@param currentMatrix Matrix
---@param modelview Matrix
---@param projection Matrix
---@param transform Matrix
---@param transformRequired boolean
---@param stack Matrix[RL_MAX_MATRIX_STACK_SIZE]
---@param stackCounter number
---@param defaultTextureId number
---@param activeTextureId unsigned int[RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS]
---@param defaultVShaderId number
---@param defaultFShaderId number
---@param defaultShaderId number
---@param defaultShaderLocs number
---@param currentShaderId number
---@param currentShaderLocs number
---@param stereoRender boolean
---@param projectionStereo Matrix[] {Matrix, Matrix}
---@param viewOffsetStereo Matrix[] {Matrix, Matrix}
---@param currentBlendMode number
---@param glBlendSrcFactor number
---@param glBlendDstFactor number
---@param glBlendEquation number
---@param glBlendSrcFactorRGB number
---@param glBlendDestFactorRGB number
---@param glBlendSrcFactorAlpha number
---@param glBlendDestFactorAlpha number
---@param glBlendEquationRGB number
---@param glBlendEquationAlpha number
---@param glCustomBlendModeModified boolean
---@param framebufferWidth number
---@param framebufferHeight number
---@return rlglData
function rl.rlglData(
  currentBatch,
  defaultBatch,
  vertexCounter,
  texcoordx,
  texcoordy,
  normalx,
  normaly,
  normalz,
  colorr,
  colorg,
  colorb,
  colora,
  currentMatrixMode,
  currentMatrix,
  modelview,
  projection,
  transform,
  transformRequired,
  stack,
  stackCounter,
  defaultTextureId,
  activeTextureId,
  defaultVShaderId,
  defaultFShaderId,
  defaultShaderId,
  defaultShaderLocs,
  currentShaderId,
  currentShaderLocs,
  stereoRender,
  projectionStereo,
  viewOffsetStereo,
  currentBlendMode,
  glBlendSrcFactor,
  glBlendDstFactor,
  glBlendEquation,
  glBlendSrcFactorRGB,
  glBlendDestFactorRGB,
  glBlendSrcFactorAlpha,
  glBlendDestFactorAlpha,
  glBlendEquationRGB,
  glBlendEquationAlpha,
  glCustomBlendModeModified,
  framebufferWidth,
  framebufferHeight
)
  return ffi.new(
    "rlglData",
    currentBatch,
    defaultBatch,
    vertexCounter,
    texcoordx,
    texcoordy,
    normalx,
    normaly,
    normalz,
    colorr,
    colorg,
    colorb,
    colora,
    currentMatrixMode,
    currentMatrix,
    modelview,
    projection,
    transform,
    transformRequired,
    stack,
    stackCounter,
    defaultTextureId,
    activeTextureId,
    defaultVShaderId,
    defaultFShaderId,
    defaultShaderId,
    defaultShaderLocs,
    currentShaderId,
    currentShaderLocs,
    stereoRender,
    projectionStereo,
    viewOffsetStereo,
    currentBlendMode,
    glBlendSrcFactor,
    glBlendDstFactor,
    glBlendEquation,
    glBlendSrcFactorRGB,
    glBlendDestFactorRGB,
    glBlendSrcFactorAlpha,
    glBlendDestFactorAlpha,
    glBlendEquationRGB,
    glBlendEquationAlpha,
    glCustomBlendModeModified,
    framebufferWidth,
    framebufferHeight
  )
end

---@class rl_float16
---@field v number[] {number, number, number, number, number, number, number, number, number, number, number, number, number, number, number, number}

--- Auxiliar matrix math functions
---@param v number[] {number, number, number, number, number, number, number, number, number, number, number, number, number, number, number, number}
---@return rl_float16
function rl.rl_float16(v)
  return ffi.new("rl_float16", v)
end

---@alias Quaternion Vector4
---@alias Texture2D Texture
---@alias TextureCubemap Texture
---@alias RenderTexture2D RenderTexture
---@alias Camera Camera3D

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
rl.KEY_MENU = 5

--- Key: Android volume up button
rl.KEY_VOLUME_UP = 24

--- Key: Android volume down button
rl.KEY_VOLUME_DOWN = 25

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

--- Gamepad right button right (i.e. PS3: Circle, Xbox: B)
rl.GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6

--- Gamepad right button down (i.e. PS3: Cross, Xbox: A)
rl.GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7

--- Gamepad right button left (i.e. PS3: Square, Xbox: X)
rl.GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8

--- Gamepad top/back trigger left (first), it could be a trailing button
rl.GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9

--- Gamepad top/back trigger left (second), it could be a trailing button
rl.GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10

--- Gamepad top/back trigger right (first), it could be a trailing button
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

--- Shader location: vertex attribute: boneIds
rl.SHADER_LOC_VERTEX_BONEIDS = 26

--- Shader location: vertex attribute: boneWeights
rl.SHADER_LOC_VERTEX_BONEWEIGHTS = 27

--- Shader location: array of matrices uniform: boneMatrices
rl.SHADER_LOC_BONE_MATRICES = 28

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

--- Shader attribute type: float
rl.SHADER_ATTRIB_FLOAT = 0

--- Shader attribute type: vec2 (2 float)
rl.SHADER_ATTRIB_VEC2 = 1

--- Shader attribute type: vec3 (3 float)
rl.SHADER_ATTRIB_VEC3 = 2

--- Shader attribute type: vec4 (4 float)
rl.SHADER_ATTRIB_VEC4 = 3

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

--- Repeats texture in tiled mode
rl.TEXTURE_WRAP_REPEAT = 0

--- Clamps texture to edge pixel in tiled mode
rl.TEXTURE_WRAP_CLAMP = 1

--- Mirrors and repeats the texture in tiled mode
rl.TEXTURE_WRAP_MIRROR_REPEAT = 2

--- Mirrors and clamps to border the texture in tiled mode
rl.TEXTURE_WRAP_MIRROR_CLAMP = 3

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

--- Default font generation, anti-aliased
rl.FONT_DEFAULT = 0

--- Bitmap font generation, no anti-aliasing
rl.FONT_BITMAP = 1

--- SDF font generation, requires external shader
rl.FONT_SDF = 2

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

--- Camera custom, controlled by user (UpdateCamera() does nothing)
rl.CAMERA_CUSTOM = 0

--- Camera free mode
rl.CAMERA_FREE = 1

--- Camera orbital, around target, zoom supported
rl.CAMERA_ORBITAL = 2

--- Camera first person
rl.CAMERA_FIRST_PERSON = 3

--- Camera third person
rl.CAMERA_THIRD_PERSON = 4

--- Perspective projection
rl.CAMERA_PERSPECTIVE = 0

--- Orthographic projection
rl.CAMERA_ORTHOGRAPHIC = 1

--- Npatch layout: 3x3 tiles
rl.NPATCH_NINE_PATCH = 0

--- Npatch layout: 1x3 tiles
rl.NPATCH_THREE_PATCH_VERTICAL = 1

--- Npatch layout: 3x1 tiles
rl.NPATCH_THREE_PATCH_HORIZONTAL = 2

--- OpenGL 1.1
rl.RL_OPENGL_11 = 1

--- OpenGL 2.1 (GLSL 120)
rl.RL_OPENGL_21 = 2

--- OpenGL 3.3 (GLSL 330)
rl.RL_OPENGL_33 = 3

--- OpenGL 4.3 (using GLSL 330)
rl.RL_OPENGL_43 = 4

--- OpenGL ES 2.0 (GLSL 100)
rl.RL_OPENGL_ES_20 = 5

--- OpenGL ES 3.0 (GLSL 300 es)
rl.RL_OPENGL_ES_30 = 6

--- Display all logs
rl.RL_LOG_ALL = 0

--- Trace logging, intended for internal use only
rl.RL_LOG_TRACE = 1

--- Debug logging, used for internal debugging, it should be disabled on release builds
rl.RL_LOG_DEBUG = 2

--- Info logging, used for program execution info
rl.RL_LOG_INFO = 3

--- Warning logging, used on recoverable failures
rl.RL_LOG_WARNING = 4

--- Error logging, used on unrecoverable failures
rl.RL_LOG_ERROR = 5

--- Fatal logging, used to abort program: exit(EXIT_FAILURE)
rl.RL_LOG_FATAL = 6

--- Disable logging
rl.RL_LOG_NONE = 7

--- 8 bit per pixel (no alpha)
rl.RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1

--- 8*2 bpp (2 channels)
rl.RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2

--- 16 bpp
rl.RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3

--- 24 bpp
rl.RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4

--- 16 bpp (1 bit alpha)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5

--- 16 bpp (4 bit alpha)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6

--- 32 bpp
rl.RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7

--- 32 bpp (1 channel - float)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R32 = 8

--- 32*3 bpp (3 channels - float)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9

--- 32*4 bpp (4 channels - float)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10

--- 16 bpp (1 channel - half float)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R16 = 11

--- 16*3 bpp (3 channels - half float)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12

--- 16*4 bpp (4 channels - half float)
rl.RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13

--- 4 bpp (no alpha)
rl.RL_PIXELFORMAT_COMPRESSED_DXT1_RGB = 14

--- 4 bpp (1 bit alpha)
rl.RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15

--- 8 bpp
rl.RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16

--- 8 bpp
rl.RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17

--- 4 bpp
rl.RL_PIXELFORMAT_COMPRESSED_ETC1_RGB = 18

--- 4 bpp
rl.RL_PIXELFORMAT_COMPRESSED_ETC2_RGB = 19

--- 8 bpp
rl.RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20

--- 4 bpp
rl.RL_PIXELFORMAT_COMPRESSED_PVRT_RGB = 21

--- 4 bpp
rl.RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22

--- 8 bpp
rl.RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 23

--- 2 bpp
rl.RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 24

--- No filter, just pixel approximation
rl.RL_TEXTURE_FILTER_POINT = 0

--- Linear filtering
rl.RL_TEXTURE_FILTER_BILINEAR = 1

--- Trilinear filtering (linear with mipmaps)
rl.RL_TEXTURE_FILTER_TRILINEAR = 2

--- Anisotropic filtering 4x
rl.RL_TEXTURE_FILTER_ANISOTROPIC_4X = 3

--- Anisotropic filtering 8x
rl.RL_TEXTURE_FILTER_ANISOTROPIC_8X = 4

--- Anisotropic filtering 16x
rl.RL_TEXTURE_FILTER_ANISOTROPIC_16X = 5

--- Blend textures considering alpha (default)
rl.RL_BLEND_ALPHA = 0

--- Blend textures adding colors
rl.RL_BLEND_ADDITIVE = 1

--- Blend textures multiplying colors
rl.RL_BLEND_MULTIPLIED = 2

--- Blend textures adding colors (alternative)
rl.RL_BLEND_ADD_COLORS = 3

--- Blend textures subtracting colors (alternative)
rl.RL_BLEND_SUBTRACT_COLORS = 4

--- Blend premultiplied textures considering alpha
rl.RL_BLEND_ALPHA_PREMULTIPLY = 5

--- Blend textures using custom src/dst factors (use rlSetBlendFactors())
rl.RL_BLEND_CUSTOM = 6

--- Blend textures using custom src/dst factors (use rlSetBlendFactorsSeparate())
rl.RL_BLEND_CUSTOM_SEPARATE = 7

--- Shader location: vertex attribute: position
rl.RL_SHADER_LOC_VERTEX_POSITION = 0

--- Shader location: vertex attribute: texcoord01
rl.RL_SHADER_LOC_VERTEX_TEXCOORD01 = 1

--- Shader location: vertex attribute: texcoord02
rl.RL_SHADER_LOC_VERTEX_TEXCOORD02 = 2

--- Shader location: vertex attribute: normal
rl.RL_SHADER_LOC_VERTEX_NORMAL = 3

--- Shader location: vertex attribute: tangent
rl.RL_SHADER_LOC_VERTEX_TANGENT = 4

--- Shader location: vertex attribute: color
rl.RL_SHADER_LOC_VERTEX_COLOR = 5

--- Shader location: matrix uniform: model-view-projection
rl.RL_SHADER_LOC_MATRIX_MVP = 6

--- Shader location: matrix uniform: view (camera transform)
rl.RL_SHADER_LOC_MATRIX_VIEW = 7

--- Shader location: matrix uniform: projection
rl.RL_SHADER_LOC_MATRIX_PROJECTION = 8

--- Shader location: matrix uniform: model (transform)
rl.RL_SHADER_LOC_MATRIX_MODEL = 9

--- Shader location: matrix uniform: normal
rl.RL_SHADER_LOC_MATRIX_NORMAL = 10

--- Shader location: vector uniform: view
rl.RL_SHADER_LOC_VECTOR_VIEW = 11

--- Shader location: vector uniform: diffuse color
rl.RL_SHADER_LOC_COLOR_DIFFUSE = 12

--- Shader location: vector uniform: specular color
rl.RL_SHADER_LOC_COLOR_SPECULAR = 13

--- Shader location: vector uniform: ambient color
rl.RL_SHADER_LOC_COLOR_AMBIENT = 14

--- Shader location: sampler2d texture: albedo (same as: RL_SHADER_LOC_MAP_DIFFUSE)
rl.RL_SHADER_LOC_MAP_ALBEDO = 15

--- Shader location: sampler2d texture: metalness (same as: RL_SHADER_LOC_MAP_SPECULAR)
rl.RL_SHADER_LOC_MAP_METALNESS = 16

--- Shader location: sampler2d texture: normal
rl.RL_SHADER_LOC_MAP_NORMAL = 17

--- Shader location: sampler2d texture: roughness
rl.RL_SHADER_LOC_MAP_ROUGHNESS = 18

--- Shader location: sampler2d texture: occlusion
rl.RL_SHADER_LOC_MAP_OCCLUSION = 19

--- Shader location: sampler2d texture: emission
rl.RL_SHADER_LOC_MAP_EMISSION = 20

--- Shader location: sampler2d texture: height
rl.RL_SHADER_LOC_MAP_HEIGHT = 21

--- Shader location: samplerCube texture: cubemap
rl.RL_SHADER_LOC_MAP_CUBEMAP = 22

--- Shader location: samplerCube texture: irradiance
rl.RL_SHADER_LOC_MAP_IRRADIANCE = 23

--- Shader location: samplerCube texture: prefilter
rl.RL_SHADER_LOC_MAP_PREFILTER = 24

--- Shader location: sampler2d texture: brdf
rl.RL_SHADER_LOC_MAP_BRDF = 25

--- Shader uniform type: float
rl.RL_SHADER_UNIFORM_FLOAT = 0

--- Shader uniform type: vec2 (2 float)
rl.RL_SHADER_UNIFORM_VEC2 = 1

--- Shader uniform type: vec3 (3 float)
rl.RL_SHADER_UNIFORM_VEC3 = 2

--- Shader uniform type: vec4 (4 float)
rl.RL_SHADER_UNIFORM_VEC4 = 3

--- Shader uniform type: int
rl.RL_SHADER_UNIFORM_INT = 4

--- Shader uniform type: ivec2 (2 int)
rl.RL_SHADER_UNIFORM_IVEC2 = 5

--- Shader uniform type: ivec3 (3 int)
rl.RL_SHADER_UNIFORM_IVEC3 = 6

--- Shader uniform type: ivec4 (4 int)
rl.RL_SHADER_UNIFORM_IVEC4 = 7

--- Shader uniform type: unsigned int
rl.RL_SHADER_UNIFORM_UINT = 8

--- Shader uniform type: uivec2 (2 unsigned int)
rl.RL_SHADER_UNIFORM_UIVEC2 = 9

--- Shader uniform type: uivec3 (3 unsigned int)
rl.RL_SHADER_UNIFORM_UIVEC3 = 10

--- Shader uniform type: uivec4 (4 unsigned int)
rl.RL_SHADER_UNIFORM_UIVEC4 = 11

--- Shader uniform type: sampler2d
rl.RL_SHADER_UNIFORM_SAMPLER2D = 12

--- Shader attribute type: float
rl.RL_SHADER_ATTRIB_FLOAT = 0

--- Shader attribute type: vec2 (2 float)
rl.RL_SHADER_ATTRIB_VEC2 = 1

--- Shader attribute type: vec3 (3 float)
rl.RL_SHADER_ATTRIB_VEC3 = 2

--- Shader attribute type: vec4 (4 float)
rl.RL_SHADER_ATTRIB_VEC4 = 3

--- Framebuffer attachment type: color 0
rl.RL_ATTACHMENT_COLOR_CHANNEL0 = 0

--- Framebuffer attachment type: color 1
rl.RL_ATTACHMENT_COLOR_CHANNEL1 = 1

--- Framebuffer attachment type: color 2
rl.RL_ATTACHMENT_COLOR_CHANNEL2 = 2

--- Framebuffer attachment type: color 3
rl.RL_ATTACHMENT_COLOR_CHANNEL3 = 3

--- Framebuffer attachment type: color 4
rl.RL_ATTACHMENT_COLOR_CHANNEL4 = 4

--- Framebuffer attachment type: color 5
rl.RL_ATTACHMENT_COLOR_CHANNEL5 = 5

--- Framebuffer attachment type: color 6
rl.RL_ATTACHMENT_COLOR_CHANNEL6 = 6

--- Framebuffer attachment type: color 7
rl.RL_ATTACHMENT_COLOR_CHANNEL7 = 7

--- Framebuffer attachment type: depth
rl.RL_ATTACHMENT_DEPTH = 100

--- Framebuffer attachment type: stencil
rl.RL_ATTACHMENT_STENCIL = 200

--- Framebuffer texture attachment type: cubemap, +X side
rl.RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0

--- Framebuffer texture attachment type: cubemap, -X side
rl.RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1

--- Framebuffer texture attachment type: cubemap, +Y side
rl.RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2

--- Framebuffer texture attachment type: cubemap, -Y side
rl.RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3

--- Framebuffer texture attachment type: cubemap, +Z side
rl.RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4

--- Framebuffer texture attachment type: cubemap, -Z side
rl.RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5

--- Framebuffer texture attachment type: texture2d
rl.RL_ATTACHMENT_TEXTURE2D = 100

--- Framebuffer texture attachment type: renderbuffer
rl.RL_ATTACHMENT_RENDERBUFFER = 200

---
rl.RL_CULL_FACE_FRONT = 0

---
rl.RL_CULL_FACE_BACK = 1

--- Initialize window and OpenGL context
---@param width number
---@param height number
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
---@return boolean
function rl.WindowShouldClose()
  return lib.WindowShouldClose()
end

--- Check if window has been initialized successfully
---@return boolean
function rl.IsWindowReady()
  return lib.IsWindowReady()
end

--- Check if window is currently fullscreen
---@return boolean
function rl.IsWindowFullscreen()
  return lib.IsWindowFullscreen()
end

--- Check if window is currently hidden
---@return boolean
function rl.IsWindowHidden()
  return lib.IsWindowHidden()
end

--- Check if window is currently minimized
---@return boolean
function rl.IsWindowMinimized()
  return lib.IsWindowMinimized()
end

--- Check if window is currently maximized
---@return boolean
function rl.IsWindowMaximized()
  return lib.IsWindowMaximized()
end

--- Check if window is currently focused
---@return boolean
function rl.IsWindowFocused()
  return lib.IsWindowFocused()
end

--- Check if window has been resized last frame
---@return boolean
function rl.IsWindowResized()
  return lib.IsWindowResized()
end

--- Check if one specific window flag is enabled
---@param flag number
---@return boolean
function rl.IsWindowState(flag)
  return lib.IsWindowState(flag)
end

--- Set window configuration state using flags
---@param flags number
---@return void
function rl.SetWindowState(flags)
  return lib.SetWindowState(flags)
end

--- Clear window configuration state flags
---@param flags number
---@return void
function rl.ClearWindowState(flags)
  return lib.ClearWindowState(flags)
end

--- Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
---@return void
function rl.ToggleFullscreen()
  return lib.ToggleFullscreen()
end

--- Toggle window state: borderless windowed, resizes window to match monitor resolution
---@return void
function rl.ToggleBorderlessWindowed()
  return lib.ToggleBorderlessWindowed()
end

--- Set window state: maximized, if resizable
---@return void
function rl.MaximizeWindow()
  return lib.MaximizeWindow()
end

--- Set window state: minimized, if resizable
---@return void
function rl.MinimizeWindow()
  return lib.MinimizeWindow()
end

--- Set window state: not minimized/maximized
---@return void
function rl.RestoreWindow()
  return lib.RestoreWindow()
end

--- Set icon for window (single image, RGBA 32bit)
---@param image Image
---@return void
function rl.SetWindowIcon(image)
  return lib.SetWindowIcon(image)
end

--- Set icon for window (multiple images, RGBA 32bit)
---@param images Image
---@param count number
---@return void
function rl.SetWindowIcons(images, count)
  return lib.SetWindowIcons(images, count)
end

--- Set title for window
---@param title string
---@return void
function rl.SetWindowTitle(title)
  return lib.SetWindowTitle(title)
end

--- Set window position on screen
---@param x number
---@param y number
---@return void
function rl.SetWindowPosition(x, y)
  return lib.SetWindowPosition(x, y)
end

--- Set monitor for the current window
---@param monitor number
---@return void
function rl.SetWindowMonitor(monitor)
  return lib.SetWindowMonitor(monitor)
end

--- Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
---@param width number
---@param height number
---@return void
function rl.SetWindowMinSize(width, height)
  return lib.SetWindowMinSize(width, height)
end

--- Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
---@param width number
---@param height number
---@return void
function rl.SetWindowMaxSize(width, height)
  return lib.SetWindowMaxSize(width, height)
end

--- Set window dimensions
---@param width number
---@param height number
---@return void
function rl.SetWindowSize(width, height)
  return lib.SetWindowSize(width, height)
end

--- Set window opacity [0.0f..1.0f]
---@param opacity number
---@return void
function rl.SetWindowOpacity(opacity)
  return lib.SetWindowOpacity(opacity)
end

--- Set window focused
---@return void
function rl.SetWindowFocused()
  return lib.SetWindowFocused()
end

--- Get native window handle
---@return void
function rl.GetWindowHandle()
  return lib.GetWindowHandle()
end

--- Get current screen width
---@return number
function rl.GetScreenWidth()
  return lib.GetScreenWidth()
end

--- Get current screen height
---@return number
function rl.GetScreenHeight()
  return lib.GetScreenHeight()
end

--- Get current render width (it considers HiDPI)
---@return number
function rl.GetRenderWidth()
  return lib.GetRenderWidth()
end

--- Get current render height (it considers HiDPI)
---@return number
function rl.GetRenderHeight()
  return lib.GetRenderHeight()
end

--- Get number of connected monitors
---@return number
function rl.GetMonitorCount()
  return lib.GetMonitorCount()
end

--- Get current monitor where window is placed
---@return number
function rl.GetCurrentMonitor()
  return lib.GetCurrentMonitor()
end

--- Get specified monitor position
---@param monitor number
---@return Vector2
function rl.GetMonitorPosition(monitor)
  return lib.GetMonitorPosition(monitor)
end

--- Get specified monitor width (current video mode used by monitor)
---@param monitor number
---@return number
function rl.GetMonitorWidth(monitor)
  return lib.GetMonitorWidth(monitor)
end

--- Get specified monitor height (current video mode used by monitor)
---@param monitor number
---@return number
function rl.GetMonitorHeight(monitor)
  return lib.GetMonitorHeight(monitor)
end

--- Get specified monitor physical width in millimetres
---@param monitor number
---@return number
function rl.GetMonitorPhysicalWidth(monitor)
  return lib.GetMonitorPhysicalWidth(monitor)
end

--- Get specified monitor physical height in millimetres
---@param monitor number
---@return number
function rl.GetMonitorPhysicalHeight(monitor)
  return lib.GetMonitorPhysicalHeight(monitor)
end

--- Get specified monitor refresh rate
---@param monitor number
---@return number
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
---@param monitor number
---@return string
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
---@return string
function rl.GetClipboardText()
  return lib.GetClipboardText()
end

--- Get clipboard image content
---@return Image
function rl.GetClipboardImage()
  return lib.GetClipboardImage()
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
---@return boolean
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
---@return boolean
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
---@param mode number
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
---@param x number
---@param y number
---@param width number
---@param height number
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

--- Check if a shader is valid (loaded on GPU)
---@param shader Shader
---@return boolean
function rl.IsShaderValid(shader)
  return lib.IsShaderValid(shader)
end

--- Get shader uniform location
---@param shader Shader
---@param uniformName string
---@return number
function rl.GetShaderLocation(shader, uniformName)
  return lib.GetShaderLocation(shader, uniformName)
end

--- Get shader attribute location
---@param shader Shader
---@param attribName string
---@return number
function rl.GetShaderLocationAttrib(shader, attribName)
  return lib.GetShaderLocationAttrib(shader, attribName)
end

--- Set shader uniform value
---@param shader Shader
---@param locIndex number
---@param value const void
---@param uniformType number
---@return void
function rl.SetShaderValue(shader, locIndex, value, uniformType)
  return lib.SetShaderValue(shader, locIndex, value, uniformType)
end

--- Set shader uniform value vector
---@param shader Shader
---@param locIndex number
---@param value const void
---@param uniformType number
---@param count number
---@return void
function rl.SetShaderValueV(shader, locIndex, value, uniformType, count)
  return lib.SetShaderValueV(shader, locIndex, value, uniformType, count)
end

--- Set shader uniform value (matrix 4x4)
---@param shader Shader
---@param locIndex number
---@param mat Matrix
---@return void
function rl.SetShaderValueMatrix(shader, locIndex, mat)
  return lib.SetShaderValueMatrix(shader, locIndex, mat)
end

--- Set shader uniform value for texture (sampler2d)
---@param shader Shader
---@param locIndex number
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

--- Get a ray trace from screen position (i.e mouse)
---@param position Vector2
---@param camera Camera
---@return Ray
function rl.GetScreenToWorldRay(position, camera)
  return lib.GetScreenToWorldRay(position, camera)
end

--- Get a ray trace from screen position (i.e mouse) in a viewport
---@param position Vector2
---@param camera Camera
---@param width number
---@param height number
---@return Ray
function rl.GetScreenToWorldRayEx(position, camera, width, height)
  return lib.GetScreenToWorldRayEx(position, camera, width, height)
end

--- Get the screen space position for a 3d world space position
---@param position Vector3
---@param camera Camera
---@return Vector2
function rl.GetWorldToScreen(position, camera)
  return lib.GetWorldToScreen(position, camera)
end

--- Get size position for a 3d world space position
---@param position Vector3
---@param camera Camera
---@param width number
---@param height number
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

--- Get the world space position for a 2d camera screen space position
---@param position Vector2
---@param camera Camera2D
---@return Vector2
function rl.GetScreenToWorld2D(position, camera)
  return lib.GetScreenToWorld2D(position, camera)
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

--- Set target FPS (maximum)
---@param fps number
---@return void
function rl.SetTargetFPS(fps)
  return lib.SetTargetFPS(fps)
end

--- Get time in seconds for last frame drawn (delta time)
---@return number
function rl.GetFrameTime()
  return lib.GetFrameTime()
end

--- Get elapsed time in seconds since InitWindow()
---@return number
function rl.GetTime()
  return lib.GetTime()
end

--- Get current FPS
---@return number
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
---@param seconds number
---@return void
function rl.WaitTime(seconds)
  return lib.WaitTime(seconds)
end

--- Set the seed for the random number generator
---@param seed number
---@return void
function rl.SetRandomSeed(seed)
  return lib.SetRandomSeed(seed)
end

--- Get a random value between min and max (both included)
---@param min number
---@param max number
---@return number
function rl.GetRandomValue(min, max)
  return lib.GetRandomValue(min, max)
end

--- Load random values sequence, no values repeated
---@param count number
---@param min number
---@param max number
---@return number
function rl.LoadRandomSequence(count, min, max)
  return lib.LoadRandomSequence(count, min, max)
end

--- Unload random values sequence
---@param sequence number
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
---@param flags number
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
---@param logLevel number
---@param text string
---@param args ...
---@return void
function rl.TraceLog(logLevel, text, args)
  return lib.TraceLog(logLevel, text, args)
end

--- Set the current threshold (minimum) log level
---@param logLevel number
---@return void
function rl.SetTraceLogLevel(logLevel)
  return lib.SetTraceLogLevel(logLevel)
end

--- Internal memory allocator
---@param size number
---@return void
function rl.MemAlloc(size)
  return lib.MemAlloc(size)
end

--- Internal memory reallocator
---@param ptr void
---@param size number
---@return void
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
---@param dataSize number
---@return string
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
---@param dataSize number
---@return boolean
function rl.SaveFileData(fileName, data, dataSize)
  return lib.SaveFileData(fileName, data, dataSize)
end

--- Export data to code (.h), returns true on success
---@param data string
---@param dataSize number
---@param fileName string
---@return boolean
function rl.ExportDataAsCode(data, dataSize, fileName)
  return lib.ExportDataAsCode(data, dataSize, fileName)
end

--- Load text data from file (read), returns a '\0' terminated string
---@param fileName string
---@return string
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
---@return boolean
function rl.SaveFileText(fileName, text)
  return lib.SaveFileText(fileName, text)
end

--- Check if file exists
---@param fileName string
---@return boolean
function rl.FileExists(fileName)
  return lib.FileExists(fileName)
end

--- Check if a directory path exists
---@param dirPath string
---@return boolean
function rl.DirectoryExists(dirPath)
  return lib.DirectoryExists(dirPath)
end

--- Check file extension (including point: .png, .wav)
---@param fileName string
---@param ext string
---@return boolean
function rl.IsFileExtension(fileName, ext)
  return lib.IsFileExtension(fileName, ext)
end

--- Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
---@param fileName string
---@return number
function rl.GetFileLength(fileName)
  return lib.GetFileLength(fileName)
end

--- Get pointer to extension for a filename string (includes dot: '.png')
---@param fileName string
---@return string
function rl.GetFileExtension(fileName)
  return lib.GetFileExtension(fileName)
end

--- Get pointer to filename for a path string
---@param filePath string
---@return string
function rl.GetFileName(filePath)
  return lib.GetFileName(filePath)
end

--- Get filename string without extension (uses static string)
---@param filePath string
---@return string
function rl.GetFileNameWithoutExt(filePath)
  return lib.GetFileNameWithoutExt(filePath)
end

--- Get full path for a given fileName with path (uses static string)
---@param filePath string
---@return string
function rl.GetDirectoryPath(filePath)
  return lib.GetDirectoryPath(filePath)
end

--- Get previous directory path for a given path (uses static string)
---@param dirPath string
---@return string
function rl.GetPrevDirectoryPath(dirPath)
  return lib.GetPrevDirectoryPath(dirPath)
end

--- Get current working directory (uses static string)
---@return string
function rl.GetWorkingDirectory()
  return lib.GetWorkingDirectory()
end

--- Get the directory of the running application (uses static string)
---@return string
function rl.GetApplicationDirectory()
  return lib.GetApplicationDirectory()
end

--- Create directories (including full path requested), returns 0 on success
---@param dirPath string
---@return number
function rl.MakeDirectory(dirPath)
  return lib.MakeDirectory(dirPath)
end

--- Change working directory, return true on success
---@param dir string
---@return boolean
function rl.ChangeDirectory(dir)
  return lib.ChangeDirectory(dir)
end

--- Check if a given path is a file or a directory
---@param path string
---@return boolean
function rl.IsPathFile(path)
  return lib.IsPathFile(path)
end

--- Check if fileName is valid for the platform/OS
---@param fileName string
---@return boolean
function rl.IsFileNameValid(fileName)
  return lib.IsFileNameValid(fileName)
end

--- Load directory filepaths
---@param dirPath string
---@return FilePathList
function rl.LoadDirectoryFiles(dirPath)
  return lib.LoadDirectoryFiles(dirPath)
end

--- Load directory filepaths with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result
---@param basePath string
---@param filter string
---@param scanSubdirs boolean
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
---@return boolean
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
---@param dataSize number
---@param compDataSize number
---@return string
function rl.CompressData(data, dataSize, compDataSize)
  return lib.CompressData(data, dataSize, compDataSize)
end

--- Decompress data (DEFLATE algorithm), memory must be MemFree()
---@param compData string
---@param compDataSize number
---@param dataSize number
---@return string
function rl.DecompressData(compData, compDataSize, dataSize)
  return lib.DecompressData(compData, compDataSize, dataSize)
end

--- Encode data to Base64 string, memory must be MemFree()
---@param data string
---@param dataSize number
---@param outputSize number
---@return string
function rl.EncodeDataBase64(data, dataSize, outputSize)
  return lib.EncodeDataBase64(data, dataSize, outputSize)
end

--- Decode Base64 string data, memory must be MemFree()
---@param data string
---@param outputSize number
---@return string
function rl.DecodeDataBase64(data, outputSize)
  return lib.DecodeDataBase64(data, outputSize)
end

--- Compute CRC32 hash code
---@param data string
---@param dataSize number
---@return number
function rl.ComputeCRC32(data, dataSize)
  return lib.ComputeCRC32(data, dataSize)
end

--- Compute MD5 hash code, returns static int[4] (16 bytes)
---@param data string
---@param dataSize number
---@return number
function rl.ComputeMD5(data, dataSize)
  return lib.ComputeMD5(data, dataSize)
end

--- Compute SHA1 hash code, returns static int[5] (20 bytes)
---@param data string
---@param dataSize number
---@return number
function rl.ComputeSHA1(data, dataSize)
  return lib.ComputeSHA1(data, dataSize)
end

--- Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
---@param fileName string
---@return AutomationEventList
function rl.LoadAutomationEventList(fileName)
  return lib.LoadAutomationEventList(fileName)
end

--- Unload automation events list from file
---@param list AutomationEventList
---@return void
function rl.UnloadAutomationEventList(list)
  return lib.UnloadAutomationEventList(list)
end

--- Export automation events list as text file
---@param list AutomationEventList
---@param fileName string
---@return boolean
function rl.ExportAutomationEventList(list, fileName)
  return lib.ExportAutomationEventList(list, fileName)
end

--- Set automation event list to record to
---@param list AutomationEventList
---@return void
function rl.SetAutomationEventList(list)
  return lib.SetAutomationEventList(list)
end

--- Set automation event internal base frame to start recording
---@param frame number
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
---@param key number
---@return boolean
function rl.IsKeyPressed(key)
  return lib.IsKeyPressed(key)
end

--- Check if a key has been pressed again
---@param key number
---@return boolean
function rl.IsKeyPressedRepeat(key)
  return lib.IsKeyPressedRepeat(key)
end

--- Check if a key is being pressed
---@param key number
---@return boolean
function rl.IsKeyDown(key)
  return lib.IsKeyDown(key)
end

--- Check if a key has been released once
---@param key number
---@return boolean
function rl.IsKeyReleased(key)
  return lib.IsKeyReleased(key)
end

--- Check if a key is NOT being pressed
---@param key number
---@return boolean
function rl.IsKeyUp(key)
  return lib.IsKeyUp(key)
end

--- Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
---@return number
function rl.GetKeyPressed()
  return lib.GetKeyPressed()
end

--- Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
---@return number
function rl.GetCharPressed()
  return lib.GetCharPressed()
end

--- Set a custom key to exit program (default is ESC)
---@param key number
---@return void
function rl.SetExitKey(key)
  return lib.SetExitKey(key)
end

--- Check if a gamepad is available
---@param gamepad number
---@return boolean
function rl.IsGamepadAvailable(gamepad)
  return lib.IsGamepadAvailable(gamepad)
end

--- Get gamepad internal name id
---@param gamepad number
---@return string
function rl.GetGamepadName(gamepad)
  return lib.GetGamepadName(gamepad)
end

--- Check if a gamepad button has been pressed once
---@param gamepad number
---@param button number
---@return boolean
function rl.IsGamepadButtonPressed(gamepad, button)
  return lib.IsGamepadButtonPressed(gamepad, button)
end

--- Check if a gamepad button is being pressed
---@param gamepad number
---@param button number
---@return boolean
function rl.IsGamepadButtonDown(gamepad, button)
  return lib.IsGamepadButtonDown(gamepad, button)
end

--- Check if a gamepad button has been released once
---@param gamepad number
---@param button number
---@return boolean
function rl.IsGamepadButtonReleased(gamepad, button)
  return lib.IsGamepadButtonReleased(gamepad, button)
end

--- Check if a gamepad button is NOT being pressed
---@param gamepad number
---@param button number
---@return boolean
function rl.IsGamepadButtonUp(gamepad, button)
  return lib.IsGamepadButtonUp(gamepad, button)
end

--- Get the last gamepad button pressed
---@return number
function rl.GetGamepadButtonPressed()
  return lib.GetGamepadButtonPressed()
end

--- Get gamepad axis count for a gamepad
---@param gamepad number
---@return number
function rl.GetGamepadAxisCount(gamepad)
  return lib.GetGamepadAxisCount(gamepad)
end

--- Get axis movement value for a gamepad axis
---@param gamepad number
---@param axis number
---@return number
function rl.GetGamepadAxisMovement(gamepad, axis)
  return lib.GetGamepadAxisMovement(gamepad, axis)
end

--- Set internal gamepad mappings (SDL_GameControllerDB)
---@param mappings string
---@return number
function rl.SetGamepadMappings(mappings)
  return lib.SetGamepadMappings(mappings)
end

--- Set gamepad vibration for both motors (duration in seconds)
---@param gamepad number
---@param leftMotor number
---@param rightMotor number
---@param duration number
---@return void
function rl.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration)
  return lib.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration)
end

--- Check if a mouse button has been pressed once
---@param button number
---@return boolean
function rl.IsMouseButtonPressed(button)
  return lib.IsMouseButtonPressed(button)
end

--- Check if a mouse button is being pressed
---@param button number
---@return boolean
function rl.IsMouseButtonDown(button)
  return lib.IsMouseButtonDown(button)
end

--- Check if a mouse button has been released once
---@param button number
---@return boolean
function rl.IsMouseButtonReleased(button)
  return lib.IsMouseButtonReleased(button)
end

--- Check if a mouse button is NOT being pressed
---@param button number
---@return boolean
function rl.IsMouseButtonUp(button)
  return lib.IsMouseButtonUp(button)
end

--- Get mouse position X
---@return number
function rl.GetMouseX()
  return lib.GetMouseX()
end

--- Get mouse position Y
---@return number
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
---@param x number
---@param y number
---@return void
function rl.SetMousePosition(x, y)
  return lib.SetMousePosition(x, y)
end

--- Set mouse offset
---@param offsetX number
---@param offsetY number
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
---@return number
function rl.GetMouseWheelMove()
  return lib.GetMouseWheelMove()
end

--- Get mouse wheel movement for both X and Y
---@return Vector2
function rl.GetMouseWheelMoveV()
  return lib.GetMouseWheelMoveV()
end

--- Set mouse cursor
---@param cursor number
---@return void
function rl.SetMouseCursor(cursor)
  return lib.SetMouseCursor(cursor)
end

--- Get touch position X for touch point 0 (relative to screen size)
---@return number
function rl.GetTouchX()
  return lib.GetTouchX()
end

--- Get touch position Y for touch point 0 (relative to screen size)
---@return number
function rl.GetTouchY()
  return lib.GetTouchY()
end

--- Get touch position XY for a touch point index (relative to screen size)
---@param index number
---@return Vector2
function rl.GetTouchPosition(index)
  return lib.GetTouchPosition(index)
end

--- Get touch point identifier for given index
---@param index number
---@return number
function rl.GetTouchPointId(index)
  return lib.GetTouchPointId(index)
end

--- Get number of touch points
---@return number
function rl.GetTouchPointCount()
  return lib.GetTouchPointCount()
end

--- Enable a set of gestures using flags
---@param flags number
---@return void
function rl.SetGesturesEnabled(flags)
  return lib.SetGesturesEnabled(flags)
end

--- Check if a gesture have been detected
---@param gesture number
---@return boolean
function rl.IsGestureDetected(gesture)
  return lib.IsGestureDetected(gesture)
end

--- Get latest detected gesture
---@return number
function rl.GetGestureDetected()
  return lib.GetGestureDetected()
end

--- Get gesture hold time in seconds
---@return number
function rl.GetGestureHoldDuration()
  return lib.GetGestureHoldDuration()
end

--- Get gesture drag vector
---@return Vector2
function rl.GetGestureDragVector()
  return lib.GetGestureDragVector()
end

--- Get gesture drag angle
---@return number
function rl.GetGestureDragAngle()
  return lib.GetGestureDragAngle()
end

--- Get gesture pinch delta
---@return Vector2
function rl.GetGesturePinchVector()
  return lib.GetGesturePinchVector()
end

--- Get gesture pinch angle
---@return number
function rl.GetGesturePinchAngle()
  return lib.GetGesturePinchAngle()
end

--- Update camera position for selected mode
---@param camera Camera
---@param mode number
---@return void
function rl.UpdateCamera(camera, mode)
  return lib.UpdateCamera(camera, mode)
end

--- Update camera movement/rotation
---@param camera Camera
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

--- Get texture that is used for shapes drawing
---@return Texture2D
function rl.GetShapesTexture()
  return lib.GetShapesTexture()
end

--- Get texture source rectangle that is used for shapes drawing
---@return Rectangle
function rl.GetShapesTextureRectangle()
  return lib.GetShapesTextureRectangle()
end

--- Draw a pixel using geometry [Can be slow, use with care]
---@param posX number
---@param posY number
---@param color Color
---@return void
function rl.DrawPixel(posX, posY, color)
  return lib.DrawPixel(posX, posY, color)
end

--- Draw a pixel using geometry (Vector version) [Can be slow, use with care]
---@param position Vector2
---@param color Color
---@return void
function rl.DrawPixelV(position, color)
  return lib.DrawPixelV(position, color)
end

--- Draw a line
---@param startPosX number
---@param startPosY number
---@param endPosX number
---@param endPosY number
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
---@param points const Vector2
---@param pointCount number
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
---@param centerX number
---@param centerY number
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
---@param segments number
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
---@param segments number
---@param color Color
---@return void
function rl.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
  return lib.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
end

--- Draw a gradient-filled circle
---@param centerX number
---@param centerY number
---@param radius number
---@param inner Color
---@param outer Color
---@return void
function rl.DrawCircleGradient(centerX, centerY, radius, inner, outer)
  return lib.DrawCircleGradient(centerX, centerY, radius, inner, outer)
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
---@param centerX number
---@param centerY number
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
---@param centerX number
---@param centerY number
---@param radiusH number
---@param radiusV number
---@param color Color
---@return void
function rl.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
  return lib.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
end

--- Draw ellipse outline
---@param centerX number
---@param centerY number
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
---@param segments number
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
---@param segments number
---@param color Color
---@return void
function rl.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
  return lib.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
end

--- Draw a color-filled rectangle
---@param posX number
---@param posY number
---@param width number
---@param height number
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
---@param posX number
---@param posY number
---@param width number
---@param height number
---@param top Color
---@param bottom Color
---@return void
function rl.DrawRectangleGradientV(posX, posY, width, height, top, bottom)
  return lib.DrawRectangleGradientV(posX, posY, width, height, top, bottom)
end

--- Draw a horizontal-gradient-filled rectangle
---@param posX number
---@param posY number
---@param width number
---@param height number
---@param left Color
---@param right Color
---@return void
function rl.DrawRectangleGradientH(posX, posY, width, height, left, right)
  return lib.DrawRectangleGradientH(posX, posY, width, height, left, right)
end

--- Draw a gradient-filled rectangle with custom vertex colors
---@param rec Rectangle
---@param topLeft Color
---@param bottomLeft Color
---@param topRight Color
---@param bottomRight Color
---@return void
function rl.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight)
  return lib.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight)
end

--- Draw rectangle outline
---@param posX number
---@param posY number
---@param width number
---@param height number
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
---@param segments number
---@param color Color
---@return void
function rl.DrawRectangleRounded(rec, roundness, segments, color)
  return lib.DrawRectangleRounded(rec, roundness, segments, color)
end

--- Draw rectangle lines with rounded edges
---@param rec Rectangle
---@param roundness number
---@param segments number
---@param color Color
---@return void
function rl.DrawRectangleRoundedLines(rec, roundness, segments, color)
  return lib.DrawRectangleRoundedLines(rec, roundness, segments, color)
end

--- Draw rectangle with rounded edges outline
---@param rec Rectangle
---@param roundness number
---@param segments number
---@param lineThick number
---@param color Color
---@return void
function rl.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color)
  return lib.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color)
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
---@param points const Vector2
---@param pointCount number
---@param color Color
---@return void
function rl.DrawTriangleFan(points, pointCount, color)
  return lib.DrawTriangleFan(points, pointCount, color)
end

--- Draw a triangle strip defined by points
---@param points const Vector2
---@param pointCount number
---@param color Color
---@return void
function rl.DrawTriangleStrip(points, pointCount, color)
  return lib.DrawTriangleStrip(points, pointCount, color)
end

--- Draw a regular polygon (Vector version)
---@param center Vector2
---@param sides number
---@param radius number
---@param rotation number
---@param color Color
---@return void
function rl.DrawPoly(center, sides, radius, rotation, color)
  return lib.DrawPoly(center, sides, radius, rotation, color)
end

--- Draw a polygon outline of n sides
---@param center Vector2
---@param sides number
---@param radius number
---@param rotation number
---@param color Color
---@return void
function rl.DrawPolyLines(center, sides, radius, rotation, color)
  return lib.DrawPolyLines(center, sides, radius, rotation, color)
end

--- Draw a polygon outline of n sides with extended parameters
---@param center Vector2
---@param sides number
---@param radius number
---@param rotation number
---@param lineThick number
---@param color Color
---@return void
function rl.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
  return lib.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
end

--- Draw spline: Linear, minimum 2 points
---@param points const Vector2
---@param pointCount number
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineLinear(points, pointCount, thick, color)
  return lib.DrawSplineLinear(points, pointCount, thick, color)
end

--- Draw spline: B-Spline, minimum 4 points
---@param points const Vector2
---@param pointCount number
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineBasis(points, pointCount, thick, color)
  return lib.DrawSplineBasis(points, pointCount, thick, color)
end

--- Draw spline: Catmull-Rom, minimum 4 points
---@param points const Vector2
---@param pointCount number
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineCatmullRom(points, pointCount, thick, color)
  return lib.DrawSplineCatmullRom(points, pointCount, thick, color)
end

--- Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
---@param points const Vector2
---@param pointCount number
---@param thick number
---@param color Color
---@return void
function rl.DrawSplineBezierQuadratic(points, pointCount, thick, color)
  return lib.DrawSplineBezierQuadratic(points, pointCount, thick, color)
end

--- Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
---@param points const Vector2
---@param pointCount number
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
---@return boolean
function rl.CheckCollisionRecs(rec1, rec2)
  return lib.CheckCollisionRecs(rec1, rec2)
end

--- Check collision between two circles
---@param center1 Vector2
---@param radius1 number
---@param center2 Vector2
---@param radius2 number
---@return boolean
function rl.CheckCollisionCircles(center1, radius1, center2, radius2)
  return lib.CheckCollisionCircles(center1, radius1, center2, radius2)
end

--- Check collision between circle and rectangle
---@param center Vector2
---@param radius number
---@param rec Rectangle
---@return boolean
function rl.CheckCollisionCircleRec(center, radius, rec)
  return lib.CheckCollisionCircleRec(center, radius, rec)
end

--- Check if circle collides with a line created betweeen two points [p1] and [p2]
---@param center Vector2
---@param radius number
---@param p1 Vector2
---@param p2 Vector2
---@return boolean
function rl.CheckCollisionCircleLine(center, radius, p1, p2)
  return lib.CheckCollisionCircleLine(center, radius, p1, p2)
end

--- Check if point is inside rectangle
---@param point Vector2
---@param rec Rectangle
---@return boolean
function rl.CheckCollisionPointRec(point, rec)
  return lib.CheckCollisionPointRec(point, rec)
end

--- Check if point is inside circle
---@param point Vector2
---@param center Vector2
---@param radius number
---@return boolean
function rl.CheckCollisionPointCircle(point, center, radius)
  return lib.CheckCollisionPointCircle(point, center, radius)
end

--- Check if point is inside a triangle
---@param point Vector2
---@param p1 Vector2
---@param p2 Vector2
---@param p3 Vector2
---@return boolean
function rl.CheckCollisionPointTriangle(point, p1, p2, p3)
  return lib.CheckCollisionPointTriangle(point, p1, p2, p3)
end

--- Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
---@param point Vector2
---@param p1 Vector2
---@param p2 Vector2
---@param threshold number
---@return boolean
function rl.CheckCollisionPointLine(point, p1, p2, threshold)
  return lib.CheckCollisionPointLine(point, p1, p2, threshold)
end

--- Check if point is within a polygon described by array of vertices
---@param point Vector2
---@param points const Vector2
---@param pointCount number
---@return boolean
function rl.CheckCollisionPointPoly(point, points, pointCount)
  return lib.CheckCollisionPointPoly(point, points, pointCount)
end

--- Check the collision between two lines defined by two points each, returns collision point by reference
---@param startPos1 Vector2
---@param endPos1 Vector2
---@param startPos2 Vector2
---@param endPos2 Vector2
---@param collisionPoint Vector2
---@return boolean
function rl.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
  return lib.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
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
---@param width number
---@param height number
---@param format number
---@param headerSize number
---@return Image
function rl.LoadImageRaw(fileName, width, height, format, headerSize)
  return lib.LoadImageRaw(fileName, width, height, format, headerSize)
end

--- Load image sequence from file (frames appended to image.data)
---@param fileName string
---@param frames number
---@return Image
function rl.LoadImageAnim(fileName, frames)
  return lib.LoadImageAnim(fileName, frames)
end

--- Load image sequence from memory buffer
---@param fileType string
---@param fileData string
---@param dataSize number
---@param frames number
---@return Image
function rl.LoadImageAnimFromMemory(fileType, fileData, dataSize, frames)
  return lib.LoadImageAnimFromMemory(fileType, fileData, dataSize, frames)
end

--- Load image from memory buffer, fileType refers to extension: i.e. '.png'
---@param fileType string
---@param fileData string
---@param dataSize number
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

--- Check if an image is valid (data and parameters)
---@param image Image
---@return boolean
function rl.IsImageValid(image)
  return lib.IsImageValid(image)
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
---@return boolean
function rl.ExportImage(image, fileName)
  return lib.ExportImage(image, fileName)
end

--- Export image to memory buffer
---@param image Image
---@param fileType string
---@param fileSize number
---@return string
function rl.ExportImageToMemory(image, fileType, fileSize)
  return lib.ExportImageToMemory(image, fileType, fileSize)
end

--- Export image as code file defining an array of bytes, returns true on success
---@param image Image
---@param fileName string
---@return boolean
function rl.ExportImageAsCode(image, fileName)
  return lib.ExportImageAsCode(image, fileName)
end

--- Generate image: plain color
---@param width number
---@param height number
---@param color Color
---@return Image
function rl.GenImageColor(width, height, color)
  return lib.GenImageColor(width, height, color)
end

--- Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
---@param width number
---@param height number
---@param direction number
---@param start Color
---@param ending Color
---@return Image
function rl.GenImageGradientLinear(width, height, direction, start, ending)
  return lib.GenImageGradientLinear(width, height, direction, start, ending)
end

--- Generate image: radial gradient
---@param width number
---@param height number
---@param density number
---@param inner Color
---@param outer Color
---@return Image
function rl.GenImageGradientRadial(width, height, density, inner, outer)
  return lib.GenImageGradientRadial(width, height, density, inner, outer)
end

--- Generate image: square gradient
---@param width number
---@param height number
---@param density number
---@param inner Color
---@param outer Color
---@return Image
function rl.GenImageGradientSquare(width, height, density, inner, outer)
  return lib.GenImageGradientSquare(width, height, density, inner, outer)
end

--- Generate image: checked
---@param width number
---@param height number
---@param checksX number
---@param checksY number
---@param col1 Color
---@param col2 Color
---@return Image
function rl.GenImageChecked(width, height, checksX, checksY, col1, col2)
  return lib.GenImageChecked(width, height, checksX, checksY, col1, col2)
end

--- Generate image: white noise
---@param width number
---@param height number
---@param factor number
---@return Image
function rl.GenImageWhiteNoise(width, height, factor)
  return lib.GenImageWhiteNoise(width, height, factor)
end

--- Generate image: perlin noise
---@param width number
---@param height number
---@param offsetX number
---@param offsetY number
---@param scale number
---@return Image
function rl.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
  return lib.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
end

--- Generate image: cellular algorithm, bigger tileSize means bigger cells
---@param width number
---@param height number
---@param tileSize number
---@return Image
function rl.GenImageCellular(width, height, tileSize)
  return lib.GenImageCellular(width, height, tileSize)
end

--- Generate image: grayscale image from text data
---@param width number
---@param height number
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

--- Create an image from a selected channel of another image (GRAYSCALE)
---@param image Image
---@param selectedChannel number
---@return Image
function rl.ImageFromChannel(image, selectedChannel)
  return lib.ImageFromChannel(image, selectedChannel)
end

--- Create an image from text (default font)
---@param text string
---@param fontSize number
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
---@param image Image
---@param newFormat number
---@return void
function rl.ImageFormat(image, newFormat)
  return lib.ImageFormat(image, newFormat)
end

--- Convert image to POT (power-of-two)
---@param image Image
---@param fill Color
---@return void
function rl.ImageToPOT(image, fill)
  return lib.ImageToPOT(image, fill)
end

--- Crop an image to a defined rectangle
---@param image Image
---@param crop Rectangle
---@return void
function rl.ImageCrop(image, crop)
  return lib.ImageCrop(image, crop)
end

--- Crop image depending on alpha value
---@param image Image
---@param threshold number
---@return void
function rl.ImageAlphaCrop(image, threshold)
  return lib.ImageAlphaCrop(image, threshold)
end

--- Clear alpha channel to desired color
---@param image Image
---@param color Color
---@param threshold number
---@return void
function rl.ImageAlphaClear(image, color, threshold)
  return lib.ImageAlphaClear(image, color, threshold)
end

--- Apply alpha mask to image
---@param image Image
---@param alphaMask Image
---@return void
function rl.ImageAlphaMask(image, alphaMask)
  return lib.ImageAlphaMask(image, alphaMask)
end

--- Premultiply alpha channel
---@param image Image
---@return void
function rl.ImageAlphaPremultiply(image)
  return lib.ImageAlphaPremultiply(image)
end

--- Apply Gaussian blur using a box blur approximation
---@param image Image
---@param blurSize number
---@return void
function rl.ImageBlurGaussian(image, blurSize)
  return lib.ImageBlurGaussian(image, blurSize)
end

--- Apply custom square convolution kernel to image
---@param image Image
---@param kernel const float
---@param kernelSize number
---@return void
function rl.ImageKernelConvolution(image, kernel, kernelSize)
  return lib.ImageKernelConvolution(image, kernel, kernelSize)
end

--- Resize image (Bicubic scaling algorithm)
---@param image Image
---@param newWidth number
---@param newHeight number
---@return void
function rl.ImageResize(image, newWidth, newHeight)
  return lib.ImageResize(image, newWidth, newHeight)
end

--- Resize image (Nearest-Neighbor scaling algorithm)
---@param image Image
---@param newWidth number
---@param newHeight number
---@return void
function rl.ImageResizeNN(image, newWidth, newHeight)
  return lib.ImageResizeNN(image, newWidth, newHeight)
end

--- Resize canvas and fill with color
---@param image Image
---@param newWidth number
---@param newHeight number
---@param offsetX number
---@param offsetY number
---@param fill Color
---@return void
function rl.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
  return lib.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
end

--- Compute all mipmap levels for a provided image
---@param image Image
---@return void
function rl.ImageMipmaps(image)
  return lib.ImageMipmaps(image)
end

--- Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
---@param image Image
---@param rBpp number
---@param gBpp number
---@param bBpp number
---@param aBpp number
---@return void
function rl.ImageDither(image, rBpp, gBpp, bBpp, aBpp)
  return lib.ImageDither(image, rBpp, gBpp, bBpp, aBpp)
end

--- Flip image vertically
---@param image Image
---@return void
function rl.ImageFlipVertical(image)
  return lib.ImageFlipVertical(image)
end

--- Flip image horizontally
---@param image Image
---@return void
function rl.ImageFlipHorizontal(image)
  return lib.ImageFlipHorizontal(image)
end

--- Rotate image by input angle in degrees (-359 to 359)
---@param image Image
---@param degrees number
---@return void
function rl.ImageRotate(image, degrees)
  return lib.ImageRotate(image, degrees)
end

--- Rotate image clockwise 90deg
---@param image Image
---@return void
function rl.ImageRotateCW(image)
  return lib.ImageRotateCW(image)
end

--- Rotate image counter-clockwise 90deg
---@param image Image
---@return void
function rl.ImageRotateCCW(image)
  return lib.ImageRotateCCW(image)
end

--- Modify image color: tint
---@param image Image
---@param color Color
---@return void
function rl.ImageColorTint(image, color)
  return lib.ImageColorTint(image, color)
end

--- Modify image color: invert
---@param image Image
---@return void
function rl.ImageColorInvert(image)
  return lib.ImageColorInvert(image)
end

--- Modify image color: grayscale
---@param image Image
---@return void
function rl.ImageColorGrayscale(image)
  return lib.ImageColorGrayscale(image)
end

--- Modify image color: contrast (-100 to 100)
---@param image Image
---@param contrast number
---@return void
function rl.ImageColorContrast(image, contrast)
  return lib.ImageColorContrast(image, contrast)
end

--- Modify image color: brightness (-255 to 255)
---@param image Image
---@param brightness number
---@return void
function rl.ImageColorBrightness(image, brightness)
  return lib.ImageColorBrightness(image, brightness)
end

--- Modify image color: replace color
---@param image Image
---@param color Color
---@param replace Color
---@return void
function rl.ImageColorReplace(image, color, replace)
  return lib.ImageColorReplace(image, color, replace)
end

--- Load color data from image as a Color array (RGBA - 32bit)
---@param image Image
---@return Color
function rl.LoadImageColors(image)
  return lib.LoadImageColors(image)
end

--- Load colors palette from image as a Color array (RGBA - 32bit)
---@param image Image
---@param maxPaletteSize number
---@param colorCount number
---@return Color
function rl.LoadImagePalette(image, maxPaletteSize, colorCount)
  return lib.LoadImagePalette(image, maxPaletteSize, colorCount)
end

--- Unload color data loaded with LoadImageColors()
---@param colors Color
---@return void
function rl.UnloadImageColors(colors)
  return lib.UnloadImageColors(colors)
end

--- Unload colors palette loaded with LoadImagePalette()
---@param colors Color
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
---@param x number
---@param y number
---@return Color
function rl.GetImageColor(image, x, y)
  return lib.GetImageColor(image, x, y)
end

--- Clear image background with given color
---@param dst Image
---@param color Color
---@return void
function rl.ImageClearBackground(dst, color)
  return lib.ImageClearBackground(dst, color)
end

--- Draw pixel within an image
---@param dst Image
---@param posX number
---@param posY number
---@param color Color
---@return void
function rl.ImageDrawPixel(dst, posX, posY, color)
  return lib.ImageDrawPixel(dst, posX, posY, color)
end

--- Draw pixel within an image (Vector version)
---@param dst Image
---@param position Vector2
---@param color Color
---@return void
function rl.ImageDrawPixelV(dst, position, color)
  return lib.ImageDrawPixelV(dst, position, color)
end

--- Draw line within an image
---@param dst Image
---@param startPosX number
---@param startPosY number
---@param endPosX number
---@param endPosY number
---@param color Color
---@return void
function rl.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
  return lib.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
end

--- Draw line within an image (Vector version)
---@param dst Image
---@param start Vector2
---@param ending Vector2
---@param color Color
---@return void
function rl.ImageDrawLineV(dst, start, ending, color)
  return lib.ImageDrawLineV(dst, start, ending, color)
end

--- Draw a line defining thickness within an image
---@param dst Image
---@param start Vector2
---@param ending Vector2
---@param thick number
---@param color Color
---@return void
function rl.ImageDrawLineEx(dst, start, ending, thick, color)
  return lib.ImageDrawLineEx(dst, start, ending, thick, color)
end

--- Draw a filled circle within an image
---@param dst Image
---@param centerX number
---@param centerY number
---@param radius number
---@param color Color
---@return void
function rl.ImageDrawCircle(dst, centerX, centerY, radius, color)
  return lib.ImageDrawCircle(dst, centerX, centerY, radius, color)
end

--- Draw a filled circle within an image (Vector version)
---@param dst Image
---@param center Vector2
---@param radius number
---@param color Color
---@return void
function rl.ImageDrawCircleV(dst, center, radius, color)
  return lib.ImageDrawCircleV(dst, center, radius, color)
end

--- Draw circle outline within an image
---@param dst Image
---@param centerX number
---@param centerY number
---@param radius number
---@param color Color
---@return void
function rl.ImageDrawCircleLines(dst, centerX, centerY, radius, color)
  return lib.ImageDrawCircleLines(dst, centerX, centerY, radius, color)
end

--- Draw circle outline within an image (Vector version)
---@param dst Image
---@param center Vector2
---@param radius number
---@param color Color
---@return void
function rl.ImageDrawCircleLinesV(dst, center, radius, color)
  return lib.ImageDrawCircleLinesV(dst, center, radius, color)
end

--- Draw rectangle within an image
---@param dst Image
---@param posX number
---@param posY number
---@param width number
---@param height number
---@param color Color
---@return void
function rl.ImageDrawRectangle(dst, posX, posY, width, height, color)
  return lib.ImageDrawRectangle(dst, posX, posY, width, height, color)
end

--- Draw rectangle within an image (Vector version)
---@param dst Image
---@param position Vector2
---@param size Vector2
---@param color Color
---@return void
function rl.ImageDrawRectangleV(dst, position, size, color)
  return lib.ImageDrawRectangleV(dst, position, size, color)
end

--- Draw rectangle within an image
---@param dst Image
---@param rec Rectangle
---@param color Color
---@return void
function rl.ImageDrawRectangleRec(dst, rec, color)
  return lib.ImageDrawRectangleRec(dst, rec, color)
end

--- Draw rectangle lines within an image
---@param dst Image
---@param rec Rectangle
---@param thick number
---@param color Color
---@return void
function rl.ImageDrawRectangleLines(dst, rec, thick, color)
  return lib.ImageDrawRectangleLines(dst, rec, thick, color)
end

--- Draw triangle within an image
---@param dst Image
---@param v1 Vector2
---@param v2 Vector2
---@param v3 Vector2
---@param color Color
---@return void
function rl.ImageDrawTriangle(dst, v1, v2, v3, color)
  return lib.ImageDrawTriangle(dst, v1, v2, v3, color)
end

--- Draw triangle with interpolated colors within an image
---@param dst Image
---@param v1 Vector2
---@param v2 Vector2
---@param v3 Vector2
---@param c1 Color
---@param c2 Color
---@param c3 Color
---@return void
function rl.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3)
  return lib.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3)
end

--- Draw triangle outline within an image
---@param dst Image
---@param v1 Vector2
---@param v2 Vector2
---@param v3 Vector2
---@param color Color
---@return void
function rl.ImageDrawTriangleLines(dst, v1, v2, v3, color)
  return lib.ImageDrawTriangleLines(dst, v1, v2, v3, color)
end

--- Draw a triangle fan defined by points within an image (first vertex is the center)
---@param dst Image
---@param points Vector2
---@param pointCount number
---@param color Color
---@return void
function rl.ImageDrawTriangleFan(dst, points, pointCount, color)
  return lib.ImageDrawTriangleFan(dst, points, pointCount, color)
end

--- Draw a triangle strip defined by points within an image
---@param dst Image
---@param points Vector2
---@param pointCount number
---@param color Color
---@return void
function rl.ImageDrawTriangleStrip(dst, points, pointCount, color)
  return lib.ImageDrawTriangleStrip(dst, points, pointCount, color)
end

--- Draw a source image within a destination image (tint applied to source)
---@param dst Image
---@param src Image
---@param srcRec Rectangle
---@param dstRec Rectangle
---@param tint Color
---@return void
function rl.ImageDraw(dst, src, srcRec, dstRec, tint)
  return lib.ImageDraw(dst, src, srcRec, dstRec, tint)
end

--- Draw text (using default font) within an image (destination)
---@param dst Image
---@param text string
---@param posX number
---@param posY number
---@param fontSize number
---@param color Color
---@return void
function rl.ImageDrawText(dst, text, posX, posY, fontSize, color)
  return lib.ImageDrawText(dst, text, posX, posY, fontSize, color)
end

--- Draw text (custom sprite font) within an image (destination)
---@param dst Image
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
---@param layout number
---@return TextureCubemap
function rl.LoadTextureCubemap(image, layout)
  return lib.LoadTextureCubemap(image, layout)
end

--- Load texture for rendering (framebuffer)
---@param width number
---@param height number
---@return RenderTexture2D
function rl.LoadRenderTexture(width, height)
  return lib.LoadRenderTexture(width, height)
end

--- Check if a texture is valid (loaded in GPU)
---@param texture Texture2D
---@return boolean
function rl.IsTextureValid(texture)
  return lib.IsTextureValid(texture)
end

--- Unload texture from GPU memory (VRAM)
---@param texture Texture2D
---@return void
function rl.UnloadTexture(texture)
  return lib.UnloadTexture(texture)
end

--- Check if a render texture is valid (loaded in GPU)
---@param target RenderTexture2D
---@return boolean
function rl.IsRenderTextureValid(target)
  return lib.IsRenderTextureValid(target)
end

--- Unload render texture from GPU memory (VRAM)
---@param target RenderTexture2D
---@return void
function rl.UnloadRenderTexture(target)
  return lib.UnloadRenderTexture(target)
end

--- Update GPU texture with new data
---@param texture Texture2D
---@param pixels const void
---@return void
function rl.UpdateTexture(texture, pixels)
  return lib.UpdateTexture(texture, pixels)
end

--- Update GPU texture rectangle with new data
---@param texture Texture2D
---@param rec Rectangle
---@param pixels const void
---@return void
function rl.UpdateTextureRec(texture, rec, pixels)
  return lib.UpdateTextureRec(texture, rec, pixels)
end

--- Generate GPU mipmaps for a texture
---@param texture Texture2D
---@return void
function rl.GenTextureMipmaps(texture)
  return lib.GenTextureMipmaps(texture)
end

--- Set texture scaling filter mode
---@param texture Texture2D
---@param filter number
---@return void
function rl.SetTextureFilter(texture, filter)
  return lib.SetTextureFilter(texture, filter)
end

--- Set texture wrapping mode
---@param texture Texture2D
---@param wrap number
---@return void
function rl.SetTextureWrap(texture, wrap)
  return lib.SetTextureWrap(texture, wrap)
end

--- Draw a Texture2D
---@param texture Texture2D
---@param posX number
---@param posY number
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

--- Check if two colors are equal
---@param col1 Color
---@param col2 Color
---@return boolean
function rl.ColorIsEqual(col1, col2)
  return lib.ColorIsEqual(col1, col2)
end

--- Get color with alpha applied, alpha goes from 0.0f to 1.0f
---@param color Color
---@param alpha number
---@return Color
function rl.Fade(color, alpha)
  return lib.Fade(color, alpha)
end

--- Get hexadecimal value for a Color (0xRRGGBBAA)
---@param color Color
---@return number
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

--- Get color lerp interpolation between two colors, factor [0.0f..1.0f]
---@param color1 Color
---@param color2 Color
---@param factor number
---@return Color
function rl.ColorLerp(color1, color2, factor)
  return lib.ColorLerp(color1, color2, factor)
end

--- Get Color structure from hexadecimal value
---@param hexValue number
---@return Color
function rl.GetColor(hexValue)
  return lib.GetColor(hexValue)
end

--- Get Color from a source pixel pointer of certain format
---@param srcPtr void
---@param format number
---@return Color
function rl.GetPixelColor(srcPtr, format)
  return lib.GetPixelColor(srcPtr, format)
end

--- Set color formatted into destination pixel pointer
---@param dstPtr void
---@param color Color
---@param format number
---@return void
function rl.SetPixelColor(dstPtr, color, format)
  return lib.SetPixelColor(dstPtr, color, format)
end

--- Get pixel data size in bytes for certain format
---@param width number
---@param height number
---@param format number
---@return number
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

--- Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
---@param fileName string
---@param fontSize number
---@param codepoints number
---@param codepointCount number
---@return Font
function rl.LoadFontEx(fileName, fontSize, codepoints, codepointCount)
  return lib.LoadFontEx(fileName, fontSize, codepoints, codepointCount)
end

--- Load font from Image (XNA style)
---@param image Image
---@param key Color
---@param firstChar number
---@return Font
function rl.LoadFontFromImage(image, key, firstChar)
  return lib.LoadFontFromImage(image, key, firstChar)
end

--- Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
---@param fileType string
---@param fileData string
---@param dataSize number
---@param fontSize number
---@param codepoints number
---@param codepointCount number
---@return Font
function rl.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount)
  return lib.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount)
end

--- Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
---@param font Font
---@return boolean
function rl.IsFontValid(font)
  return lib.IsFontValid(font)
end

--- Load font data for further use
---@param fileData string
---@param dataSize number
---@param fontSize number
---@param codepoints number
---@param codepointCount number
---@param type number
---@return GlyphInfo
function rl.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type)
  return lib.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type)
end

--- Generate image font atlas using chars info
---@param glyphs const GlyphInfo
---@param glyphRecs Rectangle
---@param glyphCount number
---@param fontSize number
---@param padding number
---@param packMethod number
---@return Image
function rl.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod)
  return lib.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod)
end

--- Unload font chars info data (RAM)
---@param glyphs GlyphInfo
---@param glyphCount number
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
---@return boolean
function rl.ExportFontAsCode(font, fileName)
  return lib.ExportFontAsCode(font, fileName)
end

--- Draw current FPS
---@param posX number
---@param posY number
---@return void
function rl.DrawFPS(posX, posY)
  return lib.DrawFPS(posX, posY)
end

--- Draw text (using default font)
---@param text string
---@param posX number
---@param posY number
---@param fontSize number
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
---@param codepoint number
---@param position Vector2
---@param fontSize number
---@param tint Color
---@return void
function rl.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
  return lib.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
end

--- Draw multiple character (codepoint)
---@param font Font
---@param codepoints const int
---@param codepointCount number
---@param position Vector2
---@param fontSize number
---@param spacing number
---@param tint Color
---@return void
function rl.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint)
  return lib.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint)
end

--- Set vertical line spacing when drawing with line-breaks
---@param spacing number
---@return void
function rl.SetTextLineSpacing(spacing)
  return lib.SetTextLineSpacing(spacing)
end

--- Measure string width for default font
---@param text string
---@param fontSize number
---@return number
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
---@param codepoint number
---@return number
function rl.GetGlyphIndex(font, codepoint)
  return lib.GetGlyphIndex(font, codepoint)
end

--- Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
---@param font Font
---@param codepoint number
---@return GlyphInfo
function rl.GetGlyphInfo(font, codepoint)
  return lib.GetGlyphInfo(font, codepoint)
end

--- Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
---@param font Font
---@param codepoint number
---@return Rectangle
function rl.GetGlyphAtlasRec(font, codepoint)
  return lib.GetGlyphAtlasRec(font, codepoint)
end

--- Load UTF-8 text encoded from codepoints array
---@param codepoints const int
---@param length number
---@return string
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
---@param count number
---@return number
function rl.LoadCodepoints(text, count)
  return lib.LoadCodepoints(text, count)
end

--- Unload codepoints data from memory
---@param codepoints number
---@return void
function rl.UnloadCodepoints(codepoints)
  return lib.UnloadCodepoints(codepoints)
end

--- Get total number of codepoints in a UTF-8 encoded string
---@param text string
---@return number
function rl.GetCodepointCount(text)
  return lib.GetCodepointCount(text)
end

--- Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
---@param text string
---@param codepointSize number
---@return number
function rl.GetCodepoint(text, codepointSize)
  return lib.GetCodepoint(text, codepointSize)
end

--- Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
---@param text string
---@param codepointSize number
---@return number
function rl.GetCodepointNext(text, codepointSize)
  return lib.GetCodepointNext(text, codepointSize)
end

--- Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
---@param text string
---@param codepointSize number
---@return number
function rl.GetCodepointPrevious(text, codepointSize)
  return lib.GetCodepointPrevious(text, codepointSize)
end

--- Encode one codepoint into UTF-8 byte array (array length returned as parameter)
---@param codepoint number
---@param utf8Size number
---@return string
function rl.CodepointToUTF8(codepoint, utf8Size)
  return lib.CodepointToUTF8(codepoint, utf8Size)
end

--- Copy one string to another, returns bytes copied
---@param dst string
---@param src string
---@return number
function rl.TextCopy(dst, src)
  return lib.TextCopy(dst, src)
end

--- Check if two text string are equal
---@param text1 string
---@param text2 string
---@return boolean
function rl.TextIsEqual(text1, text2)
  return lib.TextIsEqual(text1, text2)
end

--- Get text length, checks for '\0' ending
---@param text string
---@return number
function rl.TextLength(text)
  return lib.TextLength(text)
end

--- Text formatting with variables (sprintf() style)
---@param text string
---@param args ...
---@return string
function rl.TextFormat(text, args)
  return lib.TextFormat(text, args)
end

--- Get a piece of a text string
---@param text string
---@param position number
---@param length number
---@return string
function rl.TextSubtext(text, position, length)
  return lib.TextSubtext(text, position, length)
end

--- Replace text string (WARNING: memory must be freed!)
---@param text string
---@param replace string
---@param by string
---@return string
function rl.TextReplace(text, replace, by)
  return lib.TextReplace(text, replace, by)
end

--- Insert text in a position (WARNING: memory must be freed!)
---@param text string
---@param insert string
---@param position number
---@return string
function rl.TextInsert(text, insert, position)
  return lib.TextInsert(text, insert, position)
end

--- Join text strings with delimiter
---@param textList string
---@param count number
---@param delimiter string
---@return string
function rl.TextJoin(textList, count, delimiter)
  return lib.TextJoin(textList, count, delimiter)
end

--- Split text into multiple strings
---@param text string
---@param delimiter string
---@param count number
---@return string
function rl.TextSplit(text, delimiter, count)
  return lib.TextSplit(text, delimiter, count)
end

--- Append text at specific position and move cursor!
---@param text string
---@param append string
---@param position number
---@return void
function rl.TextAppend(text, append, position)
  return lib.TextAppend(text, append, position)
end

--- Find first text occurrence within a string
---@param text string
---@param find string
---@return number
function rl.TextFindIndex(text, find)
  return lib.TextFindIndex(text, find)
end

--- Get upper case version of provided string
---@param text string
---@return string
function rl.TextToUpper(text)
  return lib.TextToUpper(text)
end

--- Get lower case version of provided string
---@param text string
---@return string
function rl.TextToLower(text)
  return lib.TextToLower(text)
end

--- Get Pascal case notation version of provided string
---@param text string
---@return string
function rl.TextToPascal(text)
  return lib.TextToPascal(text)
end

--- Get Snake case notation version of provided string
---@param text string
---@return string
function rl.TextToSnake(text)
  return lib.TextToSnake(text)
end

--- Get Camel case notation version of provided string
---@param text string
---@return string
function rl.TextToCamel(text)
  return lib.TextToCamel(text)
end

--- Get integer value from text (negative values not supported)
---@param text string
---@return number
function rl.TextToInteger(text)
  return lib.TextToInteger(text)
end

--- Get float value from text (negative values not supported)
---@param text string
---@return number
function rl.TextToFloat(text)
  return lib.TextToFloat(text)
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
---@param points const Vector3
---@param pointCount number
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
---@param rings number
---@param slices number
---@param color Color
---@return void
function rl.DrawSphereEx(centerPos, radius, rings, slices, color)
  return lib.DrawSphereEx(centerPos, radius, rings, slices, color)
end

--- Draw sphere wires
---@param centerPos Vector3
---@param radius number
---@param rings number
---@param slices number
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
---@param slices number
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
---@param sides number
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
---@param slices number
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
---@param sides number
---@param color Color
---@return void
function rl.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
  return lib.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
end

--- Draw a capsule with the center of its sphere caps at startPos and endPos
---@param startPos Vector3
---@param endPos Vector3
---@param radius number
---@param slices number
---@param rings number
---@param color Color
---@return void
function rl.DrawCapsule(startPos, endPos, radius, slices, rings, color)
  return lib.DrawCapsule(startPos, endPos, radius, slices, rings, color)
end

--- Draw capsule wireframe with the center of its sphere caps at startPos and endPos
---@param startPos Vector3
---@param endPos Vector3
---@param radius number
---@param slices number
---@param rings number
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
---@param slices number
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

--- Check if a model is valid (loaded in GPU, VAO/VBOs)
---@param model Model
---@return boolean
function rl.IsModelValid(model)
  return lib.IsModelValid(model)
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

--- Draw a model as points
---@param model Model
---@param position Vector3
---@param scale number
---@param tint Color
---@return void
function rl.DrawModelPoints(model, position, scale, tint)
  return lib.DrawModelPoints(model, position, scale, tint)
end

--- Draw a model as points with extended parameters
---@param model Model
---@param position Vector3
---@param rotationAxis Vector3
---@param rotationAngle number
---@param scale Vector3
---@param tint Color
---@return void
function rl.DrawModelPointsEx(model, position, rotationAxis, rotationAngle, scale, tint)
  return lib.DrawModelPointsEx(model, position, rotationAxis, rotationAngle, scale, tint)
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
---@param scale number
---@param tint Color
---@return void
function rl.DrawBillboard(camera, texture, position, scale, tint)
  return lib.DrawBillboard(camera, texture, position, scale, tint)
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
---@param mesh Mesh
---@param dynamic boolean
---@return void
function rl.UploadMesh(mesh, dynamic)
  return lib.UploadMesh(mesh, dynamic)
end

--- Update mesh vertex data in GPU for a specific buffer index
---@param mesh Mesh
---@param index number
---@param data const void
---@param dataSize number
---@param offset number
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
---@param transforms const Matrix
---@param instances number
---@return void
function rl.DrawMeshInstanced(mesh, material, transforms, instances)
  return lib.DrawMeshInstanced(mesh, material, transforms, instances)
end

--- Compute mesh bounding box limits
---@param mesh Mesh
---@return BoundingBox
function rl.GetMeshBoundingBox(mesh)
  return lib.GetMeshBoundingBox(mesh)
end

--- Compute mesh tangents
---@param mesh Mesh
---@return void
function rl.GenMeshTangents(mesh)
  return lib.GenMeshTangents(mesh)
end

--- Export mesh data to file, returns true on success
---@param mesh Mesh
---@param fileName string
---@return boolean
function rl.ExportMesh(mesh, fileName)
  return lib.ExportMesh(mesh, fileName)
end

--- Export mesh as code file (.h) defining multiple arrays of vertex attributes
---@param mesh Mesh
---@param fileName string
---@return boolean
function rl.ExportMeshAsCode(mesh, fileName)
  return lib.ExportMeshAsCode(mesh, fileName)
end

--- Generate polygonal mesh
---@param sides number
---@param radius number
---@return Mesh
function rl.GenMeshPoly(sides, radius)
  return lib.GenMeshPoly(sides, radius)
end

--- Generate plane mesh (with subdivisions)
---@param width number
---@param length number
---@param resX number
---@param resZ number
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
---@param rings number
---@param slices number
---@return Mesh
function rl.GenMeshSphere(radius, rings, slices)
  return lib.GenMeshSphere(radius, rings, slices)
end

--- Generate half-sphere mesh (no bottom cap)
---@param radius number
---@param rings number
---@param slices number
---@return Mesh
function rl.GenMeshHemiSphere(radius, rings, slices)
  return lib.GenMeshHemiSphere(radius, rings, slices)
end

--- Generate cylinder mesh
---@param radius number
---@param height number
---@param slices number
---@return Mesh
function rl.GenMeshCylinder(radius, height, slices)
  return lib.GenMeshCylinder(radius, height, slices)
end

--- Generate cone/pyramid mesh
---@param radius number
---@param height number
---@param slices number
---@return Mesh
function rl.GenMeshCone(radius, height, slices)
  return lib.GenMeshCone(radius, height, slices)
end

--- Generate torus mesh
---@param radius number
---@param size number
---@param radSeg number
---@param sides number
---@return Mesh
function rl.GenMeshTorus(radius, size, radSeg, sides)
  return lib.GenMeshTorus(radius, size, radSeg, sides)
end

--- Generate trefoil knot mesh
---@param radius number
---@param size number
---@param radSeg number
---@param sides number
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
---@param materialCount number
---@return Material
function rl.LoadMaterials(fileName, materialCount)
  return lib.LoadMaterials(fileName, materialCount)
end

--- Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
---@return Material
function rl.LoadMaterialDefault()
  return lib.LoadMaterialDefault()
end

--- Check if a material is valid (shader assigned, map textures loaded in GPU)
---@param material Material
---@return boolean
function rl.IsMaterialValid(material)
  return lib.IsMaterialValid(material)
end

--- Unload material from GPU memory (VRAM)
---@param material Material
---@return void
function rl.UnloadMaterial(material)
  return lib.UnloadMaterial(material)
end

--- Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
---@param material Material
---@param mapType number
---@param texture Texture2D
---@return void
function rl.SetMaterialTexture(material, mapType, texture)
  return lib.SetMaterialTexture(material, mapType, texture)
end

--- Set material for a mesh
---@param model Model
---@param meshId number
---@param materialId number
---@return void
function rl.SetModelMeshMaterial(model, meshId, materialId)
  return lib.SetModelMeshMaterial(model, meshId, materialId)
end

--- Load model animations from file
---@param fileName string
---@param animCount number
---@return ModelAnimation
function rl.LoadModelAnimations(fileName, animCount)
  return lib.LoadModelAnimations(fileName, animCount)
end

--- Update model animation pose (CPU)
---@param model Model
---@param anim ModelAnimation
---@param frame number
---@return void
function rl.UpdateModelAnimation(model, anim, frame)
  return lib.UpdateModelAnimation(model, anim, frame)
end

--- Update model animation mesh bone matrices (GPU skinning)
---@param model Model
---@param anim ModelAnimation
---@param frame number
---@return void
function rl.UpdateModelAnimationBones(model, anim, frame)
  return lib.UpdateModelAnimationBones(model, anim, frame)
end

--- Unload animation data
---@param anim ModelAnimation
---@return void
function rl.UnloadModelAnimation(anim)
  return lib.UnloadModelAnimation(anim)
end

--- Unload animation array data
---@param animations ModelAnimation
---@param animCount number
---@return void
function rl.UnloadModelAnimations(animations, animCount)
  return lib.UnloadModelAnimations(animations, animCount)
end

--- Check model animation skeleton match
---@param model Model
---@param anim ModelAnimation
---@return boolean
function rl.IsModelAnimationValid(model, anim)
  return lib.IsModelAnimationValid(model, anim)
end

--- Check collision between two spheres
---@param center1 Vector3
---@param radius1 number
---@param center2 Vector3
---@param radius2 number
---@return boolean
function rl.CheckCollisionSpheres(center1, radius1, center2, radius2)
  return lib.CheckCollisionSpheres(center1, radius1, center2, radius2)
end

--- Check collision between two bounding boxes
---@param box1 BoundingBox
---@param box2 BoundingBox
---@return boolean
function rl.CheckCollisionBoxes(box1, box2)
  return lib.CheckCollisionBoxes(box1, box2)
end

--- Check collision between box and sphere
---@param box BoundingBox
---@param center Vector3
---@param radius number
---@return boolean
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
---@return boolean
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
---@return number
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
---@param dataSize number
---@return Wave
function rl.LoadWaveFromMemory(fileType, fileData, dataSize)
  return lib.LoadWaveFromMemory(fileType, fileData, dataSize)
end

--- Checks if wave data is valid (data loaded and parameters)
---@param wave Wave
---@return boolean
function rl.IsWaveValid(wave)
  return lib.IsWaveValid(wave)
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

--- Checks if a sound is valid (data loaded and buffers initialized)
---@param sound Sound
---@return boolean
function rl.IsSoundValid(sound)
  return lib.IsSoundValid(sound)
end

--- Update sound buffer with new data
---@param sound Sound
---@param data const void
---@param sampleCount number
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
---@return boolean
function rl.ExportWave(wave, fileName)
  return lib.ExportWave(wave, fileName)
end

--- Export wave sample data to code (.h), returns true on success
---@param wave Wave
---@param fileName string
---@return boolean
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
---@return boolean
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

--- Crop a wave to defined frames range
---@param wave Wave
---@param initFrame number
---@param finalFrame number
---@return void
function rl.WaveCrop(wave, initFrame, finalFrame)
  return lib.WaveCrop(wave, initFrame, finalFrame)
end

--- Convert wave data to desired format
---@param wave Wave
---@param sampleRate number
---@param sampleSize number
---@param channels number
---@return void
function rl.WaveFormat(wave, sampleRate, sampleSize, channels)
  return lib.WaveFormat(wave, sampleRate, sampleSize, channels)
end

--- Load samples data from wave as a 32bit float data array
---@param wave Wave
---@return number
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
---@param dataSize number
---@return Music
function rl.LoadMusicStreamFromMemory(fileType, data, dataSize)
  return lib.LoadMusicStreamFromMemory(fileType, data, dataSize)
end

--- Checks if a music stream is valid (context and buffers initialized)
---@param music Music
---@return boolean
function rl.IsMusicValid(music)
  return lib.IsMusicValid(music)
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
---@return boolean
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
---@return number
function rl.GetMusicTimeLength(music)
  return lib.GetMusicTimeLength(music)
end

--- Get current music time played (in seconds)
---@param music Music
---@return number
function rl.GetMusicTimePlayed(music)
  return lib.GetMusicTimePlayed(music)
end

--- Load audio stream (to stream raw audio pcm data)
---@param sampleRate number
---@param sampleSize number
---@param channels number
---@return AudioStream
function rl.LoadAudioStream(sampleRate, sampleSize, channels)
  return lib.LoadAudioStream(sampleRate, sampleSize, channels)
end

--- Checks if an audio stream is valid (buffers initialized)
---@param stream AudioStream
---@return boolean
function rl.IsAudioStreamValid(stream)
  return lib.IsAudioStreamValid(stream)
end

--- Unload audio stream and free memory
---@param stream AudioStream
---@return void
function rl.UnloadAudioStream(stream)
  return lib.UnloadAudioStream(stream)
end

--- Update audio stream buffers with data
---@param stream AudioStream
---@param data const void
---@param frameCount number
---@return void
function rl.UpdateAudioStream(stream, data, frameCount)
  return lib.UpdateAudioStream(stream, data, frameCount)
end

--- Check if any audio stream buffers requires refill
---@param stream AudioStream
---@return boolean
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
---@return boolean
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
---@param size number
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

--- Attach audio stream processor to stream, receives the samples as 'float'
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

--- Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
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

--- Choose the current matrix to be transformed
---@param mode number
---@return void
function rl.rlMatrixMode(mode)
  return lib.rlMatrixMode(mode)
end

--- Push the current matrix to stack
---@return void
function rl.rlPushMatrix()
  return lib.rlPushMatrix()
end

--- Pop latest inserted matrix from stack
---@return void
function rl.rlPopMatrix()
  return lib.rlPopMatrix()
end

--- Reset current matrix to identity matrix
---@return void
function rl.rlLoadIdentity()
  return lib.rlLoadIdentity()
end

--- Multiply the current matrix by a translation matrix
---@param x number
---@param y number
---@param z number
---@return void
function rl.rlTranslatef(x, y, z)
  return lib.rlTranslatef(x, y, z)
end

--- Multiply the current matrix by a rotation matrix
---@param angle number
---@param x number
---@param y number
---@param z number
---@return void
function rl.rlRotatef(angle, x, y, z)
  return lib.rlRotatef(angle, x, y, z)
end

--- Multiply the current matrix by a scaling matrix
---@param x number
---@param y number
---@param z number
---@return void
function rl.rlScalef(x, y, z)
  return lib.rlScalef(x, y, z)
end

--- Multiply the current matrix by another matrix
---@param matf const float
---@return void
function rl.rlMultMatrixf(matf)
  return lib.rlMultMatrixf(matf)
end

---
---@param left number
---@param right number
---@param bottom number
---@param top number
---@param znear number
---@param zfar number
---@return void
function rl.rlFrustum(left, right, bottom, top, znear, zfar)
  return lib.rlFrustum(left, right, bottom, top, znear, zfar)
end

---
---@param left number
---@param right number
---@param bottom number
---@param top number
---@param znear number
---@param zfar number
---@return void
function rl.rlOrtho(left, right, bottom, top, znear, zfar)
  return lib.rlOrtho(left, right, bottom, top, znear, zfar)
end

--- Set the viewport area
---@param x number
---@param y number
---@param width number
---@param height number
---@return void
function rl.rlViewport(x, y, width, height)
  return lib.rlViewport(x, y, width, height)
end

--- Set clip planes distances
---@param nearPlane number
---@param farPlane number
---@return void
function rl.rlSetClipPlanes(nearPlane, farPlane)
  return lib.rlSetClipPlanes(nearPlane, farPlane)
end

--- Get cull plane distance near
---@return number
function rl.rlGetCullDistanceNear()
  return lib.rlGetCullDistanceNear()
end

--- Get cull plane distance far
---@return number
function rl.rlGetCullDistanceFar()
  return lib.rlGetCullDistanceFar()
end

--- Initialize drawing mode (how to organize vertex)
---@param mode number
---@return void
function rl.rlBegin(mode)
  return lib.rlBegin(mode)
end

--- Finish vertex providing
---@return void
function rl.rlEnd()
  return lib.rlEnd()
end

--- Define one vertex (position) - 2 int
---@param x number
---@param y number
---@return void
function rl.rlVertex2i(x, y)
  return lib.rlVertex2i(x, y)
end

--- Define one vertex (position) - 2 float
---@param x number
---@param y number
---@return void
function rl.rlVertex2f(x, y)
  return lib.rlVertex2f(x, y)
end

--- Define one vertex (position) - 3 float
---@param x number
---@param y number
---@param z number
---@return void
function rl.rlVertex3f(x, y, z)
  return lib.rlVertex3f(x, y, z)
end

--- Define one vertex (texture coordinate) - 2 float
---@param x number
---@param y number
---@return void
function rl.rlTexCoord2f(x, y)
  return lib.rlTexCoord2f(x, y)
end

--- Define one vertex (normal) - 3 float
---@param x number
---@param y number
---@param z number
---@return void
function rl.rlNormal3f(x, y, z)
  return lib.rlNormal3f(x, y, z)
end

--- Define one vertex (color) - 4 byte
---@param r string
---@param g string
---@param b string
---@param a string
---@return void
function rl.rlColor4ub(r, g, b, a)
  return lib.rlColor4ub(r, g, b, a)
end

--- Define one vertex (color) - 3 float
---@param x number
---@param y number
---@param z number
---@return void
function rl.rlColor3f(x, y, z)
  return lib.rlColor3f(x, y, z)
end

--- Define one vertex (color) - 4 float
---@param x number
---@param y number
---@param z number
---@param w number
---@return void
function rl.rlColor4f(x, y, z, w)
  return lib.rlColor4f(x, y, z, w)
end

--- Enable vertex array (VAO, if supported)
---@param vaoId number
---@return boolean
function rl.rlEnableVertexArray(vaoId)
  return lib.rlEnableVertexArray(vaoId)
end

--- Disable vertex array (VAO, if supported)
---@return void
function rl.rlDisableVertexArray()
  return lib.rlDisableVertexArray()
end

--- Enable vertex buffer (VBO)
---@param id number
---@return void
function rl.rlEnableVertexBuffer(id)
  return lib.rlEnableVertexBuffer(id)
end

--- Disable vertex buffer (VBO)
---@return void
function rl.rlDisableVertexBuffer()
  return lib.rlDisableVertexBuffer()
end

--- Enable vertex buffer element (VBO element)
---@param id number
---@return void
function rl.rlEnableVertexBufferElement(id)
  return lib.rlEnableVertexBufferElement(id)
end

--- Disable vertex buffer element (VBO element)
---@return void
function rl.rlDisableVertexBufferElement()
  return lib.rlDisableVertexBufferElement()
end

--- Enable vertex attribute index
---@param index number
---@return void
function rl.rlEnableVertexAttribute(index)
  return lib.rlEnableVertexAttribute(index)
end

--- Disable vertex attribute index
---@param index number
---@return void
function rl.rlDisableVertexAttribute(index)
  return lib.rlDisableVertexAttribute(index)
end

--- Enable attribute state pointer
---@param vertexAttribType number
---@param buffer void
---@return void
function rl.rlEnableStatePointer(vertexAttribType, buffer)
  return lib.rlEnableStatePointer(vertexAttribType, buffer)
end

--- Disable attribute state pointer
---@param vertexAttribType number
---@return void
function rl.rlDisableStatePointer(vertexAttribType)
  return lib.rlDisableStatePointer(vertexAttribType)
end

--- Select and active a texture slot
---@param slot number
---@return void
function rl.rlActiveTextureSlot(slot)
  return lib.rlActiveTextureSlot(slot)
end

--- Enable texture
---@param id number
---@return void
function rl.rlEnableTexture(id)
  return lib.rlEnableTexture(id)
end

--- Disable texture
---@return void
function rl.rlDisableTexture()
  return lib.rlDisableTexture()
end

--- Enable texture cubemap
---@param id number
---@return void
function rl.rlEnableTextureCubemap(id)
  return lib.rlEnableTextureCubemap(id)
end

--- Disable texture cubemap
---@return void
function rl.rlDisableTextureCubemap()
  return lib.rlDisableTextureCubemap()
end

--- Set texture parameters (filter, wrap)
---@param id number
---@param param number
---@param value number
---@return void
function rl.rlTextureParameters(id, param, value)
  return lib.rlTextureParameters(id, param, value)
end

--- Set cubemap parameters (filter, wrap)
---@param id number
---@param param number
---@param value number
---@return void
function rl.rlCubemapParameters(id, param, value)
  return lib.rlCubemapParameters(id, param, value)
end

--- Enable shader program
---@param id number
---@return void
function rl.rlEnableShader(id)
  return lib.rlEnableShader(id)
end

--- Disable shader program
---@return void
function rl.rlDisableShader()
  return lib.rlDisableShader()
end

--- Enable render texture (fbo)
---@param id number
---@return void
function rl.rlEnableFramebuffer(id)
  return lib.rlEnableFramebuffer(id)
end

--- Disable render texture (fbo), return to default framebuffer
---@return void
function rl.rlDisableFramebuffer()
  return lib.rlDisableFramebuffer()
end

--- Get the currently active render texture (fbo), 0 for default framebuffer
---@return number
function rl.rlGetActiveFramebuffer()
  return lib.rlGetActiveFramebuffer()
end

--- Activate multiple draw color buffers
---@param count number
---@return void
function rl.rlActiveDrawBuffers(count)
  return lib.rlActiveDrawBuffers(count)
end

--- Blit active framebuffer to main framebuffer
---@param srcX number
---@param srcY number
---@param srcWidth number
---@param srcHeight number
---@param dstX number
---@param dstY number
---@param dstWidth number
---@param dstHeight number
---@param bufferMask number
---@return void
function rl.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask)
  return lib.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask)
end

--- Bind framebuffer (FBO)
---@param target number
---@param framebuffer number
---@return void
function rl.rlBindFramebuffer(target, framebuffer)
  return lib.rlBindFramebuffer(target, framebuffer)
end

--- Enable color blending
---@return void
function rl.rlEnableColorBlend()
  return lib.rlEnableColorBlend()
end

--- Disable color blending
---@return void
function rl.rlDisableColorBlend()
  return lib.rlDisableColorBlend()
end

--- Enable depth test
---@return void
function rl.rlEnableDepthTest()
  return lib.rlEnableDepthTest()
end

--- Disable depth test
---@return void
function rl.rlDisableDepthTest()
  return lib.rlDisableDepthTest()
end

--- Enable depth write
---@return void
function rl.rlEnableDepthMask()
  return lib.rlEnableDepthMask()
end

--- Disable depth write
---@return void
function rl.rlDisableDepthMask()
  return lib.rlDisableDepthMask()
end

--- Enable backface culling
---@return void
function rl.rlEnableBackfaceCulling()
  return lib.rlEnableBackfaceCulling()
end

--- Disable backface culling
---@return void
function rl.rlDisableBackfaceCulling()
  return lib.rlDisableBackfaceCulling()
end

--- Color mask control
---@param r boolean
---@param g boolean
---@param b boolean
---@param a boolean
---@return void
function rl.rlColorMask(r, g, b, a)
  return lib.rlColorMask(r, g, b, a)
end

--- Set face culling mode
---@param mode number
---@return void
function rl.rlSetCullFace(mode)
  return lib.rlSetCullFace(mode)
end

--- Enable scissor test
---@return void
function rl.rlEnableScissorTest()
  return lib.rlEnableScissorTest()
end

--- Disable scissor test
---@return void
function rl.rlDisableScissorTest()
  return lib.rlDisableScissorTest()
end

--- Scissor test
---@param x number
---@param y number
---@param width number
---@param height number
---@return void
function rl.rlScissor(x, y, width, height)
  return lib.rlScissor(x, y, width, height)
end

--- Enable wire mode
---@return void
function rl.rlEnableWireMode()
  return lib.rlEnableWireMode()
end

--- Enable point mode
---@return void
function rl.rlEnablePointMode()
  return lib.rlEnablePointMode()
end

--- Disable wire (and point) mode
---@return void
function rl.rlDisableWireMode()
  return lib.rlDisableWireMode()
end

--- Set the line drawing width
---@param width number
---@return void
function rl.rlSetLineWidth(width)
  return lib.rlSetLineWidth(width)
end

--- Get the line drawing width
---@return number
function rl.rlGetLineWidth()
  return lib.rlGetLineWidth()
end

--- Enable line aliasing
---@return void
function rl.rlEnableSmoothLines()
  return lib.rlEnableSmoothLines()
end

--- Disable line aliasing
---@return void
function rl.rlDisableSmoothLines()
  return lib.rlDisableSmoothLines()
end

--- Enable stereo rendering
---@return void
function rl.rlEnableStereoRender()
  return lib.rlEnableStereoRender()
end

--- Disable stereo rendering
---@return void
function rl.rlDisableStereoRender()
  return lib.rlDisableStereoRender()
end

--- Check if stereo render is enabled
---@return boolean
function rl.rlIsStereoRenderEnabled()
  return lib.rlIsStereoRenderEnabled()
end

--- Clear color buffer with color
---@param r string
---@param g string
---@param b string
---@param a string
---@return void
function rl.rlClearColor(r, g, b, a)
  return lib.rlClearColor(r, g, b, a)
end

--- Clear used screen buffers (color and depth)
---@return void
function rl.rlClearScreenBuffers()
  return lib.rlClearScreenBuffers()
end

--- Check and log OpenGL error codes
---@return void
function rl.rlCheckErrors()
  return lib.rlCheckErrors()
end

--- Set blending mode
---@param mode number
---@return void
function rl.rlSetBlendMode(mode)
  return lib.rlSetBlendMode(mode)
end

--- Set blending mode factor and equation (using OpenGL factors)
---@param glSrcFactor number
---@param glDstFactor number
---@param glEquation number
---@return void
function rl.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation)
  return lib.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation)
end

--- Set blending mode factors and equations separately (using OpenGL factors)
---@param glSrcRGB number
---@param glDstRGB number
---@param glSrcAlpha number
---@param glDstAlpha number
---@param glEqRGB number
---@param glEqAlpha number
---@return void
function rl.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha)
  return lib.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha)
end

--- Initialize rlgl (buffers, shaders, textures, states)
---@param width number
---@param height number
---@return void
function rl.rlglInit(width, height)
  return lib.rlglInit(width, height)
end

--- De-initialize rlgl (buffers, shaders, textures)
---@return void
function rl.rlglClose()
  return lib.rlglClose()
end

--- Load OpenGL extensions (loader function required)
---@param loader void
---@return void
function rl.rlLoadExtensions(loader)
  return lib.rlLoadExtensions(loader)
end

--- Get current OpenGL version
---@return number
function rl.rlGetVersion()
  return lib.rlGetVersion()
end

--- Set current framebuffer width
---@param width number
---@return void
function rl.rlSetFramebufferWidth(width)
  return lib.rlSetFramebufferWidth(width)
end

--- Get default framebuffer width
---@return number
function rl.rlGetFramebufferWidth()
  return lib.rlGetFramebufferWidth()
end

--- Set current framebuffer height
---@param height number
---@return void
function rl.rlSetFramebufferHeight(height)
  return lib.rlSetFramebufferHeight(height)
end

--- Get default framebuffer height
---@return number
function rl.rlGetFramebufferHeight()
  return lib.rlGetFramebufferHeight()
end

--- Get default texture id
---@return number
function rl.rlGetTextureIdDefault()
  return lib.rlGetTextureIdDefault()
end

--- Get default shader id
---@return number
function rl.rlGetShaderIdDefault()
  return lib.rlGetShaderIdDefault()
end

--- Get default shader locations
---@return number
function rl.rlGetShaderLocsDefault()
  return lib.rlGetShaderLocsDefault()
end

--- Load a render batch system
---@param numBuffers number
---@param bufferElements number
---@return rlRenderBatch
function rl.rlLoadRenderBatch(numBuffers, bufferElements)
  return lib.rlLoadRenderBatch(numBuffers, bufferElements)
end

--- Unload render batch system
---@param batch rlRenderBatch
---@return void
function rl.rlUnloadRenderBatch(batch)
  return lib.rlUnloadRenderBatch(batch)
end

--- Draw render batch data (Update->Draw->Reset)
---@param batch rlRenderBatch
---@return void
function rl.rlDrawRenderBatch(batch)
  return lib.rlDrawRenderBatch(batch)
end

--- Set the active render batch for rlgl (NULL for default internal)
---@param batch rlRenderBatch
---@return void
function rl.rlSetRenderBatchActive(batch)
  return lib.rlSetRenderBatchActive(batch)
end

--- Update and draw internal render batch
---@return void
function rl.rlDrawRenderBatchActive()
  return lib.rlDrawRenderBatchActive()
end

--- Check internal buffer overflow for a given number of vertex
---@param vCount number
---@return boolean
function rl.rlCheckRenderBatchLimit(vCount)
  return lib.rlCheckRenderBatchLimit(vCount)
end

--- Set current texture for render batch and check buffers limits
---@param id number
---@return void
function rl.rlSetTexture(id)
  return lib.rlSetTexture(id)
end

--- Load vertex array (vao) if supported
---@return number
function rl.rlLoadVertexArray()
  return lib.rlLoadVertexArray()
end

--- Load a vertex buffer object
---@param buffer const void
---@param size number
---@param dynamic boolean
---@return number
function rl.rlLoadVertexBuffer(buffer, size, dynamic)
  return lib.rlLoadVertexBuffer(buffer, size, dynamic)
end

--- Load vertex buffer elements object
---@param buffer const void
---@param size number
---@param dynamic boolean
---@return number
function rl.rlLoadVertexBufferElement(buffer, size, dynamic)
  return lib.rlLoadVertexBufferElement(buffer, size, dynamic)
end

--- Update vertex buffer object data on GPU buffer
---@param bufferId number
---@param data const void
---@param dataSize number
---@param offset number
---@return void
function rl.rlUpdateVertexBuffer(bufferId, data, dataSize, offset)
  return lib.rlUpdateVertexBuffer(bufferId, data, dataSize, offset)
end

--- Update vertex buffer elements data on GPU buffer
---@param id number
---@param data const void
---@param dataSize number
---@param offset number
---@return void
function rl.rlUpdateVertexBufferElements(id, data, dataSize, offset)
  return lib.rlUpdateVertexBufferElements(id, data, dataSize, offset)
end

--- Unload vertex array (vao)
---@param vaoId number
---@return void
function rl.rlUnloadVertexArray(vaoId)
  return lib.rlUnloadVertexArray(vaoId)
end

--- Unload vertex buffer object
---@param vboId number
---@return void
function rl.rlUnloadVertexBuffer(vboId)
  return lib.rlUnloadVertexBuffer(vboId)
end

--- Set vertex attribute data configuration
---@param index number
---@param compSize number
---@param type number
---@param normalized boolean
---@param stride number
---@param offset number
---@return void
function rl.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset)
  return lib.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset)
end

--- Set vertex attribute data divisor
---@param index number
---@param divisor number
---@return void
function rl.rlSetVertexAttributeDivisor(index, divisor)
  return lib.rlSetVertexAttributeDivisor(index, divisor)
end

--- Set vertex attribute default value, when attribute to provided
---@param locIndex number
---@param value const void
---@param attribType number
---@param count number
---@return void
function rl.rlSetVertexAttributeDefault(locIndex, value, attribType, count)
  return lib.rlSetVertexAttributeDefault(locIndex, value, attribType, count)
end

--- Draw vertex array (currently active vao)
---@param offset number
---@param count number
---@return void
function rl.rlDrawVertexArray(offset, count)
  return lib.rlDrawVertexArray(offset, count)
end

--- Draw vertex array elements
---@param offset number
---@param count number
---@param buffer const void
---@return void
function rl.rlDrawVertexArrayElements(offset, count, buffer)
  return lib.rlDrawVertexArrayElements(offset, count, buffer)
end

--- Draw vertex array (currently active vao) with instancing
---@param offset number
---@param count number
---@param instances number
---@return void
function rl.rlDrawVertexArrayInstanced(offset, count, instances)
  return lib.rlDrawVertexArrayInstanced(offset, count, instances)
end

--- Draw vertex array elements with instancing
---@param offset number
---@param count number
---@param buffer const void
---@param instances number
---@return void
function rl.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances)
  return lib.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances)
end

--- Load texture data
---@param data const void
---@param width number
---@param height number
---@param format number
---@param mipmapCount number
---@return number
function rl.rlLoadTexture(data, width, height, format, mipmapCount)
  return lib.rlLoadTexture(data, width, height, format, mipmapCount)
end

--- Load depth texture/renderbuffer (to be attached to fbo)
---@param width number
---@param height number
---@param useRenderBuffer boolean
---@return number
function rl.rlLoadTextureDepth(width, height, useRenderBuffer)
  return lib.rlLoadTextureDepth(width, height, useRenderBuffer)
end

--- Load texture cubemap data
---@param data const void
---@param size number
---@param format number
---@param mipmapCount number
---@return number
function rl.rlLoadTextureCubemap(data, size, format, mipmapCount)
  return lib.rlLoadTextureCubemap(data, size, format, mipmapCount)
end

--- Update texture with new data on GPU
---@param id number
---@param offsetX number
---@param offsetY number
---@param width number
---@param height number
---@param format number
---@param data const void
---@return void
function rl.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data)
  return lib.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data)
end

--- Get OpenGL internal formats
---@param format number
---@param glInternalFormat number
---@param glFormat number
---@param glType number
---@return void
function rl.rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType)
  return lib.rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType)
end

--- Get name string for pixel format
---@param format number
---@return string
function rl.rlGetPixelFormatName(format)
  return lib.rlGetPixelFormatName(format)
end

--- Unload texture from GPU memory
---@param id number
---@return void
function rl.rlUnloadTexture(id)
  return lib.rlUnloadTexture(id)
end

--- Generate mipmap data for selected texture
---@param id number
---@param width number
---@param height number
---@param format number
---@param mipmaps number
---@return void
function rl.rlGenTextureMipmaps(id, width, height, format, mipmaps)
  return lib.rlGenTextureMipmaps(id, width, height, format, mipmaps)
end

--- Read texture pixel data
---@param id number
---@param width number
---@param height number
---@param format number
---@return void
function rl.rlReadTexturePixels(id, width, height, format)
  return lib.rlReadTexturePixels(id, width, height, format)
end

--- Read screen pixel data (color buffer)
---@param width number
---@param height number
---@return string
function rl.rlReadScreenPixels(width, height)
  return lib.rlReadScreenPixels(width, height)
end

--- Load an empty framebuffer
---@return number
function rl.rlLoadFramebuffer()
  return lib.rlLoadFramebuffer()
end

--- Attach texture/renderbuffer to a framebuffer
---@param fboId number
---@param texId number
---@param attachType number
---@param texType number
---@param mipLevel number
---@return void
function rl.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel)
  return lib.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel)
end

--- Verify framebuffer is complete
---@param id number
---@return boolean
function rl.rlFramebufferComplete(id)
  return lib.rlFramebufferComplete(id)
end

--- Delete framebuffer from GPU
---@param id number
---@return void
function rl.rlUnloadFramebuffer(id)
  return lib.rlUnloadFramebuffer(id)
end

--- Load shader from code strings
---@param vsCode string
---@param fsCode string
---@return number
function rl.rlLoadShaderCode(vsCode, fsCode)
  return lib.rlLoadShaderCode(vsCode, fsCode)
end

--- Compile custom shader and return shader id (type: RL_VERTEX_SHADER, RL_FRAGMENT_SHADER, RL_COMPUTE_SHADER)
---@param shaderCode string
---@param type number
---@return number
function rl.rlCompileShader(shaderCode, type)
  return lib.rlCompileShader(shaderCode, type)
end

--- Load custom shader program
---@param vShaderId number
---@param fShaderId number
---@return number
function rl.rlLoadShaderProgram(vShaderId, fShaderId)
  return lib.rlLoadShaderProgram(vShaderId, fShaderId)
end

--- Unload shader program
---@param id number
---@return void
function rl.rlUnloadShaderProgram(id)
  return lib.rlUnloadShaderProgram(id)
end

--- Get shader location uniform
---@param shaderId number
---@param uniformName string
---@return number
function rl.rlGetLocationUniform(shaderId, uniformName)
  return lib.rlGetLocationUniform(shaderId, uniformName)
end

--- Get shader location attribute
---@param shaderId number
---@param attribName string
---@return number
function rl.rlGetLocationAttrib(shaderId, attribName)
  return lib.rlGetLocationAttrib(shaderId, attribName)
end

--- Set shader value uniform
---@param locIndex number
---@param value const void
---@param uniformType number
---@param count number
---@return void
function rl.rlSetUniform(locIndex, value, uniformType, count)
  return lib.rlSetUniform(locIndex, value, uniformType, count)
end

--- Set shader value matrix
---@param locIndex number
---@param mat Matrix
---@return void
function rl.rlSetUniformMatrix(locIndex, mat)
  return lib.rlSetUniformMatrix(locIndex, mat)
end

--- Set shader value matrices
---@param locIndex number
---@param mat const Matrix
---@param count number
---@return void
function rl.rlSetUniformMatrices(locIndex, mat, count)
  return lib.rlSetUniformMatrices(locIndex, mat, count)
end

--- Set shader value sampler
---@param locIndex number
---@param textureId number
---@return void
function rl.rlSetUniformSampler(locIndex, textureId)
  return lib.rlSetUniformSampler(locIndex, textureId)
end

--- Set shader currently active (id and locations)
---@param id number
---@param locs number
---@return void
function rl.rlSetShader(id, locs)
  return lib.rlSetShader(id, locs)
end

--- Load compute shader program
---@param shaderId number
---@return number
function rl.rlLoadComputeShaderProgram(shaderId)
  return lib.rlLoadComputeShaderProgram(shaderId)
end

--- Dispatch compute shader (equivalent to *draw* for graphics pipeline)
---@param groupX number
---@param groupY number
---@param groupZ number
---@return void
function rl.rlComputeShaderDispatch(groupX, groupY, groupZ)
  return lib.rlComputeShaderDispatch(groupX, groupY, groupZ)
end

--- Load shader storage buffer object (SSBO)
---@param size number
---@param data const void
---@param usageHint number
---@return number
function rl.rlLoadShaderBuffer(size, data, usageHint)
  return lib.rlLoadShaderBuffer(size, data, usageHint)
end

--- Unload shader storage buffer object (SSBO)
---@param ssboId number
---@return void
function rl.rlUnloadShaderBuffer(ssboId)
  return lib.rlUnloadShaderBuffer(ssboId)
end

--- Update SSBO buffer data
---@param id number
---@param data const void
---@param dataSize number
---@param offset number
---@return void
function rl.rlUpdateShaderBuffer(id, data, dataSize, offset)
  return lib.rlUpdateShaderBuffer(id, data, dataSize, offset)
end

--- Bind SSBO buffer
---@param id number
---@param index number
---@return void
function rl.rlBindShaderBuffer(id, index)
  return lib.rlBindShaderBuffer(id, index)
end

--- Read SSBO buffer data (GPU->CPU)
---@param id number
---@param dest void
---@param count number
---@param offset number
---@return void
function rl.rlReadShaderBuffer(id, dest, count, offset)
  return lib.rlReadShaderBuffer(id, dest, count, offset)
end

--- Copy SSBO data between buffers
---@param destId number
---@param srcId number
---@param destOffset number
---@param srcOffset number
---@param count number
---@return void
function rl.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count)
  return lib.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count)
end

--- Get SSBO buffer size
---@param id number
---@return number
function rl.rlGetShaderBufferSize(id)
  return lib.rlGetShaderBufferSize(id)
end

--- Bind image texture
---@param id number
---@param index number
---@param format number
---@param readonly boolean
---@return void
function rl.rlBindImageTexture(id, index, format, readonly)
  return lib.rlBindImageTexture(id, index, format, readonly)
end

--- Get internal modelview matrix
---@return Matrix
function rl.rlGetMatrixModelview()
  return lib.rlGetMatrixModelview()
end

--- Get internal projection matrix
---@return Matrix
function rl.rlGetMatrixProjection()
  return lib.rlGetMatrixProjection()
end

--- Get internal accumulated transform matrix
---@return Matrix
function rl.rlGetMatrixTransform()
  return lib.rlGetMatrixTransform()
end

--- Get internal projection matrix for stereo render (selected eye)
---@param eye number
---@return Matrix
function rl.rlGetMatrixProjectionStereo(eye)
  return lib.rlGetMatrixProjectionStereo(eye)
end

--- Get internal view offset matrix for stereo render (selected eye)
---@param eye number
---@return Matrix
function rl.rlGetMatrixViewOffsetStereo(eye)
  return lib.rlGetMatrixViewOffsetStereo(eye)
end

--- Set a custom projection matrix (replaces internal projection matrix)
---@param proj Matrix
---@return void
function rl.rlSetMatrixProjection(proj)
  return lib.rlSetMatrixProjection(proj)
end

--- Set a custom modelview matrix (replaces internal modelview matrix)
---@param view Matrix
---@return void
function rl.rlSetMatrixModelview(view)
  return lib.rlSetMatrixModelview(view)
end

--- Set eyes projection matrices for stereo rendering
---@param right Matrix
---@param left Matrix
---@return void
function rl.rlSetMatrixProjectionStereo(right, left)
  return lib.rlSetMatrixProjectionStereo(right, left)
end

--- Set eyes view offsets matrices for stereo rendering
---@param right Matrix
---@param left Matrix
---@return void
function rl.rlSetMatrixViewOffsetStereo(right, left)
  return lib.rlSetMatrixViewOffsetStereo(right, left)
end

--- Load and draw a cube
---@return void
function rl.rlLoadDrawCube()
  return lib.rlLoadDrawCube()
end

--- Load and draw a quad
---@return void
function rl.rlLoadDrawQuad()
  return lib.rlLoadDrawQuad()
end

--- check if the given value is of type "Vector2"
---@param check any the value to compare
---@return boolean
function rl.IsVector2(check)
  return type(check) == "cdata" and ffi.istype("struct Vector2", ffi.typeof(check))
end

--- check if the given value is of type "Vector3"
---@param check any the value to compare
---@return boolean
function rl.IsVector3(check)
  return type(check) == "cdata" and ffi.istype("struct Vector3", ffi.typeof(check))
end

--- check if the given value is of type "Vector4"
---@param check any the value to compare
---@return boolean
function rl.IsVector4(check)
  return type(check) == "cdata" and ffi.istype("struct Vector4", ffi.typeof(check))
end

--- check if the given value is of type "Matrix"
---@param check any the value to compare
---@return boolean
function rl.IsMatrix(check)
  return type(check) == "cdata" and ffi.istype("struct Matrix", ffi.typeof(check))
end

--- check if the given value is of type "Color"
---@param check any the value to compare
---@return boolean
function rl.IsColor(check)
  return type(check) == "cdata" and ffi.istype("struct Color", ffi.typeof(check))
end

--- check if the given value is of type "Rectangle"
---@param check any the value to compare
---@return boolean
function rl.IsRectangle(check)
  return type(check) == "cdata" and ffi.istype("struct Rectangle", ffi.typeof(check))
end

--- check if the given value is of type "Image"
---@param check any the value to compare
---@return boolean
function rl.IsImage(check)
  return type(check) == "cdata" and ffi.istype("struct Image", ffi.typeof(check))
end

--- check if the given value is of type "Texture"
---@param check any the value to compare
---@return boolean
function rl.IsTexture(check)
  return type(check) == "cdata" and ffi.istype("struct Texture", ffi.typeof(check))
end

--- check if the given value is of type "RenderTexture"
---@param check any the value to compare
---@return boolean
function rl.IsRenderTexture(check)
  return type(check) == "cdata" and ffi.istype("struct RenderTexture", ffi.typeof(check))
end

--- val if the given value is of type "NPatchInfo"
---@param check any the value to compare
---@return boolean
function rl.IsNPatchInfo(check)
  return type(check) == "cdata" and ffi.istype("struct NPatchInfo", ffi.typeof(check))
end

--- check if the given value is of type "GlyphInfo"
---@param check any the value to compare
---@return boolean
function rl.IsGlyphInfo(check)
  return type(check) == "cdata" and ffi.istype("struct GlyphInfo", ffi.typeof(check))
end

--- check if the given value is of type "Font"
---@param check any the value to compare
---@return boolean
function rl.IsFont(check)
  return type(check) == "cdata" and ffi.istype("struct Font", ffi.typeof(check))
end

--- check if the given value is of type "Camera3D"
---@param check any the value to compare
---@return boolean
function rl.IsCamera3D(check)
  return type(check) == "cdata" and ffi.istype("struct Camera3D", ffi.typeof(check))
end

--- check if the given value is of type "Camera2D"
---@param check any the value to compare
---@return boolean
function rl.IsCamera2D(check)
  return type(check) == "cdata" and ffi.istype("struct Camera2D", ffi.typeof(check))
end

--- check if the given value is of type "Mesh"
---@param check any the value to compare
---@return boolean
function rl.IsMesh(check)
  return type(check) == "cdata" and ffi.istype("struct Mesh", ffi.typeof(check))
end

--- check if the given value is of type "Shader"
---@param check any the value to compare
---@return boolean
function rl.IsShader(check)
  return type(check) == "cdata" and ffi.istype("struct Shader", ffi.typeof(check))
end

--- check if the given value is of type "MaterialMap"
---@param check any the value to compare
---@return boolean
function rl.IsMaterialMap(check)
  return type(check) == "cdata" and ffi.istype("struct MaterialMap", ffi.typeof(check))
end

--- check if the given value is of type "Material"
---@param check any the value to compare
---@return boolean
function rl.IsMaterial(check)
  return type(check) == "cdata" and ffi.istype("struct Material", ffi.typeof(check))
end

--- check if the given value is of type "Transform"
---@param check any the value to compare
---@return boolean
function rl.IsTransform(check)
  return type(check) == "cdata" and ffi.istype("struct Transform", ffi.typeof(check))
end

--- check if the given value is of type "BoneInfo"
---@param check any the value to compare
---@return boolean
function rl.IsBoneInfo(check)
  return type(check) == "cdata" and ffi.istype("struct BoneInfo", ffi.typeof(check))
end

--- check if the given value is of type "Model"
---@param check any the value to compare
---@return boolean
function rl.IsModel(check)
  return type(check) == "cdata" and ffi.istype("struct Model", ffi.typeof(check))
end

--- check if the given value is of type "ModelAnimation"
---@param check any the value to compare
---@return boolean
function rl.IsModelAnimation(check)
  return type(check) == "cdata" and ffi.istype("struct ModelAnimation", ffi.typeof(check))
end

--- check if the given value is of type "Ray"
---@param check any the value to compare
---@return boolean
function rl.IsRay(check)
  return type(check) == "cdata" and ffi.istype("struct Ray", ffi.typeof(check))
end

--- check if the given value is of type "RayCollision"
---@param check any the value to compare
---@return boolean
function rl.IsRayCollision(check)
  return type(check) == "cdata" and ffi.istype("struct RayCollision", ffi.typeof(check))
end

--- check if the given value is of type "BoundingBox"
---@param check any the value to compare
---@return boolean
function rl.IsBoundingBox(check)
  return type(check) == "cdata" and ffi.istype("struct BoundingBox", ffi.typeof(check))
end

--- check if the given value is of type "Wave"
---@param check any the value to compare
---@return boolean
function rl.IsWave(check)
  return type(check) == "cdata" and ffi.istype("struct Wave", ffi.typeof(check))
end

--- check if the given value is of type "rAudioBuffer"
---@param check any the value to compare
---@return boolean
function rl.IsrAudioBuffer(check)
  return type(check) == "cdata" and ffi.istype("struct rAudioBuffer", ffi.typeof(check))
end

--- check if the given value is of type "rAudioProcessor"
---@param check any the value to compare
---@return boolean
function rl.IsrAudioProcessor(check)
  return type(check) == "cdata" and ffi.istype("struct rAudioProcessor", ffi.typeof(check))
end

--- check if the given value is of type "AudioStream"
---@param check any the value to compare
---@return boolean
function rl.IsAudioStream(check)
  return type(check) == "cdata" and ffi.istype("struct AudioStream", ffi.typeof(check))
end

--- check if the given value is of type "Sound"
---@param check any the value to compare
---@return boolean
function rl.IsSound(check)
  return type(check) == "cdata" and ffi.istype("struct Sound", ffi.typeof(check))
end

--- check if the given value is of type "Music"
---@param check any the value to compare
---@return boolean
function rl.IsMusic(check)
  return type(check) == "cdata" and ffi.istype("struct Music", ffi.typeof(check))
end

--- check if the given value is of type "VrDeviceInfo"
---@param check any the value to compare
---@return boolean
function rl.IsVrDeviceInfo(check)
  return type(check) == "cdata" and ffi.istype("struct VrDeviceInfo", ffi.typeof(check))
end

--- check if the given value is of type "VrStereoConfig"
---@param check any the value to compare
---@return boolean
function rl.IsVrStereoConfig(check)
  return type(check) == "cdata" and ffi.istype("struct VrStereoConfig", ffi.typeof(check))
end

--- check if the given value is of type "FilePathList"
---@param check any the value to compare
---@return boolean
function rl.IsFilePathList(check)
  return type(check) == "cdata" and ffi.istype("struct FilePathList", ffi.typeof(check))
end

--- check if the given value is of type "AutomationEvent"
---@param check any the value to compare
---@return boolean
function rl.IsAutomationEvent(check)
  return type(check) == "cdata" and ffi.istype("struct AutomationEvent", ffi.typeof(check))
end

--- check if the given value is of type "AutomationEventList"
---@param check any the value to compare
---@return boolean
function rl.IsAutomationEventList(check)
  return type(check) == "cdata" and ffi.istype("struct AutomationEventList", ffi.typeof(check))
end

return rl
