if kpse then
  -- when we run this test with texlua
  require "busted.runner" ()
  kpse.set_program_name "luatex"
end

local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"
local tailoring_lib = require "lua-uca.lua-uca-tailoring"

describe("Test language support", function()
  local czech = collator.new(ducet)
  it("should  support language setting", function()
    local c, ccaron = czech:string_to_codepoints("c"), czech:string_to_codepoints("č")
    local primary = function(codepoints) return czech:get_weights(codepoints, 1)[1][1] end
    -- č has the primary weight of c before language rules have been applied
    assert.truthy(primary(c) == primary(ccaron))
    -- apply Czech rules
    languages.cs(czech)
    -- č has its own primary weight with the new rules
    assert.truthy(primary(c) < primary(ccaron))
  end)
  it("should support the tailoring dsl", function()
    -- test tailoring dsl
    --
    tailoring_lib.tailor_string(czech,"&z<ž")
    local zweight = czech:get_weights(czech:string_to_codepoints("z"), 1)
    local zcaronweight = czech:get_weights(czech:string_to_codepoints("ž"), 1)
    assert.truthy(zcaronweight[1][1] - zweight[1][1] == 1)
  end)
  it("should find codepoints from weight", function()
    local codepoints = czech:string_to_codepoints("Chrobák")
    local first_char = czech:get_lowest_char(codepoints, 1)
    assert.same(utf8.char(table.unpack(first_char)), "ch")
    -- test without explicit position in the string
    local first_char_nonexplicit = czech:get_lowest_char(codepoints)
    assert.same(utf8.char(table.unpack(first_char_nonexplicit)), "ch")
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
    -- the rules from different collator objects shouldn't have an effect
    -- Ch has distinct sort weight in Czech
    local codepoints = norsk:string_to_codepoints("Chrobák")
    local first_char = norsk:get_lowest_char(codepoints, 1)
    assert.same(utf8.char(table.unpack(first_char)), "c")

  end)
  it("should support French sorting", function()
    local french = collator.new(ducet)
    languages.fr_backward_accents(french)
    local t = {"bohème", "Bohême", "Bohémien","Bohemien","gëne","gene", "géne", "gène", "gêne", "gêné",  "tire-bouchon", "tire-d'aile", "tirefond", "COTÉ", "Coté", "Côté"}
    table.sort(t, function(a,b)
      return french:compare_strings(a,b)
    end)
    -- make table where words point to their position in the sorced table
    local reversed = {}
    for i, x in ipairs(t) do
      reversed[x] = i
      print(x)
    end
    -- test strange rules, where sorting of accents goes from end of the word forward
    assert.truthy(reversed["gêne"] < reversed["gëne"])
    assert.truthy(reversed["gëne"] < reversed["gêné"])
    assert.truthy(reversed["Coté"] < reversed["COTÉ"])
    assert.truthy(reversed["COTÉ"] < reversed["Côté"])
  end)

  it("should support Chinese sorting", function()
    local chinese = collator.new(ducet)
    languages.zh(chinese)
    local t = {
      "一",  -- U+4E00, yi
      "丁",  -- U+4E01, ding
      "七",  -- U+4E03, qi
    }
    table.sort(t, function(a,b)
      return chinese:compare_strings(a,b)
    end)
    assert.same(t, {"丁", "七", "一"})
  end)

end)
