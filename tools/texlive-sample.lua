kpse.set_program_name "luatex"
local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"

local collator_obj = collator.new(ducet)
-- load Czech rules
collator_obj = languages.cs(collator_obj)

local t = {"cihla",  "chochol", "hudba", "jasan", "čáp"}

table.sort(t, function(a,b) return collator_obj:compare_strings(a,b) end)

for _, v in ipairs(t) do
  print(v)
end
