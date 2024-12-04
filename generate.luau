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
          print(filteredTable)
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
    float = "number",
    int = "integer",
    unsigned_int = "integer",
    bool = "bool",
    void_ = "void",
    void = "void",
  }

  return typemap[key] or check
end

local output = [[
local ffi = require("ffi")

return function(lib)
  local mt = {__index = lib}
  local rl = setmetatable({}, mt)
]]

-- defines
for _, entry in pairs(raylibApi.defines) do
  if entry.type ~= "UNKNOWN" and entry.value ~= "" then
    if typeof(entry.value) == "string" then
      local value = entry.value:gsub("CLITERAL(Color)", "")
      output = output .. `\n  --- {entry.description}\n  rl.{entry.name} = {value}\n`
    end
    if typeof(entry.value) == "number" then
      output = output .. `\n  --- {entry.description}\n  rl.{entry.name} = {entry.value}\n`
    end
  end
end

-- structs
for _, entry in pairs(raylibApi.structs) do
  output = output .. `\n\n  --- {entry.description}`
  local fnArgs = {}

  for _, field in pairs(entry.fields) do
    output = output .. `\n  ---@param {typeMap(field.type)} {field.name} {field.description}`
    table.insert(fnArgs, tostring(field.name))
  end

  local combinedArgs = tableJoin(fnArgs, ", ")

  if entry.returnType ~= nil then
    output = output .. `\n  ---@return {entry.returnType}`
  end
  output = output .. `\n  function rl.{entry.name}({combinedArgs})`
  output = output .. `\n    return ffi.new("{entry.name}", {combinedArgs})`
  output = output .. `\n  end\n`
end

-- aliases
-- enums
-- callbacks
-- functions

local output = output .. [[


  return rl
end
]]

print(output)
fs.writeFile("output.lua", output)