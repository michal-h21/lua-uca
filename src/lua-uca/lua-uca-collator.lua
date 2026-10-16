-- object for Unicode string collation
local math = require "math"
local tailoring_lib
local reordering_table
local implicit
local ccc
local uni_normalize
if kpse then
  tailoring_lib = require "lua-uca.lua-uca-tailoring"
  reordering_table = require "lua-uca.lua-uca-reordering-table"
  implicit = require "lua-uca.lua-uca-implicit"
  ccc = require "lua-uca.lua-uca-ccc"
  -- in LuaTeX, load the lua-uni-normalize library
  uni_normalize = require "lua-uni-normalize"
else
  tailoring_lib = require "lua-uca.tailoring"
  reordering_table = require "lua-uca.reordering-table"
  implicit = require "lua-uca.implicit"
  ccc = require "lua-uca.ccc"
end

local utf8 = utf8
if jit then
  package.cpath = package.cpath .. ";?.dylib;?.so;?.dll"
  utf8 = require "lua-utf8" -- https://github.com/starwing/luautf8.git
end

local collator = {}
collator.__index = collator

-- Unicode normalization: the UCA requires NFD, used by default when
-- lua-uni-normalize is available
local normalize_method = uni_normalize and "NFD" or false

function collator.use_nfc()
  if uni_normalize then
    normalize_method = "NFC"
  else
    return nil, "lua-uni-normalize is not available"
  end
end

function collator.use_nfd()
  if uni_normalize then
    normalize_method = "NFD"
  else
    return nil, "lua-uni-normalize is not available"
  end
end


local function copy_table(tbl)
  local t = {}
  for  k, v in pairs(tbl) do
    if type(v) == "table" then
      t[k] = copy_table(v)
    else
      t[k] = v
    end
  end
  return t
end

collator.copy_table = copy_table

function collator.new(codes)
  local self = setmetatable({}, collator)
  -- tree with mappings from codepoints to collation elements
  self.codes = copy_table(codes or {})
  -- cached sort keys
  self.stringcache = {}
  self.tailoring_multiplier = {1, 1, 1, 1}
  return self
end

