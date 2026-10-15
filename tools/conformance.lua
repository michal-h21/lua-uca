-- run the UCA conformance tests (UTS #10, section 12.2)
-- texlua tools/conformance.lua [file ...]
-- the default files are data/CollationTest/CollationTest_*.txt; the
-- files with SHIFTED in their names are run with shifted variable weighting
-- each line must be greater than or equal to the previous one, compared
-- with the identical level
kpse.set_program_name "luatex"
-- use the files in src/, not the installed ones
table.insert(package.searchers, 2, function(name)
  local filename, err = package.searchpath(name, "src/?.lua")
  if filename then return assert(loadfile(filename)), filename end
  return err
end)
local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"

local files = {}
for i = 1, #arg do files[i] = arg[i] end
if #files == 0 then
  for _, name in ipairs {"NON_IGNORABLE_SHORT", "NON_IGNORABLE", "SHIFTED_SHORT", "SHIFTED"} do
    files[#files + 1] = "data/CollationTest/CollationTest_" .. name .. ".txt"
  end
end

local function compare(a, b)
  for i = 1, math.min(#a, #b) do
    if a[i] ~= b[i] then return a[i] < b[i] and -1 or 1 end
  end
  if #a == #b then return 0 end
  return #a < #b and -1 or 1
end

local failed = false
for _, filename in ipairs(files) do
  local collator_obj = collator.new(ducet)
  collator_obj.identical_level = true
  if filename:match("SHIFTED") then collator_obj.variable_weighting = "shifted" end
  local previous, previous_line
  local lines, errors = 0, 0
  for line in io.lines(filename) do
    local hex = not line:match("^#") and line:match("^([%x ]+)")
    if hex then
      local codepoints = {}
      for code in hex:gmatch("%x+") do codepoints[#codepoints + 1] = tonumber(code, 16) end
      local key = collator_obj:make_sort_key(collator_obj:string_to_codepoints(utf8.char(table.unpack(codepoints))))
      lines = lines + 1
      if previous and compare(previous, key) > 0 then
        errors = errors + 1
        if errors <= 10 then
          print("wrong order: " .. previous_line .. "\n         and: " .. line)
        end
      end
      previous, previous_line = key, line
    end
  end
  print(string.format("%s: %d lines, %d errors", filename, lines, errors))
  if errors > 0 or lines == 0 then failed = true end
end
os.exit(failed and 1 or 0)
