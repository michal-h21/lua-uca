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
  it("should compare strings", function()
    local get_sortkey = function(a) 
      local codepoints = {}
      for _, code in utf8.codes(a) do codepoints[#codepoints+1] = code end
      return collator_obj:make_sort_key(codepoints) 
    end
    local abc = get_sortkey("abc")
    local bbc = get_sortkey("bbc")
    local abcd = get_sortkey("abcd")
    assert.truthy(collator_obj:compare(abc, bbc))
    assert.truthy(collator_obj:compare(bbc,abc)==false)
    assert.truthy(collator_obj:compare(abc, abcd))
    -- compare strings
    --
    assert.truthy(collator_obj:compare_strings("abc", "abcd"))

    -- try to sort a table
    local t = {"med", "Med", "dabing",  "měď", "da capo", "ďábel", "zeď", "medvěd","motýlek", "kánon", "motýl noční", "ucho","kaňon", "úchop", "uchopit", "kanon", "kanón", "cáp", "čáp", "cep"}
    local cache = {}
    table.sort(t, function(a,b)
      local asortkey = cache[a] or get_sortkey(a)
      local bsortkey = cache[b] or get_sortkey(b)
      cache[a], cache[b] = asortkey, bsortkey
      return collator_obj:compare(asortkey, bsortkey)
    end)
    local reverse_table = {}
    for i, x in ipairs(t) do 
      -- this will enable us to test position of words in the sorted table
      reverse_table[x] = i
      print(x) 
    end
    local function assert_smaller(a, b) assert.truthy(reverse_table[a] < reverse_table[b]) end
    assert_smaller("měď", "medvěd")
    assert_smaller("da capo", "ďábel")
    assert_smaller("ucho", "úchop")

  end)
  it("should support tailoring", function()
    local h = collator_obj:string_to_codepoints("h")
    local ch = collator_obj:string_to_codepoints("ch")
    local c = collator_obj:string_to_codepoints("c")
    local ccaron = collator_obj:string_to_codepoints("č")
    local r = collator_obj:string_to_codepoints("r")
    local rcaron = collator_obj:string_to_codepoints("ř")
    local s = collator_obj:string_to_codepoints("s")
    local scaron = collator_obj:string_to_codepoints("š")
    local z = collator_obj:string_to_codepoints("z")
    local zcaron = collator_obj:string_to_codepoints("ž")
    local tailoring_table = {1, 0, 0}
    collator_obj:tailor(h, ch, tailoring_table)
    collator_obj:tailor(c, ccaron, tailoring_table)
    collator_obj:tailor(r, rcaron, tailoring_table)
    collator_obj:tailor(s, scaron, tailoring_table)
    collator_obj:tailor(z, zcaron, tailoring_table)
    local t = {"cd", "be", "ce", "zbla", "cha", "ha","ie", "čáp", "dada", "rak", "řak", "se", "še", "te", "za", "ža"}
    table.sort(t, function(a,b)
      return collator_obj:compare_strings(a,b)
    end)
    for i, x in ipairs(t) do
      print(x)
    end

  end)

end)
