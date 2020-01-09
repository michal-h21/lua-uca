local languages = {}
local tailoring_table = {1, 0, 0}
local secondary_tailoring = {0, 1, 0}
local tertiary_tailoring = {0, 0, 1}

local function tailor_string(collator_obj, str)
  -- cupport the cldr strings in the form: &D<<đ<<<Đ<<ð<<<Ð
  -- it is important that the strings are in the NFC normal form
  -- the CLDR XML files are in NFD, so they need to be converted
  -- for example using `uconv -x any-nfc < file.xml`
  local function tailor(a, b, tbl) 
    local autf = collator_obj:string_to_codepoints(a)
    local butf = collator_obj:string_to_codepoints(b)
    collator_obj:tailor(autf,butf, tbl) 
  end
  local function tailor_primary(a,b) tailor(a,b, tailoring_table) end
  local function tailor_secondary(a,b) tailor(a,b, secondary_tailoring) end
  local function tailor_tertiary(a,b) tailor(a,b, tertiary_tailoring) end
  local functions = {["<"] = tailor_primary, ["<<"] = tailor_secondary, ["<<<"] = tailor_tertiary}
  local first = str:match("^&?([^%<]+)")
  for fn, second in str:gmatch("([<]+)([^<]+)") do
    local exec = functions[fn]
    exec(first, second)
    first = second -- set the current second object as first for the next round
  end
end



languages.cs = function(collator_obj)
  local tailoring = function(s) tailor_string(collator_obj, s) end
	tailoring "&c<č<<<Č"
  tailoring "&h<ch<<<cH<<<Ch<<<CH"
  tailoring "&R<ř<<<Ř"
  tailoring "&s<š<<<Š"
  tailoring "&z<ž<<<Ž"
  return collator_obj
end

languages.no = function(collator_obj)
  local tailoring = function(s) tailor_string(collator_obj, s) end
  tailoring("&D<<đ<<<Đ<<ð<<<Ð")
	tailoring("&th<<<þ")
	tailoring("&TH<<<Þ")
	tailoring("&Y<<ü<<<Ü<<ű<<<Ű")
	tailoring("&ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA")
	tailoring("&oe<<œ<<<Œ")
  return collator_obj
end

return languages
