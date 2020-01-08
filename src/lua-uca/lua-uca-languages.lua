local languages = {}
local tailoring_table = {1, 0, 0}
local secondary_tailoring = {0, 1, 0}
local tertiary_tailoring = {0, 0, 1}

local function tailor_string(collator_obj, str)
  -- cupport the cldr strings in the form: &D<<đ<<<Đ<<ð<<<Ð
  local function tailor(a, b, tbl) collator_obj:tailor(collator_obj:string_to_codepoints(a), collator_obj:string_to_codepoints(b), tbl) end
  local function tailor_primary(a,b) tailor(a,b, tailoring_table) end
  local function tailor_secondary(a,b) tailor(a,b, secondary_tailoring) end
  local function tailor_tertiary(a,b) tailor(a,b, tertiary_tailoring) end
  local functions = {["<"] = tailor_primary, ["<<"] = tailor_secondary, ["<<<"] = tailor_tertiary}
  local first = str:match("^&?([^%<]+)")
  for fn, second in str:gmatch("([<]+)([^<]+)") do
    local exec = functions[fn]
    print(fn, first, second)
    exec(first, second)
    first = second -- set the current second object as first for the next round
  end
end


languages.cs = function(collator_obj)
  local tailoring = function(s) tailor_string(collator_obj, s) end
	tailoring "&c<č<<<Č"
  tailoring "&h<ch<<<cH<<<Ch<<<CH"
  tailoring "&R<ř<<<Ř"
  tailoring "&s<š<<<Š"
  tailoring "&z<ž<<<Ž"
  -- collator_obj:tailor(collator_obj:string_to_codepoints("Z"), collator_obj:string_to_codepoints("ž"), tailoring_table)
  -- local h = collator_obj:string_to_codepoints("h")
  -- local ch = collator_obj:string_to_codepoints("ch")
  -- local Ch = collator_obj:string_to_codepoints("Ch")
  -- local cH = collator_obj:string_to_codepoints("cH")
  -- local CH = collator_obj:string_to_codepoints("CH")
  -- local c = collator_obj:string_to_codepoints("c")
  -- local ccaron = collator_obj:string_to_codepoints("č")
  -- local r = collator_obj:string_to_codepoints("r")
  -- local rcaron = collator_obj:string_to_codepoints("ř")
  -- local s = collator_obj:string_to_codepoints("s")
  -- local scaron = collator_obj:string_to_codepoints("š")
  -- local z = collator_obj:string_to_codepoints("z")
  -- local zcaron = collator_obj:string_to_codepoints("ž")
  -- collator_obj:tailor(h, ch, tailoring_table)
  -- collator_obj:tailor(ch, cH, tertiary_tailoring)
  -- collator_obj:tailor(cH, Ch, tertiary_tailoring)
  -- collator_obj:tailor(Ch, CH, tertiary_tailoring)
  -- collator_obj:tailor(c, ccaron, tailoring_table)
  -- collator_obj:tailor(r, rcaron, tailoring_table)
  -- collator_obj:tailor(s, scaron, tailoring_table)
  -- collator_obj:tailor(z, zcaron, tailoring_table)
  return collator_obj
end

languages.no = function(collator_obj)
  local tailoring = function(s) tailor_string(collator_obj, s) end
  tailoring("&D<<đ<<<Đ<<ð<<<Ð")
	tailoring("&th<<<þ")
	tailoring("&TH<<<Þ")
	tailoring("&Y<<ü<<<Ü<<ű<<<Ű")
	tailoring("&ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA")
	tailoring("&oe<<œ<<<Œ")
  return collator_obj
end

return languages
