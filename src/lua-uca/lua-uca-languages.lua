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

languages.ar = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "arabic" }
  tailoring "&ت<<ة<<<ﺔ<<<ﺓ"
  tailoring "&ي<<ى<<<ﯨ<<<ﯩ<<<ﻰ<<<ﻯ<<<ﲐ<<<ﱝ"
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

languages.ha = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&B<ɓ<<<Ɓ"
  tailoring "&D<ɗ<<<Ɗ"
  tailoring "&K<ƙ<<<Ƙ"
  tailoring "&S<sh<<<Sh<<<SH"
  tailoring "&T<ts<<<Ts<<<TS"
  tailoring "&Y<ƴ<<<ʼy<<<''y<<<Ƴ<<<ʼY<<<''Y"
  return collator_obj
end

languages.haw = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&a<e<<<E<i<<<I<o<<<O<u<<<U"
  tailoring "&w<ʻ"
  return collator_obj
end


languages.he = function(collator_obj)
  collator_obj:reorder{"hebrew"}
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

languages.hi = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "bengali","devanagari","gurmukhi","gujarati","oriya","tamil","telugu","kannada","malayalam","sinhala" }
  tailoring "&ॐ<ं<<ँ<ः"
  return collator_obj
end

languages.hsb = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<č<<<Č<ć<<<Ć"
  tailoring "&E<ě<<<Ě"
  tailoring "&H<ch<<<cH<<<Ch<<<CH"
  tailoring "&L<ł<<<Ł"
  tailoring "&R<ř<<<Ř"
  tailoring "&S<š<<<Š"
  tailoring "&Z<ž<<<Ž<ź<<<Ź"
  return collator_obj
end

languages.hu = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<cs<<<Cs<<<CS"
  tailoring "&D<dz<<<Dz<<<DZ"
  tailoring "&DZ<dzs<<<Dzs<<<DZS"
  tailoring "&G<gy<<<Gy<<<GY"
  tailoring "&L<ly<<<Ly<<<LY"
  tailoring "&N<ny<<<Ny<<<NY"
  tailoring "&S<sz<<<Sz<<<SZ"
  tailoring "&T<ty<<<Ty<<<TY"
  tailoring "&Z<zs<<<Zs<<<ZS"
  tailoring "&O<ö<<<Ö<<ő<<<Ő"
  tailoring "&U<ü<<<Ü<<ű<<<Ű"
  tailoring "&cs<<<ccs/cs"
  tailoring "&Cs<<<Ccs/cs"
  tailoring "&CS<<<CCS/CS"
  tailoring "&dz<<<ddz/dz"
  tailoring "&Dz<<<Ddz/dz"
  tailoring "&DZ<<<DDZ/DZ"
  tailoring "&dzs<<<ddzs/dzs"
  tailoring "&Dzs<<<Ddzs/dzs"
  tailoring "&DZS<<<DDZS/DZS"
  tailoring "&gy<<<ggy/gy"
  tailoring "&Gy<<<Ggy/gy"
  tailoring "&GY<<<GGY/GY"
  tailoring "&ly<<<lly/ly"
  tailoring "&Ly<<<Lly/ly"
  tailoring "&LY<<<LLY/LY"
  tailoring "&ny<<<nny/ny"
  tailoring "&Ny<<<Nny/ny"
  tailoring "&NY<<<NNY/NY"
  tailoring "&sz<<<ssz/sz"
  tailoring "&Sz<<<Ssz/sz"
  tailoring "&SZ<<<SSZ/SZ"
  tailoring "&ty<<<tty/ty"
  tailoring "&Ty<<<Tty/ty"
  tailoring "&TY<<<TTY/TY"
  tailoring "&zs<<<zzs/zs"
  tailoring "&Zs<<<Zzs/zs"
  tailoring "&ZS<<<ZZS/ZS"
  return collator_obj
end


languages.hy = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder {"armenian"}
  tailoring "&ք<և<<<Եւ"
  return collator_obj
end

languages.id = function(collator_obj)
  return collator_obj
end

