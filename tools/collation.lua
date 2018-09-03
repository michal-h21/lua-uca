local collation = {}
collation.__index = collation

function collation.new()
  local self = setmetatable({}, collation)
  self.keys = {}
  return self
end

local function unhex(num)
  return tonumber(num, 16)
end

local function get_elements(line)
  local key, elements = {},{}
  local key_part, elements_part = line:match("^%s*([^%;]+);([^%#]+)")
  if not key_part then return nil end
  for k in key_part:gmatch("([0-9a-fA-F]+)") do key[#key+1] = unhex(k) end
  for typ, primary, secondary, tertiary, quartery  in line:gmatch("%[([%.%*]?)([0-9a-fA-F]+)%.([0-9a-fA-F]+)%.([0-9a-fA-F]+)%.?([0-9a-fA-F]*)") do
    table.insert(elements,{ type = typ, unhex(primary), unhex(secondary), unhex(tertiary), unhex(quartery) })
  end
  return key, elements
end

-- it is necessary to process the key and create a tree
function collation:update_keys(key, elements)
  local keys = self.keys
  local function add_to_tree(tbl, current_pos)
    local tbl = tbl or {}
    local current_key = key[current_pos]
    local el =  tbl[current_key] or {}
    if current_pos < #key then
      el.children = add_to_tree(el.children, current_pos + 1)
    elseif current_pos == #key then
      el.value = elements
    end
    tbl[current_key] = el
    return tbl
  end
  keys = add_to_tree(keys, 1)
end

function collation:load_ducet(content)
  for line in content:gmatch("([^\n]+)") do
    -- ignore comments
    if line:match("^%s*#") then
    -- ignore version
    elseif line:match("^%s*@version") then
    -- Todo: process implicits
    elseif line:match("@implicitweights") then
    else
      local key, elements = get_elements(line)
      self:update_keys(key, elements)
    end
  end
end

return collation
