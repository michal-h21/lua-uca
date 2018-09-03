local collation = require "tools.collation"

describe("Collation test", function()
  local collator = collation.new()
  it("should load the DUCET file", function()
    assert.same(type(collator.load_ducet), "function")
    local ducet_file = io.open("data/allkeys.txt", "r")
    local content = ducet_file:read("*all")
    collator:load_ducet(content)
    ducet_file:close()
    assert.same(type(collator.keys), "table")
    local sorted_table = {}
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
      sorted_table[#sorted_table+1] = {key = primary_keys[1], codepoint = codepoint}
      -- print(utf8.char(codepoint), table.concat(primary_keys, ";"))
    end
    table.sort(sorted_table, function(a,b) return a.key < b.key end)
    local t = {}
    for _, x in ipairs(sorted_table) do
      t[#t+1] = utf8.char(x.codepoint) .. ":" ..  x.key ..";"
    end
    print(table.concat(t))

  end)
end)
