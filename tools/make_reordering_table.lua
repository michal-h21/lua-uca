local collation = require "tools.collation"
local collator = collation.new()
local ducet_file = io.open("data/allkeys.txt", "r")
local content = ducet_file:read("*all")
collator:load_ducet(content)
-- just few blocks, there should be more
local unicode_blocks = {
    {0x0030, 0x0039, "digits"},
    {0x003A, 0x00FF, "latin"},
    {0x0100, 0x017F, "latin"},
    {0x0180, 0x024F, "latin"},
    {0x0250, 0x02AF, "latin"},
    {0x0370, 0x03FF, "greek"},
    {0x0400, 0x04FF, "cyrillic"},
    {0x0500, 0x052F, "cyrillic"},
    {0x0530, 0x058F, "armenian"},
    {0x0590, 0x05FF, "hebrew"},
    {0x0600, 0x06FF, "arabic"},
    {0x0700, 0x074F, "syriac"},
    {0x0750, 0x077F, "arabic"},
    {0x0780, 0x07BF, "thaana"},
    {0x07C0, 0x07FF, "nko"},
    {0x0800, 0x083F, "samaritan"},
    {0x0840, 0x085F, "mandaic"},
    {0x0860, 0x086F, "syriac"},
    {0x08A0, 0x08FF, "arabic"},
    {0x0900, 0x097F, "devanagari"},
    {0x0980, 0x09FF, "bengali"},
    {0x0A00, 0x0A7F, "gurmukhi"},
    {0x0A80, 0x0AFF, "gujarati"},
    {0x0B00, 0x0B7F, "oriya"},
    {0x0B80, 0x0BFF, "tamil"},
    {0x0C00, 0x0C7F, "telugu"},
    {0x0C80, 0x0CFF, "kannada"},
    {0x0D00, 0x0D7F, "malayalam"},
    {0x0D80, 0x0DFF, "sinhala"},
    {0x0E00, 0x0E7F, "thai"},
    {0x0E80, 0x0EFF, "lao"},
    {0x0F00, 0x0FFF, "tibetan"},
    {0x1000, 0x109F, "myanmar"},
    {0x10A0, 0x10FF, "georgian"},
    {0x1100, 0x11FF, "hangul"},
    {0x1200, 0x137F, "ethiopic"},
    {0x1380, 0x139F, "ethiopic"},
    {0x13A0, 0x13FF, "cherokee"},
    {0x1680, 0x169F, "ogham"},
    {0x16A0, 0x16FF, "runic"},
    {0x1700, 0x171F, "tagalog"},
    {0x1720, 0x173F, "hanunoo"},
    {0x1740, 0x175F, "buhid"},
    {0x1760, 0x177F, "tagbanwa"},
    {0x1780, 0x17FF, "khmer"},
    {0x1800, 0x18AF, "mongolian"},
    {0x1900, 0x194F, "limbu"},
    {0x1950, 0x197F, "taile"},
    {0x1980, 0x19DF, "tailue"},
    {0x19E0, 0x19FF, "khmer"},
    {0x1A00, 0x1A1F, "buginese"},
    {0x1A20, 0x1AAF, "tai tham"},
    {0x1B00, 0x1B7F, "balinese"},
    {0x1B80, 0x1BBF, "sundanese"},
    {0x1BC0, 0x1BFF, "batak"},
    {0x1C00, 0x1C4F, "lepcha"},
    {0x1C50, 0x1C7F, "ol chiki"},
    {0x1C80, 0x1C8F, "cyrillic"},
    {0x1C90, 0x1CBF, "georgian"},
    {0x1CC0, 0x1CCF, "sundanese"},
    {0x1E00, 0x1EFF, "latin"},
    {0x1F00, 0x1FFF, "greek"},
    {0x2C00, 0x2C5F, "glagolitic"},
    {0x2C60, 0x2C7F, "latin"},
    {0x2C80, 0x2CFF, "coptic"},
    {0x2D00, 0x2D2F, "georgian"},
    {0x2D30, 0x2D7F, "tifinagh"},
    {0x2D80, 0x2DDF, "ethiopic"},
    {0x2DE0, 0x2DFF, "cyrillic"},
    {0x2E80, 0x2EFF, "cjk"},
    {0x3000, 0x303F, "cjk"},
    {0x3040, 0x309F, "hiragana"},
    {0x30A0, 0x30FF, "katakana"},
    {0x3100, 0x312F, "bopomofo"},
    {0x3130, 0x318F, "hangul"},
    {0x31A0, 0x31BF, "bopomofo"},
    {0x31C0, 0x31EF, "cjk"},
    {0x31F0, 0x31FF, "katakana"},
    {0x3200, 0x32FF, "cjk"},
    {0x3300, 0x33FF, "cjk"},
    {0x3400, 0x4DBF, "cjk"},
    {0x4E00, 0x9FFF, "cjk"},
    {0xA000, 0xA48F, "yi"},
    {0xA490, 0xA4CF, "yi"},
    {0xA4D0, 0xA4FF, "lisu"},
    {0xA500, 0xA63F, "vai"},
    {0xA640, 0xA69F, "cyrillic"},
    {0xA6A0, 0xA6FF, "bamum"},
    {0xA720, 0xA7FF, "latin"},
    {0xA800, 0xA82F, "syloti"},
    {0xA840, 0xA87F, "phags-pa"},
    {0xA880, 0xA8DF, "saurashtra"},
    {0xA8E0, 0xA8FF, "devanagari"},
    {0xA900, 0xA92F, "kayah li"},
    {0xA930, 0xA95F, "rejang"},
    {0xA960, 0xA97F, "hangul"},
    {0xA980, 0xA9DF, "javanese"},
    {0xA9E0, 0xA9FF, "myanmar"},
    {0xAA00, 0xAA5F, "cham"},
    {0xAA60, 0xAA7F, "myanmar"},
    {0xAA80, 0xAADF, "tai viet"},
    {0xAAE0, 0xAAFF, "meetei"},
    {0xAB00, 0xAB2F, "ethiopic"},
    {0xAB30, 0xAB6F, "latin"},
    {0xAB70, 0xABBF, "cherokee"},
    {0xABC0, 0xABFF, "meetei"},
    {0xAC00, 0xD7AF, "hangul"},
    {0xD7B0, 0xD7FF, "hangul"},
    {0xF900, 0xFAFF, "cjk"},
    {0xFB50, 0xFDFF, "arabic"},
    {0xFE30, 0xFE4F, "cjk"},
    {0xFE70, 0xFEFF, "arabic"},
    {0x10000, 0x1007F, "linear b"},
    {0x10080, 0x100FF, "linear b"},
    {0x10280, 0x1029F, "lycian"},
    {0x102A0, 0x102DF, "carian"},
    {0x102E0, 0x102FF, "coptic"},
    {0x10300, 0x1032F, "old italic"},
    {0x10330, 0x1034F, "gothic"},
    {0x10350, 0x1037F, "old permic"},
    {0x10380, 0x1039F, "ugaritic"},
    {0x103A0, 0x103DF, "old persian"},
    {0x10400, 0x1044F, "deseret"},
    {0x10450, 0x1047F, "shavian"},
    {0x10480, 0x104AF, "osmanya"},
    {0x104B0, 0x104FF, "osage"},
    {0x10500, 0x1052F, "elbasan"},
    {0x10530, 0x1056F, "caucasian albanian"},
    {0x10600, 0x1077F, "linear a"},
    {0x10800, 0x1083F, "cypriot syllabary"},
    {0x10840, 0x1085F, "imperial aramaic"},
    {0x10860, 0x1087F, "palmyrene"},
    {0x10880, 0x108AF, "nabataean"},
    {0x108E0, 0x108FF, "hatran"},
    {0x10900, 0x1091F, "phoenician"},
    {0x10920, 0x1093F, "lydian"},
    {0x10A00, 0x10A5F, "kharoshthi"},
    {0x10A60, 0x10A7F, "old south arabian"},
    {0x10A80, 0x10A9F, "old north arabian"},
    {0x10AC0, 0x10AFF, "manichaean"},
    {0x10B00, 0x10B3F, "avestan"},
    {0x10B40, 0x10B5F, "inscriptional parthian"},
    {0x10B60, 0x10B7F, "inscriptional pahlavi"},
    {0x10B80, 0x10BAF, "psalter pahlavi"},
    {0x10C00, 0x10C4F, "old turkic"},
    {0x10C80, 0x10CFF, "old hungarian"},
    {0x10D00, 0x10D3F, "hanifi rohingya"},
    {0x10F00, 0x10F2F, "old sogdian"},
    {0x10F30, 0x10F6F, "sogdian"},
    {0x10FE0, 0x10FFF, "elymaic"},
    {0x11000, 0x1107F, "brahmi"},
    {0x11080, 0x110CF, "kaithi"},
    {0x110D0, 0x110FF, "sora sompeng"},
    {0x11100, 0x1114F, "chakma"},
    {0x11150, 0x1117F, "mahajani"},
    {0x11180, 0x111DF, "sharada"},
    {0x11200, 0x1124F, "khojki"},
    {0x11280, 0x112AF, "multani"},
    {0x112B0, 0x112FF, "khudawadi"},
    {0x11300, 0x1137F, "grantha"},
    {0x11400, 0x1147F, "newa"},
    {0x11480, 0x114DF, "tirhuta"},
    {0x11580, 0x115FF, "siddham"},
    {0x11600, 0x1165F, "modi"},
    {0x11660, 0x1167F, "mongolian"},
    {0x11680, 0x116CF, "takri"},
    {0x11700, 0x1173F, "ahom"},
    {0x11800, 0x1184F, "dogra"},
    {0x118A0, 0x118FF, "warang citi"},
    {0x119A0, 0x119FF, "nandinagari"},
    {0x11A00, 0x11A4F, "zanabazar square"},
    {0x11A50, 0x11AAF, "soyombo"},
    {0x11AC0, 0x11AFF, "pau cin hau"},
    {0x11C00, 0x11C6F, "bhaiksuki"},
    {0x11C70, 0x11CBF, "marchen"},
    {0x11D00, 0x11D5F, "masaram gondi"},
    {0x11D60, 0x11DAF, "gunjala gondi"},
    {0x11EE0, 0x11EFF, "makasar"},
    {0x11FC0, 0x11FFF, "tamil"},
    {0x12000, 0x123FF, "cuneiform"},
    {0x16800, 0x16A3F, "bamum"},
    {0x16A40, 0x16A6F, "mro"},
    {0x16AD0, 0x16AFF, "bassa vah"},
    {0x16B00, 0x16B8F, "pahawh hmong"},
    {0x16E40, 0x16E9F, "medefaidrin"},
    {0x16F00, 0x16F9F, "miao"},
    {0x17000, 0x187FF, "tangut"},
    {0x18800, 0x18AFF, "tangut"},
    {0x1B000, 0x1B0FF, "kana"},
    {0x1B100, 0x1B12F, "kana"},
    {0x1B130, 0x1B16F, "small kana extension"},
    {0x1B170, 0x1B2FF, "nushu"},
    {0x1BC00, 0x1BC9F, "duployan"},
    {0x1E000, 0x1E02F, "glagolitic"},
    {0x1E100, 0x1E14F, "nyiakeng puachue hmong"},
    {0x1E2C0, 0x1E2FF, "wancho"},
    {0x1E800, 0x1E8DF, "mende kikakui"},
    {0x1E900, 0x1E95F, "adlam"},
    {0x20000, 0x2A6DF, "cjk"},
    {0x2A700, 0x2B73F, "cjk"},
    {0x2B740, 0x2B81F, "cjk"},
    {0x2B820, 0x2CEAF, "cjk"},
    {0x2CEB0, 0x2EBEF, "cjk"},
    {0x2F800, 0x2FA1F, "cjk"},
}
-- copy from xindex-lib.lua, it is unfortunatelly unavailable globally
local floor = math.floor
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