languages.ig = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&B<ch<<<Ch<<<CH"
  tailoring "&G<gb<<<Gb<<<GB<gh<<<Gh<<<GH<gw<<<Gw<<<GW"
  tailoring "&I<ị<<<Ị"
  tailoring "&K<kp<<<Kp<<<KP<kw<<<Kw<<<KW"
  tailoring "&N<ṅ<<<Ṅ<nw<<<Nw<<<NW<ny<<<Ny<<<NY"
  tailoring "&O<ọ<<<Ọ"
  tailoring "&S<sh<<<Sh<<<SH"
  tailoring "&U<ụ<<<Ụ"
  return collator_obj
end

languages.is = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&b<á<<<Á"
  tailoring "&d<<đ<<<Đ<ð<<<Ð"
  tailoring "&f<é<<<É"
  tailoring "&j<í<<<Í"
  tailoring "&p<ó<<<Ó"
  tailoring "&v<ú<<<Ú"
  tailoring "&z<ý<<<Ý"
  tailoring "&ǀ<æ<<<Æ<<ä<<<Ä<ö<<<Ö<<ø<<<Ø<å<<<Å"
  return collator_obj
end

languages.it = function(collator_obj)
  return collator_obj
end

-- languages.ja - in the future
--
languages.ka = function(collator_obj)
  collator_obj:reorder{"georgian"}
  return collator_obj
end


languages.kk = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "cyrillic" }
  tailoring "&Е<ё<<<Ё"
  tailoring "&Ұ<ү<<<Ү"
  tailoring "&ь<і<<<І"
  return collator_obj
end

languages.kl = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&D<<đ<<<Đ<<ð<<<Ð"
  tailoring "&Q<<ĸ<<<K''"
  tailoring "&t<<<þ/h"
  tailoring "&T<<<Þ/H"
  tailoring "&Y<<ü<<<Ü<<ű<<<Ű"
  tailoring "&ǀ<æ<<<Æ<<ä<<<Ä<<ę<<<Ę<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<<œ<<<Œ<å<<<Å"
  return collator_obj
end

languages.kl = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "khmer" }
  tailoring "&។ល។<<<៘"
  tailoring "&ៈ<<៎<<៏<<៑<<័<<ៈ<<៝<<់<<៉<<៊<<៍"
  tailoring "&រ<ឫ<ឬ"
  tailoring "&ល<ឭ<ឮ"
  tailoring "&រ្ក<<ក៌"
  tailoring "&រ្ខ<<ខ៌"
  tailoring "&រ្គ<<គ៌"
  tailoring "&រ្ឃ<<ឃ៌"
  tailoring "&រ្ង<<ង៌"
  tailoring "&រ្ច<<ច៌"
  tailoring "&រ្ឆ<<ឆ៌"
  tailoring "&រ្ជ<<ជ៌"
  tailoring "&រ្ឈ<<ឈ៌"
  tailoring "&រ្ញ<<ញ៌"
  tailoring "&រ្ដ<<ដ៌"
  tailoring "&រ្ឋ<<ឋ៌"
  tailoring "&រ្ឌ<<ឌ៌"
  tailoring "&រ្ឍ<<ឍ៌"
  tailoring "&រ្ណ<<ណ៌"
  tailoring "&រ្ត<<ត៌"
  tailoring "&រ្ថ<<ថ៌"
  tailoring "&រ្ទ<<ទ៌"
  tailoring "&រ្ធ<<ធ៌"
  tailoring "&រ្ន<<ន៌"
  tailoring "&រ្ប<<ប៌"
  tailoring "&រ្ផ<<ផ៌"
  tailoring "&រ្ព<<ព៌"
  tailoring "&រ្ភ<<ភ៌"
  tailoring "&រ្ម<<ម៌"
  tailoring "&រ្យ<<យ៌"
  tailoring "&រ្រ<<រ៌"
  tailoring "&រ្ឫ<<ឫ៌"
  tailoring "&រ្ឬ<<ឬ៌"
  tailoring "&រ្ល<<ល៌"
  tailoring "&រ្ឭ<<ឭ៌"
  tailoring "&រ្ឮ<<ឮ៌"
  tailoring "&រ្វ<<វ៌"
  tailoring "&រ្ឝ<<ឝ៌"
  tailoring "&រ្ឞ<<ឞ៌"
  tailoring "&រ្ស<<ស៌"
  tailoring "&រ្ហ<<ហ៌"
  tailoring "&រ្ឡ<<ឡ៌"
  tailoring "&រ្អ<<អ៌=ឣ៌"
  tailoring "&អ=ឣ"
  tailoring "&អា=ឤ"
  tailoring "&អិ<<ឥ"
  tailoring "&អី<<ឦ"
  tailoring "&អុ<<ឧ"
  tailoring "&អូ<<ឩ"
  tailoring "&អែ<<ឯ"
  tailoring "&អៃ<<ឰ"
  tailoring "&អោ<<ឱ"
  tailoring "&អៅ<<ឳ"
  tailoring "&ឧក<<<ឨ"
  tailoring "&ឩវ<<<ឪ"
  tailoring "&ឱ<<<ឲ"
  tailoring "&ៅ<ុំ<ំ<ាំ<ះ<ិះ<ុះ<េះ<ោះ"
  return collator_obj
