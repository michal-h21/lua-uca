
reorder("cyrillic", newtable)
reorder("others", newtable)
reorder("digits", newtable)

print "------------------------------"
-- test sort
local collator_lib = require "src.lua-uca.lua-uca-collator"
local ducet = require "src.lua-uca.lua-uca-ducet"
local collator_obj = collator_lib.new(ducet)
reorder_collator(collator_obj, newtable)

local sort_table = {"12", "ahoj", "Первая"}
table.sort(sort_table, function(a,b) return collator_obj:compare_strings(a,b) end)
for _, x in ipairs(sort_table) do 
  print(x)
end

