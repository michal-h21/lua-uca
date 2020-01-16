-----------------------------------------------------------------------
--         FILE:  xindex-norsk.lua
--  DESCRIPTION:  configuration file for xindex.lua
-- REQUIREMENTS:  
--       AUTHOR:  Herbert Voß
--     MODIFIED:  Sveinung Heggen (2020-01-02)
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-cfg'] = {
      version = 0.20,
      comment = "configuration to xindex.lua",
       author = "Herbert Voss",
    copyright = "Herbert Voss",
      license = "LPPL 1.3"
}

local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"
local collator_obj = collator.new(ducet)

local language = "en" -- default language
-- language name specified on the command line doesn't seem to be available
-- in the config file, so we just try to find it ourselves
for i, a in ipairs(arg) do
  if a == "-l" or a=="--language" then
    language = arg[i+1]
    break
  end
end

if languages[language] then
  print("[Lua-UCA] Loading language: " .. language)
  collator_obj = languages[language](collator_obj)
end

local upper = unicode.utf8.upper


escape_chars = { -- by default " is the escape char
  {'""', "\\escapedquote",      '\"{}' },
  {'"@', "\\escapedat",         "@"    },
  {'"|', "\\escapedvert",       "|"    },
  {'"!', "\\escapedexcl",       "!"    },
  {'"(', "\\escapedparenleft",  "("   },
  {'")', "\\escapedparenright", ")"  }
}

itemPageDelimiter = ","     -- Hello, 14
compressPages     = true    -- something like 12--15, instead of 12,13,14,15. the |( ... |) syntax is still valid
fCompress         = true    -- 3f -> page 3, 4 and 3ff -> page 3, 4, 5
minCompress       = 3       -- 14--17 or 
numericPage       = true    -- for non-numerical page numbers, like "VI-17"
sublabels         = {"", "---\\,", "--\\,", "-\\,"} -- for the (sub(sub(sub-items  first one is for item
pageNoPrefixDel   = ""     -- a delimiter for page numbers like "VI-17"
indexOpening      = ""     -- commands after \begin{theindex}
rangeSymbol       = "--"
idxnewletter      = "\\textbf"  -- Only valid if -n is not set

folium = { 
  de = {"f.", "ff."},
  en = {"f.", "ff."},
  fr = {"\\,sq","\\,sqq"},
  no = {"\\,f.","\\,ff."},
  cs = {"f.", "ff."},
} 

indexheader = { 
  de = {"Symbole", "Zahlen"},
  en = {"Symbols", "Numbers"},
  fr = {"Symboles","Chiffre"},
  jp = {"シンボル","番号"},
  cs = {"Symboly", "Čísla"}
}

-- support reordering of the entries

orders = {
  cs = {"other", "digits"}
}

function makeOrderingCategories(language)
  -- if there are no reordering for the given language, just return other
  local order = orders[language] or {"other"}
  local categories = {order = order, categories = {}}
  -- make subtable for each category
  for _, category in pairs(order) do categories.categories[category] = {} end
  return categories
end


-- just few blocks, there should be more
local unicode_blocks = {
    {0x0000, 0x007F, "latin"},
    {0x0080, 0x00FF, "latin"},
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
    {0x0860, 0x086F, "syriac"},
    {0x08A0, 0x08FF, "arabic"},
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


-- get Unicode category of the codepoint, if supported
function getCategory(codepoints)
  local codepoint = codepoints[1]
  local category = get_category(codepoint)
  if category == "Nd" then 
    return "digits"
  elseif category:match("^L") then
    local block =  binary_range_search(codepoint, unicode_blocks) or {}
    return block[3] or "other"
  end
  return "other"
end

-- insert the index entry to the categories subtable
function categorize(codepoints, entry, categories)
  local subcategories = categories.categories
  -- return category name from the Unicode block of the first character
  local category = getCategory(codepoints)
  -- if the categories doesn't use this code block, categorize it as other
  local used = subcategories[category] and category or "other"
  table.insert(subcategories[used], entry)
end

-- convert categories back to index list
function uncategorize(ordering_categories)
  local newlist = {}
  -- make new index order based on defined categories
  for _, category in ipairs(ordering_categories.order) do
    for _,entry in ipairs(ordering_categories.categories[category]) do
      newlist[#newlist+1] = entry
    end
  end
  return newlist
end


function UTFCompare(a,b)
  local A = a["SortKey"]
  local B = b["SortKey"]
  return collator_obj:compare_strings(A,B)
end

function getSortChar(codepoints)
  local codes = collator_obj:get_lowest_char(codepoints, 1)
  local sort_char = utf8.char(table.unpack(codes))
  -- print unicode category of the first char
  return upper(sort_char) -- use unicode.utf8.upper to make the char uppercase
end

function SORTendhook(list)
  local ordering_categories = makeOrderingCategories(language)
  -- get the headers for letter groups
  for i=1, #list do
    v = list[i]
    -- the collator:get_lowest_char will return character on the given
    -- position. It will be lowercase and without accents.
    local codepoints = collator_obj:string_to_codepoints(NormalizedUpper(v.Entry))
    v.sortChar = getSortChar(codepoints)
    categorize(codepoints, v, ordering_categories)
  end
  return uncategorize(ordering_categories)
end

-- We use Lua-UCA methods for sorting and determining first characters, so
-- alphabet list is obsolete

alphabet_lower = { }
alphabet_upper = { }
