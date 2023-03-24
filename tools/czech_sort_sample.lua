package.path = package.path .. ";src/?.lua"
-- read text from stdin, separate words and sort them
local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"

local collator_obj = collator.new(ducet)
local tailoring = function(s) collator_obj:tailor_string(s) end

tailoring "&c<č<<<Č"
tailoring "&h<ch<<<cH<<<Ch<<<CH"
tailoring "&R<ř<<<Ř"
tailoring "&s<š<<<Š"
tailoring "&z<ž<<<Ž"
-- local h = collator_obj:string_to_codepoints("h")
-- local ch = collator_obj:string_to_codepoints("ch")
-- local c = collator_obj:string_to_codepoints("c")
-- local ccaron = collator_obj:string_to_codepoints("č")
-- local r = collator_obj:string_to_codepoints("r")
-- local rcaron = collator_obj:string_to_codepoints("ř")
-- local s = collator_obj:string_to_codepoints("s")
-- local scaron = collator_obj:string_to_codepoints("š")
-- local z = collator_obj:string_to_codepoints("z")
-- local zcaron = collator_obj:string_to_codepoints("ž")
-- local tailoring_table = {1, 0, 0}
-- collator_obj:tailor(h, ch, tailoring_table)
-- collator_obj:tailor(c, ccaron, tailoring_table)
-- collator_obj:tailor(r, rcaron, tailoring_table)
-- collator_obj:tailor(s, scaron, tailoring_table)
-- collator_obj:tailor(z, zcaron, tailoring_table)

local words = {}

for line in io.lines() do
  for word in line:gmatch("[^%s^%.^%,^%!]+") do words[#words+1] = word end
end

table.sort(words, function(a,b)
  return collator_obj:compare_strings(a,b)
end)

for i, x in ipairs(words) do
  print(x)
end