local function get_value(val) 
  local element = collator.keys[val] 
  if not element then return end
  return  element.value[1][1]
end


-- the value where non-digits start
local minimal_others = get_value(utf8.codepoint("a")) - 1
local max_value = 0xFFFFFFFFFFFFFFF -- just too big value used in tests
local tables = {}
for _, el  in ipairs(unicode_blocks) do
  local current_block_name = el[3]
  -- there can be multiple instances of the same name. set the minimal value only for  
  -- the first occurance. the next occurances may set some symbols with lower sort 
  -- weights
  if not tables[current_block_name] or tables[current_block_name].min == max_value then 
    local min = max_value
    for first = el[1], el[2] do
      local value = get_value(first) 
      if value and (value > minimal_others or (first > 47 and first < 58)) then
        min = math.min(min, value)
      end
    end
    tables[current_block_name] = {min = min, max = 0}
  end
end

-- find primary weights assigned to particular Unicode blocks
-- find value of letter a, it has lowest value we care in 
for code, v in pairs(collator.keys) do
  local subtable = binary_range_search(code, unicode_blocks) or {}
  local name = subtable[3] or "unkown"
  local curr = tables[name] 
  -- handle only supported blocks
  if curr then 
    local values = v.value or {{nil}} -- get the primary weight
    local value = values[1][1] or curr.min
    curr.max = math.max(curr.max, value)
    tables[name] = curr
  end
