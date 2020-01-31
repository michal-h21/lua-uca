local languages = {}



languages.cs = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&c<č<<<Č"
  tailoring "&h<ch<<<cH<<<Ch<<<CH"
  tailoring "&R<ř<<<Ř"
  tailoring "&s<š<<<Š"
  tailoring "&z<ž<<<Ž"
  return collator_obj
end


languages.da = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:uppercase_first()
  tailoring("&D<<đ<<<Đ<<ð<<<Ð")
  tailoring("&th<<<þ")
  tailoring("&TH<<<Þ")
  tailoring("&Y<<ü<<<Ü<<ű<<<Ű")
  tailoring("&ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA")
  tailoring("&oe<<œ<<<Œ")
  return collator_obj
end

languages.de = function(collator_obj)
  local tailoring = function(s) tailor_string(collator_obj, s) end
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:uppercase_first()
  tailoring "&th<<<þ"
  tailoring "&TH<<<Þ"
  tailoring "&Y<<ƿ<<<Ƿ<<ʒ<<<Ʒ<<<ᶾ"
  tailoring "&A<<ä<<<Ä<<ǟ<<<Ǟ<<á<<<Á<<à<<<À<<ă<<<Ă<<ắ<<<Ắ<<ằ<<<Ằ<<ẵ<<<Ẵ<<ẳ<<<Ẳ<<â<<<Â<<ấ<<<Ấ<<ầ<<<Ầ<<ẫ<<<Ẫ<<ẩ<<<Ẩ<<ǎ<<<Ǎ<<å<<<Å=Å<<ǻ<<<Ǻ<<ã<<<Ã<<ȧ<<<Ȧ<<ǡ<<<Ǡ<<ą<<<Ą<<ā<<<Ā<<ả<<<Ả<<ȁ<<<Ȁ<<ȃ<<<Ȃ<<ạ<<<Ạ<<ặ<<<Ặ<<ậ<<<Ậ<<ḁ<<<Ḁ<<ᷓ<<ᴀ<<ⱥ<<<Ⱥ<<ᶏ<<ɐ<<<Ɐ<<<ᵄ<<ɑ<<<Ɑ<<<ᵅ<<ᶐ<<ɒ<<<Ɒ<<<ᶛ"
  tailoring "&O<<ö<<<Ö<<ȫ<<<Ȫ<<ó<<<Ó<<ò<<<Ò<<ŏ<<<Ŏ<<ô<<<Ô<<ố<<<Ố<<ồ<<<Ồ<<ỗ<<<Ỗ<<ổ<<<Ổ<<ǒ<<<Ǒ<<ő<<<Ő<<õ<<<Õ<<ṍ<<<Ṍ<<ṏ<<<Ṏ<<ȭ<<<Ȭ<<ȯ<<<Ȯ<<ȱ<<<Ȱ<<ø<<<Ø<<ǿ<<<Ǿ<<ǫ<<<Ǫ<<ǭ<<<Ǭ<<ō<<<Ō<<ṓ<<<Ṓ<<ṑ<<<Ṑ<<ỏ<<<Ỏ<<ȍ<<<Ȍ<<ȏ<<<Ȏ<<ơ<<<Ơ<<ớ<<<Ớ<<ờ<<<Ờ<<ỡ<<<Ỡ<<ở<<<Ở<<ợ<<<Ợ<<ọ<<<Ọ<<ộ<<<Ộ<<ᴏ<<ᴑ<<ᴓ<<ɔ<<<Ɔ <<<ᵓ<<ᴐ<<ᴒ<<ᶗ<<ꝍ<<<Ꝍ<<ᴖ<<<ᵔ<<ᴗ<<<ᵕ<<ⱺ<<ɵ<<<Ɵ<<<ᶱ<<ꝋ<<<Ꝋ<<ɷ<<ȣ<<<Ȣ<<<ᴽ<<ᴕ				  "
  tailoring "&U<<ü<<<Ü<<ǘ<<<Ǘ<<ǜ<<<Ǜ<<ǚ<<<Ǚ<<ǖ<<<Ǖ<<ú<<<Ú<<ù<<<Ù<<ŭ<<<Ŭ<<û<<<Û<<ǔ<<<Ǔ<<ů<<<Ů<<ű<<<Ű<<ũ<<<Ũ<<ṹ<<<Ṹ<<ų<<<Ų<<ū<<<Ū<<ṻ<<<Ṻ<<ủ<<<Ủ<<ȕ<<<Ȕ<<ȗ<<<Ȗ<<ư<<<Ư<<ứ<<<Ứ<<ừ<<<Ừ<<ữ<<<Ữ<<ử<<<Ử<<ự<<<Ự<<ụ<<<Ụ<<ṳ<<<Ṳ<<ṷ<<<Ṷ<<ṵ<<<Ṵ<<ᴜ<<<ᶸ<<ᴝ<<<ᵙ<<ᴞ<<ʉ<<<Ʉ<<<ᶶ<<ᵾ<<ᶙ<<ʊ<<<Ʊ<<<ᶷ<<ᵿ"
  return collator_obj
end

languages.de_din2 = function(collator_obj)
  local function tailor(a, b, tbl) 
    local autf = collator_obj:string_to_codepoints(a)
    local butf = collator_obj:string_to_codepoints(b)
    collator_obj:tailor(autf,butf, tbl) 
  end
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:uppercase_first()
  languages.de(collator_obj)
  tailoring "&Ö=Oe"
  tailoring "&ö=oe"
  return collator_obj
end

languages.no = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:uppercase_first()
  tailoring("&D<<đ<<<Đ<<ð<<<Ð")
  tailoring("&th<<<þ")
  tailoring("&TH<<<Þ")
  tailoring("&Y<<ü<<<Ü<<ű<<<Ű")
  tailoring("&ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA")
  tailoring("&oe<<œ<<<Œ")
  return collator_obj
end


return languages
