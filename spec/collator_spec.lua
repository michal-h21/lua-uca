local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local collator_obj = collator.new(ducet)

describe("collator test suite",function()
  it("collator keys should be set", function()
    assert.truthy(collator_obj.codes)
    assert.truthy(collator_obj.codes[string.byte("a")])
  end)
  it("implicit weights should work", function()
    -- 
    local weight, pos = collator:get_implicit_weight({2222}, 1)
    assert.truthy(weight)
    assert.truthy(type(weight) == "table")
    assert.truthy(weight[1][1] == 2222)
    assert.truthy(pos==2)
  end)
  it("contractions should work", function()
    -- non-sense codepoint
    local codepoints = {0x1223228877119}
    local weights, pos = collator_obj:read_weight(codepoints, 1)
    assert.truthy(weights == nil)
    local codepoints = {0x0FB2, 0x0F80}
    local weights, pos = collator_obj:read_weight(codepoints, 1)
    -- it should read 
    assert.truthy(pos == 3)

  end)
  it("should make sort keys", function()
    local codepoints = {0x0FB2, 0x0F80, string.byte("a")}
    local sort_key = collator_obj:make_sort_key(codepoints)
    -- assert two collation elements * 3 levels + 3 separator zeroes (there is one trailing at the end of the sort key)
    assert.truthy(#sort_key, 2 * 3 + 3)
  end)
end)
