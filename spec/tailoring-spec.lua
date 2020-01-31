local newtable = require "lua-uca.lua-uca-reordering-table"
local tailoring = require "lua-uca.lua-uca-tailoring"
local collator_lib = require "lua-uca.lua-uca-collator"
local ducet = require "lua-uca.lua-uca-ducet"
local reorder = tailoring.reorder
local reorder_collator = tailoring.reorder_collator

-- test sort
local collator_obj = collator_lib.new(ducet)

local sort_table = {"12", "ahoj", "Первая"}

describe("Test reordering", function()
  local sort = function(sort_table) 
    table.sort(sort_table, function(a,b) return collator_obj:compare_strings(a,b) end) 
  end
  local assert_order = function(t1, t2)
    for i = 1, #t1 do
      assert.equals(t1[i], t2[i])
    end
  end

  it("Default order", function()
    sort(sort_table)
    assert_order(sort_table, {"12", "ahoj", "Первая"})
  end)
  it("Reorder Cyrillic", function()
    reorder("cyrillic", newtable)
    -- reorder("others", newtable)
    -- reorder("digits", newtable)
    reorder_collator(collator_obj, newtable)
    sort(sort_table)
    -- digits are bellow reordering order, so they still come first
    assert_order(sort_table, {"12", "Первая",  "ahoj"})
  end)
  it("Reorder digits", function()
    reorder("others", newtable)
    reorder("digits", newtable)
    reorder_collator(collator_obj, newtable)
    sort(sort_table)
    -- digits should be sorted as last
    assert_order(sort_table, {"Первая",  "ahoj", "12"})
  end)
end)
