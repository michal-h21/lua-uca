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
    assert.same({{0xFBC0, 0x20, 0x02}, {0x88AE, 0, 0}}, weight)
    assert.truthy(pos==2)
    -- core Han, other Han, Tangut
    assert.same({{0xFB40, 0x20, 0x02}, {0xCE00, 0, 0}}, collator:get_implicit_weight({0x4E00}, 1))
    assert.same({{0xFB80, 0x20, 0x02}, {0xB400, 0, 0}}, collator:get_implicit_weight({0x3400}, 1))
    assert.same({{0xFB84, 0x20, 0x02}, {0x8000, 0, 0}}, collator:get_implicit_weight({0x20000}, 1))
    assert.same({{0xFB00, 0x20, 0x02}, {0x8000, 0, 0}}, collator:get_implicit_weight({0x17000}, 1))
  end)
  it("implicit weights should sort Han after the explicit weights", function()
    -- cuneiform U+12034 has the highest explicit primary weights
    -- the Kangxi radical U+2F00 has explicit weights, a tertiary variant of U+4E00
    local a = collator_obj:make_sort_key({0x12034})
    local b = collator_obj:make_sort_key({0x2F00})
    local c = collator_obj:make_sort_key({0x4E00})
    local d = collator_obj:make_sort_key({0x4E01})
    assert.truthy(collator_obj:compare(a, c))
    assert.truthy(collator_obj:compare(c, b))
    assert.truthy(collator_obj:compare(b, d))
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
  it("discontiguous contractions should work", function()
    -- alef + madda above (U+0653) is a contraction, U+0591 (class 220)
    -- between them doesn't block it
    local contraction = collator_obj:make_sort_key({0x0627, 0x0653, 0x0591})
    assert.same(contraction, collator_obj:make_sort_key({0x0627, 0x0591, 0x0653}))
    -- U+0592 has the same class as U+0653 (230) and blocks it
    local blocked = collator_obj:make_sort_key({0x0627, 0x0592, 0x0653})
    local unblocked = collator_obj:make_sort_key({0x0627, 0x0653, 0x0592})
    assert.truthy(collator_obj:compare(blocked, unblocked) or collator_obj:compare(unblocked, blocked))
  end)
  it("backward secondary weights should be reversed in segments", function()
    local backward = collator.new(ducet)
    backward.accents_backward = true
    -- the secondary level of the sort key, between the first two zeroes
    local function secondary(codepoints)
      local key = backward:make_sort_key(codepoints)
      local level, zeroes = {}, 0
      for _, weight in ipairs(key) do
        if weight == 0 then
          zeroes = zeroes + 1
          if zeroes == 2 then break end
        elseif zeroes == 1 then
          level[#level + 1] = weight
        end
      end
      return level
    end
    local function weight(codepoint) return backward:get_weights({codepoint}, 1)[1][2] end
    -- a, acute, U+FFFE, b: the segment before U+FFFE is reversed alone
    assert.same({weight(0x0301), weight(0x61), weight(0xFFFE), weight(0x62)},
      secondary({0x61, 0x0301, 0xFFFE, 0x62}))
    -- without U+FFFE the whole level is reversed
    assert.same({weight(0x62), weight(0x0301), weight(0x61)}, secondary({0x61, 0x0301, 0x62}))
  end)
  it("variable weighting should work", function()
    local function sorted(variable)
      local c = collator.new(ducet)
      c.variable_weighting = variable
      local t = {"deluge", "de-luge", "demark", "de luge", "death"}
      table.sort(t, function(a, b) return c:compare_strings(a, b) end)
      return t, c
    end
    assert.same({"de luge", "de-luge", "death", "deluge", "demark"}, sorted("non-ignorable"))
    assert.same({"de luge", "de-luge", "death", "deluge", "demark"}, sorted(nil))
    -- shifted: space and hyphen are ignored up to the quaternary level
    assert.same({"death", "de luge", "de-luge", "deluge", "demark"}, sorted("shifted"))
    -- blanked: they are ignored
    local _, blanked = sorted("blanked")
    local key = function(s) return blanked:make_sort_key(blanked:string_to_codepoints(s)) end
    assert.same(key("deluge"), key("de-luge"))
    assert.same(key("deluge"), key("de luge"))
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
