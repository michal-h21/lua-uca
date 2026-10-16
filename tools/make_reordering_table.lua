-- make the table of primary weight ranges of the scripts, used for script
-- reordering, from allkeys.txt, Scripts.txt, PropertyValueAliases.txt
-- (ISO 15924 codes), UnicodeData.txt (digits) and PropList.txt (Han)
local collation = require "tools.collation"
local serpent = require "tools.serpent"
local collator = collation.new()
local ducet_file = io.open("data/allkeys.txt", "r")
local content = ducet_file:read("*all")
ducet_file:close()
collator:load_ducet(content)

local function read_ranges(filename, fn)
  for line in io.lines("data/" .. filename) do
    local first, last, rest = line:match("^(%x+)%.?%.?(%x*)%s*;%s*([^#]-)%s*#")
    if not first then
      first, last, rest = line:match("^(%x+)%.?%.?(%x*)%s*;%s*([^#]-)%s*$")
    end
    if first then
      first = tonumber(first, 16)
      last = last ~= "" and tonumber(last, 16) or first
      fn(first, last, rest)
    end
  end
end

-- ISO 15924 codes of the scripts
local codes = {}
for line in io.lines("data/PropertyValueAliases.txt") do
  local code, name = line:match("^sc%s*;%s*(%S+)%s*;%s*(%S+)")
  if code then codes[name] = code end
end

local scripts = {}
read_ranges("Scripts.txt", function(first, last, script)
  if not codes[script] then error("no ISO 15924 code for script " .. script) end
  for codepoint = first, last do scripts[codepoint] = script end
end)

local digits = {}
for line in io.lines("data/UnicodeData.txt") do
  local codepoint, category = line:match("^(%x+);[^;]*;([^;]*);")
  if category == "Nd" then digits[tonumber(codepoint, 16)] = true end
end


local extra_aliases = {
  Katakana = {"hrkt", "katakana or hiragana"},
  -- names from the previous, block based, table
  Han = {"cjk"},
  Meetei_Mayek = {"meetei"},
  Syloti_Nagri = {"syloti"},
  Tai_Le = {"taile"},
  New_Tai_Lue = {"tailue"},
  Phags_Pa = {"phags-pa"},
  Cypriot = {"cypriot syllabary"},
}

local function get_value(codepoint)
  local element = collator.keys[codepoint]
  if not element or not element.value then return end
  return element.value[1][1]
end

-- the value where non-digits start
local minimal_others = get_value(utf8.codepoint("a")) - 1

local groups = {}
local function add(name, value)
  local group = groups[name] or {min = value, max = value}
  group.min, group.max = math.min(group.min, value), math.max(group.max, value)
  groups[name] = group
end

-- single code points only, contractions belong to the script of their
-- first character
for codepoint, element in pairs(collator.keys) do
  local value = get_value(codepoint)
  if value and value > 0 then
    if digits[codepoint] then
      add("digits", value)
    elseif value > minimal_others then
      local script = scripts[codepoint]
      if script and script ~= "Common" and script ~= "Inherited" then
        add(script, value)
      end
    end
  end
end

-- implicit weights: Han (UTS #10, 10.1.3) and the scripts with their own
-- bases in allkeys.txt
read_ranges("PropList.txt", function(first, last, prop)
  if prop == "Unified_Ideograph" then
    local core = first >= 0x4E00 and last <= 0x9FFF or first >= 0xF900 and last <= 0xFAFF
    local base = core and 0xFB40 or 0xFB80
    add("Han", base + (first >> 15))
    add("Han", base + (last >> 15))
  end
end)
for line in content:gmatch("@implicitweights[^\n]*") do
  local first, base = line:match("^@implicitweights%s+(%x+)%.%.%x+%s*;%s*(%x+)")
  local script = scripts[tonumber(first, 16)]
  if script then add(script, tonumber(base, 16)) end
end

local newtable = {minimal_others = minimal_others}
for name, group in pairs(groups) do
  local entry = {min = group.min, max = group.max}
  if name == "digits" then
    entry.name = "digits"
  else
    entry.name = name:lower():gsub("_", " ")
    local aliases = {}
    aliases[#aliases + 1] = codes[name]:lower()
    for _, alias in ipairs(extra_aliases[name] or {}) do aliases[#aliases + 1] = alias end
    entry.aliases = aliases
  end
  newtable[#newtable + 1] = entry
end

table.sort(newtable, function(a, b)
  if a.min ~= b.min then return a.min < b.min end
  return a.name < b.name
end)

-- scripts that share primary weights (Hiragana and Katakana, the two
-- Meroitic scripts) are one group, the other names are its aliases
local merged = {}
for _, entry in ipairs(newtable) do
  local last = merged[#merged]
  if last and entry.min <= last.max and entry.name ~= "digits" and last.name ~= "digits" then
    io.stderr:write(string.format("merged groups: %s and %s\n", last.name, entry.name))
    last.max = math.max(last.max, entry.max)
    last.aliases = last.aliases or {}
    table.insert(last.aliases, entry.name)
    for _, alias in ipairs(entry.aliases or {}) do table.insert(last.aliases, alias) end
  else
    merged[#merged + 1] = entry
  end
end
newtable = {minimal_others = minimal_others}
for i, entry in ipairs(merged) do newtable[i] = entry end

-- the weights between two groups belong to the first one, so a group moves
-- together with all its weights (the digits get the other numbers before
-- the letters); not the free weights before and among the implicit bases
local first_implicit = 0xFB00
for i, entry in ipairs(newtable) do
  local nextentry = newtable[i + 1]
  if nextentry then
    assert(entry.max < nextentry.min, "digits overlap a script")
    if nextentry.min < first_implicit then entry.max = nextentry.min - 1 end
  end
end

local version = content:match("@version%s+(%S+)") or ""
print("-- generated by tools/make_reordering_table.lua from the Unicode " .. version .. " data")
print(serpent.dump(newtable))
