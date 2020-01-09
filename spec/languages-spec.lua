local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"

describe("Test language support", function()
  it("should  support language setting", function()
    local czech = collator.new(ducet)
    ccaron = utf8.codepoint("č") 
    local cweight = czech.codes[ccaron]
    -- save primary weight before language rules have been applied
    local first =  cweight.value[1][1]
    -- apply Czech rules
    languages.cs(czech)
    local cweight = czech.codes[ccaron]
    -- primary weight with new rules
    local second = cweight.value[1][1]
    assert.truthy(first < second)
    

  end)
end)
