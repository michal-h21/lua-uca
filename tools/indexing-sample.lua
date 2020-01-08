package.path = package.path .. ";src/?.lua"
local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"

kpse.set_program_name "luatex"

local ieclib = require "ieclib"

local collator_obj = collator.new(ducet)
collator_obj = languages.cs(collator_obj)
ieclib.load_enc{"T1", "T2A", "T2B", "T2C", "T3", "T5", "LGR"}
local function parse_index_entries(text)
  local indexentries = {}
  for entry, locator in text:gmatch("indexentry{(.-)}{(.-)}") do
    local subentries = {}
    -- fix entries produced by inputenc package with utf8 option. They have special encoding.
    local entry = ieclib.process(entry)
    -- parse locator modifires (entry|modifier)
    local entry, locator_modifier = entry:match("([^%|]+)%|?(.*)")
    -- parse formatted entry (sortentry@displayentry)
    local sort_entry,display_entry = entry:match("([^@]+)@?(.*)")
    for subentry in sort_entry:gmatch("([^!]+)") do subentries[#subentries+1] = subentry end
    -- print(sort_entry)
    indexentries[#indexentries + 1] = {display_entry = display_entry, subentries = subentries, sort_entry = sort_entry,  locator = locator, locator_modifier = locator_modifier}
  end
  return indexentries
end

local text =  io.read("*all")
local index = parse_index_entries(text)

table.sort(index, function(a,b)
  return collator_obj:compare_strings(a.sort_entry, b.sort_entry)
end)

for k,v in ipairs(index) do 
  print(k, v.sort_entry)
end