-- make tree that points weights back to codepoints
function collator:weight_to_codepoints(codes)
  local weights = {}
  local codes = codes or self.codes

  local function insert_weight(element, codepoints, weights)
    local values = element.value
    local weights = weights
    if values and not values.equal then
      values = values[1]
      local current = weights
      for i, weight in ipairs(values) do
        local new = current[weight] or {}
        -- multiple characters can have the same weight.
        if i == #values and not new.codepoints then
          new.codepoints = codepoints
        end
        current[weight] = new
        current = new
      end
    end
    local children = element.children or {}
    for codepoint, element in pairs(children) do
      -- make copy of the codes table, so the new codepoints are not added indefinitely
      local newcodes = {table.unpack(codepoints)}
      newcodes[#newcodes + 1] = codepoint
      insert_weight(element, newcodes, weights)
    end
  end
  for codepoint, element in pairs(codes) do
    insert_weight(element, {codepoint}, weights)
  end
  return weights
end

-- ranges for implicit weights, UTS #10 section 10.1.3, generated from the
-- Unicode data of the DUCET (tools/make_implicit.lua)
local core_han = implicit.core_han
local other_han = implicit.other_han
local implicit_blocks = implicit.blocks

local function in_ranges(ranges, codepoint)
  for _, range in ipairs(ranges) do
    if codepoint >= range[1] and codepoint <= range[2] then return true end
  end
  return false
end

function collator:get_implicit_weight(codepoints, pos)
  -- implicit weight is based on the codepoint value: two collation elements,
  -- [.AAAA.0020.0002][.BBBB.0000.0000]
  local codepoint = codepoints[pos]
  local first, second
  for _, block in ipairs(implicit_blocks) do
    if codepoint >= block[1] and codepoint <= block[2] then
      first, second = block[3], (codepoint - block[4]) | 0x8000
      break
    end
  end
  if not first then
    local base = 0xFBC0
    if in_ranges(core_han, codepoint) then
      base = 0xFB40
    elseif in_ranges(other_han, codepoint) then
      base = 0xFB80
    end
    first, second = base + (codepoint >> 15), (codepoint & 0x7FFF) | 0x8000
  end
  -- the implicit weights are moved with their script by reordering
  if self.reorder_moves then
    first = tailoring_lib.move_primary(first, self.reorder_moves)
  end
  return {{first, 0x20, 0x02}, {second, 0, 0}}, pos + 1
end

function collator:read_weight(codepoints, pos)
  -- try to find contractions and return weight for longest matched string
  -- in the database
  local function read_children(parent, pos)
    local children = parent.children or {}
    local newpos = pos + 1
    local newcodepoint = codepoints[newpos]
    -- if we go out of the codepoint array
    if not newcodepoint then return nil end
    local child = children[newcodepoint]
    if child then
      local nextchild, nextpos, nextnode = read_children(child, newpos)
      if nextchild then return nextchild, nextpos, nextnode end
      if child.value then return child.value, newpos, child end
    end
    return nil
  end
  local weights, new_pos, node
  local current_codepoint = codepoints[pos]
  local codes = self.codes[current_codepoint]
  if not codes then return nil, pos + 1 end
  -- first try to read contractions
  weights, new_pos, node = read_children(codes, pos)
  if not weights then
    -- if no contraction, weights are in the value field
    weights, new_pos, node = codes.value, pos, codes
  end
  if not weights then return nil, pos + 1 end
  -- discontiguous contractions (UTS #10, S2.1.1-S2.1.3): an unblocked
  -- non-starter after the match extends it when the longer string is in the
  -- database, and is removed from the codepoints
  local removed
  local i = new_pos + 1
  local blocking = 0 -- the highest combining class skipped
  while node.children do
    local codepoint = codepoints[i]
    local class = codepoint and ccc[codepoint]
    if not class then break end
    local child = node.children[codepoint]
    if child and child.value and blocking < class then
      weights, node = child.value, child
      removed = removed or {}
      removed[i] = true
    elseif class > blocking then
      blocking = class
    end
    i = i + 1
  end
  if removed then
    local remaining = {}
    for j = 1, #codepoints do
      if not removed[j] then remaining[#remaining + 1] = codepoints[j] end
    end
    return weights, new_pos + 1, remaining
  end
  return weights, new_pos + 1
end

-- get weights for the next characters
-- when a discontiguous contraction was matched, the codepoints without the
-- removed characters are returned as the third value
function collator:get_weights(codepoints, pos)
  local weights, next_pos, remaining = self:read_weight(codepoints, pos)
  -- return implicit weights for codepoints that are not in the database
  if not weights then
    weights, next_pos = self:get_implicit_weight(codepoints, pos)
  end
  -- don't step next_pos if it is larger than size of the codepoints array
  if next_pos > #(remaining or codepoints) then next_pos = nil end
  return weights, next_pos, remaining
end

-- get characters with lowest weight at the given point of the codepoint array
-- useful for index header strings
function collator:get_lowest_char(codepoints, pos)
  -- find the lowest key in the table
  local min = math.min
  local max = math.max
  local pos = pos or 1
  local minimal = 0xffffffffff
  local maximal = -0xfffffffff
  local function get_lowest_key(tbl)
    local minimal, maximal = minimal, maximal
    if tbl.minimal then return tbl.minimal, tbl.maximal end
    for k,v in pairs(tbl) do
      minimal,maximal = min(k, minimal), max(k, maximal)
    end
    tbl.minimal, tbl.maximal = minimal, maximal
    return minimal, maximal
  end

  -- traverse tree, select lowest keys and find the codepoints
  local function find_codepoints(tbl, level)
    local level = level or 1
    local tbl = tbl or {}
    if tbl.codepoints then return tbl.codepoints end
    local newmin, newmax = get_lowest_key(tbl)
    -- this shouldn't happen
    if newmin == minimal then return nil end
    -- if the collation is set to upperace first, then the lowest character has the hightest
    -- collation value
    if self.is_uppercase_first and level == 2 then
      newmin = newmax
    end
    return find_codepoints(tbl[newmin], level + 1)
  end


  local weights, next_pos = self:read_weight(codepoints, pos)
  local x
  if weights then
    local weight_to_char = self.weight_to_char or self:weight_to_codepoints()
    self.weight_to_char = weight_to_char
    -- find the primary weight of the matched character
    local first = weights[1][1]
    local current = weight_to_char[first]
    -- traverse the tree to find the codepoint with the lowest weight
    x = find_codepoints(current)
  end
  -- the result is meant for display, return it in NFC
  if x and uni_normalize then
    local composed = {}
    for _, code in utf8.codes(uni_normalize.NFC(utf8.char(table.unpack(x)))) do
      composed[#composed + 1] = code
    end
    x = composed
  end
  return x, next_pos
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



-- the primary weight of U+FFFE, which separates the segments for backward
-- levels (UTS #10, 10.1.5)
local segment_separator = 0x0200

-- variable weighting (UTS #10, section 4): collator_obj.variable_weighting is
-- "non-ignorable" (the default), "shifted" or "blanked"
-- the weights of the variable collation elements and of the ignorable ones
-- after them are reset to zero; shifted adds a quaternary level, with the
-- old primary weight of the variable collation elements, FFFF for the
-- other non-ignorable ones
local function variable_weights(weights, levels, shifted, after_variable)
  local new = {}
  for i, element in ipairs(weights) do
    local reset, quaternary
    if element.type == "*" and element[1] ~= 0 then
      -- variable collation element
      reset, quaternary, after_variable = true, element[1], true
    elseif element[1] == 0 then
      -- ignorable collation element
      if after_variable then
        reset, quaternary = true, 0
      else
        local completely_ignorable = true
        for level = 2, levels do
          if element[level] ~= 0 then completely_ignorable = false end
        end
        reset, quaternary = false, completely_ignorable and 0 or 0xFFFF
      end
    else
      reset, quaternary, after_variable = false, 0xFFFF, false
    end
    local changed = {}
    for level = 1, levels do
      changed[level] = reset and 0 or element[level]
    end
    if shifted then changed[levels + 1] = quaternary end
    new[i] = changed
  end
  return new, after_variable
end

-- make sort key from codepoints array (it can be created using the utf8.codes() function
function collator:make_sort_key(codepoints)
  local levels = {}
  local pos = 1
  local weights, remaining
  local sort_key = {}
  local original = codepoints
  -- positions of the U+FFFE weights in the secondary level
  local separators = {}
  -- the number of levels in the collation elements
  local element_levels = self.is_uppercase_first and 4 or 3
  local variable = self.variable_weighting
  if variable == "non-ignorable" then variable = nil end
  local after_variable = false
  while true do
    --
    weights, pos, remaining = self:get_weights(codepoints, pos)
    codepoints = remaining or codepoints
    if variable then
      weights, after_variable = variable_weights(weights, element_levels, variable == "shifted", after_variable)
    end
    if self.accents_backward then
      for _, element in ipairs(weights) do
        if element[1] == segment_separator then
          separators[#separators + 1] = #(levels[2] or {}) + 1
        end
        levels = self:update_levels(levels, {element})
      end
    else
      levels = self:update_levels(levels, weights)
    end
    -- break when we reach end of the codepoints array
    if not pos then break end
  end
  -- (df) Reverse sort for accents?
  -- the secondary weights are reversed in each segment between the U+FFFE
  -- weights (UTS #10, S3.6), the U+FFFE weights stay in place
  if self.accents_backward and levels[2] then
    local secondary = levels[2]
    separators[#separators + 1] = #secondary + 1
    local start = 1
    for _, separator in ipairs(separators) do
      local stop = separator - 1
      while stop > start do
        secondary[start], secondary[stop] = secondary[stop], secondary[start]
        start = start + 1
        stop = stop - 1
      end
      start = separator + 1
    end
  end
  -- every level is in the sort key, also when it has no weights
  local max_level = element_levels + (variable == "shifted" and 1 or 0)
  for i = 1, max_level do
    for _, element in ipairs(levels[i] or {}) do
      table.insert(sort_key, element)
    end
    -- zero separates levels in the sort key
    table.insert(sort_key, 0)
  end
  -- the identical level (UTS #10, S3.10): the NFD code points, shifted by 2
  -- so that they are above the level separator, U+FFFE with the minimal
  -- weight 1
  if self.identical_level then
    local nfd = original
    if normalize_method ~= "NFD" and uni_normalize then
      nfd = {}
      for _, code in utf8.codes(uni_normalize.NFD(utf8.char(table.unpack(original)))) do
        nfd[#nfd + 1] = code
      end
    end
    for _, code in ipairs(nfd) do
      table.insert(sort_key, code == 0xFFFE and 1 or code + 2)
    end
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

local codepoints_cache = {}

function collator:string_to_codepoints(a)
  if codepoints_cache[a] then return codepoints_cache[a] end
  -- try unicode normalization, if it is available
  -- it uses libraries available in LuaTeX, so it doesn't work with
  -- stock Lua
  local normalized = a
  if normalize_method then
    normalized = uni_normalize[normalize_method](a)
  end
  local codepoints = {}
  for _, code in utf8.codes(normalized) do codepoints[#codepoints+1] = code end
  codepoints_cache[a] = codepoints
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
  -- when tailoring sets an equivialent character, it needs to be ignored in collator:weight_to_codepoints
  local is_equivalent = 0
  for _, x in ipairs(tailoring_table) do is_equivalent = is_equivalent + x end
  if is_equivalent == 0 then new_value.equal = true end
  self:update_codes(target, new_value)
end

-- support for CLDR style strings
function collator:tailor_string(s)
  tailoring_lib.tailor_string(self, s)
end

-- reorder scripts
-- pass table with script names to reorder
function collator:reorder(tbl)
  -- make table of the reordering table
  local t = copy_table(reordering_table)
  for _, script in ipairs(tbl) do
    -- reorder scripts
    tailoring_lib.reorder(script, t)
  end
  -- apply reordering to the collator object
  tailoring_lib.reorder_collator(self, t)
end

-- expand characters to another characters
function collator:equal(base, target)
  local new_weight = {}
  local value, pos
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
  self.is_uppercase_first = true
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
    for x, child in pairs(children) do
      change_case(child)
    end
  end
  for _, element in pairs(self.codes) do
    change_case(element)
  end

end


return collator
