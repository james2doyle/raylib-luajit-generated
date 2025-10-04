local Lust = require("api/Lust")

-- the list of API files to load
local raylibApi = require("api/raylib_api")
local rlglApi = require("api/rlgl_api")
local raymathApi = require("api/raymath_api")
local configApi = require("api/config_api")
-- right now, the raylib_parser does not output the full raygui code
-- local rayguiApi = require("api/raygui_api")

local apiFiles = {
  raylibApi,
  rlglApi,
  raymathApi,
  configApi,
  -- rayguiApi,
}

local function table_contains(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

local function skipped_types(check)
  local t = {
    "GUARD",
    "MACRO",
    "UNKNOWN",
  }

  return table_contains(t, check)
end

--- Converts a C-style constant math expression string to a Lua expression string
--- using the simplified rule: remove the float suffix, then prefix constants with 'rl.'.
---@param c_style_math_string string The C-style math string (e.g., "(PI/180.0f)").
---@return string The converted Lua expression string (e.g., "rl.PI / 180").
local function convert_c_math_to_lua(c_style_math_string)
  -- 1. Remove the floating point suffix '.0f' or '.0F' and spaces, preserving only the integer.
  -- We target the specific patterns as requested by the user, and spaces.
  local temp_string = c_style_math_string:gsub("%.%d+[fF]", ""):gsub("%s*", "")

  -- 2. Remove outer parentheses.
  temp_string = temp_string:gsub("^%s*%((.+?)%)%s*$", "%1")

  -- 3. Replace uppercase constant names with the 'rl.' prefix.
  -- We look for single or multi-letter words consisting entirely of uppercase letters (A-Z).
  local lua_expression = temp_string:gsub("([A-Z_]+)", "rl.%1")

  -- 4. Re-add spaces around the division symbol for readability.
  return lua_expression:gsub("/", " / ")
end

local tableReturnTemplate = Lust({ [[@map{ n=argList, _separator=", " }:{{$n}}]] })

local function type_map(check)
  local key = check:gsub("*", ""):gsub(" ", "_")

  local typemap = {
    string = "string",
    char = "string",
    char_ = "string",
    const_char_ = "string",
    const_unsigned_char_ = "string",
    unsigned_char = "string",
    unsigned_char_ = "string",
    unsigned_short_ = "string",
    float = "number",
    float_ = "number",
    double = "number",
    int = "number",
    int_ = "number",
    unsigned = "number",
    unsigned_int = "number",
    unsigned_int_ = "number",
    bool = "boolean",
    void_ = "void",
    void = "void",
  }

  -- match array values
  local pattern = "([%w_]+)%[(%d+)%]"
  local word, number = key:match(pattern)

  if word and word == "char" then
    return typemap["char"]
  end

  if word and number and word ~= "char" then
    local mapped = typemap[word] or word:gsub("*", "")
    local argList = {}
    for i = 1, tonumber(number) do
      table.insert(argList, mapped)
    end

    local output = tableReturnTemplate:gen({ argList = argList })

    return string.format("%s[] {%s}", mapped, output)
  end

  return typemap[key] or check:gsub("*", "")
end

-- Open the file in write mode
local file = assert(io.open("init.lua", "w"), "Could not load init.lua")

-- Check if the file was successfully opened
if file == nil then
  error("Output file (init.lua) could not be opened")
end

local header = [[
local ffi = require("ffi")
local lib = ffi.load("libraylib")

local generated = assert(io.open("raylib/generated.h", "r"), "Cannot find generated.h")

ffi.cdef(generated:read("*all"))

local mt = { __index = lib }
local rl = setmetatable({}, mt)

local raygui = require("raylib/raygui")
rl = raygui(rl)

local physac = require("raylib/physac")
rl = physac(rl)
]]

file:write(header)

-- defines
local definesTemplate = Lust({ [[$entry.description
  rl.$entry.name = $entry.value

]] })

-- bucket to make sure structs aren't doubled
local loadedDefines = {}

for _, targetApi in pairs(apiFiles) do
  for _, entry in pairs(targetApi.defines) do
    if table_contains(loadedDefines, entry.name) == false then
      if skipped_types(entry.type) == false and entry.value ~= "" then
        if entry.description ~= "" then
          entry.description = "--- " .. entry.description
        end

        if type(entry.value) == "string" then
          entry.value = entry.value:gsub("CLITERAL%(Color%)", "")
        end

        if entry.type == "STRING" then
          entry.value = string.format("%q", entry.value)
        end

        if entry.type == "FLOAT_MATH" then
          entry.value = convert_c_math_to_lua(entry.value)
        end

        local output = definesTemplate:gen({ entry = entry })

        local formattedOutput = string.format("  %s", output)

        -- print(formattedOutput)

        file:write(formattedOutput)

        table.insert(loadedDefines, entry.name)
      end
    end
  end
end

-- structs
local structsClassTemplate =
  Lust({ [[$class $entry.name
  @map{ n=entry.fields }:{{$field $n.name $n.type $newline}}]] })

local structsFunctionTemplate = Lust({
  [[  --- $entry.description @map{ n=entry.fields }:{{$newline  $param $n.name $n.type}}
  $returns $entry.name
  function rl.$entry.name(@map{ n=entry.fields, _separator=", " }:{{$n.name}})
    return ffi.new("$entry.name", @map{ n=entry.fields, _separator=", " }:{{$n.name}})
  end]],
})

-- bucket to make sure structs aren't doubled
local loadedStructs = {}

for _, targetApi in pairs(apiFiles) do
  for _, entry in pairs(targetApi.structs) do
    if table_contains(loadedStructs, entry.name) == false then
      if entry.fields ~= nil then
        for i, v in ipairs(entry.fields) do
          entry.fields[i].type = type_map(entry.fields[i].type)
        end
      end

      local classOutput = structsClassTemplate:gen({
        entry = entry,
        class = "---@class",
        field = "---@field",
        newline = "\n",
      })

      local functionOutput = structsFunctionTemplate:gen({
        entry = entry,
        param = "---@param",
        returns = "---@return",
        newline = "\n",
      })

      local formattedOutput = string.format("\n\n  %s\n%s", classOutput, functionOutput)

      -- print(formattedOutput)

      file:write(formattedOutput)

      table.insert(loadedStructs, entry.name)
    end
  end
end

-- aliases
local aliasesTemplate = Lust({ [[@map{ n=aliases }:{{  $alias $n.name $n.type$newline}}]] })

for _, targetApi in pairs(apiFiles) do
  if #targetApi.aliases > 0 then
    local output = aliasesTemplate:gen({
      aliases = targetApi.aliases,
      alias = "---@alias",
      newline = "\n",
    })

    local formattedOutput = string.format("\n\n%s\n", output)

    -- print(formattedOutput)

    file:write(formattedOutput)
  end
end

-- enums
local enumsTemplate =
  Lust({ [[@map{ n=entry.values }:{{  --- $n.description$newline  rl.$n.name = $n.value$newline$newline}}]] })

for _, targetApi in pairs(apiFiles) do
  for _, entry in pairs(targetApi.enums) do
    local output = enumsTemplate:gen({
      entry = entry,
      newline = "\n",
    })

    local formattedOutput = string.format("%s", output)

    -- print(formattedOutput)

    file:write(formattedOutput)
  end
end

---@todo callbacks?

-- functions
local functionsTemplate = Lust({
  [[  --- $entry.description @map{ n=entry.params }:{{$newline  $param $n.name $n.type}}
  $returns $entry.returnType
  function rl.$entry.name(@map{ n=entry.params, _separator=", " }:{{$n.name}})
    return lib.$entry.name(@map{ n=entry.params, _separator=", " }:{{$n.name}})
  end]],
})

for _, targetApi in pairs(apiFiles) do
  for _, entry in pairs(targetApi.functions) do
    entry.returnType = type_map(entry.returnType)

    if entry.params ~= nil then
      for i, v in ipairs(entry.params) do
        entry.params[i].name = entry.params[i].name == "end" and "ending" or entry.params[i].name
        entry.params[i].type = type_map(entry.params[i].type)
      end
    end

    local output = functionsTemplate:gen({
      entry = entry,
      param = "---@param",
      returns = "---@return",
      newline = "\n",
    })

    local formattedOutput = string.format("\n%s\n", output)

    -- print(formattedOutput)

    file:write(formattedOutput)
  end
end

local footer = [[

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

  --- Get vector length (magnitude)
  ---@param v Vector2
  ---@return number
  function rl.Vector2Length(v)
    return math.sqrt(v.x * v.x + v.y * v.y)
  end

  --- Add two vectors (v1 + v2)
  ---@param v1 Vector2
  ---@param v2 Vector2
  ---@return Vector2
  function rl.Vector2Add(v1, v2)
    return rl.Vector2(v1.x + v2.x, v1.y + v2.y)
  end

  --- Subtract two vectors (v1 - v2)
  ---@param v1 Vector2
  ---@param v2 Vector2
  ---@return Vector2
  function rl.Vector2Subtract(v1, v2)
    return rl.Vector2(v1.x - v2.x, v1.y - v2.y)
  end

  --- Calculate cross product of two vectors (Vector2Cross)
  --- The 2D 'cross product' is equivalent to the Z-component of the 3D cross product.
  ---@param v1 Vector2
  ---@param v2 Vector2
  ---@return number
  function rl.Vector2Cross(v1, v2)
    return v1.x * v2.y - v1.y * v2.x
  end

  --- Normalize provided vector
  ---@param v Vector2
  ---@return Vector2
  function rl.Vector2Normalize(v)
    local length = rl.Vector2Length(v)
    if length == 0 then
      -- Return a zero vector if the length is zero to avoid division by zero.
      return rl.Vector2(0, 0)
    end
    local invLength = 1 / length
    return rl.Vector2(v.x * invLength, v.y * invLength)
  end

  --- Scale vector (multiply by value)
  ---@param v Vector2
  ---@param scale number
  ---@return Vector2
  function rl.Vector2Scale(v, scale)
    return rl.Vector2(v.x * scale, v.y * scale)
  end

  --- Calculate the length (magnitude) of a Vector3
  ---@param v Vector3 The vector to calculate the length of.
  ---@return number
  function rl.Vector3Length(v)
    return math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z)
  end

  --- Add two Vector3 vectors (v1 + v2)
  ---@param v1 Vector3 The first vector.
  ---@param v2 Vector3 The second vector.
  ---@return Vector3
  function rl.Vector3Add(v1, v2)
    return rl.Vector3(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
  end

  --- Subtract two Vector3 vectors (v1 - v2)
  ---@param v1 Vector3 The first vector (minuend).
  ---@param v2 Vector3 The second vector (subtrahend).
  ---@return Vector3
  function rl.Vector3Subtract(v1, v2)
    return rl.Vector3(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
  end

  --- Calculate the cross product of two Vector3 vectors (v1 x v2)
  ---@param v1 Vector3 The first vector.
  ---@param v2 Vector3 The second vector.
  ---@return Vector3
  function rl.Vector3Cross(v1, v2)
    local x = v1.y * v2.z - v1.z * v2.y
    local y = v1.z * v2.x - v1.x * v2.z
    local z = v1.x * v2.y - v1.y * v2.x
    return rl.Vector3(x, y, z)
  end

  --- Normalize a Vector3 (set its magnitude to 1.0)
  ---@param v Vector3 The vector to normalize.
  ---@return Vector3
  function rl.Vector3Normalize(v)
    local length = rl.Vector3Length(v)
    if length == 0 then
      return rl.Vector3(0, 0, 0)
    else
      return rl.Vector3(v.x / length, v.y / length, v.z / length)
    end
  end

  --- Scale a Vector3 (multiply by a value)
  ---@param v Vector3 The vector to scale.
  ---@param scale number The scalar value to multiply the vector components by.
  ---@return Vector3
  function rl.Vector3Scale(v, scale)
    return rl.Vector3(v.x * scale, v.y * scale, v.z * scale)
  end


  return rl
]]

file:write(footer)

file:close()
