local keys = require "lua-uca.lua-uca-ducet"
-- this loads the precompiled  ducet file 

describe("Collation test", function()
  it("should load the DUCET file", function()

    -- assert.same(type(collator.keys), "table")
    local sorted_table = {}
    -- local s = "příliš žluťoučký kůň úpěl ďábelské ódy"
    local s = "aábcčdďeéěfghchiíjklmnňoópqrřsštťuúůvwxyýzžAÁBCČDĎEÉĚFGHCHIÍJKLMNŇOÓPQRŘSŠTŤUÚŮVWXYÝZŽ"
    for _, codepoint in utf8.codes(s) do
    -- for i = 1, utf8.len(s) do
      -- codepoint = utf8.codepoint(s, i)
    -- for pos, codepoint in ipairs(utf8.codepoint()) do
    -- for pos, codepoint in ipairs(utf8.codepoint("příliš žluťoučký kůň úpěl ďábelské ódy")) do
      local key = keys[codepoint]
      local values = key.value or {}
      local primary_keys = {}
      for _, x in ipairs(values) do
        primary_keys[#primary_keys+1] = x[1]
      end
      sorted_table[#sorted_table+1] = {key = primary_keys[1], codepoint = codepoint}
      print(utf8.char(codepoint), table.concat(primary_keys, ";"))
    end

    table.sort(sorted_table, function(a,b) return a.key < b.key end)
    local t = {}
    for _, x in ipairs(sorted_table) do
      t[#t+1] = utf8.char(x.codepoint) .. ":" ..  x.key ..";"
    end
    print(table.concat(t))

  end)
  it("should compare strings", function()
    -- test comparison using primary keys 
    local a = keys[string.byte("a")].value[1][1]
    local b = keys[string.byte("b")].value[1][1]
    assert.truthy(a < b)
  end)
  it("contracted characters", function()
    -- test for existence of sequence 0x006C 0x00B7
    local l = keys[0x006C] --
    assert.truthy(l.children[0x00B7])
  end)
  it("supports contractions of  more than two letters", function()
     local x = keys[0x0FB2] 
     local y = x.children[0x0F71]
     -- y shouldn't have values, there is no contraction for 0x0FB2 and 0x0F71
     assert.truthy(y.value == nil)
     -- there should be another child
     local d = y.children[0x0F80]
     assert.truthy(d)
     -- it should have value
     assert.truthy(d.value)
  end)
end)