end

-- create new table containing blocks sorted by minimal value
local newtable = {minimal_others = minimal_others}
for k,v in pairs(tables) do
  if v.max > 0 then
    -- save the script name
    v.name = k
    table.insert(newtable, v)
  end
end

table.sort(newtable, function(a,b) return a.min<b.min end)
for k,v in ipairs(newtable) do
  local nextel = newtable[k + 1] or {}
  local nextmin = nextel.min 
  if nextmin then
    -- the maximal value for the current script must be smaller than the next
    -- minimal value, otherwise there would be overlap
    if v.max > nextmin then
      v.max = nextmin - 1
    end
  end
  print(v.name, v.min, v.max)

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

local function reorder(what, blocks)

  local min, max = get_range(what, blocks)
  local max_value = blocks[#blocks].max -- find maximal value in blocks
  if what == "others" or what == "Zzzz" then 
    -- when reordering others, don't move anything, just set the
    -- minimal_others to the maximal value, so the next reordering will move 
    -- the reordered block behind all others
    blocks.minimal_others = max_value 
    return 
  end
  if not min then return nil, "Cannot find block for reordering" end
  local search = get_search_table(min, max, max_value, blocks)
  clasify_blocks(blocks, search)
  for k,v in ipairs(blocks) do
    if v.status == move or v.status == inside_block then
      print(v.name, v.status)
    end
  end


end

reorder("cyrillic", newtable)
reorder("others", newtable)
reorder("digits", newtable)

