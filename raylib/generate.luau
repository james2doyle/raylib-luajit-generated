local fs = require("@lune/fs")

local function isUpperCase(str)
  return str == string.upper(str)
end

local function tableJoin(intable, separator)
  -- Check if the input is actually a table
  if type(intable) ~= "table" then
    error("Input is not a table")
  end

  -- Filter out nil values
  local filteredTable = {}
  for i, v in ipairs(intable) do
    if v ~= nil then
      table.insert(filteredTable, tostring(v))
    end
  end

  -- Join the filtered table
  return table.concat(filteredTable, separator)
end

local function splitAtFirstComma(str)
    local commaIndex = string.find(str, ",")

    if commaIndex then
        return { str:sub(1, commaIndex-1), str:sub(commaIndex+1) }
    else
        return { str }
    end
end

-- Parse different file formats into lua tables
local raylibApi = require("api/raylib_api.lua")

local function typeMap(check)
  local key = check:gsub("*", ""):gsub(" ", "_")

  local typemap = {
    string = "string",
    char_ = "string",
    const_char_ = "string",
    const_unsigned_char_ = "string",
    unsigned_char = "string",
    unsigned_char_ = "string",
    unsigned_short_ = "string",
    float = "number",
    float_ = "number",
    double = "number",
    int = "integer",
    int_ = "integer",
    unsigned = "integer",
    unsigned_int = "integer",
    bool = "boolean",
    void_ = "void",
    void = "void",
  }

  return typemap[key] or check
end

local function table_contains(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

local function skippedTypes(check)
  local t = {
    "GUARD",
    "MACRO",
    "UNKNOWN",
    "FLOAT_MATH",
  }

  return table_contains(t, check)
end

local output = [[
local ffi = require("ffi")
local lib = ffi.load("libraylib")

local generated = io.open("raylib/generated.h", "r")

if generated == nil then
  error("Cannot find generated.h")
end

ffi.cdef(generated:read("*all"))

local mt = {__index = lib}
local rl = setmetatable({}, mt)
]]

-- defines
for _, entry in pairs(raylibApi.defines) do
  if skippedTypes(entry.type) == false and entry.value ~= "" then
    if entry.description ~= "" then
      output = output .. `\n--- {entry.description}`
    end
    if typeof(entry.value) == "string" then
      local value = entry.value:gsub("CLITERAL%(Color%)", "")
      output = output .. `\nrl.{entry.name} = {value}\n`
    end
    if typeof(entry.value) == "number" then
      output = output .. `\nrl.{entry.name} = {entry.value}\n`
    end
  end
end

-- structs
for _, entry in pairs(raylibApi.structs) do
  local className = splitAtFirstComma(entry.description)
  output = output .. `\n---@class {className[1]}`
  for _, field in pairs(entry.fields) do
    output = output .. `\n---@field {field.name} {typeMap(field.type)} {field.description}`
  end

  output = output .. `\n`
end

---@todo: figure out a way capture aliases
output = output .. `\n---@alias Camera3D Camera\n---@alias Texture2D Texture\n---@alias TextureCubemap Texture\n---@alias Quaternion Vector4\n---@alias RenderTexture2D RenderTexture`

for _, entry in pairs(raylibApi.structs) do
  output = output .. `\n\n--- {entry.description}`
  local fnArgs = {}

  for _, field in pairs(entry.fields) do
    output = output .. `\n---@param {field.name} {typeMap(field.type)} {field.description}`
    table.insert(fnArgs, tostring(field.name))
  end

  local combinedArgs = tableJoin(fnArgs, ", ")

  if entry.returnType ~= nil then
    output = output .. `\n---@return {typeMap(entry.returnType)}`
  end
  output = output .. `\nfunction rl.{entry.name}({combinedArgs})`
  output = output .. `\n  return ffi.new("{entry.name}", {combinedArgs})`
  output = output .. `\nend`
end

-- aliases
-- enums
for _, entry in pairs(raylibApi.enums) do
  output = output .. `\n\n--- {entry.name} {entry.description}\n\n`

  for _, field in pairs(entry.values) do
    output = output .. `\n--- {field.description}`
    output = output .. `\nrl.{field.name} = {field.value}`
  end
end
-- callbacks

-- functions
for _, entry in pairs(raylibApi.functions) do
  output = output .. `\n--- {entry.description}`

  local fnArgs = {}

  if entry.params ~= nil then
    for _, param in pairs(entry.params) do
      local name = param.name == "end" and "ending" or param.name
      output = output .. `\n---@param {name} {typeMap(param.type)}`
      table.insert(fnArgs, tostring(name))
    end
  end

  if entry.returnType ~= nil then
    output = output .. `\n---@return {typeMap(entry.returnType)}`
  end

  local combinedArgs = tableJoin(fnArgs, ", ")
  if combinedArgs == "" or combinedArgs == nil then
    output = output .. `\nfunction rl.{entry.name}()`
    output = output .. `\n  return lib.{entry.name}()`
  else
    output = output .. `\nfunction rl.{entry.name}({combinedArgs})`
    output = output .. `\n  return lib.{entry.name}({combinedArgs})`
  end
  output = output .. `\nend`
end

local output = output .. [[

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
  return type(check) == "cdata" and ffi.istype("struct RenderTexture", ffi.typeof(value))
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
]]

fs.writeFile("init.lua", output)
print(`Wrote out {#output / 1000} kb to init.lua`)
