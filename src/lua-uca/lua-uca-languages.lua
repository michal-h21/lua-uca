local languages = {}

languages.af = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring("&N<<<ŉ")
  return collator_obj
end

languages.am = function(collator_obj)
  collator_obj:reorder{ "ethiopic" }
  return collator_obj
end


languages.as = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "bengali","devanagari","gurmukhi","gujarati","oriya","tamil","telugu","kannada","malayalam","sinhala" }
  tailoring "&ঔ<ং<ঁ<ঃ"
  tailoring "&ত<ৎ=ত্\u{200D}"
  tailoring "&হ<ক্ষ"
  return collator_obj
end

languages.az = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "latin", "cyrillic" }
  tailoring "&C<ç<<<Ç"
  tailoring "&G<ğ<<<Ğ"
  tailoring "&i<ı<<<I"
  tailoring "&i<<<İ"
  tailoring "&O<ö<<<Ö"
  tailoring "&S<ş<<<Ş"
  tailoring "&U<ü<<<Ü"
  tailoring "&K<q<<<Q"
  tailoring "&E<ə<<<Ə"
  tailoring "&H<x<<<X"
  tailoring "&Z<w<<<W"
  return collator_obj
end

languages.be = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder {"cyrillic"}
  tailoring "&Е<ё<<<Ё"
  tailoring "&у<ў<<<Ў"
  return collator_obj
end

languages.bg = function(collator_obj)
  collator_obj:reorder {"cyrillic"}
  return collator_obj
end


languages.bn = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "bengali","devanagari","gurmukhi","gujarati","oriya","tamil","telugu","kannada","malayalam","sinhala" }
  tailoring "&ঔ<ং<ঃ<ঁ"
  return collator_obj
end


languages.bs = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder {"latin", "cyrillic"}
  tailoring "&C<č<<<Č<ć<<<Ć"
  tailoring "&D<dž<<<ǆ<<<Dž<<<ǅ<<<DŽ<<<Ǆ<đ<<<Đ"
  tailoring "&L<lj<<<ǉ<<<Lj<<<ǈ<<<LJ<<<Ǉ"
  tailoring "&N<nj<<<ǌ<<<Nj<<<ǋ<<<NJ<<<Ǌ"
  tailoring "&S<š<<<Š"
  tailoring "&Z<ž<<<Ž"
  return collator_obj
end

languages.bs_cyrl = function(collator_obj)
  collator_obj:reorder{ "cyrillic" }
  return collator_obj
end

languages.ca = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<ch<<<cH<<<Ch<<<CH"
  tailoring "&L<ll<<<l·l<<<lL<<<l·L<<<Ll<<<L·l<<<LL<<<L·L"
  return collator_obj
end

languages.chr = function(collator_obj)
  collator_obj:reorder {"cherokee"}
  return collator_obj
end


languages.cs = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&c<č<<<Č"
  tailoring "&h<ch<<<cH<<<Ch<<<CH"
  tailoring "&R<ř<<<Ř"
  tailoring "&s<š<<<Š"
  tailoring "&z<ž<<<Ž"
  collator_obj:reorder {"others", "digits"}
  return collator_obj
end

languages.cy = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<ch<<<Ch<<<CH"
  tailoring "&D<dd<<<Dd<<<DD"
  tailoring "&F<ff<<<Ff<<<FF"
  tailoring "&G<ng<<<Ng<<<NG"
  tailoring "&L<ll<<<Ll<<<LL"
  tailoring "&P<ph<<<Ph<<<PH"
  tailoring "&R<rh<<<Rh<<<RH"
  tailoring "&T<th<<<Th<<<TH"
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
  languages.de(collator_obj)
  tailoring "&Ö=Oe"
  tailoring "&ö=oe"
  return collator_obj
end

languages.dsb = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<č<<<Č<ć<<<Ć"
  tailoring "&E<ě<<<Ě"
  tailoring "&H<ch<<<cH<<<Ch<<<CH"
  tailoring "&L<ł<<<Ł"
  tailoring "&N<ń<<<Ń"
  tailoring "&R<ŕ<<<Ŕ"
  tailoring "&S<š<<<Š<ś<<<Ś"
  tailoring "&Z<ž<<<Ž<ź<<<Ź"
  return collator_obj
end

-- rules for this language are quite complex, I will add them in the future
-- languages.dz = function(collator_obj)
--   local tailoring = function(s) collator_obj:tailor_string(s) end
--   collator_obj:reorder {"tibetan"}
--   return collator_obj
-- end

