local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"

describe("Test language support", function()
  local czech = collator.new(ducet)
  it("should  support language setting", function()
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
  it("should support the tailoring dsl", function()
    -- test tailoring dsl
    --
    languages.tailor_string(czech,"&z<ž")
    local z, zcaron = utf8.codepoint("z"), utf8.codepoint("ž")
    local zweight, zcaronweight = czech.codes[z], czech.codes[zcaron]
    assert.truthy(zcaronweight.value[1][1] - zweight.value[1][1] == 1)
  end)
  it("should find codepoints from weight", function()
    local codepoints = czech:string_to_codepoints("Chrobák")
    local first_char = czech:get_lowest_char(codepoints, 1)
    assert.same(utf8.char(table.unpack(first_char)), "ch")
    local first_char = czech:get_lowest_char(codepoints, 6)
    assert.same(utf8.char(table.unpack(first_char)), "a")
    -- č has distinct sort weight to c
    local codepoints = czech:string_to_codepoints("čáp")
    local first_char = czech:get_lowest_char(codepoints, 1)
    assert.same(utf8.char(table.unpack(first_char)), "č")
  end)
  it("should find codepoints from weight for norwegian", function()
    local norsk = collator.new(ducet)
    languages.no(norsk)
    local codepoints = norsk:string_to_codepoints("åkerhane")
    local first_char = norsk:get_lowest_char(codepoints, 1)
    assert.same(utf8.char(table.unpack(first_char)), "å")

  end)

end)
