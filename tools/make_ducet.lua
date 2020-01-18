local collation = require "tools.collation"
local serpent = require "tools.serpent"

local collator = collation.new()
local ducet_file = io.open("data/allkeys.txt", "r")
local content = ducet_file:read("*all")
collator:load_ducet(content)
ducet_file:close()
print(serpent.dump(collator.keys))