languages.ee = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&̌<<̂"
  tailoring "&D<dz<<<Dz<<<DZ<ɖ<<<Ɖ"
  tailoring "&E<ɛ<<<Ɛ"
  tailoring "&F<ƒ<<<Ƒ"
  tailoring "&G<gb<<<Gb<<<GB<ɣ<<<Ɣ"
  tailoring "&H<x<<<X"
  tailoring "&K<kp<<<Kp<<<KP"
  tailoring "&N<ny<<<Ny<<<NY<ŋ<<<Ŋ"
  tailoring "&O<ɔ<<<Ɔ"
  tailoring "&T<ts<<<Ts<<<TS"
  tailoring "&V<ʋ<<<Ʋ"
  return collator_obj
end

languages.el = function(collator_obj)
  collator_obj:reorder {"greek"}
  return collator_obj
end

languages.en = function(collator_obj)
  -- default sorting
  return collator_obj
end

languages.eo = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<ĉ<<<Ĉ"
  tailoring "&G<ĝ<<<Ĝ"
  tailoring "&H<ĥ<<<Ĥ"
  tailoring "&J<ĵ<<<Ĵ"
  tailoring "&S<ŝ<<<Ŝ"
  tailoring "&U<ŭ<<<Ŭ"
  return collator_obj
end

languages.es = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&N<ñ<<<Ñ"
  return collator_obj
end

languages.et = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&T<š<<<Š<z<<<Z<ž<<<Ž"
  tailoring "&X<õ<<<Õ<ä<<<Ä<ö<<<Ö<ü<<<Ü"
  return collator_obj
end

languages.fa = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&َ<<ِ<<ُ<<ً<<ٍ<<ٌ"
  tailoring "&ا<آ"
  tailoring "&ا<<ٱ<ء"
  tailoring "<<أ<<ٲ<<إ<<ٳ<<ؤ"
  tailoring "<<یٔ<<<ىٔ<<<ئ"
  tailoring "&ک<<*ڪګكڬڭڮ"
  tailoring "&ۏ<ه<<ە<<ہ<<ة<<ۃ<<ۀ<<ھ"
  tailoring "&ی<<*ىےيېۑۍێ"
  return collator_obj
end

languages.fi = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&D\u{0335}<<đ<<<Đ"
  tailoring "&G\u{0335}<<ǥ<<<Ǥ"
  tailoring "&N\u{0335}<<ŋ<<<Ŋ"
  tailoring "&T\u{0335}<<ŧ<<<Ŧ"
  tailoring "&Y<<ü<<<Ü"
  tailoring "&Z\u{0335}<<ʒ<<<Ʒ"
  tailoring "&ǀ<å<<<Å<ä<<<Ä<<æ<<<Æ<ö<<<Ö<<ø<<<Ø"
  return collator_obj
end

languages.fil = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&N<ñ<<<Ñ<ng<<<Ng<<<NG"
  return collator_obj
end

languages.fo = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&D<<đ<<<Đ<<ð<<<Ð"
  tailoring "&t<<<þ/h"
  tailoring "&T<<<Þ/H"
  tailoring "&Y<<ü<<<Ü<<ű<<<Ű"
  tailoring "&ǀ<æ<<<Æ<<ä<<<Ä<<ę<<<Ę<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<<œ<<<Œ<å<<<Å<<<aa<<<Aa<<<AA"
end

languages.fr = function(collator_obj)
  return collator_obj
end

languages.ga = function(collator_obj)
  return collator_obj
end

languages.gl = languages.es 

	
languages.gu = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"gujarati","devanagari", "bengali", "gurmukhi","oriya","tamil","telugu","kannada","malayalam","sinhala" }
  tailoring "&ૐ<ં<<ઁ<ઃ"
  return collator_obj
end


languages.hr = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder {"latin", "cyrillic"}
  tailoring "&C<č<<<Č<ć<<<Ć"
  tailoring "&D<dž<<<ǆ<<<Dž<<<ǅ<<<DŽ<<<Ǆ<đ<<<Đ"
  tailoring "&L<lj<<<ǉ<<<Lj<<<ǈ<<<LJ<<<Ǉ"
  tailoring "&N<nj<<<ǌ<<<Nj<<<ǋ<<<NJ<<<Ǌ"
  tailoring "&S<š<<<Š"
  tailoring "&Z<ž<<<Ž"
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

languages.ru = function(collator_obj)
  collator_obj:reorder{ "cyrillic" }
  return collator_obj
end

languages.sr = function(collator_obj)
  collator_obj:reorder{ "cyrillic" }
  return collator_obj
end

return languages
