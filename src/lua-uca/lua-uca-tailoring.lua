
local floor = math.floor

-- search value in table with ranges
-- source: Xindex
local function binary_range_search(code_point, ranges)
  local low, mid, high
  low, high = 1, #ranges
  while low <= high do
    mid = floor((low + high) / 2)
    local range = ranges[mid]
    if code_point < range[1] then
      high = mid - 1
    elseif code_point <= range[2] then
      return range, mid
    else
      low = mid + 1
    end
  end
  return nil, mid
end

-- find the group of a script name or alias (ISO 15924 code etc.), in any case
local function find_group(what, blocks)
  local name = what:lower()
  for i, v in ipairs(blocks) do
    if v.name == name then return i end
    for _, alias in ipairs(v.aliases or {}) do
      if alias == name then return i end
    end
  end
end

-- names for all the groups that are not listed
local others = {others = true, zzzz = true}
-- groups that stay at the start when they are not listed
local special = {digits = true}

-- add a script to the reordering, as in CLDR (UTS #35): the listed groups
-- come first, in the given order; the groups that are not listed come in
-- their default order at the place of "others", or after the listed ones;
-- the special groups (digits) that are not listed stay at the start
local function reorder(what, blocks)
  blocks.order = blocks.order or {}
  if others[what:lower()] then
    table.insert(blocks.order, "others")
    return blocks
  end
  local index = find_group(what, blocks)
  if not index then return nil, "Cannot find block for reordering" end
  table.insert(blocks.order, index)
  return blocks
end

-- the new place of each group: {min, max, move}, sorted by min
local function make_moves(blocks)
  local listed, seen, has_others = {}, {}, false
  for _, item in ipairs(blocks.order or {}) do
    if item == "others" then
      if not has_others then listed[#listed + 1] = "others" end
      has_others = true
    elseif not seen[item] then
      seen[item] = true
      listed[#listed + 1] = item
    end
  end
  local unlisted = {}
  local sequence = {}
  for i, block in ipairs(blocks) do
    if not seen[i] then
      if special[block.name] then
        sequence[#sequence + 1] = i
      else
        unlisted[#unlisted + 1] = i
      end
    end
  end
  if not has_others then listed[#listed + 1] = "others" end
  for _, item in ipairs(listed) do
    if item == "others" then
      for _, i in ipairs(unlisted) do sequence[#sequence + 1] = i end
    else
      sequence[#sequence + 1] = item
    end
  end
  -- the groups get consecutive weights from the lowest one
  local position = blocks[1].min
  local moves = {}
  for _, i in ipairs(sequence) do
    local block = blocks[i]
    moves[#moves + 1] = {block.min, block.max, position - block.min}
    position = position + block.max - block.min + 1
  end
  table.sort(moves, function(x, y) return x[1] < y[1] end)
  return moves
end

-- the reordered primary weight
local function move_primary(weight, moves)
  local range = binary_range_search(weight, moves)
  return range and weight + range[3] or weight
end

-- the primary weights of implicit weights start a pair of collation
-- elements; the second one is not a primary weight of a group
local function is_implicit_lead(weight)
  return weight >= 0xFB00 and weight <= 0xFBFF
end

local function reorder_collator(collator, blocks)
  local moves = make_moves(blocks)
  -- the weights moved by a previous reordering are moved back first: the
  -- previous moves at their new places
  local undo
  if collator.reorder_moves then
    undo = {}
    for _, move in ipairs(collator.reorder_moves) do
      undo[#undo + 1] = {move[1] + move[3], move[2] + move[3], -move[3]}
    end
    table.sort(undo, function(x, y) return x[1] < y[1] end)
  end
  local function update_value(value)
    local continuation = false
    for _, element in ipairs(value) do
      local weight = element[1]
      if undo then weight = move_primary(weight, undo) end
      if not continuation and weight ~= 0 then
        element[1] = move_primary(weight, moves)
      else
        element[1] = weight
      end
      continuation = is_implicit_lead(weight)
    end
  end
  local function update_weights(entry)
    if entry.value then update_value(entry.value) end
    for _, child in pairs(entry.children or {}) do
      update_weights(child)
    end
  end
  for _, current in pairs(collator.codes) do
    update_weights(current)
  end
  collator.reorder_moves = moves
  -- clear the caches
  collator.stringcache = {}
  collator.weight_to_char = nil
end

-----------------------
-- tailoring support --
-- --------------------
local tailoring_table = {1, 0, 0}
local secondary_tailoring = {0, 1, 0}
local tertiary_tailoring = {0, 0, 1}
local equal_tailoring= {0, 0, 0}

local function equal_string(collator_obj,base, target)
  collator_obj:equal(collator_obj:string_to_codepoints(base), collator_obj:string_to_codepoints(target))
end

local function tailor_string(collator_obj, str)
  -- cupport the cldr strings in the form: &D<<đ<<<Đ<<ð<<<Ð
  -- it is important that the strings are in the NFC normal form
  -- the CLDR XML files are in NFD, so they need to be converted
  -- for example using `uconv -x any-nfc < file.xml`
  local function tailor(a, b, tbl) 
    local autf = collator_obj:string_to_codepoints(a)
    local butf = collator_obj:string_to_codepoints(b)
    collator_obj:tailor(autf,butf, tbl) 
  end
  local function tailor_equal(base, target)
    equal_string(collator_obj, base, target)
  end
  local function tailor_primary(a,b) tailor(a,b, tailoring_table) end
  local function tailor_secondary(a,b) tailor(a,b, secondary_tailoring) end
  local function tailor_tertiary(a,b) tailor(a,b, tertiary_tailoring) end
  local functions = {["<"] = tailor_primary, ["<<"] = tailor_secondary, ["<<<"] = tailor_tertiary, ["="] = tailor_equal}
  local first = str:match("^&?([^%<^%=%*]+)")
  for fn, second in str:gmatch("([<=*]+)([^<^%=%*]+)") do
    if fn:match("%*$") then  -- Ending with "*" like "<*"
      fn = fn:sub(1, -2)
      local exec = functions[fn]
      for char in second:gmatch(utf8.charpattern) do
        exec(first, char)
        first = char
      end
    else
      local exec = functions[fn]
      exec(first, second)
      first = second -- set the current second object as first for the next round
    end
  end
end


local M = {}

M.reorder = reorder
M.reorder_collator = reorder_collator
M.move_primary = move_primary
M.tailor_string = tailor_string
return M