end

languages.kn = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"kannada","devanagari", "bengali", "gurmukhi","gujarati","oriya","tamil","telugu","malayalam","sinhala" }
  tailoring "&ಔ<ಂ<ಃ<ೱ<ೲ"
  return collator_obj
end

languages.ko = function(collator_obj)
  -- this is pretty incomplete, there are tons of tailorings in the xml file
  -- we will support them maybe in the future
  -- the original reorder in xml is Hang Hani <- I don't know what it is
  collator_obj:reorder{"hangul"}
  return collator_obj
end


languages.kok = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"devanagari", "bengali", "gurmukhi","gujarati","oriya","tamil","telugu","kannada","malayalam","sinhala" }
  tailoring "&ॐ<ं<<ँ<ः"
  tailoring "&ह<ळ"
  tailoring "<क्ष"
  return collator_obj
end

languages.ky = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "cyrillic" }
  tailoring "&е<ё<<<Ё"
  return collator_obj
end

languages.lb = function(collator_obj)
  return collator_obj
end

languages.lkt = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<č<<<Č"
  tailoring "&G<ǧ<<<Ǧ"
  tailoring "&H<ȟ<<<Ȟ"
  tailoring "&S<š<<<Š"
  tailoring "&Z<ž<<<Ž"
  return collator_obj
end

languages.ln = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&E<ɛ<<<Ɛ"
  tailoring "&O<<ɔ<<<Ɔ"
  return collator_obj
end

languages.lo = function(collator_obj)
  collator_obj:reorder{ "lao" }
  return collator_obj
end

languages.lt = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&̀=̇̀"
  tailoring "&́=̇́"
  tailoring "&̃=̇̃"
  tailoring "&A<<ą<<<Ą"
  tailoring "&C<č<<<Č"
  tailoring "&E<<ę<<<Ę<<ė<<<Ė"
  tailoring "&I<<į<<<Į<<y<<<Y"
  tailoring "&S<š<<<Š"
  tailoring "&U<<ų<<<Ų<<ū<<<Ū"
  tailoring "&Z<ž<<<Ž"
  return collator_obj
end

languages.lv = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&D<č<<<Č"
  tailoring "&H<ģ<<<Ģ"
  tailoring "&I<<y<<<Y"
  tailoring "&L<ķ<<<Ķ"
  tailoring "&M<ļ<<<Ļ"
  tailoring "&O<ņ<<<Ņ"
  tailoring "&S<ŗ<<<Ŗ"
  tailoring "&T<š<<<Š"
  tailoring "&Ʒ<ž<<<Ž"
  return collator_obj
end

languages.mk = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{ "cyrillic" }
  tailoring "&ԃ<ѓ<<<Ѓ"
  tailoring "&ћ<ќ<<<Ќ"
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
