local collation = require "luaindex.collation"

describe("Collation test", function()
  local collator = collation.new()
  it("should load the DUCET file", function()
    assert.same(type(collator.load_ducet), "function")
    local ducet_file = io.open("data/allkeys.txt", "r")
    local content = ducet_file:read("*all")
    collator:load_ducet(content)
    ducet_file:close()
    assert.same(type(collator.keys), "table")
    -- local s = "příliš žluťoučký kůň úpěl ďábelské ódy"
    local s = "aábcčdďeéěfghchiíjklmnňoópqrřsštťuúůvwxyýzžAÁBCČDĎEÉĚFGHCHIÍJKLMNŇOÓPQRŘSŠTŤUÚŮVWXYÝZŽ"
    for _, codepoint in utf8.codes(s) do
    -- for i = 1, utf8.len(s) do
      -- codepoint = utf8.codepoint(s, i)
    -- for pos, codepoint in ipairs(utf8.codepoint()) do
    -- for pos, codepoint in ipairs(utf8.codepoint("příliš žluťoučký kůň úpěl ďábelské ódy")) do
      local key = collator.keys[codepoint]
      local values = key.value or {}
      local primary_keys = {}
      for _, x in ipairs(values) do
        primary_keys[#primary_keys+1] = x[1]
      end
      print(utf8.char(codepoint), table.concat(primary_keys, ";"))
    end

  end)
end)
