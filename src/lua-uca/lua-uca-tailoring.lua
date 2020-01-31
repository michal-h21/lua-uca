
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

local function get_range(block, blocks)
  for _,v in ipairs(blocks) do
    if v.name == block then return v.min, v.max end
  end
end

-- variables used for test whether the value lies inside range that should be moved
local inside_block = 1
local dont_move = 0 
local move = -1

local function get_search_table(min, max, max_value, blocks)
  -- prepare table with ranges for search
  local minimal_others = blocks.minimal_others
  local lower_range = min < minimal_others and  min - 1 or minimal_others
  -- construct search table
  local search = {
    {min, max, inside_block}, -- codes inside moved block
    {0, lower_range, dont_move}, -- codes that will not move
    {max + 1,  max_value, dont_move} -- codes above moved block
  }
  if min > minimal_others then -- codes need to be renumbered only when the code is moved back
    table.insert(search, {minimal_others + 1, min -1, move}) -- codes that need to be renumbered
  end
  table.sort(search, function(a,b) return a[1] < b[1] end)
  return search
end

local function clasify_blocks(blocks, search)
  -- find whether block should be moved
  for _, x in ipairs(blocks) do
    local status, mid = binary_range_search(x.min, search)
    local status_value = status[3]
    x.status = status_value
  end
end

local function renumber_block(block, min, max, move)
  local newmin, newmax = min + move, max + move
  block.move = (block.move or 0) + move
  return newmin, newmax
end

local function renumber_blocks(blocks, min, max)
  local move_offset = max - min + 1
  for k,v in ipairs(blocks) do
    -- set default value that will be used for the block moving
    v.move = v.move or 0
    if v.status == move then
      renumber_block(v, v.min, v.max, move_offset)
    elseif v.status == inside_block then
      local move = blocks.minimal_others - max + move_offset
      newmin, newmax = renumber_block(v, v.min, v.max, move)
      blocks.minimal_others = newmax + 1
    end
  end
end

local function reorder(what, blocks)
  local min, max = get_range(what, blocks)
  local max_value = blocks[#blocks].max -- find maximal value in blocks
  if what == "others" or what == "Zzzz" then 
    -- when reordering others, don't move anything, just set the
    -- minimal_others to the maximal value, so the next reordering will move 
    -- the reordered block behind all others
    blocks.minimal_others = max_value + 1
    return 
  end
  if not min then return nil, "Cannot find block for reordering" end
  local search = get_search_table(min, max, max_value, blocks)
  clasify_blocks(blocks, search)
  renumber_blocks(blocks, min, max)
  return blocks
end

local function reorder_collator(collator, blocks)
  local function prepare_search_table(blocks)
    -- make search table for collator weights
    -- initialize it with block that contain all values bellow the minimal block
    local search = {{0, blocks[1].min - 1, 0}}
    for _, block in ipairs(blocks) do
      -- return move value for each script block
      local t = {block.min, block.max, block.move}
      search[#search+1] = t
    end
    return search
  end
  local function update_value(value, search) 
    -- find the move offset for the primary weight in the reordering table
    local first = value[1][1]
    local status = binary_range_search(first, search) or {}
    local move = status[3] or 0
    if move ~= 0 then 
      -- detect if we need to recalculate the primary weight
      value[1][1] = first + move
    end
    return value
  end
  local function update_weights(entry, search)
    -- recursivelly process weighgs for the current codepoint
    if entry.value then
      entry.value = update_value(entry.value, search)
    end
    if entry.children then
      update_weights(entry.children, search)
    end
  end
  local search = prepare_search_table(blocks)
  for _, current in pairs(collator.codes) do
    update_weights(current, search)
  end
  -- clear sortkey cache
  collator.stringcache = {}
end

local M = {}

M.reorder = reorder
M.reorder_collator = reorder_collator
return M

