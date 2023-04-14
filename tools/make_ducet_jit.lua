--- split-duect.lua
-- run: lua split-duect.lua > lua-uca-ducet.lua
package.path = package.path .. ";src/?.lua"
local ducet = require "lua-uca.lua-uca-ducet"

local function encode(tbl)
  local ret = {}
  local i = 0
  for key, val in pairs(tbl) do
    i = i + 1
    if type(key) == "number" then
      ret[i] = string.format("[%d]=%s", key, type(val) == "table" and type(val) == "table" and encode(val) or type(val) == "number" and val or '"' .. tostring(val) .. '"')
    else
      ret[i] = string.format("%s=%s", key, type(val) == "table" and type(val) == "table" and encode(val) or type(val) == "number" and val or '"' .. tostring(val) .. '"')
    end
  end
  return "{" .. table.concat(ret, ",") .. "}"
end

local tbl = {}
local txt
local ret = {
  [[
local ret = {}

local function concat(tbl)
  for key, val in pairs(tbl) do
    ret[key] = val
  end
end

]]
}
local i = 0
local part = 1

local function add()
  txt = encode(tbl)
  ret[part + 1] = "local function part" .. part .. "()\n\treturn " .. txt .. "\nend\nconcat(part" .. part .. "())\n\n"
  part = part + 1
  tbl = {}
end

for key, val in pairs(ducet) do
  i = i + 1
  tbl[key] = val
  if i % 10000 == 0 then
    add()
  end
end
add()
part = part + 1
ret[part] = "return ret"
print(table.concat(ret))