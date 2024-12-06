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
    int = "integer",
    int_ = "integer",
    unsigned = "integer",
    unsigned_int = "integer",
    bool = "bool",
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

local generated = io.open("generated.h", "r")

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
    if typeof(entry.value) == "string" then
      local value = entry.value:gsub("CLITERAL%(Color%)", "")
      output = output .. `\n--- {entry.description}\nrl.{entry.name} = {value}\n`
    end
    if typeof(entry.value) == "number" then
      output = output .. `\n--- {entry.description}\nrl.{entry.name} = {entry.value}\n`
    end
  end
end

-- structs
for _, entry in pairs(raylibApi.structs) do
  output = output .. `\n\n--- {entry.description}`
  local fnArgs = {}

  for _, field in pairs(entry.fields) do
    output = output .. `\n---@param {field.name} {typeMap(field.type)} {field.description}`
    table.insert(fnArgs, tostring(field.name))
  end

  local combinedArgs = tableJoin(fnArgs, ", ")

  if entry.returnType ~= nil then
    output = output .. `\n---@return {entry.returnType}`
  end
  output = output .. `\nfunction rl.{entry.name}({combinedArgs})`
  output = output .. `\n  return ffi.new("{entry.name}", {combinedArgs})`
  output = output .. `\nend\n`
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
    output = output .. `\n---@return {entry.returnType}`
  end

  local combinedArgs = tableJoin(fnArgs, ", ")
  if combinedArgs == "" or combinedArgs == nil then
    output = output .. `\nfunction rl.{entry.name}()`
    output = output .. `\n  return lib.{entry.name}()`
  else
    output = output .. `\nfunction rl.{entry.name}({combinedArgs})`
    output = output .. `\n  return lib.{entry.name}({combinedArgs})`
  end
  output = output .. `\nend\n`
end

local output = output .. [[

return rl
]]

fs.writeFile("raylib.lua", output)
print(`Wrote out {#output / 1000} kb to raylib.lua`)
