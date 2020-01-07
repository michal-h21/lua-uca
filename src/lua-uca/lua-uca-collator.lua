-- object for 
local collator = {}
collator.__index = collator

function collator.new(codes)
  local self = setmetatable({}, collator)
  -- table for 
  self.codes = codes or {}
  return self
end

function collator:get_implicit_weight(codepoints, pos)
  -- implicit weight is based on the codepoint value
  local codepoint = codepoints[pos]
  return {{codepoint, 0,  0}}, pos + 1
end

function collator:read_weight(codepoints, pos)
  -- try to find contractions
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

return collator
