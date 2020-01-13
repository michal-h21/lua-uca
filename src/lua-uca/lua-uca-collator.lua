-- object for Unicode string collation
local math = require "math"

local collator = {}
collator.__index = collator

function collator.new(codes)
  local self = setmetatable({}, collator)
  -- tree with mappings from codepoints to collation elements
  self.codes = codes or {}
  -- cached sort keys
  self.stringcache = {}
  self.tailoring_multiplier = {1, 1, 1, 1}
  return self
end

-- make tree that points weights back to codepoints
function collator:weight_to_codepoints(codes)
  local weights = {}
  local codes = codes or self.codes

  local function insert_weight(element, codepoints)
    local values = element.value
    if values and not element.equal then
      values = values[1]
      local current = weights
      for i, weight in ipairs(values) do
        local new = current[weight] or {}
        if i == #values then
          new.codepoints = codepoints
        end
        current[weight] = new
        current = new
      end
    end
    for codepoint, element in ipairs(element.children or {}) do
      -- make copy of the codes table, so the new codepoints are not added indefinitely
      local newcodes = {table.unpack(codes)}
      newcodes[#newcodes + 1] = codepoint
      insert_weight(element, newcodes)
    end
  end
  for codepoint, element in pairs(codes) do
    insert_weight(element, {codepoint})
  end
  return weights
end

function collator:get_implicit_weight(codepoints, pos)
  -- implicit weight is based on the codepoint value
  local codepoint = codepoints[pos]
  return {{codepoint, 0,  0}}, pos + 1
end

function collator:read_weight(codepoints, pos)
  -- try to find contractions and return weight for longest matched string
  -- in the database
  local function read_children(parent, pos)
    local children = parent.children or {}
    local newpos = pos + 1
    newcodepoint = codepoints[newpos]
    -- if we go out of the codepoint array
    if not newcodepoint then return nil end
    local child = children[newcodepoint]
    if child then 
      local nextchild, nextpos = read_children(child, newpos)
      if nextchild then return nextchild, nextpos end
      if child.value then return child.value, newpos end
    end
    return nil
  end
  local weights
  local current_codepoint = codepoints[pos]
  local codes = self.codes[current_codepoint]
  if not codes then return nil, pos + 1 end
  -- first try to read contractions
  weights, new_pos = read_children(codes, pos)
  if weights then return weights, new_pos + 1 end
  -- if no contraction, weights are in the value field
  return codes.value, pos + 1
end

-- get weights for the next characters
function collator:get_weights(codepoints, pos)
  local weights, next_pos = self:read_weight(codepoints, pos) 
  -- return implicit weights for codepoints that are not in the database
  if not weights then
    weights, next_pos = self:get_implicit_weight(codepoints, pos)
  end
  -- don't step next_pos if it is larger than size of the codepoints array
  if next_pos > #codepoints then next_pos = nil end
  return weights, next_pos
end

-- get characters with lowest weight at the given point of the codepoint array
-- useful for index header strings
function collator:get_lowest_char(codepoints, pos)
  local weights, next_pos = self:read_weight(codepoints, pos)
  local weight_to_char = self.weight_to_char or self:weight_to_codepoints()
  for k, v in pairs(weight_to_char) do print(k) end
  local first = weights[1][1]
  local current = weight_to_char[first]
  print(first, current)

end

function collator:update_levels(levels, weights)
  -- process weight weights
  for _, w in ipairs(weights) do
    for i, x in ipairs(w) do
      --  process collation elements
      if x ~= 0 then -- ignore zero elements
        -- insert element at the current collation level
        local current_level = levels[i] or {}
        table.insert(current_level, x)
        levels[i] = current_level
      end
    end
  end
  return levels
end



-- make sort key from codepoints array (it can be created using the utf8.codes() function
function collator:make_sort_key(codepoints)
  local levels = {}
  local pos = 1
  local weights 
  local sort_key = {}
  while true do
    -- 
    weights, pos = self:get_weights(codepoints, pos)
    levels = self:update_levels(levels, weights)
    -- break when we reach end of the codepoints array
    if not pos then break end
  end
  for i, elements in ipairs(levels) do 
    for _, element in ipairs(elements) do
      table.insert(sort_key, element)
    end
    -- zero separates levels in the sort key
    table.insert(sort_key, 0)
  end
  return sort_key
end

function collator:compare(a, b)
  -- sort using sort keys
  local min = math.min(#a, #b)
  for i = 1, min do 
    if a[i] ~= b[i] then return a[i] < b[i] end
  end
  -- this should happen only when the strings are equal
  -- it needs to return false, otherwise the table.sort function reports
  -- "invalid order function for sorting" error
  return #a < #b
end

function collator:string_to_codepoints(a)
  local codepoints = {}
  for _, code in utf8.codes(a) do codepoints[#codepoints+1] = code end
  return codepoints
end

function collator:compare_strings(a,b)
  -- sort using strings
  local cache = self.stringcache
  local get_sortkey = function(x) return self:make_sort_key(self:string_to_codepoints(x)) end
  local asortkey = cache[a] or get_sortkey(a)
  local bsortkey = cache[b] or get_sortkey(b)
  cache[a], cache[b] = asortkey, bsortkey
  return self:compare(asortkey, bsortkey)
end

-- update collation codes
function collator:update_codes(key, elements)
  local keys = self.codes
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


--- change sorting ordering
-- 
function collator:tailor(base, target, tailoring_table)
  -- get the value of the base character
  local value = self:get_weights(base, 1)
  local new_value = {}
  --  create a new collation element
  for k, v in ipairs(value) do
    local subtable = {}
    for x, y in ipairs(v) do
      subtable[x] = y + ((tailoring_table[x] or 0) * self.tailoring_multiplier[x] or 1)
    end
    new_value[k] = subtable
  end
  self:update_codes(target, new_value)
end

-- expand characters to another characters
function collator:equal(base, target)
  local new_weight = {}
  local values, pos 
  pos = 1
  while true do
    value, pos = self:get_weights(target, pos)
    for _, v in ipairs(value) do 
      new_weight[#new_weight + 1] = v 
    end
    if not pos then break end
  end
  self:update_codes(base, new_weight)
end

-- sort uppercase first
function collator:uppercase_first()
  -- table with values for uppercase
  local uppercase_values = {0x08, 0x09, 0xA, 0xB, 0x0C, 0x0E, 0x11, 0x12, 0x1D}
  local is_uppercase = {}
  -- we must invert tertiary element in tailoring
  self.tailoring_multiplier[3] = -1
  for k,v in ipairs(uppercase_values) do is_uppercase[v] = true end
  
  local function change_case(element)
    local value =  element.value or {}
    for _, collation_element in ipairs(value) do
      -- detect if the tertiary element is uppercase
      local third = collation_element[3]
      -- make new collation element and insert it before the tertiary element
      local case = is_uppercase[third] and 1 or 3
      table.insert(collation_element, 3, case)
    end
    -- recursivelly process children
    local children = element.children or {}
    for _, child in ipairs(children) do change_case(child) end
  end
  for _, element in pairs(self.codes) do
    change_case(element)
  end

end


return collator
