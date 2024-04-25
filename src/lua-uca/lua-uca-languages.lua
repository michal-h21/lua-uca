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
  -- these are tailorings from "compat". standard tailorings are huge
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

languages.dz = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder {"tibetan"}
  -- tons of tailorings ommited
  return collator_obj
end

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
  -- French uses default sorting rules by default
  return collator_obj
end

languages.fr_backward_accents = function(collator_obj)
  -- alternative sorting for Cannadian French
  -- reverse search for accents in French:
  collator_obj.accents_backward = true
  -- accents: sorting order in French
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring("&a<<à<<â")
  tailoring("&e<<é<<è<<ê<<ë")
  tailoring("&i<<î<<ï")
  tailoring("&o<<ô<<ö")
  tailoring("&u<<ù<<û<<ü")
  tailoring("&y<<ÿ")
  tailoring("&ae<æ<<<Æ")
  tailoring("&oe<œ<<<Œ")
  tailoring("&th<þ<<<Þ")       -- Canadian, see SGQRI004.pdf
  -- lowercase before uppercase in French
  --collator_obj:uppercase_first()
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

languages.ja = function(collator_obj)
  collator_obj:reorder{"latin", "kana", "han"}
  -- tons of tailorings ommited
  return collator_obj
end

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

languages.km = function(collator_obj)
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
  collator_obj:reorder{"hangul", "han"}
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

languages.ml = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"malayalam","latin", "devanagari", "arabic","tamil", "kannada", "telugu", "bengali", "gurmukhi","gujarati","oriya","sinhala" }
  tailoring "&ഃ<<ഽ"
  tailoring "&\u{0D4C}<<\u{0D57}"
  tailoring "&ക്<<ക്\u{200D}<<<ൿ"
  tailoring "&ണ്<<ണ്\u{200D}<<<ൺ"
  tailoring "&ന്<<ന്\u{200D}<<<ൻ"
  tailoring "&ര്<<ര്\u{200D}<<<ർ"
  tailoring "&ല്<<ല്\u{200D}<<<ൽ"
  tailoring "&ള്<<ള്\u{200D}<<<ൾ"
  tailoring "&മ്<<ം"
  tailoring "&ന്<<<ൻ്"
  return collator_obj
end

languages.mn = function(collator_obj)
  collator_obj:reorder{ "cyrillic", "mongolian" }
  return collator_obj
end

languages.mr = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"devanagari", "bengali", "gurmukhi", "gujarati", "oriya", "tamil", "telugu", "kannada", "malayalam", "sinhala"}
  tailoring "&ॐ<ं<<ँ<ः"
  tailoring "&ह<ळ"
  tailoring "<क्ष"
  tailoring "<ज्ञ"
  return collator_obj
end

languages.ms = function(collator_obj)
  return collator_obj
end

languages.mt = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:uppercase_first()
  tailoring "&c<ċ<<<Ċ"
  tailoring "&g<ġ<<<Ġ"
  tailoring "&h<għ<<<gĦ<<<Għ<<<GĦ"
  tailoring "&i<ħ<<<Ħ"
  tailoring "&z<ż<<<Ż"
  return collator_obj
end


languages.my = function(collator_obj)
  -- there are tons of tailoring in the xml file, at the moment we just reorder
  collator_obj:reorder{ "myanmar" }
  return collator_obj
end

languages.nb = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&D<<đ<<<Đ<<ð<<<Ð"
  tailoring "&t<<<þ/h"
  tailoring "&T<<<Þ/H"
  tailoring "&Y<<ü<<<Ü<<ű<<<Ű"
  tailoring "&ǀ<æ<<<Æ<<ä<<<Ä<<ę<<<Ę<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<<œ<<<Œ<å<<<Å<<aa<<<Aa<<<AA"
  return collator_obj
end

languages.ne = function(collator_obj)
  collator_obj:reorder{ "devanagari" }
  return collator_obj
end

languages.nl = function(collator_obj)
  return collator_obj
end

-- 
languages.nn = languages.nb

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

languages.om = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&Z<ch<<<Ch<<<CH<dh<<<Dh<<<DH<kh<<<Kh<<<KH<ny<<<Ny<<<NY<ph<<<Ph<<<PH<sh<<<Sh"
  return collator_obj
end

languages["or"] = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"oriya", "devanagari", "bengali", "gurmukhi", "gujarati", "tamil", "telugu", "kannada", "malayalam", "sinhala"}
  tailoring "&ଔ<ଁ<ଂ<ଃ"
  tailoring "&ହ<କ୍ଷ"
  tailoring "&ଯ<<ୟ"
  return collator_obj
end

languages.pa = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"gurmukhi", "devanagari", "bengali", "gujarati", "oriya", "tamil", "telugu", "kannada", "malayalam", "sinhala", "arabic"}
  tailoring "&ੱ<<ੰ<<ਂ<<ਁ<<਼"
  tailoring "&ੜ<੍"
  return collator_obj
end

languages.pl = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&A<ą<<<Ą"
  tailoring "&C<ć<<<Ć"
  tailoring "&E<ę<<<Ę"
  tailoring "&L<ł<<<Ł"
  tailoring "&N<ń<<<Ń"
  tailoring "&O<ó<<<Ó"
  tailoring "&S<ś<<<Ś"
  tailoring "&Z<ź<<<Ź<ż<<<Ż"
  return collator_obj
end


languages.ps = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"arabic"}
  tailoring "&َ<<ِ<<ُ<<ً<<ٍ<<ٌ"
  tailoring "&ا<آ"
  tailoring "&ا<<أ<<ٲ<<ٱ<<إ<<ٳ<ء"
  tailoring "&ت<ټ<<ٹ"
  tailoring "&ج<ځ<<حٔ"
  tailoring "&چ<څ"
  tailoring "&د<ډ<<ڈ"
  tailoring "&ر<ړ<<ڑ"
  tailoring "&ژ<ږ"
  tailoring "&ک<<*ڪك"
  tailoring "&ګ<<گ"
  tailoring "&ڼ<<ڻ"
  tailoring "&و<<ؤ<<ۇ<<ۉ"
  tailoring "&ه<<<ۀ<<<هٔ<<*ەہھةۃ"
  tailoring "&ی<<*ىےيېۍ<<یٔ<<<ىٔ<<<ئ"
  tailoring "&\u{00A0}<<\u{200C}<<\u{200D}"
  return collator_obj
end

languages.pt = function(collator_obj)
  return collator_obj
end

languages.ro = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&A<ă<<<Ă<â<<<Â"
  tailoring "&I<î<<<Î"
  tailoring "&S<ş=ș<<<Ş=Ș"
  tailoring "&T<ţ=ț<<<Ţ=Ț"
  return collator_obj
end

languages.ru = function(collator_obj)
  collator_obj:reorder{ "cyrillic" }
  return collator_obj
end


languages.se = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&b<á<<<Á"
  tailoring "&d<č<<<Č<ʒ<<<Ʒ<ǯ<<<Ǯ"
  tailoring "&e<đ<<<Đ<<ð<<<Ð"
  tailoring "&h<ǧ<<<Ǧ<ǥ<<<Ǥ"
  tailoring "&l<ǩ<<<Ǩ"
  tailoring "&o<ŋ<<<Ŋ<<ń<<<Ń<<ñ<<<Ñ"
  tailoring "&t<š<<<Š"
  tailoring "&u<ŧ<<<Ŧ<<þ<<<Þ"
  tailoring "&y<<ü<<<Ü<<ű<<<Ű"
  tailoring "&ǀ<ž<<<Ž<ø<<<Ø<<œ<<<Œ<æ<<<Æ<å<<<Å<<ȧ<<<Ȧ<ä<<<Ä<<ã<<<Ã<ö<<<Ö<<ő<<<Ő<<õ<<<Õ<<ô<<<Ô<<ǫ<<<Ǫ"
  return collator_obj
end

languages.si = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"sinhala","devanagari", "bengali", "gurmukhi", "gujarati", "oriya", "tamil", "telugu", "kannada", "malayalam"}
  tailoring "&ඖ<ං<ඃ"
  tailoring "&ඥ<ඤ"
  return collator_obj
end

languages.sk = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&A<ä<<<Ä"
  tailoring "&C<č<<<Č"
  tailoring "&H<ch<<<cH<<<Ch<<<CH"
  tailoring "&O<ô<<<Ô"
  tailoring "&R<ř<<<Ř"
  tailoring "&S<š<<<Š"
  tailoring "&Z<ž<<<Ž"
  return collator_obj
end


languages.sl = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<č<<<Č"
  tailoring "&S<š<<<Š"
  tailoring "&Z<ž<<<Ž"
  return collator_obj
end

languages.smn = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&A<â<<<Â<<à<<<À"
  tailoring "&C<č<<<Č"
  tailoring "&D<đ<<<Đ"
  tailoring "&Ŋ<<ñ<<<Ñ<<ń<<<Ń"
  tailoring "&S<š<<<Š"
  tailoring "&Z<ž<<<Ž<æ<<<Æ<ø<<<Ø<å<<<Å<ã<<<Ã<ä<<<Ä<á<<<Á<ö<<<Ö"
  return collator_obj
end

languages.sq = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&D<ç<<<Ç"
  tailoring "&E<dh<<<Dh<<<DH"
  tailoring "&F<ë<<<Ë"
  tailoring "&H<gj<<<Gj<<<GJ"
  tailoring "&M<ll<<<Ll<<<LL"
  tailoring "&O<nj<<<Nj<<<NJ"
  tailoring "&S<rr<<<Rr<<<RR"
  tailoring "&T<sh<<<Sh<<<SH"
  tailoring "&U<th<<<Th<<<TH"
  tailoring "&Y<xh<<<Xh<<<XH"
  tailoring "&Ʒ<zh<<<Zh<<<ZH"
  return collator_obj
end

languages.sr = function(collator_obj)
  collator_obj:reorder{ "cyrillic" }
  return collator_obj
end

languages.sr_latn = languages.hr

languages.sv = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&D<<đ<<<Đ<<ð<<<Ð"
  tailoring "&t<<<þ/h"
  tailoring "&T<<<Þ/H"
  tailoring "&v<<<V<<w<<<W"
  tailoring "&Y<<ü<<<Ü<<ű<<<Ű"
  tailoring "&ǀ<å<<<Å<ä<<<Ä<<æ<<<Æ<<ę<<<Ę<ö<<<Ö<<ø<<<Ø<<ő<<<Ő<<œ<<<Œ<<ô<<<Ô"
  return collator_obj
end

languages.sw = function(collator_obj)
  return collator_obj
end


languages.ta = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"tamil", "devanagari", "bengali", "gurmukhi", "gujarati", "oriya", "telugu", "kannada", "malayalam", "sinhala"}
  tailoring  "&ஔ<ஂ<ஃ"
  tailoring  "&ஹ<க்ஷ"
  tailoring  "&க<க்"
  tailoring  "&ங<ங்"
  tailoring  "&ச<ச்"
  tailoring  "&ஞ<ஞ்"
  tailoring  "&ட<ட்"
  tailoring  "&ண<ண்"
  tailoring  "&த<த்"
  tailoring  "&ந<ந்"
  tailoring  "&ப<ப்"
  tailoring  "&ம<ம்"
  tailoring  "&ய<ய்"
  tailoring  "&ர<ர்"
  tailoring  "&ல<ல்"
  tailoring  "&வ<வ்"
  tailoring  "&ழ<ழ்"
  tailoring  "&ள<ள்"
  tailoring  "&ற<ற்"
  tailoring  "&ன<ன்"
  tailoring  "&ஜ<ஜ்"
  tailoring  "&ஶ<ஶ்"
  tailoring  "&ஷ<ஷ்"
  tailoring  "&ஸ<ஸ்"
  tailoring  "&ஹ<ஹ்"
  tailoring  "&க்ஷ<க்ஷ்"
  return collator_obj
end

languages.te = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"telugu", "devanagari", "bengali", "gurmukhi", "gujarati", "oriya", "tamil", "kannada", "malayalam", "sinhala"}
  tailoring "&ఔ<ఁ<ం<ః"
  return collator_obj
end

languages.th = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"thai"}
  tailoring "&๚<ฯ"
  tailoring "&๛<ๆ"
  tailoring "&๎<<์"
  tailoring "&ะ<ํ"
  tailoring "&า<<<ๅ"
  tailoring "&าํ<<<ํา<<<ำ"
  tailoring "&ๅํ<<<ํๅ"
  tailoring "&ไ<ฺ"
  return collator_obj
end

languages.tk = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<ç<<<Ç"
  tailoring "&E<ä<<<Ä"
  tailoring "&J<ž<<<Ž"
  tailoring "&N<ň<<<Ň"
  tailoring "&O<ö<<<Ö"
  tailoring "&S<ş<<<Ş"
  tailoring "&U<ü<<<Ü"
  tailoring "&Y<ý<<<Ý"
  return collator_obj
end

languages.to = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&n<ng<<<Ng<<<NG<<<ŋ<<<Ŋ"
  tailoring "&z<ʻ<<<ʽ"
  tailoring "&a<<á<<<Á<<ā<<<Ā"
  tailoring "&e<<é<<<É<<ē<<<Ē"
  tailoring "&i<<í<<<Í<<ī<<<Ī"
  tailoring "&o<<ó<<<Ó<<ō<<<Ō"
  tailoring "&u<<ú<<<Ú<<ū<<<Ū"
  return collator_obj
end

languages.tr = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&C<ç<<<Ç"
  tailoring "&G<ğ<<<Ğ"
  tailoring "&i<ı<<<I"
  tailoring "&i<<<İ"
  tailoring "&O<ö<<<Ö"
  tailoring "&S<ş<<<Ş"
  tailoring "&U<ü<<<Ü"
  return collator_obj
end

languages.ug = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"arabic"}
  tailoring "&ا<ە<ب"
  tailoring "&ك<گ<ڭ<ل"
  tailoring "&ھ<و<ۇ<ۆ<ۈ<ۋ<ې<ى<ي"
  return collator_obj
end

languages.uk = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"cyrillic"}
  tailoring "&Г<ґ<<<Ґ"
  tailoring "&ꙇ<ї<<<\u{A676}<<<Ї"
  return collator_obj
end

languages.ur = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"arabic"}
  tailoring "&ا<<أ<آ<ب<بھ<پ<پھ<ت<تھ<ٹ<ٹھ<ث<ج<جھ<چ<چھ<ح<خ<د<دھ<ڈ<ڈھ<ذ<ر<رھ<ڑ<ڑھ<ز<ژ<س<ش<ص<ض<ط<ظ <ع<غ<ف<ق<ک<کھ<گ<گھ<ل<لھ<م<مھ<ن<نھ<ں<ںھ<و<<ؤ<وھ<ہ<<ۂ<ھ<ۃ<ء<ی<<ئ<یھ<ے<<ۓ"
  tailoring "&\u{0652}<<\u{064E}<<\u{0650}<<\u{064F}<<\u{0670}<<\u{0656}<<\u{0657}<<\u{064B}<<\u{064D}<<\u{064C}<<\u{0654}<<\u{0651}<<\u{0658}<<\u{0653}"
  tailoring "&<<<\u{0610}<<<\u{0611}<<<\u{0613}<<<\u{0612}<<<\u{0614}"
  return collator_obj
end

languages.uz = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&[before 1]ʒ<oʻ=o‘=o''<<<Oʻ=O‘=O''"
  tailoring "<gʻ=g‘=g''<<<Gʻ=G‘=G''"
  tailoring "<sh<<<Sh<<<SH"
  tailoring "<ch<<<Ch<<<CH"
  return collator_obj
end


languages.vi = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&̀<<̉<<̃<<́<<̣"
  tailoring "&a<ă<<<Ă<â<<<Â"
  tailoring "&d<đ<<<Đ"
  tailoring "&e<ê<<<Ê"
  tailoring "&o<ô<<<Ô<ơ<<<Ơ"
  tailoring "&u<ư<<<Ư"
  return collator_obj
end

languages.vo = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&A<ä<<<Ä"
  tailoring "&O<ö<<<Ö"
  tailoring "&U<ü<<<Ü"
  return collator_obj
end

languages.wae = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&á=aa"
  tailoring "&ã=ää"
  tailoring "&é=ee"
  tailoring "&í=ii"
  tailoring "&ó=oo"
  tailoring "&õ=öö"
  tailoring "&č=ch"
  tailoring "&š=sch"
  tailoring "&ú=uu"
  tailoring "&ũ=üü"
  return collator_obj
end

languages.wo = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&A<à<<<À"
  tailoring "&E<é<<<É<ë<<<Ë"
  tailoring "&N<ñ<<<Ñ<ŋ<<<Ŋ"
  tailoring "&O<ó<<<Ó"
  return collator_obj
end

languages.yi = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"hebrew"}
  tailoring "&''<<׳"
  tailoring "&'\"'<<״"
  tailoring "&ב<בֿ"
  tailoring "&ו<<וּ<<וו<<וי"
  tailoring "&י<<יִ<<יי<<ײַ"
  tailoring "&כ<כּ"
  tailoring "&פ<פּ"
  tailoring "&פֿ<<<ף"
  tailoring "&ש<שׂ"
  tailoring "&ת<תּ"
  return collator_obj
end

languages.yo = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  tailoring "&E<ẹ<<<Ẹ"
  tailoring "&G<gb<<<Gb<<<GB"
  tailoring "&O<ọ<<<Ọ"
  tailoring "&S<ṣ<<<Ṣ"
  return collator_obj
end

languages.zh = function(collator_obj)
  local tailoring = function(s)
    s = string.gsub(s, "%s*#.-\n%s*", "")  -- Remove comments
    collator_obj:tailor_string(s)
  end
  collator_obj:reorder{"han"}
  -- Use "pinyin", the default collation method for "zh"
  tailoring([[&'\uFDD0A' # INDEX A
    <*阿𥥩锕𠼞𨉚 # ā
    <*嗄 # á
    <*啊 # a
    <*𡉓哎哀唉𠳳埃娭挨欸㶼𡟓𢰇溾嗳𤸖銰锿噯鎄 # āi
    <*𠊎𫘤啀捱皑凒溰䠹嘊敱敳㱯𤸳皚𦩴癌𧪚騃𩪂𩮖䶣 # ái
    <*毐昹娾㢊矮𦥈𣤃𦥂蔼𩫇𧡋躷濭䨠䑂藹譪霭靄 # ǎi
    <*艾伌𡰽𥤦𡶃㤅㘷㕌㝶爱砹硋䀳隘嗌㗒塧嫒愛㾢碍𧰿𧵨𩈋叆𢟪𢟰暧瑷閡僾䅬䝽壒嬡懓㿄𥡽𦗍薆鴱𡁍懝𢣏𢣕曖𣜬璦𦗐𧏹餲𣋞𣝅𣩱𤢵皧瞹䔽𨶂馤𤻢礙𥴨𧓁譺鑀𪕭鱫𪇈靉 # ài
    <*安𡯏㸩侒峖䢿㫨桉氨㞄庵䀂菴谙媕㛺𢰍萻葊痷䅖腤鹌蓭誝𩽾𠽪鞌鞍𣚖盦諳𧩸馣盫𧫥𧫧𪁟鵪韽鶕𪘒𧮍 # ān
    <*玵𣵱啽雸𡪁儑𡽜䜙 # án
    <*垵俺𠉬唵埯铵隌揞𥦍㽢㜝罯銨𦺽𩈴𤜁𤃷𩅝 # ǎn
    <*犴𠰑岸㟁按洝荌𣆛案𤞿胺𧖮豻堓婩𤟉䅁𡎑𡹼晻𣣚暗𡪙𥏮貋𣽥𨲊錌闇𩓤鮟㱘𥳬䬓䮗𩭢𩹎黯䯥 # àn
    <*肮𠵫骯𡕉 # āng
    <*卬岇昂昻䀚䒢㭿𤭒䩕𩑝䭹𩔘 # áng
    <*䇦䭺𦫫 # ǎng
    <*𡵙𢓋枊㼜盎𠹃𩉰𣉗𣖮𩜟醠 # àng
    <*凹㕭柪梎軪𧨲𤏶㩠䫜爊𩥊𪃨𧅃 # āo
    <*𡊛敖𣷫㿰厫隞嗷嗸嶅廒滶獓蔜遨𡏼㟼㠂摮熬獒璈𢧴𣊁磝𪉑𥂢翱聱螯翶𦪈謷謸翺鳌鏖䦋𩘮䥝𩮯𩱏鰲鷔䵅鼇 # áo
    <*㑃𢁱㤇抝芺拗袄镺媪媼𩑤𩈏𥜌𦽀襖𩣻䯠𪁾䴈 # ǎo
    <*㘬㘭岙扷坳垇岰𥑑𩑍傲奡奥奧嫯慠骜㜜𢕟𢳆隩墺嶴㥿懊澳㜩㠗擙䐿𤺾鏊䜒䫨𩕀驁𩟇䮯𩼈 # ào
    <'\uFDD0B' # INDEX B
    <*丷八仈巴叭𡚭扒𠛋朳玐夿岜𤜱𤣸芭𩠀𢻷㸭㺴𦓧峇柭𤤒疤㿬哵巼捌笆粑羓蚆釛釟𠵺㭭豝𧲧𨊹𩚥𩡩鲃魞𢠭䰾𧎱 # bā
    <*叐犮抜坺妭𢇷拔茇㔜炦癹胈𩙥𥎱菝𧺡詙𧺺跋䟦軷𦳺颰𩖽魃墢𩊤䮂䳊鼥 # bá
    <*㞎把钯𢃳鈀靶𢺞 # bǎ
    <*坝弝爸𥝧垻罢耙𧿏𦫙跁䇑䩗𩨜鲅鲌罷䎬𩃴鮊覇䩻䶕矲䆉𩹏䎱霸㶚壩灞𤜕欛䃻𩽷 # bà
    <*吧𣬶𣬷紦 # ba
    <*㓦挀𢛞掰䪹𨃅擘 # bāi
    <*白𦣺𪡈㿟𥬝䳆 # bái
    <*𠫛百佰柏栢捭瓸竡粨絔摆䙓擺襬 # bǎi
    <*𡭢庍拝𣧙䒔败𢈕拜𤙅敗猈䢙𣺽𤽹稗𦳞𡏯粺𦩋㠔薭㔥𩋂𩎻贁𤁣韛𩏞 # bài
    <*㗑 # bai
    <*𠚼𠦒扳攽𣪂𤫫班般颁𥹓斑𤦦𠺚搬斒𦎊頒𠔯𤡰瘢䃑鳻𩿉𪉒䈲𧇥螌褩𤳖癍辬𩔮𨭉𪄕𪒋 # bān
    <*阪坂𡯘岅昄板版瓪𠧫钣粄舨䉽𧿨鈑蝂𧌿䬳魬闆 # bǎn
    <*办半伴𠯘扮坢㚘姅怑拌绊㪵柈𦙹秚湴絆𢲔𦝤鉡靽𢴬𩢔辦𨐦𨐱瓣𥷁𨐾 # bàn
    <*螁 # ban
    <*邦𠲑垹帮𠳐㙃捠梆浜𤱵𦰥邫幇𣮡㨍幚𤚰㿶𢁏縍幫𨢐𢸌鞤䩷𩍗 # bāng
    <*绑㮄𣮧綁榜牓膀𦾭髈 # bǎng
    <*𠬣𠨵㭋玤䂜蚌𢜗𢮏䖫傍棒棓谤塝𢄎搒稖蒡䧛䎧蜯𣘙磅镑䰷𢶶艕𡽲謗鎊𩮗𩦠 # bàng
    <*勹包𠣒佨𨚔孢𡶄苞枹胞笣𠅬𧵢煲龅蕔褒襃闁齙 # bāo
    <*𤿈窇䨌䪨嫑𥭓雹䨔䈏㵡薄𦡕𦢊㿺䥤 # báo
    <*𠤏宝𡧖怉饱保鸨㙅宲𤞥珤㻄䎂堡堢媬葆寚飹飽褓駂䭸鳵緥𩛞鴇賲𩬽䳈藵䭋寳𩭼寶䳰𨰦靌䴐𨰻 # bǎo
    <*勽𡉩报抱𤝧𢼌㲒𣭀㫧𥄹豹趵铇菢蚫袌報𨠖𠣺𠹕鉋鲍𤔣靤𩊅骲𩾡暴髱𩿓虣鮑儤㙸曓𧝘𪏶𡂟爆忁𩍂𧭤𨇅䤖鑤 # bào
    <*陂卑杯盃𤵛𦈧𢃍桮悲揹椑𤷁𥏓㗗𣬍㽡𤿾碑𦈶鹎𦩖𧼠藣鵯𩔹𥶓䥯 # bēi
    <*北㤳𧉥𧋲鉳䋳 # běi
    <*贝𣎵孛狈𤜲貝邶备𢂏𢻵昁𣬪牬㸬苝𤿒背郥钡俻倍𡋭㛝悖狽被偝偹㔨㫲梖㸽珼𤰈𦮷鄁𩇩備𠋭僃惫焙琲軰辈𩖠㣁愂㻗碚禙蓓蛽𩚾𠢥𣖾㸢犕㾱褙誖𧶙䟺鞁骳𢴾輩鋇䩀䰽憊㷶𤹲糒𠐡䔒𦾙𤳦㰆鞴䡶㶔鐾⻉ # bèi
    <*呗唄 # bei
    <*奔泍𣳰贲栟𩧼犇锛錛𩣺𪑖 # bēn
    <*本㡷苯奙畚翉楍𣄏㮺 # běn
    <*坋坌㤓倴𣴞捹桳渀笨𦯀逩𨋒㨧㮥䬱撪獖𪊜𪎝𥢊輽 # bèn
    <*伻𢆸𨸂㔙𡶤祊𠜳𠡮𨹹奟崩𢉁𥞩绷𣂤𣨥𤙾絣䑫閍傰嵭痭𨕧𨻱嘣𡡈𢐒綳𤡭𥛱䨜𦅈 # bēng
    <*甭 # béng
    <*㑟𤫬𨓁埄埲菶琣琫𧚭𩑚𥀂䙀𩊌䋽𦂌繃鞛䩬𧑑䳞 # běng
    <*泵迸逬𡎾𥦜𦝷𧻓塴𩂦㷯甏𦺑𧩱镚𩗴䭰𥖗蹦𪔑𡾛鏰𨆊䨻 # bèng
    <*揼 # beng
    <*屄𤝸偪毴逼𩧿㡙楅榌𥏠𨻼𢟵䫾𢡅䚜𧤃豍𨲋𣚡螕鵖鲾鎞𩭧䮠鰏 # bī
    <*𣴨荸鼻𩾳嬶䨆䵄 # bí
    <*匕比㠲夶朼佊𠛡吡妣沘疕彼柀𤽊䃾秕䏢䣥俾笔粃舭䘡啚𨟵𢩒㪏𣔓筆𠬈鄙𡳄𢳋箄聛𪌄𦸣貏㻶𤹦𠐌𠧅𨅗𪐄 # bǐ
    <*币必𢖬𠦈毕𨚍闭佖𠡂𠨘坒㘩𡛗庇𤜻诐邲𨚓𨸼㘠妼㡀𢁽㢰怭怶𢘍㧙枈畀畁苾𠈺哔㢶𣁉柲𣢠𣥣毖珌疪㿫荜陛㙄㢸毙𣭤狴畢𤵘䀣䄶笓粊袐铋婢庳敝梐𤙞䉾䋔䎵䏶𦯛𦰙萆萞䖩閇閉𠋯堛弻弼愊愎𣮐㳼湢皕𥆯禆筚𦱔詖貱賁赑䟤𨋥𨠔䧗𠓷㓖𠩿嗶彃𣦇滗滭煏𤗚痹痺睤𥟗腷蓖蓽蜌裨跸𨋩鉍閟𩉫飶𡠚𡻞幣弊𢲾熚𤠺 # bì (p1)
    <*𤡝獙𥈗碧箅箆綼蔽鄪䩛䪐𩑻馝𩲢𠮃𠽩𡚁幤𢴩㪤㮿㯇𣘥𣯴潷獘㻫𥛘𦂖罼𦑞𦔆襅𧳠䠋䫁駜髲壁嬖廦𢐦𣁢㵥𤢣𤹝篦篳縪𦠞薜觱避𩊰鮅𡽶斃𣦢㱸𣩩濞𤐙𥢦臂𧏻蹕𨐨𨵰䯗髀𪏺奰𢅩𣝍𤂀璧䁹𥳆䊧𧒀𧫤䟆鄨鏎饆𣋹𤻖𥴬繴𧓄襞襣鞸韠䮡魓𦤫䕗躃躄䬛驆𩪖贔鐴鷝𥷑𩪧鷩𪋜𪍪𧥑𧲜鼊𤅹 # bì (p2)
    <*边辺𢻶砭笾揙猵编𣩀煸牑甂箯編蝙𨖾𢩟𠐈獱邉鍽𨩫鳊邊鞭鯾鯿𪏗𠑟𪓍𤄺䟍𦇭籩 # biān
    <*贬𠓫扁窆匾𠪂𡬯𡬲貶𡬸惼萹𢴂碥稨褊𨖠糄𦟣鴘𡈯𤀫𦽟藊㦚䁵𥣝𥣰𪖯 # biǎn
    <*卞弁𠯴忭抃汳汴苄𨚕釆变峅㳎㳒玣便変昪㭓㺹㝸𢭥覍䒪𠷖㣐徧𣈠㴜𣸇缏䛒遍𨳲𠭹㲢𣪭閞辡䪻𩰍緶艑𨧕𧩰䡢辧辨辩㵷𤀲𤺇辫𣝜𩩯𦉙𤻶辮𪉱辯變𥍚䉸 # biàn
    <*炞 # bian
    <*𠔂灬杓标飑骉䙳髟淲㶾彪猋脿颩𩙪䁃墂幖摽滮蔈颮骠𢒯標熛膘瘭磦䅺𦠎镖飙飚儦䁭𥲦𦔗𦾑颷𣄠瀌𤂆𤐫藨謤爂臕贆鏢𠚠穮镳𩪊𦔩𨭚飆飇飈飊驃𩴩𧥍鑣䮽𩽁驫𤆀⺣ # biāo
    <*𥘤表婊裱㟽諘㠒𢅚褾錶檦𧝪㯹䔸 # biǎo
    <*𠬪俵㧼𧳀𢿏䞄𧴎𧴕鳔鰾 # biào
    <*𡘴𡙀㔡𣇢𤉤𥞲𤷗䋢𧌽䘷𩵛𡐞憋𢠳𥡁𨂅𣊶蟞𢐳𩸁鳖䳤𪂟鱉鼈𧆊虌龞 # biē
    <*別别咇𨒜䏟𡷘莂𢛎蛂𧿥𡙪䇷𩠻𠍯徶𧧸襒𤺓𧝬𩓝䭱蹩䠥𤾵𪐆𩡟𩦉 # bié
    <*瘪癟㿜 # biě
    <*㢼𢆣彆䌘 # biè
    <*𡦻汃邠𥃰𣢏玢𡧼砏𠴇宾彬梹傧斌椕𢲰滨㻞缤𣉮槟瑸豩賓賔镔儐濒濱濵虨豳䧬檳𣰨璸𧷟𨐰𨽗瀕霦繽䚔鑌䨈顮𩴱𩆱𪇕 # bīn
    <*䐔 # bǐn
    <*𡦆摈殡膑髩擯鬂殯臏𧸈髌鬓髕鬢 # bìn
    <*氞 # bin
    <*冫仌仒氷冰𢎴兵𨹗𡲍掤鋲䔊𥲂𩋒𪑰 # bīng
    <*丙𠛥邴陃怲抦秉苪𠱛昞昺柄炳饼𡇤𡖛眪窉𠒝㨀蛃𡹾摒棅禀稟鈵鉼鞆餅𩊖餠𩶁𦼹鞞𩏂䴵𣦪𡚛 # bǐng
    <*并㓈並併幷垪庰倂栤病竝偋𠊧傡寎𢔧誁𨋲𢊜䗒𩬝𢆩鮩𣰜𦡻𦿅𥖬𩮟𨆱靐 # bìng
    <*癶𤜧𠱀帗𢂍拨波癷𩧯玻剝剥哱盋砵袚𧙄钵饽啵紴缽菠袰㞈溊𦲱䝛𧲯𠺣碆鉢僠𥮯嶓撥播䃗餑𡀖𤗳𩜥𩬸鮁蹳𨭂驋𩯌鱍䭦 # bō
    <*仢𠮭伯𠧛犻肑驳帛𢺽狛瓝苩䢌侼勃𢫯𣧧胉郣𩙦亳𡋯㟑挬浡瓟㼟秡䊿袯钹铂㪍𣭷淿㶿㹀㼎㼣𤶋脖舶𦯉袹䟛博𠷺𠸳渤𦰬葧𨈩鹁㗘愽搏猼𥭖𥹸𦋉鈸鉑䬪馎僰㬍㴾煿牔𤚽箔膊艊蔔𧟱𩗀馛䭯駁𢠺𢩞𣽡𦤚𧇚䞳踣鋍镈𩗒䮀䯋𣛓𤾝𦃙𦈞䍸䗚䙏䢪䪬𩓐𩗓馞駮䳁𢣞𤗺𦤣𦼭𦽮襏豰𨍭𩃶𩣡嚗懪㩧㬧礡𥜖簙鎛餺𩷚鵓𪌰𢐾 # bó (p1)
    <*㩭𣋵犦𥴮䌟䑈𩄿𩌏髆髉欂𤃵𤒔䂍襮䰊礴𪍡䵗䥬𩟕䪇𩏯𩱚䶈𨏫鑮𪙍𩍿𩽛 # bó (p2)
    <*𥸥㝿𤿑跛箥𪓜簸𪚷 # bǒ
    <*𠴸𡯳𡯷𩈔孹檗糪譒蘗𡅂 # bò
    <*⺊萡 # bo
    <*𠚉峬庯逋钸晡𥪀鈽誧𧻷𩶉𩺼 # bū
    <*鳪𥻞轐醭 # bú
    <*卟𣱶𤣰𥃨补哺捕喸㨐䀯補㙛䋠𡡐𨴪䪔𥣌鵏䪁𩯏𩏮𩏵鸔𪇰 # bǔ
    <*不布佈吥步咘㘵㚴𢁻𢇴怖抪歨歩㳍𠜙柨𨛒钚勏埔埗悑捗𥑢荹𫐓部𫗦埠㻉𧉩瓿㾟䏽𨋞𠘁廍䊇𥹴䑰蔀𤚵䍌䝵踄𤸵郶餔𩢕篰𩊬𩊶餢䒀䬏𩣝𥳖𩷖簿𩅇䴺𩻗 # bù
    <'\uFDD0C' # INDEX C
    <*𨺭𪊗嚓擦攃䃰𤄖䌨𨆾 # cā
    <*礤礸 # cǎ
    <*𥩝遪䵽囃𥗭 # cà
    <*䞗偲婇猜䠕䟀 # cāi
    <*才𨙴㒲𢎂材𦬁财財裁𧵤䴭纔 # cái
    <*毝𤝭采倸啋寀彩㥒採𤟖䣋𤚀䐆𤷕睬跴綵䌽踩𧀊 # cǎi
    <*埰菜棌蔡縩𡣮𤁱䰂𨯓𩁞𩧇𪇭 # cài
    <*参𠫭參叄飡骖叅喰湌傪㜗嬠餐𩝖𥢽䉔𦪜䟃䱗𦪫爘𩟒驂 # cān
    <*𣦼㱚𠡡残𢦸蚕惭㥇殘䏼𢾃慚𢧮蝅䙁䝳慙㨻䣟𦺐䗝䗞𠠋𨞷𥂥𨅔𩀧𧓩𩈻䘉䳻𧅀蠶蠺 # cán
    <*𡆮惨朁䅟慘𥠩𥮾憯穇㿊篸㦧𨲱𩈼黪黲 # cǎn
    <*灿𡛝㛑掺𣶡孱𥹛粲摻𣻬儏㻮㣓澯㽩薒䛹燦璨謲𤅒𩯞𪆶 # càn
    <*仓仺伧沧苍鸧倉舱傖𠥐嵢滄獊蒼𤚬濸艙螥𦾝𩀞𩝞鶬𩕹 # cāng
    <*𡽴𡾻㵴藏𡿄欌㶓𨤃鑶 # cáng
    <*䢢䅮賶 # càng
    <*𠀊撡操糙䎭𤒕 # cāo
    <*曺𤵥曹𣈅嘈㜖嶆漕𤡐蓸𩠎𡮦𣉿槽䐬㯥𥕢䄚𦋿褿𥲍䏆艚螬𨎝鏪𩞄𩫥 # cáo
    <*艸䒑草愺𠹊懆騲 # cǎo
    <*肏鄵䒃襙 # cào
    <*⺾⺿ # cao
    <*冊册侧厕恻拺𣌧测荝敇畟側厠笧粣萗𡍫廁惻測策䇲𥬰䊂𦣧萴𧵡筞筴蓛墄㥽㨲𥠉箣𦵪𩒄憡㩍䈟𢿸𥰡𦔎簎𥳯䔴𨶨 # cè
    <*𤭢 # cèi
    <*嵾 # cēn
    <*㞥岑𦊃涔笒梣𨥣𨱼𨁊䨙䤁䅾𩅨𩅮䲋𩻛𣡎 # cén
    <*曽噌𡃆 # cēng
    <*层曾𡪠層嶒𢅋㬝𤛢𦠇䁬竲𡾓䉕𧲅驓 # céng
    <*𠟂㣒蹭 # cèng
    <*叉𨙳𡵌扠𤜫杈𤜯肞𡋨𢘹臿挿𢭅𣆗偛𠝞𤵾𠞊嗏㛼𢔣插揷馇㮑𦝥𨀸𦑈銟锸艖疀𦦘𦦜鍤餷𨪺𩝟𤳵𦦱𪘾 # chā
    <*𣱱㪯秅垞查茬茶𡝐𡝙𡨀㫅㢉䅊𦛝嵖搽猹𤶠𥥸靫槎𦳘詧察㢒碴䤩𨼑𠽹𣘤𣘻䁟𥻗𦉆𦑣𨃓𢣼檫𥌀䕓𩟔𪒼 # chá
    <*衩𥫢𡌚𥑥蹅𨩨镲鑔 # chǎ
    <*奼㣾汊岔侘诧姹差㤞紁𧠈𤞠䟕䒲詫䓭𤳅𧶵𣍏䡨𥃀𧫗𪑂𨆇𪑨𩴳䶪 # chà
    <*芆拆𥐟钗釵𩑐㼮䐤𢹓 # chāi
    <*犲侪𤞗㑪柴豺祡𤠌喍𡟭𡺵𨌅㾹䓱儕齜 # chái
    <*茝䜺 # chǎi
    <*㳗虿袃訍𦐰瘥𦑏𧪘蠆𧀱𧒨囆𧔴𧸿𧕧䘍 # chài
    <*𢌚㢟辿㚲㤐𤴿觇梴㰫𡖞𡖤𡝫搀覘𥭔裧鉆㺗鋓幨𨵍襜𠣄攙𡮿䪜𨊝𩖌 # chān
    <*㶣㢆婵谗𢽝棎湹禅䣑馋𡎻𣔵煘缠𦝟僝獑𤸦蝉誗𧨗鋋儃嬋廛潹潺緾䤫澶磛禪𨽊毚𧐲鄽镡𪏁㙻瀍蟬𧴃𪏂儳劖蟾䡲酁𩮏𪏋嚵壥巉𢥋𣤱瀺㺥𧓋𨬖䧯欃纏䜛䫮䂁纒𧾡躔镵艬𧕃𨮻𪏦𧥓讒鑱饞𩽝𪓄𪖎𪗂𪚃 # chán
    <*产刬𢁧𣃘旵丳斺𡶴浐𧈪剗谄啴𡍌㹽產産𤯥𦈎铲阐𠋷蒇𨔢剷𠹖𢱟𤚍𠁷嵼㦃摌滻𨼒嘽幝㯆㹌䐮𦸰蕆諂閳骣燀簅𨩪𠐩冁𢷹繟𨄉䥀𨪑𩝚𠑆𦆀𦢙譂𧬦辴鏟䩶𠑑𨲵闡𠑡䑎𩥮囅灛讇𨇝䤘𨷭䵐𪙞 # chǎn
    <*忏䀡硟𧠛㬄摲㙴𥊓𤗻懴𤪮颤䴼懺䠨㸥羼𤮭𤼋韂顫䱿䊲𢺟𨇦𨳂𩟶 # chàn
    <*伥昌倀娼淐猖菖阊晿椙琩䅛裮锠䗉𩲹錩閶鲳䮖𥫅鯧𪂇𪉨𨷇鼚 # chāng
    <*仧仩𢁝兏𠙁肠苌镸尝偿㙊常徜瓺萇𦰱𨱮甞腸嘗塲嫦䗅䯴㦂瑺膓䠆鋿償嚐𦼳鲿𥋤鏛𪁺𨣛𪄹鱨⻑ # cháng
    <*厂场昶㫤𡭿惝場敞𤿼僘厰廠𤢄氅鋹𥗊⺁ # chǎng
    <*𠚊怅𢗺玚畅倡𤽣鬯唱悵焻瑒𥇔𥟚暢畼𢢌𥠴誯䩨韔𧀄 # chàng
    <*蟐 # chang
    <*抄𠰉𢁾弨怊欩钞訬䫸焯𤙴超鈔勦𩖥𨴡䫿𦾱䜈䰫 # chāo
    <*牊晁巢巣朝鄛鼌𡏮𡡊𡻝漅嘲𡼼樔潮窲𦸛𥕘罺𥲀𣰩𨄓轈鼂謿 # cháo
    <*吵㶤炒䏚𦙧眧𪎊焣㷅𧧠煼䎐𩈎麨𩱈𪍑巐𩱦 # chǎo
    <*仦仯𤰬耖𦨖𡯴觘𥿷𨌬𨗡𨨚𨢪𪍈 # chào
    <*车伡車俥砗唓𡷖莗𤥭硨蛼𩒷⻋ # chē
    <*𧙝 # ché
    <*扯偖㨋䞣撦䋲㵔䰩𩴟𦓍 # chě
    <*屮𢇛彻坼𦈈迠𤖷𨹡㤴㳧烢㿭㔭㥉𣨊𥿊聅𦛖掣㾝硩𢊏𤊿𤗙𨀠𩎚頙徹撤澈𥯥䛸𩂻㬚𤕛𤹞䁤䚢𧼳䧪𩗙𪎺勶瞮䒆㒤爡䜠 # chè
    <*抻𤝚䑣𥞁郴捵𤟸琛䀼䠳𨻖𩇖嗔𦁄㥲綝𦁟䐜𨼌𤡳瞋諃賝縝𧡬謓𣞟𩅌 # chēn
    <*尘臣㕴𢆺忱沈沉辰陈𤘣迧㽸茞䢻宸𥫹䒞莀莐䣅陳敐晨㫳訦谌軙愖揨䆣䟢鈂䤟㴴煁蔯䢅塵樄瘎𧨡𨼤𤹛𥉜霃螴諶𣀍薼𪁏麎曟䢈䜟𨑌鷐 # chén
    <*趻𧿒硶碜墋𥔪夦磣踸䫈鍖贂醦䫖𨣔 # chěn
    <*衬疢㧱龀𠋆趁趂榇𨼐齓齔儭𢎕嚫谶櫬𥗒襯𧭼䞋讖𧆂 # chèn
    <*阷㓌泟柽爯䟓棦浾琤称𩁷偁𦓬蛏㛵𣥺湞牚䟫赪僜憆摚稱䗀䞓靗𠏧撐撑緽𩠏𡽊橕瞠赬頳檉竀罉穪蟶𧯒䕝鏳鏿鐣𨭃饓𩞦 # chēng
    <*丞成朾呈䆑㞼承枨诚郕乗城娍宬峸洆荿𨹚乘𠳽埕𡝚挰晟珹脀𠕠掁珵𤿣碀𥥱窚脭𧹓铖䧕堘惩𢻓棖椉㲂𤗓㼩䄇程筬絾裎𩨆塍塖𢾊溗䇸䚘誠𩫹畻䁎𧶔𨁎𨞐酲鋮𢐞憕澂澄𨌤𢿦𢿧橙檙䫆𣀏𥢲䆵鯎瀓𦦢𪁋懲𨅝𩤙騬𩙆䮪𩯎𤆁 # chéng
    <*侱徎悜逞骋庱𢜻𢜼𣥻睈𢟊騁 # chěng
    <*𡤿㐼秤𢔤𧡈𩛦𧶸𧷒𤕀 # chèng
    <*吃妛㰞侙𥄇𨒬哧彨𫄨𦐉胵蚩鸱瓻眵笞粚喫䇪訵嗤媸摛㺈痴𥭘絺䧝𡼁𣣷𤡢𦞲噄㷰瞝誺𧩚螭𧩴𩶅鴟𧪡鵄䜉𧴁𩤖𪌹癡魑齝攡𦆤彲黐 # chī
    <*弛池𣲋驰𡉪㞴𢓎迟坻岻㢮茌持竾𦐁荎𡌞歭𤈔𧺏𢔊蚳赿𩚉𡎍筂𦱰貾遅䪧㙜𣉄㮛𣹡𦳚𦵟𧋗趍遟馳箎墀漦𦑡𧛺踟遲篪𧎨䮈䙙謘䞾𨨲𪌫𡂙䜄䶔𨘾𪏐𧭟䶵 # chí
    <*尺叺𨑠𠛔呎肔侈卶𦙆齿垑㢁胣𠭋恥㶴𤵬䊼耻蚇𧉀𠝨㢋𤟆䑛袳𧰲欼歯𥚚袲䜵𨾛𡖳裭㱀𧛧𨖎鉹褫𩒐齒䜻𩳲𢇕𡳭𧀤㘜⻭⻮ # chǐ
    <*彳叱𠮟𡚨斥𦘪𠧚杘灻𤆍赤饬㞿抶𣐃𤰠勅𢂝㡿恜炽㽚𦏿𦤸勑𠧵翄翅𪉄敕烾痓𧺠𧺧𪉅啻㥡𢜳湁䀸硳𧺿𨔤飭傺㓼𠞩痸腟跮鉓雴𩾕㒆𠻟憏𤡏瘈𦎚翤䟷遫銐𫛶𪉗慗𣙰瘛𤸪𥛚𦂋翨䤲䰡𡣀𢨒𣚩熾𦥊𧤍𧩼𧼪𨂰𨧳𨨬𩿪𥱻𪀦懘𣤩趩䠠𩷧㔑饎鶒𩥲䳵鷘𪅍𪅙𦔫䮻𪆵 # chì
    <*麶 # chi
    <*充冲忡沖㤝㳘䆔茺浺珫𥫯翀𠝤舂𥁵䘪𨈮𨤩𥭥𠟍嘃摏徸憃憧𦟛衝𧩃𩬤䂌䆹罿𧐍𧝎𪎽艟𧘂蹖䝑䡴𢥞𩥫𪄻𪅈𪅖𨳁𪒒𩰀 # chōng
    <*虫䖝𣐯𨛱崇崈隀𢝈㓽褈㹐緟蝩𢖄𩜖蟲𩞉𩞋𩌨䳯𡿂爞䌬 # chóng
    <*宠埫𢛒𦑝𧼙𩒘𨿿𠖥寵 # chǒng
    <*㧤𣑁𥅻铳揰𥬱㮔銃𢡹𨖼𧼩𩩳𠑙 # chòng
    <*𥃧抽𢭆婤𠌪𥬠䌷䀺搊㨨㮲𥺣𨡑瘳篘𥰞𥻤𨡲犨𥵬犫 # chōu
    <*仇怞㐜俦帱㤽栦𦭸𠝽𡕪惆𣪐𥏈紬绸菗𠷎椆畴𤽯絒𠹝愁𣕾皗稠筹䓓裯酧酬𠼡𤾊綢踌𠾉𥡀𧮻𩾂儔㵞𨞪雔嚋嬦幬懤𤳝𤳠𤾦𥲅薵㦞𣀓𣫐燽𦡴𨤷雠疇㿧籌䌧躊醻𡕐讎讐䲖𪇘𩽀 # chóu
    <*丑丒吜𠜋杻杽𤘶侴𥄨偢𨀔瞅𢣊醜𩋄矁𩌄䪮𧃝魗 # chǒu
    <*臭𥦅臰遚殠𨖬䔏 # chòu
    <*出岀初𠰕䢺𤙟䝙𠁉㗙摴𩨸樗𠿝貙𪁲齣𩙙 # chū
    <*刍㛀除芻䟞厨滁䎝蒢豠锄㕏媰𢊍耡蒭蜍趎鉏雏㕑犓𦷝蕏㡡廚䅳篨䠂鋤橱𣦠𩿿𢅥𣦡幮櫉𦿀藸蟵躇雛櫥蹰䠧鶵䊰躕𪆷 # chú
    <*処𠧖杵础椘䖏储楮楚褚𢕓𩂫𨼪濋𧎷儲檚璴䙘𤻇礎𪓐齭鸀齼 # chǔ
    <*亍处𠇘㔘𢨫竌怵㤕拀𤝞绌豖柷欪竐𧢶俶𡝈敊𣢶畜𧰫埱㙇𢒔珿絀處䜴䦌傗𣥹琡𥁯𥒭䇍𧺶䟣鄐搐滀㾥𥹵䎌䐍蓫触𨕢𡐌𧯩踀閦儊嘼𡳑諔𨁿𨴰憷𤏱𦺵𩈤斶歜臅𨃕黜𢣿𧽧觸𧃏𩹱矗𪇆 # chù
    <*榋橻 # chu
    <*欻㔍歘𤁫䊬䵵 # chuā
    <*𠹐𣹶𠻦𣛕 # chuǎ
    <*䫄 # chuà
    <*揣搋𢲽 # chuāi
    <*㪓膗 # chuái
    <*𣲂㪜 # chuǎi
    <*啜嘬𠽶𣤌䦷膪踹䦤𨣅䴝 # chuài
    <*巛川𠯀𠛖氚穿剶猭𩂍瑏𠾮𨩴 # chuān
    <*传𤜼舡舩船圌遄傳椽㼷暷㯌𤰌篅𤮍䁣輲𣛹𨘼 # chuán
    <*舛㱛𣧒荈喘𥬫歂僢𧍒踳 # chuǎn
    <*汌串玔𥃹钏釧𤶱𦎇𦎜賗𦺛𨂦𥲏𣀔𧑝鶨 # chuàn
    <*刅𡆪疮窓窗牎摐䆫牕瘡䄝𥡟窻𧜧𥎒𥲡𧢆 # chuāng
    <*床牀𠳹㡖噇幢𨧖𩃕䃥𦔛𪁱䚒𩞆𧬧䭚𩪘 # chuáng
    <*闯傸𠞮𡻯摤𠏨㼽磢闖 # chuǎng
    <*创怆刱剏剙凔創𨜾愴𥈄䎫 # chuàng
    <*吹炊𤙵龡 # chuī
    <*𠄒㝽垂𢏒倕埀陲捶菙𡍮搥𣇦棰椎腄槌锤箠䍋𦉈錘鎚顀𩗰𩭦𩌝 # chuí
    <*㷃䞼 # chuǐ
    <*𥙋𥞃𣟈 # chuì
    <*𡉐旾杶春䡅萅堾媋暙椿槆瑃箺蝽橁𣚆䞺𨉩輴𧇶櫄鰆䲠鶞𪂹𣌚 # chūn
    <*𡗥㸪𤘛纯陙唇浱純莼䣨淳脣䣩㝄𣮢湻犉滣䓐蒓鹑漘蓴𣘣𦎧醇㝇㵮醕錞䫃䔚䥎鯙鶉𣌠 # chún
    <*䏛𦚧偆㖺萶𩨁惷𢾎䐏㿤睶賰䞐䦮䮞蠢 # chǔn
    <*逴踔戳㪬𨮸𨰆 # chuō
    <*⻌⻍辵𨒢㲋娕娖婼惙涰绰㚟𢽸𤿫䋘腏辍𥓑䓎酫綽𦁶趠輟龊擉𢿭磭𡁇𩩟繛歠嚽𨆬齪𪘛鑡𩟫⻎ # chuò
    <*𡰾呲𢫴𨒮疵𦍧趀偨𧠥跐𩨨縒骴𦑺𦒁𣜁髊𡃸蠀齹 # cī
    <*𠯂词𡥎珁㓨垐㘹㞖柌𣐑祠茈茨堲瓷䂣𧙈㤵𥿆䧳𪉈詞䛐辝𨠐慈甆辞磁雌䨏鹚䈘糍辤飺餈㘂嬨𢶴濨薋䲿䳄𩝐鴜礠𥴺𠤫辭鶿鷀𩆂𩉋䭣 # cí
    <*此佌𢓗𨒤泚玼皉𦐨𧺼𦐾𩢑𦼡鮆 # cǐ
    <*𠦐朿次伺𠩆佽刺刾𣢕庛㢀茦栨𨾅莿𧠎絘𥿴蛓𧊒赐𧧒𨋰𩾔𦖝䓧𧌐𨲁螆賜𢅜䯸㩞䳐𧑖䗹𪉪𪑟䰍 # cì
    <*匆囪囱㞱苁𨑪𨑹忩枞𪻐茐怱𫓩悤𡟟𡹸𢔩㥖棇焧䐋葱𤧚𦝰𨱸㜡𢊕𢐔漗𥍷聡䓗蓯蔥骢暰樅樬熜瑽璁䈡緫聦聪䐫䗓䢨𨦱瞛𥎋𥡬𨂴𨍉𨡮𩬼篵聰𦗜蟌鍯繱䡯𨲧鏦騘𦇎驄 # cōng
    <*从丛𠕁𠂥𠤰𣃗𠙂𡵷𨒀従婃孮𢃏徖從悰淙琮𠢛㗰慒漎潀潨誴賨賩𣊷樷㼻藂𧐱叢䉘𥵫𧓏𡅇灇𤄓𡦷欉爜𩯍䳷𦇱䕺 # cóng
    <*𧝮 # cǒng
    <*憁𥮨𧩪謥 # còng
    <*𢈾 # cōu
    <*𧡣 # cóu
    <*𤆑凑湊𣉅腠𦳿辏𣙘𦦅𦺀𧱪輳𨨯𣞜𩹀𪉮 # còu
    <*𡘛𡝉𤿚𥅗粗觕𧺲麁麄麤𧆓 # cū
    <*徂殂䢐𦯣䣯 # cú
    <*𤛏 # cǔ
    <*𠛙𢪃促𢈠𥾛𤗁猝脨媨𡞜䟟酢瘄㗤𢄧𤠽𦈚蔟誎䛤趗噈憱𥻒𦟠𦠁𧼜踧醋瘯䃚𥪱簇縬蹙䠞䥄鼀蹴蹵𪓡䥘顣𪕝𪚯𡄱𪓰𠑯䙯𥷼 # cù
    <*汆𥍬撺鋑镩蹿攛躥鑹 # cuān
    <*㠝𢖑櫕巑𨣵欑穳 # cuán
    <*窜𨼉殩熶篡簒𤐲竄𢸥𥎢𥎣㸑爨𥎤 # cuàn
    <*崔催凗缞𨻵墔㜠嶉𢕘慛摧榱獕槯𤗯𤛍磪縗䙑𧼬䄟𥼂𧽠𨄍鏙 # cuī
    <*漼𣯧㵏璀𧳚趡䧽𨿐𢶓𣿒𣿓皠䊫𥼺 # cuǐ
    <*伜忰㳃𢂕疩倅𠗚𠩪粋紣翆脃脆啐啛悴淬萃㱖毳焠脺𠞿瘁䃀𧚥𠟓㷪粹綷翠㝮𢄸𢡈𤎋膵𧎃㯔㯜𥻮膬𧜱濢竁𥨒襊顇𣃍𣰚𥳈𥼛臎𦦣𧑎𩤏𧹺𨅎𨊉䆊 # cuì
    <*乼 # cui
    <*𨙯邨村皴𧚉䞭踆澊竴膥 # cūn
    <*存侟𨚲拵𨀛𤿄 # cún
    <*刌忖 # cǔn
    <*寸吋籿䍎 # cùn
    <*𣨎搓𤠝瑳𥭭遳磋撮𥰭蹉醝𢤎𩯉𪒙 # cuō
    <*𠦏㭫虘嵯嵳痤睉矬蒫𣖵𣩈蔖䣜㽨㿷䑘鹾䠡酂𩄝䰈鹺䴾𨇃𪘓躦 # cuó
    <*脞䂳 # cuǒ
    <*剉𨛏剒厝夎㟇𢒐𢚂挫莝莡措逪𢯽斮棤𧚏锉蓌错𥕉銼錯䱜 # cuò
    <'\uFDD0D' # INDEX D
    <*𡉑咑耷荅笚𠞈嗒𡍲搭𠹥𦈘䐛𦞂㿴褡噠㙮𡐿撘𨱏䌋𦖿𨨹鎝𦗧𩝣䪚 # dā
    <*达迏迖迚呾妲怛𢘇沓哒炟𤝰羍𦬹荙𠉤畗𩠅剳匒𢛁畣㾑㿯笪逹𢝉𣸉答詚達𡈐㜓跶阘𤨑靼㩉𥉌𦂀𦑻薘鞑燵䵣䃮蟽鎉𩣯𩭣𦪭躂𩏒鐽韃𩟐龖龘 # dá
    <*打𥕇 # dǎ
    <*大亣𡚻汏𤤊眔𠶫𢽇𣥾𣣴𨗾 # dà
    <*垯㟷瘩墶繨 # da
    <*呆呔𠯪𣐮獃懛𦪍 # dāi
    <*歹𣦶逮傣䚞䚟⺞ # dǎi
    <*代㐲𠯈㞭㶡轪侢𠰺垈岱帒甙𤮼绐迨骀𡧹带待怠柋殆玳𦙯贷帯𢎌軑𨓞𨟲埭帶紿𥿝䒫蚮𧊇袋軚𨊺𠷂𣇨㻖貸軩𢄔𣫹瑇𨥶廗𤸊䈆䲦叇曃㯂緿𪐝𩃠鴏戴𦄂艜𨽿𩃷黛簤𧑔蹛瀻霴襶黱靆 # dài
    <*鮘 # dai
    <*丹妉𡵕𣲥单担𣅟単眈砃𡖓𢑝耼耽䒟郸𢉑聃𧴸躭㐤單媅殚鿕𠹆㴷瘅𩈊匰箪褝鄲頕儋勯㠆擔殫䐷𧡪甔癉襌𠆛䄡簞𦅼聸𧀻𨢿𩏥 # dān
    <*伔𠇋刐㕪抌𢻼玬瓭𥄦𥐹胆衴疸紞掸赕亶𤲭撢撣𡦨𢋃澸𤢏黕𥱷膽𦽫𤺺䃫𥳹䉞黮𪆻 # dǎn
    <*𢎪旦𠆶但帎㡺沊泹狚诞𠈰柦疍啖啗弹惮𣇇𣱍淡萏蛋啿弾氮腅蜑觛㗖窞誕𩈉僤噉𦋪馾髧嘾彈憚𢅒憺㲷澹禫蓞𦻁䩥駳鴠䳉𣋊𣛱𥨎𥲄𥲇𦽜𦾩䨢𩄕𩩧𤁡癚𥳸嚪繵贉𧂄霮饏𧭃𩅾䭛𩕤䨵𪒾 # dàn
    <*𡰨当珰裆铛筜當噹澢𤢎𤔶𤗾璫𦼲㼕㽆𥢷襠簹𦗴艡蟷𨎴鐺𩟈𩼉𪇁 # dāng
    <*挡党䣊谠𣺼𣗋擋譡黨𡗍攩灙𤣞䣣欓𧅗𥤗讜𩽳 # dǎng
    <*氹凼圵𡇈宕砀垱荡档𡇵菪婸愓瓽逿嵣𣂳𨝦䦒雼𣻍潒碭儅𡢈𢠽𢡂瞊𥯕䑗蕩趤壋𣃉檔璗盪𡾕礑簜𦿆𧑘蘯闣𥸈𨷾 # dàng
    <*刀⺈叨忉𣱼朷氘舠釖鱽魛𦩍𩕯⺉ # dāo
    <*捯 # dáo
    <*导岛陦島捣𢭏祷禂搗隝嶋嶌㠀㨶槝導𤹷隯壔嶹擣蹈𠐵禱㿒𦦺𦦾 # dǎo
    <*到䧂𤓾倒𣁍𦒺𠴼悼焘盗菿椡盜道𨱦𤷘𥓬𥺅稲箌翢噵稻艔衜𧼤𩈞𨗓檤衟𩬱燾𤘀䆃𩭟𣫜𡄒䊭䌦翿𥗚軇瓙纛 # dào
    <*嘚 # dē
    <*㝵𡋩恴㤫䙷䙸得淂悳惪㥁棏𣮊𣮰𤷙锝𡭂徳德𨁽𠮊㯖鍀𣌏 # dé
    <*地的𠵨脦 # de
    <*扥扽㩐 # dèn
    <*灯登豋㔁𤼶噔嬁㲪燈璒𤺌竳𪔏𤮘簦艠䔲䙞覴𧾊蹬𨶿𩯇䳾 # dēng
    <*朩䒭等戥𤾢𪌷 # děng
    <*邓𢯭凳𡦔鄧隥墱嶝𦩫𢿤𣩟瞪磴镫櫈𨄇𨎤鐙𩞬𩍐𪑬䠬𨮴䮴𧄼𪒘 # dèng
    <*氐仾低𣲢奃𡛜彽𣅥㫝𤞈𥾬䍕袛㓳啲埞𥿄羝䧑隄堤趆𠍪䃅䐎𩉱滴𩑾𠽰𡰖𣚌镝磾鍉鞮𡄷 # dī
    <*𠕳廸狄㣙籴𦉹苖迪唙敌涤荻梑𤈥笛觌靮滌馰髢嘀嫡𢕚翟𦵦蔋蔐頔敵𣂉樀㹍𥕐篴䨀𠒿嚁𡽢藡䨤䯼䵠𡒱𤁰豴蹢鬄𩭲𩷎㰅鏑𥖾䊮糴覿𪄱𨮹𩴺鸐䴞𥸚 # dí
    <*𠨿厎坘诋邸阺呧底弤抵拞𤝬㪆柢牴䢑砥䂡掋菧䣌㭽觝詆軧聜骶𨂇𨌮䏄𧤲鯳 # dǐ
    <*𠚭𠫜𡚷㢩坔弟旳杕玓𨑩𨑼怟枤𣬴俤帝𢓧埊娣𤬵䏑𧉛递逓偙啇𢉆梊焍珶眱祶第𦨢菂谛釱媂棣渧睇䀿缔䑭蒂𧺽僀𠥖𤧛禘腣䑯𧋍遞鉪䩘墑墬摕㼵碲蔕蝃遰䩚𢅊慸𣯵甋締䗖𧍝嶳諦踶𨗼𠐑𤾠螮𥳠𨘬𨪾𡚙𧀶𧂨䶍 # dì
    <*𢖩甸𡱇敁𠶧掂𦕒傎厧嵮滇𤠶𩨋槇槙瘨𩬑颠𧽍蹎𩄠巅顚顛𪖚𩥄𠑘𠫉癫巓巔攧𣪀𧄺癲齻𨈀𪓼 # diān
    <*典奌点𠩷𢻅𦒻婰𣇖猠䍄敟椣跕𤿶碘蒧𥮏䓦蕇踮㸃點嚸 # diǎn
    <*电佃㓠阽坫店𣧛垫扂𣢥玷𥅑钿婝惦𣒂淀𥑼奠𣣈琔𣣣殿𣪪㼭𥇞𥦟蜔電𠢣墊㝪𩂵㞟𡼓𢕯𧍿壂𢅝橂橝澱靛𤩱𥢏𦽄癜簟𥳢𦅆𥵏𩅀㶘𪑩𩆔驔 # diàn
    <*刁𠚥𨸓𠚻叼汈刟㢯㹦虭𧘨𧘩凋䂏䘟𠶰奝弴彫𦨣蛁琱貂碉鳭𩾗㚋𥮐𦶌殦𦸔瞗雕鮉鲷䳂簓𩀜鼦鯛鵰 # diāo
    <*𠄏𢆴𢁕扚䄪屌𢄦𧜣䉆𦄋 # diǎo
    <*弔伄吊钓𠤼𤕷窎𥾯訋调掉𤭈𤱩𦰏釣铞铫𠥑㪕𥁮鈟䂽竨蓧銱雿魡調㒛瘹窵鋽𥲟䔙藋𩈮𩋙𣩰鑃𧅈𨰑 # diào
    <*爹跌嗲㦅䪓褺 # diē
    <*𣧈苵迭㑙𡇓垤峌𢎆恎挕昳绖胅𨸅𠗛𠲷𡱷㦶𣨂㲳瓞眣𥑇耊𨓊𠗨戜䏲谍喋堞𡹭𡺑幉㥈惵揲㫼𣈍𤚊畳絰耋臷詄趃镻𨻗叠殜牃牒𨳺𨾤嵽𡼄𢲼𤖒𥈖碟𦁜蜨褋𨴗𤗨艓蝶𧍱𢶣㷸疂𥉺諜蹀䳀𣛻𦄔𩋞鲽𪀒䞇䠟𨄌䫕曡㬪疉𨭓鰈𪑧𡅥疊𥶺𥷕𩻵𠠯㩸㩹𣡟氎㲲𤴍𦈅𨈈𨐁䴑 # dié
    <*𡖐 # diě
    <*哋𠅗眰𠆙 # diè
    <*𨈖 # dìn
    <*丁仃叮帄㣔䦺玎疔盯钉耵𦨍虰酊釘靪𩡯𧳉𩾚𧌾 # dīng
    <*奵顶𣆍頂𩠑㫀鼎𪔂嵿㴿鼑濎𤛙薡𤐣𧇷𢑅鐤 # dǐng
    <*订忊饤㝎矴定𥸧訂𣢳飣啶萣铤𩠆椗腚𥇓碇锭碠聢𦩘蝊鋌𥯢錠𩜦磸顁𥳰𩸎 # dìng
    <*丟丢𠲍𢒝铥銩 # diū
    <*东冬咚㚵岽東苳昸氡𤤮倲鸫埬娻崠崬𢔅𢛔涷笗菄徚氭𤦪𧲴𤲚𤷆𩂓䍶蝀𧼓𨿢𩜍鮗鴤𧯾𨩧𩣳䰤鼕鯟鶇𧓕鶫 # dōng
    <*䂢㖦㨂董墥嬞懂箽蕫諌𧳣𣿅𦡂𥳘䵔𪐈𧄓 # dǒng
    <*动㑈冻侗㓊垌姛峒㢥恫挏栋洞胨迵𩧲凍戙胴動硐棟湩絧腖働㼯䞒𢳾𧡍𩐤駧𠄉霘𩭩𧽿𩐵𥫎𪔦 # dòng
    <*吺𤝈𠱑唗都兜兠𥆖𧯠𧯤𠍄𣂮㨮𤾒蔸𨁋𠾇𣘛𥉝𩳈橷篼𦄓𧡸𦆘𩔡𩮷 # dōu
    <*乧𢦍阧㞳抖枓𣭗𧘞陡唞𣁵蚪㪷鈄𨥪𩑯𪌉𧏆 # dǒu
    <*斗豆郖𨹜㛒㢄浢𤞟荳逗饾鬥梪毭脰𧯞酘痘䄈𥥷閗𡟳窦䇺𥺉䬦𡙬䛠𧱓𨴜鬦餖𩊪斣𤀨𪐺𡂛𡂝𨪐闘䕆𨶜竇鬪𤅋鬭鬬𡆏𧮡 # dòu
    <*厾𡰪𦘴𦙋剢𠣰㞘阇𤫻𧰵嘟督醏𦺥䦠闍𣫔𥳉䩲𧷿𧞹 # dū
    <*毒独𠉩涜㾄𥑯读渎㸿𢝂椟㱩牍犊𤚚𥓍碡裻𧛔読䓯蝳獨𦺇𨂭𨍛錖凟𠠔匵𨽍𠠠嬻𢷺瀆𧐰櫝殰𣰬牘犢瓄𦏕䢱皾𥀲𥖿𦌷𧁿騳黩𩞾讀豄贕𧾥䪅韣䫳髑鑟䮷韇韥𪍹𩧈䙱黷讟 # dú
    <*笃堵帾𦛯琽䀾𥓇赌𢾀𤬂睹䈞覩賭篤 # dǔ
    <*芏妒杜𣧃肚妬𤬪𤴱𥃾𥝟度𤵊𡝜𥝾荰𧉓秺𨋈㓃𡍨𡎉𢉜渡𤶮靯𢾅𣨲𤚡𦳔𧋌𥀁䟻镀𩵚䲧𥯖𪐞𦡄螙殬𥲗鍍𥳲𧑠𩩮蠧𧔬蠹 # dù
    <*耑偳剬媏㟨𥠄端褍𧤗鍴𦾸𩤚𥵣 # duān
    <*𢭃短𧶲𢷖𣠭 # duǎn
    <*段𠡱断𨱚𨺣塅𢯫缎葮椴㱭煅瑖腶㫁碫锻緞毈簖鍛斷𩏇𩤣䠪躖籪 # duàn
    <*𠂤𠦗䂙垖𡜥𤤷堆𢈹𥑵塠𡏩嵟𢟋痽𤷎𧧆磓𩈜𩨽𤹵鴭𪌤䜃䭔鐜 # duī
    <*𠡒㨃𦞱𡑈頧 # duǐ
    <*队对兊兌兑𠫨対㳔祋𨹅𠜑𡷋怼㙂㟋陮隊碓䇏𥹲綐對𦶏𡼻憞𠏮憝𩊭䬈𡁨㠚濧薱𩄮镦懟㬣𣝉𦡷瀩譈𩅆䯟襨鐓𩅥𩅲𩈁𤄛𤮩譵𩐌䨴𪒛𪒡䨺 # duì
    <*吨惇敦𤭞蜳墩墪𡼖撴獤噸撉橔犜𥂦礅䃦𦼿𧝗䔻蹲蹾𩞤䪃驐 # dūn
    <*𣎴盹趸𧿗躉 # dǔn
    <*伅𡆰囤庉沌炖盾砘𥫬逇钝𢬼𥫱顿䤜𤟢𦰭遁𨔡鈍楯𥭒頓𣗁碷遯𠎻潡𣚪燉踲𣞇𦪔𩔂 # dùn
    <*多夛咄哆畓𧢵剟㙍𡌭崜掇𦍦敠敪毲裰𢳽𩢎嚉 # duō
    <*夺𪞝㣞𢼠铎剫敓敚喥𢜬痥鈬𩑒𨀟奪凙𤢕𧩧踱𨍏䐾鮵𪃒鐸𩍜 # duó
    <*朵朶𠛫𨹃哚垛垜㛊𡶲挅挆埵缍𧙤㖼㙐𡺇㥩㻔𥿰䒳𧊱椯趓躱躲綞𦖋䤪𨦃𤛛𨉡𨲉䫂亸鍺𩃒𩬻䙤䠤軃嚲𪘉奲䯬 # duǒ
    <*刴剁陊陏饳㛆尮柁柮𣑧桗𣧷𤤸堕𣵺𣵻𤬾𥞛舵䑨惰𤋨𤌃䅜𧧇跢跥跺䩔飿墮嶞憜㻧墯𢿎䙃𩊜𩎫𧱫䤻𡓉𥳔鵽𨆅𨬍𡓷䲊 # duò
    <*𦕰 # duo
    <'\uFDD0E' # INDEX E
    <*妸妿𠥍娿婀屙𡹣𥑺痾䋪 # ē
    <*讹吪囮迗俄𨱂娥峨峩涐莪珴𧢽訛𧿕𠷸皒睋䄉𧚄鈋锇鹅蛾䖸磀誐頟额魤𩣣㼂𩋽額鵝鵞䳗䳘䕏𧒎譌𧽶䩹𩤩𨶯䱮𡅅𩑁鰪𧔼 # é
    <*枙𣄰砈𧙃頋噁𣘨𨵌𩒰騀鵈 # ě
    <*厄𡴯𣦵屵戹歺岋阨呃扼苊阸𨸷呝𠰜㧖砐轭咢咹𠱥𠱫垩姶峉𢼚𣢛䆓匎恶砨𦛅䑥蚅饿偔㓵卾堊悪硆𥑾𦊪谔軛鄂阏𨺨㔩𠥕㖾㗁堮崿㟧𢃲惡愕湂㷈𥓈䑪萼𧊜𧠞豟䝈軶遌遏鈪𩽹廅㣂搤搹㮙琧腭詻䛖䞩𩉴𩚬僫𡪑𡪗蝁𧌄𧨟锷𩨮魥鹗𠥜㠋㦍𤡾𤭼𤸱𥔲𥯳蕚𧍬𧼎𨂁𨌧遻䣞𨤕𩊢頞颚餓噩擜𤎣覨諤𨃃閼餩𡀾𤪄鍔𩋊𩐰鳄 # è (p1)
    <*𪀝歞𥋙𩇠顎𡾙𤂷礘𩸇𩸋𩸖櫮𣤲鰐鶚䳬𢨡𪘊𡅡𧭪𩕟𩪤𪘐㩵讍𩕬𪅴齃鑩𩖀齶䫷鱷𪙯 # è (p2)
    <*诶誒 # éi
    <*奀恩𤇯𤫹𡟯蒽煾 # ēn
    <*𡵖峎𡷐䅰 # ěn
    <*摁䬶䭓䭡 # èn
    <*鞥 # ēng
    <*儿而児侕兒陑㖇峏㧫洏𤽓䎟䎠荋栭胹唲𥅡𦓓袻鸸粫𦓔聏輀𡦕䋩鲕𣩚隭髵𩰴鮞鴯䮘𨎪𩱊轜𪕨 # ér
    <*厼尒尓尔耳㚷迩洱饵栮毦珥铒㢽䋙䌺𩚪爾𧌣餌𢀪駬薾邇𦗼𪕔趰𩱓 # ěr
    <*二𠚧弍弐佴刵咡㛅贰𣧹䏪䎶貮衈貳誀䣵㒃鉺𢄽𦖢樲𪐰 # èr
    <'\uFDD0F' # INDEX F
    <*发沷発𤿓發彂醱 # fā
    <*乏伐姂㕹垡㘺浌疺䇅罚茷阀栰𤇰砝𥩱笩傠筏𠞵𨀳𨋺䣹瞂罰閥罸橃藅𦪑 # fá
    <*佱法𤣹𥎰䂲鍅灋 # fǎ
    <*珐㛲琺髪蕟髮𧬋 # fà
    <*𠲎 # fa
    <*帆忛訉番𧦟勫噃嬏幡憣蕃旙旛繙翻𦪖藩轓颿𤄫籓䪛飜鱕 # fān
    <*凡凢凣𨙮㠶匥杋柉矾籵𥸨钒舤烦䀟舧笲𥿋𦊻棥渢𦨲𧊾𣔶煩䋣䋦䭵緐墦樊㺕𩨏𢶃橎燔璠𥻫膰薠𥢌繁䌓襎𨟄𢐲䉒䊩𥼞羳𧀭蹯瀪瀿㸋礬蘩𨆌鐇鐢蠜䪤䕰𧢜䮳鷭䫶𩧅𪖇 # fán
    <*反払仮𢗰返㽹䛀䡊釩𦜒 # fǎn
    <*𠆩氾犯㕨奿汎𢇪㤆泛饭𡗹𡜀𡶉𣳜𤬨𥃵范贩畈㼝䀀𥅒軓婏梵㴀盕笵𥹇䒦𧉤販㛯𤭍軬䣲𨠒飯飰𩡫𩨩滼䐪嬎範𧍙𠒾𡁈䉊𧁉𡤎𤄑㶗 # fàn
    <*匚方邡坊汸芳枋牥䄱钫淓𥫳蚄鈁𩇴𩲌錺鴋𪕃 # fāng
    <*防妨㤃房肪埅鲂魴𩗧𩷸鰟 # fáng
    <*仿访㑂㕫彷㧍纺昉昘瓬䢍眆倣旊紡舫訪𣄅髣䲱㯐鶭 # fǎng
    <*放趽𨾔 # fàng
    <*堏 # fang
    <*飞妃非飛啡婓婔渄绯菲𩇫扉暃㫵猆𦱷靟𥇖裶𩙲緋蜚𢑮𨵈霏鲱餥馡騑騛𪁹䩁𩹉𩦎飝⻜ # fēi
    <*肥淝腓𩇯𤷂𥭬䈈蜰蟦𩇽𧓖 # féi
    <*朏𣍧胐匪诽奜悱䨽斐棐㥱𥟍𦈗𢾺榧翡𧍃𥠶蕜誹𠏿篚𦃄䕁𩄼𧕒𧕿 # fěi
    <*㔗吠芾废𢒍杮沸狒肺昲胇费俷剕厞疿𥄱䑔陫𡌦屝萉䨾廃㹃𧚆䛍費𨻃𩇮痱𢳁𫂈𧌘镄𠮆廢㩌㵒䠊𩵥曊𣙿𤼺䤵癈𤺕𧝇鼣濷䒈𧑈䰁𩰾櫠䚨鯡𪂏鐨𥝊䉬䕠𩱎䆏𩯃𩆦𥝋靅 # fèi
    <*分𢁤吩帉㤋纷芬昐𣬩氛哛竕衯兺紛翂𦐈兝棻訜𧿚躮酚鈖𨳣雰𣱦𤔟𩡷𩢈㬟朆𣯻餴饙𨷒𩰟 # fēn
    <*坟妢岎汾𠛸朌枌炃㸮𦍏肦羒蚠蚡梤𦍪𦰛𧮱棼𣸣焚㷊蒶𩉵馚隫墳幩𢊱𢴢濆蕡魵𩿈橨燌燓𦦑豮𧷐鼢𥳡羵鼖豶轒𨎾鐼䩿馩䴅黂 # fén
    <*𡨖𢚅粉𠵮㥹𦶚黺 # fěn
    <*份弅𡊄𡊅奋忿𤘝𤰪秎偾愤粪𢧝𥹻僨𠻫憤奮㱵𤖘𤗸𥂙膹𨤘糞𨤚鲼㿎𢅯𩸂𢹔瀵𥽒鱝 # fèn
    <*丰风仹㐽凨凬妦𡵞沣沨凮枫封疯盽砜風㛔𡨛峯峰𢓱䒠偑桻烽𤖀琒𦜁𧥹𨺢㜂崶猦䀱葑锋楓犎蜂𩉧瘋碸僼篈鄷鋒𩊩檒𨩥闏豐鎽鏠𥽈㒥酆𩘵寷㠦灃蘴霻蠭𥷜𩙐𧾳靊飌𧆉麷𩙣⻛ # fēng
    <*冯夆䏎捀浲逢堸溄𥍮馮摓漨綘艂㦀𨝭𥛝𧍯㵯䙜𨲫䩼 # féng
    <*𢇫覂唪䟪諷𩋮𪐃𦧁 # fěng
    <*凤讽奉𠣡甮俸湗焨煈缝赗鳯㡝鳳鴌𣿝𥊒縫賵𩐯𩪌 # fèng
    <*覅 # fiào
    <*仏坲梻𧼴𧥚 # fó
    <*𤊻 # fōu
    <*紑𧉈裦 # fóu
    <*缶否妚𡜊𨛔缹缻𤽦殕𧊦雬𩂆鴀 # fǒu
    <*夫伕邞呋妋𢗲姇𤆮玞肤㕊怤柎𥄓砆䃿䄮荂衭𫓧垺娐尃荴旉㭪㲗𤙤紨趺麸痡𥒫稃跗鈇𩽺𡏪筟綒𦖀䓏鄜孵豧𨁒敷𣘧膚䓵𩵩鳺𪊐麩𥱀糐䎔𦺉𩿧麬㩤䱐麱䴸懯𣞒𥼼𧀮𧀴𡫺𦇁𡬇 # fū
    <*乀𠬝巿弗伏凫甶佛冹刜孚𢌹扶芙芣咈㚕岪𢂀𢏍彿怫拂㫙服枎泭𤝟绂绋𦨈𦨋苻茀俘垘㪄柫𣭘氟洑炥玸畉畐𥄑祓𥘬罘茯郛韨哹𠲽㟊𢀼𢒒栿浮砩𥾧䍖𦊦莩蚨䘠𫚒匐𢁀𣆵桴𣑿涪烰琈符笰紱紼翇𦐡䑧𦨡艴𦮹菔虙袱𧥱䡍𡞪幅𢰆棴𣹋𤉨𤱽𤶖𥦘絥罦𦊾𦲫葍䞞𧿳㜑𡦄𢞦𤠪福𥪋粰綍艀𦳓蜉𧳂䟮辐鉘鉜𩂔𩂕颫𩖬鳧𡠞 # fú (p1)
    <*榑𣻜稪𥪚箙𩉽韍𩎛𩐚𩖼㠅幞澓䋹䌿𦎭𦩡蝠𧼗𨌥䨗髴鴔𣿆𥧷𥰛𦑹諨𧼱踾輻𨵟𩓖𩢰𩳎鮄癁𦽏襆𩜲鮲黻𦿁𩋟𩋨䳕䵾䕎襥𧴌䭮鵩𣀣鶝𩠷𣀾𧖚 # fú (p2)
    <*𨑑呒㕮𢗫抚𣥋甫乶㓡府弣拊斧俌俛𢻀胕郙鳬俯𧉊釜釡捬𢯋𤙭辅椨焤𤿭盙𥒰腑滏𦎎蜅𩑬𠟌䋨腐䗄輔嘸撨撫頫𩒙䩉𩳐䫍鬴簠䌗䫝𪂀黼 # fǔ
    <*⻏父讣付妇负𡵛㳇附咐坿𢂆㤔𤝔竎阜驸复㚆峊祔訃負赴䟔㤱㾈䂤蚥袝陚𨺅偩𠋩冨副婦蚹䞜傅㙏媍富復㷆秿𦰺𦱖萯蛗覄詂赋䠵𩂎𩽻𠌽椱𤭟缚腹鲋𠣾𡐝𣄎𤸑𤸗禣𧌈𧌓複褔赙䞯𧻳𨦛䭻𢠲㬼緮𦂊𦸱蕧蝜蝮賦䝾䞸駙𩬙𩵹𩾿𠪻嬔縛𦔍輹䦣𩒺𩢿鮒𥨍𥲛䒄賻鍑鍢𩣜鳆𪀺㽬𥳇䒇䔰𧒂覆馥䮛𩣸𧒙𩭺𪂋䘀䨱鰒𪂾𪃓𪍏 # fù (p1)
    <*𩅿𩍏𧄏𪆠𠓗𥷱𧕡 # fù (p2)
    <*酜 # fu
    <'\uFDD0G' # INDEX G
    <*𡉅旮呷嘎嘠 # gā
    <*钆尜噶𡼛錷 # gá
    <*𠁥尕玍 # gǎ
    <*尬𡯰𡯽魀 # gà
    <*侅该郂陔垓姟峐荄晐㱾赅畡䀭祴絯𧊏該豥賅賌䐩䬵𧯺 # gāi
    <*忋𦫻改𡧣𢍓𢻉𨱣絠䪱𨱕𨮂 # gǎi
    <*丐乢匃匄阣𨸛㧉杚䏗钙盖摡溉葢鈣隑𠌰戤概㮣槩蓋漑㕢槪𨞨𡒖𢅤瓂𩕭 # gài
    <*甘𡯋忓芉迀攼杆㶥玕肝坩𡶑㤌泔𤮽㿻矸苷𩠁乹㓧柑竿疳䊻酐乾𢧀䇞粓亁凲尲尴筸𨝌𩖦𩚵𣗲漧鳱𣦖𩢨𪔆𤯌尶尷𩴁魐𩴵𧾲 # gān
    <*仠扞𠇵𥘏皯秆衦𥾍赶敢桿笴稈感𨳼澉趕𣘠橄䵟擀𥰟𥕵𦼮䃭𦪧簳𨣝鰔𩹸鳡𠖫䤗鱤𪊄𥸡 # gǎn
    <*干旰汵盰绀倝凎𣆙淦𣵼紺𣁖詌骭幹𣹟榦𤌹㽏䯎䲺檊𧹳𦾮𪚬贑赣𩉐𪉿贛𪊇灨𧆐 # gàn
    <*冈罓冮刚㧏杠纲肛岡㭎牨疘矼㼚缸钢剛𡇬𢭈罡𠵹堈掆䚗釭𢰌棡犅𦱌堽𤭛𣦐綱罁𦋳鋼鎠⺱ # gāng
    <*岗㽘崗㟠𨟼港㟵䴚 # gǎng
    <*鿍焵焹筻槓𣗵戅戆 # gàng
    <*㤒皋羔羙高皐𦍱𦤎髙𣓌臯滜槔睾膏䓘𨝲𡼗槹𣽎橰篙糕𦺆𥢐䆁餻櫜𧢌韟𪔘𦏦𩏤鷎鼛鷱 # gāo
    <*夰㚏㚖杲𤱟菒稁𧚡搞𥓖缟暠槀槁㵆㾸稾稿𧜉镐縞𩫓𥢑藁𩓢檺藳𩔇𩕍 # gǎo
    <*吿告勂𡋟诰郜𡜲峼𡷥𢍎祮祰锆𢞟筶禞𧠼誥鋯𣝏𩋺 # gào
    <*戈仡𠛊圪犵纥𠯫戓肐𢎄牫疙咯㤎𤇞牱哥胳𦨜袼𨟶鸽割𠸲𡟍搁𨝆𨾓𠺝彁滒𧗶戨歌𩢅𤭻鿔𩾷䔅𧎺鴐鴚𪀁𪀉擱謌鴿鎶𤜊𪃿 # gē
    <*呄㠷佮匌𢓜挌茖阁革𠲱㦴敋𢼛格㭘𣭝鬲㖵𧿩㗆𢆜愅𢩓𢯹𤠇臵葛蛒𧊧裓隔𩨀嗝𠹓塥滆𥺊䐙觡𢧧搿槅膈閣閤𨼣䪺𢡍獦𥉅䈓𦑜𨞛镉鞈韐𩢛骼㵧㷴䗘諽輵𨐥𤩲䛿𨍮䨣鮯𪌣櫊𥢸韚𥴩轕鞷䫦騔𧈌䘁𧈑𧈖䪂𩹺𩹿𪄎𨏚𩼙𨏴𩎎 # gé
    <*𤕒哿舸嗰𥰮 # gě
    <*个各虼䧄個硌铬𦓱箇 # gè
    <*给給 # gěi
    <*𠛵根跟 # gēn
    <*哏 # gén
    <*艮䫀𩒝𩓓 # gěn
    <*亘亙𠄣㫔𥃩茛𨒼揯搄㮓 # gèn
    <*刯庚畊浭㹴耕䎴㹹菮𧙸䢚椩焿絚赓鹒緪縆羮賡𩜣𩱁羹鶊𩱋𦣍𩱧 # gēng
    <*𠡣郠哽埂峺𢙾挭䋁𥾚绠耿莄𣆳梗𦛟𡩃㾘𢞚綆𧋑𦵸𥉔䌄𩂼鲠骾𧀙鯁 # gěng
    <*更𧰨𦚸𥅨堩𡍷𦜷暅𣈶𣎄𦞌𥔂䱍䱎䱭䱴 # gèng
    <*工弓公厷㓚功𠇒𢁠𢖷㕬攻杛供糼肱𦬘𧘏宫𥸲䍔𦔸𨒱䢼宮恭蚣躬𨊧𤱨𦊫龚匑䂵𧆷𨋝塨幊愩𦞗觥躳𨋷熕𦞨𨴛𩛘匔碽𩐣䰸䲲䐵𧎡𨉫𩃙髸𡚑𦄜䳍觵龏𥫋𪏠𪏢龔𤅐 # gōng
    <*廾巩𢀜㫒汞㺬㤨拱拲㧬栱㭟珙𤬳㼦䂬𦈩𦓳𨋑輁䡗𥧂𤨶鞏𫋐𥨐䱋𢸁𨣂𩌌 # gǒng
    <*共贡㓋羾唝貢𠌕𠞖䇨𡟫莻𥧡𦩼䔈㯯𪄌𡔕㔶 # gòng
    <*慐 # gong
    <*勾佝𠛎沟𤖮钩𤫱㽛𥬉袧䑦𥿺缑鈎㡚𣕌溝鉤䬲𡗁緱褠篝𦩷𦽋簼𥴴鞲韝𪚭 # gōu
    <*芶岣狗苟𡖑枸玽耇耉笱耈蚼𢄇㺃𦱣豿𣕉𣙱𨩦 # gǒu
    <*坸构诟购垢姤茩冓够夠𧵈訽䝭㗕媾㝅㝤彀㨌搆詬𧲿遘雊構煹𤚼𤠼𦵷觏撀𥉇䃓𥧒𦎯𣫌𦎼覯購𩄢𧃛𪃺 # gòu
    <*估𨸯呱咕𡗷姑孤沽泒苽柧轱唂㼋罛𨱃鸪笟𥿍𦊬菇菰蛄𠷞觚軱軲辜酤𨠋𦋆𧆻鈲箍箛𠽿嫴𢡇篐橭䐻𦺠𧇡鮕鴣𥂰𣀐䉉𧬕𨬕 # gū
    <*𦎰䜼𧳸䮩鶻 # gú
    <*夃古𠑹扢㒴汩诂谷㚉股𧟣𡷓牯䀜𥐬⻣唃䀦罟羖逧钴傦啒𣨍淈𦍩脵蛊蛌尳𢝳愲䀰𦈔蓇詁𧵎馉鹄榾𣨺毂𧣡鈷鼓鼔嘏𠻧榖𣖫𤚱皷𥮝䐨𩲱鹘㯏𣱫㾶穀𥠳縎𡽂𣫀䀇糓薣𨵐濲皼臌轂餶𣦩瀔盬瞽𦾫𨪷𣦭𥵠䶜蠱𩙏𪕷䵻𪇗𤅱 # gǔ
    <*固故凅㽽顾堌崓崮㧽梏牿棝祻雇痼稒䍛锢僱䓢𣪸錮鲴鯝顧𩴡 # gù
    <*瓜𠛒𠯑刮𡜁㧓胍𠜵栝𥄼䏦𠵯㶽鸹歄煱聒䒷𧿼颪趏劀𠟗𥈓緺踻銽𨵃颳𩢍䯏䯄鴰䫚騧𩻎 # guā
    <*𪇜 # guá
    <*𠆣冎叧𠙼𠮠㒷𠈥剐𣅻剮𠊰寡䈑𧤐 # guǎ
    <*𤆜𥝒卦坬诖挂啩掛罣𦊱絓罫褂詿 # guà
    <*𠛕乖𡧩𦮃𠦬𡇸掴㾩䂷摑𧱾 # guāi
    <*𦫳拐枴柺𧊅箉 # guǎi
    <*夬叏怪㧔𣲾恠𥑋𥑰䊽𡌪䂯𡖪𢶒𩶦𧴚 # guài
    <*关观官冠覌倌𡭷𠴨𢇇𢉂𥿑棺蒄𡠒窤𥈒関瘝𥎅𦺊𥜄癏観䤽闗鳏關䚪𨷀鰥𡅭𢺄𥍅𥷬觀鱞𩖒 # guān
    <*䏓莞𦛤馆琯䦎痯筦管䗆䘾輨𨵄舘錧館䩪䪀鳤䲘 # guǎn
    <*毌丱𣬂𣥥贯泴悺惯掼涫貫悹祼𠬆㴦㮡𨝑𨱌慣摜潅遦樌𣩔𥉀䝺盥𥊫罆䙛雚䗰躀鏆灌爟瓘䎚矔礶鹳𤼐罐䙮鑵鱹鸛𪈸 # guàn
    <*光灮侊炗炚炛咣垙姯洸茪桄烡胱𨐈僙輄𧻺銧𩒚黆𤖖𨎩𪕓𨶰𩧉 # guāng
    <*广広犷廣𠏤獷臩𤳭𥀱𤴀𪇵 # guǎng
    <*俇㫛𢓯珖逛㤮臦撗𦢎𨤡𩑈 # guàng
    <*欟 # guang
    <*归圭妫龟规邽皈茥闺帰𢻂㰪珪胿𦤇亀傀𡌲𡹙𤼮硅䅅窐袿規媯廆椝𦓯𨾚𢄊瑰𥇳𥦣郌嫢摫𥈸閨𨾴鲑嬀槻槼螝璝膭𩓠鮭𪊧龜巂歸𧷱鬶𡃩騩瓌鬹櫷𥍁䲅𪄯𪆳𪈥⻲⻱ # guī
    <*宄氿㲹朹轨庋佹匦𤘧诡陒𠱓垝姽恑㧪攱癸䃽軌䣀鬼𡷺庪𣢪㸵祪匭𣪕𥍨𥥠𧊄𩱻𢃯晷湀𣷾䍯蛫㔳𦳛觤詭䞨厬㨳䤥𩲡𩊛瞡簋𩳧𪀗蟡⻤ # guǐ
    <*𡗤攰刽刿昋柜𣧎炔𧹑𡧭贵㪈桂桧𤱺𤿡椢猤𤱾𤲉筀貴𨋡𩉝𠪑蓕𧻜跪匱劊劌嶡𢠿撌槶𤡱䁛䈐䐴䝿𣄜䌆𧡫𩳝檜瞶禬𥜏簂䳏櫃𣦦癐襘𩔆𠐽𥎛䞈𩏐𩪁𤻿䠩鳜𡬂鞼𩏡𨲿𨇙𩍨鱖𪏤鱥 # guì
    <*丨𠃌𡘝衮𢃩惃绲袞𣮎𦫎辊滚䃂蓘㨰滾緄𦓼䎾蔉𩨬𡈧磙輥鲧𥕦𦠺𩩌鮌㯻䜇鯀 # gǔn
    <*棍𠞬睔㙥𡻨睴璭謴𧬪䵪𧸫 # gùn
    <*呙咼𣁯𦬗㳡埚郭啯堝崞鈛锅墎𣂄瘑𩰬嘓彉濄蝈𩰭𣽅𣽰㗻㿆𥂣鍋𩫏彍𦗒蟈𨽏𡓣𦘌𪆹𪈃 # guō
    <*㕵囯𡇄囶囻国𠩥圀𥄍國帼𦛢𥆘腘䂸幗𢐚慖𢧰漍聝蔮𧖻膕𦸈虢𠿤𤮋𦄰䬎馘𢸗㶁𤂁𧤯𨉹𢹖𧰒𩪐𧭕𧾛𨭗𧭣𩉕䆐 # guó
    <*果𥁁𠜴𢃦惈淉猓菓馃椁褁槨粿綶蜾裹輠𥕖錁餜𩋗鐹𪂠𪋊䴹䙨𥜭𩻧 # guǒ
    <*过㳀𠋜𧥵過𢝸𢅗𧒖𩟂 # guò
    <'\uFDD0H' # INDEX H
    <*哈铪𨉣 # hā
    <*蛤𡄟 # há
    <*奤 # hǎ
    <*𨸜𣢇㱼咍咳㰧㰩㾂嗨㨟 # hāi
    <*㜾还孩𠹛𧻲頦𩠚骸還䯐𩰶𧽊𧽖䠽䱺 # hái
    <*𣳠海𥁐胲烸塰𣖻酼𨡬𥂧醢 # hǎi
    <*𠀅亥𢩸𡕗妎𠔑㤥㧡骇害氦𥩤𤵽䇋𥩲𦐤嗐𢞐𨀖餀𢻜𦷷㺔駭駴𡾨𦤦𩞞𩡔𩪃𦤬𩹄饚 # hài
    <*嚡 # hai
    <*佄𣢅顸哻㤷𤞶𠵸𣢺蚶𧮰𧮳𧵊酣頇嫨𤸕䘶谽𧹣䣻憨𩈣馠歛鼾𣝽𧭻𡬖 # hān
    <*邗𠤮𠦊含邯函咁肣𦥖凾𠤾𠥴𠲒𡇜𣢟㶰𤬯虷唅圅娢㟏㟔浛㖤崡𢔈晗梒涵𣵷焓琀𠗴寒嵅㮀㼨𤭙𥆡𦜆韩甝筨䈄䎏𦞞蜬𣘞澏𥀐鋡𠿑𦺦䗙䤴魽𫒶䨡韓䶃𧑚䥁𩄙𧃙𩦊 # hán
    <*丆厈罕䍐䍑浫喊䓍蔊阚𠽦㺖𣛴㸁㘎豃𦒝𧾔㘕鬫㘚𧯘 # hǎn
    <*𢎘𢀵汉𨸗屽𢇞㢨汗闬旱岾𨛎垾𡷛悍捍𣐺涆猂莟𧰪𫘣𢃗𢔔㪋晘𣒷焊䏷菡釬閈䧲㑵𠢇㨔皔𤿧睅𩎒傼𠹄𢄜𥇌蛿颔馯㒈𡻡𢧦撖㲦漢㵄𤌐𦋣蜭䛞𨁄𩖺𩾝暵熯𥉰銲鋎憾撼𤀉𤳉翰䓿螒頷𩗤𡁀𡣔㺝𦒅䎯䗣𨢈顄駻譀雗𩭥瀚𧂃蘫䮧𩹑𩞿𩹼鶾䫲𩕠䕿 # hàn
    <*兯爳 # han
    <*夯𠡊㰠𤵻䂫𩲋𩠾𪐦䦭𪕇 # hāng
    <*苀迒斻杭垳㤚绗珩笐𦐄航蚢䘕颃䀪𧦑貥筕絎𦨵𨾒頏𨁈魧䲳𧘃𪗜𤼍 # háng
    <*沆𤰟𡕧䟘𥮕䣈𩔋 # hàng
    <*𣭖茠𢻇𣭹蒿𤡇嚆薅薧𡽝𤢨𧯌𩮘 # hāo
    <*𠚃毜𨚙𨒑竓蚝毫椃𠢕嗥獆貉噑𡐒獔豪𨼍𩖸嘷㬔𣘫獋諕𨂜儫𤀃嚎壕㠙㩝濠𤢭䧫𩐮𩫕䝥籇蠔譹 # háo
    <*好𡥆郝𤫧 # hǎo
    <*号㘪㚪𡚽𨚮㝀㞻昊𤝐昦秏哠恏悎𣆧浩𥍣耗晧㬶淏䚽傐皓䒵鄗滈聕𦳁號𨠬䧚𩲊暤䪽𡠖暭澔皜皞䝞㙱𡚌曍𣚧𤩩皡薃𤩭皥𧇼鎬颢𧬁灏顥鰝䯫灝 # hào
    <*𠀀诃呵抲䏜𦘿㰤𥘫𠳊欱𠵩喝訶嗬𣣹㿣𩑸𩐥蠚䶎𢥳𪖲 # hē
    <*禾𠧕合何劾咊和𠰓姀𣏷河𣲲𥝖郃𡇞峆㪃曷柇𤖱狢盇𥝸籺紇阂饸哬𠳇敆㪉核盉盍𥞄𥞍荷䢔𠚔啝𡇶㭱涸渮𤈧盒秴䅂𦛘𦛜䒩菏萂蚵𨜱龁𠶹惒𥟃粭𧊬訸𨋟𨜴颌𢄍㥺楁㮝毼澕㹇𦳬詥𧮵貈䞦輅鉌阖鲄㕡𠻙㮫熆𧇎𨴢鹖麧㿥䃒𥻉頜㗿𣿌篕𦃔翮𧇮螛𨍇𨨛魺𦼵𧪞礉𦒏𧝳闔鞨䫘𩩲齕𠘢覈𩌡䶅𩅢䮤鶡皬䕣鑉𧭳龢𪘹𥽶𦇸 # hé (p1)
    <*𪈊 # hé (p2)
    <*𠡀佫𠗂垎𣆈贺𢬲袔寉焃𠶾賀嗃煂㷎碋熇𤌾褐䚂𧨂赫㵑𩵢鹤㬞穒翯𦺞𩩒壑癋𦽅𧝂謞𧯉𡫥燺爀𧀔𩄸𢅰𥋿𧬂𧬱鶮鶴䳽靍靎鸖靏 # hè
    <*黒黑嘿𢡀潶㱄𥕙𢖛𨭆𩻤 # hēi
    <*拫𦚣痕㯊鞎 # hén
    <*佷很狠詪䓳 # hěn
    <*恨 # hèn
    <*亨哼悙涥啈𣨉脝𦨾 # hēng
    <*㔰𡧦姮恆恒桁烆胻𠧿𥞧鸻𠔲𦶙横橫衡𩙯䯒𤮏𧝒鴴鵆䬖㶇蘅𪏓䬝鑅 # héng
    <*堼 # hèng
    <*噷 # hm
    <*叿吽呍灴轰哄訇烘軣𢝁𢝻揈渹焢𤟼硡𦐳𦕠𠹅𥓰𨋮𨌁𥔀䆪𦑟𦑠谾𩐠𩗄𥕗䎕薨輷𩒼𩓅嚝𦒃鍧𨎗𩘇𠐿𤃫轟𩖉𩙛𪈘 # hōng
    <*仜弘妅红吰宏𡵓㢬汯玒纮闳宖𢘌泓玜苰𨹁𠲓垬娂𢂔𢬀洪䆖竑䉺紅𦏺荭虹䧆㖓浤𥥈紘翃𦐌耾𧈽䞑𡇳硔紭谹䡌𨾊𫚉鸿渱𥏕竤粠葒葓𧮴䡏鈜閎䩑䪦䫹綋翝谼𨥺䨎䫺㗢潂𦁷𨌆鉷鞃魟䲨𠪷䃔鋐彋蕻霐黉𧐬霟鴻𤂲𩘎𤄏黌 # hóng
    <*𢗵𢼦晎㬴䀧嗊𣽝𩒓𨢣𩕆𩕉𢦅 # hǒng
    <*讧𠳃訌㶹𥥡𧊯𡺭𦕷𧋔𦶓閧撔澋澒𥈿銾𥰲闂𩒴𩗢鬨闀𩰓𧾧 # hòng
    <*𠯜𪖙齁𪅺𩙡 # hōu
    <*侯㤧矦𦚥鄇喉㗋𡞥𡟑𡹵帿𢜴猴㺅葔㬋㮢𣔹𣣠𣣡𥚦𦞈𦞕𧮶瘊睺𥈑䂉篌糇翭𦑚䗔䙈骺𧼵翵𧇹鍭𩃺餱䫛鯸䳧𪃶𪑻 # hóu
    <*吼犼㖃𤘽𠴣㸸𦍵𤙽𧻿 # hǒu
    <*后㫗郈厚垕後洉逅候𥅠𧙺𠷋堠豞䞧鲎𥀃䪷鲘𧩨䞀鮜𩄬𩘋𪄗鱟𪇂 # hòu
    <*乎乯匢虍𠥰呼垀𡧥忽昒㫚曶泘苸恗㧮烀𤇠轷匫𠦪唿𡱽惚㧾淴㳷㺀虖𢑢𢽨𣓗𤶘𧦝軤𨕚𩂂䩐𥇰𧠩𨖃𩖨嘑寣㦆滹𦁕𦩕䓤雐𡼘幠戯歑𧇛𧩓䴯㦌𤎲膴䨚𩶈䴣𤐀䬍𩳨謼䰧𣡾𧢰 # hū
    <*𢎵囫抇𢪏弧𤘵狐𤝘瓳𥐿胡壶㪶𤞲𥾨𦊧隺𠴱𡍐壷𢏯斛焀䉿䊀䎁𧲥喖㗅壺媩𡹹𢉢搰湖猢絗𦧘葫𩨔𡰅楜𣹬煳瑚𤾅𦴉嘝𤌍𤭱㾰𦷳蔛𧛞䚛䞱𧻰𩑶鹕槲𣙶箶糊蝴𧍵衚𧣼𨴬䧼𩢪𩰯魱𩵬𩾻𣎚㯛𣛫𣫈𥂤𥰪縠𦖼𦺟𧇰螜䠒醐頶䁫䈸觳𨍲𨢋鍸䭅餬𪏻𣄟𣝗㽇𦗣䩴䭌䭍鵠𪕉𢑹瀫𦏗𧞒鬍𪂒𨣗鰗鶘鶦𥶜𧹾𩱍𥷆𪕮𪕱𪙈 # hú
    <*乕汻虎浒俿𧆢𨛵唬萀𧆮𧰴琥虝𨝘滸䗂𧌧錿鯱⻁ # hǔ
    <*乥互𢆰弖戶户戸㸦𡴱𢨥𤘔冱冴𢨦芐㕆𠯳𡵘帍护沍沪𣲑𤜷𠰛岵怙戽昈枑𦬚𡜂怘祜䍓𦊂𦭈𧘢𨱀𢚪𣑂笏䇘粐䊺𦊘婟扈瓠𧆯𧥮𧥯𧦚𧿓𧿠𡞠楛𨥛嗀㺉綔鄠𨝞雽嫭嫮𡻮摢㨭滬㷤蔰槴熩𤨖鳸𤹣𪏳𥢟簄𥲉𧗌𧹲鍙嚛𨢤鹱𪍂𧂔護𧲇鳠䨼韄頀𪄮䕶䪝鱯鸌𧅰 # hù
    <*𩾇 # hu
    <*花芲哗𠝐埖婲𤙕椛㳸硴嘩糀𦶎誮蒊錵𡁑𩝨𨣄蘤𨶱𦧹 # huā
    <*华㕲㭉姡㟆骅𠳂𢼤華釪釫铧𪉊滑猾搳撶磆𦧠𧨋㠏㦊𥉄蕐螖鋘䴳𥢮䔢𦽊譁𧽌𤁪𧑍鏵𩤉驊䱻鷨䶤 # huá
    <*𠤎化划㕦夻㕷𢦚杹画话㓰崋桦䇈䋀婳𣶩䀨畫𥒶嬅畵觟話𩲏𩵏劃㚌摦樺𦁊𦖍䛡𩂤嫿𢄶槬澅諙諣𩗐𠿜𥧰黊繣舙𦧵𦪠𩸄譮𨶬 # huà
    <*怀徊淮槐褢踝懐褱㜳㠢懷瀤𩌃櫰䃶耲蘹𪊉 # huái
    <*坏咶𣸎𦧬壊𧱳壞𣟉𣩹𤜄𦏨蘾𩟮 # huài
    <*欢犿𥹚𠂄歓𤛚鴅𩿊𡚊㹕鵍酄嚾懽獾𨽧𡚜歡𣌓𩦘𥐓讙貛驩𩵄𪈩 # huān
    <*㡲环㿪郇𡘍𡱌峘洹狟荁桓𩡧萈萑𡍦寏𡩂絙雈𩑖䭴綄羦貆𨕹鉮𢟿锾䴟𠟼圜嬛寰澴缳𦻃𦼉䦡阛㵹環𤩽豲䝠鍰𪊥镮鹮糫繯𡄤㶎轘𦣴鐶闤䥧𩍡𩙽鬟瓛䴉䴋𪍺 # huán
    <*㣪缓䈠緩𦑛𧡩𤀣攌𥶍𤼢 # huǎn
    <*㕕幻奂肒𤴯𤽅䀓奐宦𤽕唤𡷗换浣涣烉䒛𨜌患梙焕𥏇䆠逭喚喛嵈愌換渙痪睆𧚁𠺐𠻍㪱㬇㬊煥瑍㼫𦝝豢漶𤡟瘓𥈉𥠅槵𤢁䠉鲩擐澣㹖䍺䯘𦌦藧𧴊鯇鯶鰀𡅱𡅻 # huàn
    <*巟㠵𢇟𡿰𢁹肓𤆴𨚳𡜋㡃荒衁𣆖𧖬朚𤭉䀮塃慌𥿪𣺬𤠛𧠬𡡄㬻𩢯𪀞 # huāng
    <*𡉚㞷𠂸皇䍿偟凰𨜔隍黄喤堭媓崲徨惶湟葟遑𫗮黃楻煌𤚝瑝墴潢獚㾮𤾑䄓䅣𨝴锽熿璜篁篊䊗艎蝗𤛥癀磺穔諻䞹𨉤𨍧𤯷䅿簧蟥鍠𨱑餭鳇䊣𦡽𦪗趪韹鐄騜𪏍𪏒𩞩鰉䳨䑟䪄𪏙䮲鱑鷬𧕸⻩ # huáng
    <*怳𡧽恍㤺炾宺晃晄奛谎幌詤𣉪熀䐠𦵽𦟮𣄙縨謊櫎兤 # huǎng
    <*𥫼㿠愰㨪滉𨉁榥曂皝䁜䌙鎤皩 # huàng
    <*灰灳𠯠㧑诙咴㞀恢拻挥洃虺𡯥袆𢀡晖烣珲𦭹𧉇豗䝅婎媈揮㷇𤟤翚辉隓𢊄暉楎煇㹆禈䖶詼幑𣄓𤕚㾯𤾈睳褘𧳐𨦗噅撝㫎噕翬𧗼輝麾徽隳𪀬𠓊𡒾瀈𪑀𪖕𥌍䜐𪏏𥃌蘳鰴𩻟𪈑 # huī
    <*囘回𤜡囬佪廻𠲛𡋙廽恛洄茴迴𨛤烠蚘逥𡹎痐蛔蛕蜖𡰋𫚔𩢱鮰𪀟𪛂 # huí
    <*𡭛悔䏨𤈦𣸀㷄毀毁㷐𤌋𦞙𡢕毇𥊔䛼𩗝㩓檓燬䃣𦽐𩶥𧗏𩃾𪏇𤃽譭𥶵𥸃 # huǐ
    <*卉屶屷㞧汇会讳𡥋泋𤆳𠧩哕𡜦㤬浍绘芔荟诲𨊢恚恵烩㻅贿㑰彗晦秽㑹喙𡹯惠𢻔湏䅏絵缋翙阓𠍗匯𡏁㜇𢊇彙彚㥣㨤會𣨶滙詯䛛賄颒僡嘒𢄣𢟾㨹㱱𤸁瘣䂕蔧誨𧧾䤧𠽡圚寭慧憓暳槥潓𥔯𦂆蕙䧥𩇻𩒏噦𠿔嬒徻𢕺橞殨澮濊獩璤䌇薈薉𧏧諱𨗥𨵘䩈頮𩒳𣋘𦡖檅燴璯𥀠篲𥱵藱𨍹𨘇餯嚖𢅫㩨瞺穢繢𦒎蟪𨘲𩔁㬩櫘 # huì (p1)
    <*𥴯繪翽䕇譓䜋儶𧬨鏸闠孈𤜋鐬𩆁靧䫭譿顪𧭾𪊂𪔊𧖢 # huì (p2)
    <*𣌭懳 # hui
    <*昏昬荤𠉣㖧婚𡨩惛涽𧠚阍𣇲棔𣣏殙䎜葷睧睯䡣閽𩅴 # hūn
    <*忶浑𩧰㑮梡馄堚渾㨡𣨿琿𨋨魂㮯䊐䰟𦟲餛繉轋𣝂䴷䮝𪌽𨏂鼲 # hún
    <*𩽼𦃕𪑕 # hǔn
    <*诨俒倱圂𡇯掍混焝㥵𣣞溷䅙𧣢慁𦞢𦵣觨䅱䚠䛰諢𨂱𨡫𦡵𩏖䫟䧰𩇇 # hùn
    <*吙剨耠锪劐䦝嚄鍃豁𩭳攉騞𨷮 # huō
    <*佸𡯢活秮䄆秳𦨯䄑𧵻䣶𢋒𤻙 # huó
    <*火伙𤆄邩钬鈥漷𤬁夥 # huǒ
    <*㘞𠯐㦯沎㓉或货咟砉䄀俰捇眓𥙨获閄𠙞㖪𠵾𡿿𢃎𢛯掝𥒠祸貨惑𢝇旤楇湱禍𥝂𢞕𣄸𤊴𥇙蒦𡪞㨯𣉒𦑌𦞦㗲㦎㩇㯉𧯱奯濩𤏘獲䁨䐸霍䬉㦜檴𥊮謋𧯆𨘌𣤨𤁹𤐰矆穫𧤴镬䨥䰥嚯𡓘瀖㺢䉟耯艧藿蠖𨐶𨙀䱛嚿曤㸌臛𩞺𡄴癨矐鑊𩆀𥽥𦒧𩟨𩪭靃䂄𪒩𩟸𧆑 # huò
    <'\uFDD0J' # INDEX J
    <*丌𢩦讥击刉叽饥乩刏𠚽圾机𣬠玑𥘌肌芨𠔋矶鸡㚻𢆻枅𨐆咭𠀷𡇟姫𢼋迹剞唧姬屐䂑积𥫶笄𨹶飢𠴩基𢁂绩𨊻𩉜𩨒𠋻喞𠷌㛷嵆嵇敧㫷𣇳朞犄筓䇫缉赍𨻕𠍃勣嗘𣪠𤋭畸稘䐚𦳌𫌀跡跻𨳻𩚮鳮僟𠟣𠼻㮷毄𤌿箕𥺵銈嘰𢡴撃槣樭畿稽𥡒緝觭䛴賫躸𪌍齑𢨐墼𡫀機𣰈激璣𤳎禨積𥰦𦠄𦺬䗗襀錤隮𩜆𪔋㦘擊磯簊績羁𦼷 # jī (p1)
    <*𧐐賷𨍺鄿𩐆𩠨櫅䁶𥳏耭𦿓𧗒𧫠蹟𨲪雞𡳮𦌰譏䟇𨅤韲鶏譤鐖饑癪𥨿䕤躋鞿鷄齎羇虀鑇覉鑙𨮺𪅹齏𡿙羈鸄覊 # jī (p2)
    <*亼亽及𠓞伋㲺㔕吉𠯉岌彶忣汲级𨸚即极皀亟佶㤂㧀𣏡𣳃诘郆𠗏卽𠫷叝姞𢏞急狤㽺皍笈級揤疾脊𧉆𧉍觙𧮭䞘偮卙𠦫庴𢉗㭲焏㾊𤿠𥒡谻𨋉𠨠㗊𠶻𡹪𢃺㥛戢𢰒棘極殛湒㴕𣹜𦝖集𠹋塉嫉愱𢱣楫𣣝𤊵𤠎𤷉䐕蒺𧧩趌辑槉𣖷䁒𥈂𥠋耤膌𦵾𦶍銡㗱㙫㠍㠎嶯潗濈𤎗瘠𥕂箿𦎢𦩧蕀蕺踖𨦮䲯鹡𠿠㡮橶𣛔檝㻷𦺩𦺴螏𧎿 # jí (p1)
    <*𧤏𧩦輯𡁰𣜇𤺷𥊬𦠾藉襋𧪠𧽑蹐䣢鍓𩀖㘍𡃃𡦪𥋥𥖙艥𨪏䩯𩴃𠑃䚐籍𧥄轚鏶霵䳭𪂺䟌𨤹鶺鷑𪄸𩦤𡅺躤雦雧 # jí (p2)
    <*几己丮㞦𤜝䢳𠮯妀犱𢓄泲𤜾𥾊虮𠱨挤𧾾𨒴𨳋㞆掎㨈㴉鱾㞛幾𢜭戟㦸嵴𩉢麂魢撠㚡擠穖𥪼蟣𨄐䍤𪂍魕𩯋 # jǐ
    <*彐⺕旡计记伎㒫𠨕𢗂纪坖妓忌𢗹技𣄯𣱗芰䢋际剂季𢺼㰟𤤋𨛉哜垍𡋚𡥞峜𢍇既洎济𤵀紀茍茤荠計𧾽𨛑𩧱㑧剤𠲹𡜱𢚁𢭄𢼷𣄱紒继𦮯觊記偈𠴫寂寄㞃㠱徛悸㥍旣梞済㳵祭𦮼𧢾𨜒䦇塈惎㻑𥭋𥭌䐀𦜸臮葪蔇䛋兾𡦊𣔽痵𥭜継䋟𦋋蓟裚𧧃𧧟𨀶際鬾㡭暨㮨㲅𣯅漃漈㹄𤛄㾵禝稩穊𦁳䗁𧡉誋跽霁䨖鲚㙨𡪱暩𣽍稷𥪫 # jì (p1)
    <*𦂑諅䝸鲫冀劑𠿉曁䀈穄𥡴䓽𦺶薊𧇯𧡯𧪇䠏𨂢髻嚌𡁪𡽉檕濟繋罽𦌗薺覬𩓮𩩛䶓檵㸄𦾲𧫜𨢵鵋齌廭懻癠穧蘎䤒𩞊骥鯚瀱𥣩繼𦆡𦪱蘮𧓓𩥉鱀𧃞䜞𨣧𡬄蘻霽鰶鰿𪄵𤓑𤫝𥷙𦇧𪘥䮺䰏𩼄𩼚鱭𪊆驥䶩𧟜⺔ # jì (p2)
    <*加𡭘乫夹伽夾抸佳㚙𡶥拁泇㹢茄迦枷𣪇毠浃珈埉家浹痂䂟𥝿梜𤟚笳𥹌耞𧉪袈𨔗傢𠷉𡩚猳葭𧦤跏𨔣𠺢𣮫犌𤠙腵鉫嘉鉿𩊏𦎮𦣯镓𥡮糘豭貑𩶛䴥鎵䕒麚𪔟𪐓 # jiā
    <*㕅圿忦扴𡊠𢫢㪴𨒇郏荚郟𩠃唊恝𥑔莢戛䀫袷铗戞𥞵蛱裌𧿵颊㮖𥇗蛺跲𩉡𩚲䛟餄𦸘鋏頬𩛩𦎱𦧮𦺧䩡頰𦽤鴶鵊㿓䕛𪇷𪈟 # jiá
    <*甲岬𤖰叚玾胛斚𥑐贾钾假婽徦斝椵𣦉𤗜賈鉀榎槚瘕䑝𩨹𩲣檟𩌍𪆲 # jiǎ
    <*价驾架𦙺𦨦𢉤𢜿𢱈𢱌嫁幏榢價稼駕𥋣 # jià
    <*𠫘戋奸尖幵坚歼间冿戔㦰玪肩艰姦姧𢨿兼𢦺监堅惤㭴猏笺菅菺豜𧲨㓺𡬵𢃬𢐆𣮏湔牋犍缄𦣨葌𨔥間𨳡搛椷椾煎瑊睷碊缣蒹豣𨳿𠼤𢳚監箋樫𣘖𣘷𣽖熞𤍖𥊇緘𦋰䓸蕑蕳𨴾𩛧鲣鳽鹣㔋𠿏𣚙熸𥡝篯縑䌑艱䔐𦽇𧤨𩋋鞬餰馢麉𪐻𣝕瀐𤪋𦏔鞯鳒殱𥌈礛䌠覸𩱃鵳𪏊𡄑㡨瀸𧂢𧢖鐧𩌯櫼殲𧥈𩅼𩍎鶼韀鰹䶬囏虃䘋䶢鑯 # jiān (p1)
    <*𩆷韉𪒹𩇏 # jiān (p2)
    <*㔓囝拣枧𣥞俭𡭭𢩀柬𣳲䄯茧倹挸捡㳨笕减剪梘检湕趼堿揀揃検減睑硷䅐裥詃锏𠍚𠹟𢆞弿暕瑐筧简絸谫䟰𢍫彅戩戬㨵𥍹碱𦁲儉𠏇𠽱𢵈𦂇翦𡑯撿𥢇𦺍𦺘䵡檢𣜭藆襇襉䚊謇蹇𨢑瞼礆簡䉍𥳒𥳟𥳷繭𧀇謭䵤𠐻𦢣𨣇鬋鰎鹸𡄓𡾰瀽蠒𧬫鐗劗㶕𤄒鹻𥍀籛譾䭠𩟗𡅶𣠷𧅆襺𩉍𥀹𧮈鹼䶠𨤄𪒫𨰓䮿𩽜 # jiǎn
    <*见件見建饯剑洊𣴓牮荐贱俴𠊒健剣栫涧珔舰剱徤㣤渐䇟袸𧙧谏釼䧖寋旔楗毽溅腱臶葥践𤧣𤷃賎鉴键僭㨴榗漸蔪𧗸劍劎墹澗㵎𣽦箭𥯦糋諓賤趝踐踺䬻劒劔𢆦𦩵薦諫鋻鍵餞𤀩瞷磵礀螹鍳𨪅𨵭擶㯺濺繝𦾶䟅䭈𪋁㰄瀳𥴱𧀵覵𨎫鏩𪉦𥽐艦𧂂𧂆䥜䯡𪃛譼轞𨏊䤔鐱𨷓鑑鑒𩻘鑬𪆿鑳𩉔𪙨⻅ # jiàn
    <*橺 # jian
    <*江𤕭𢪇𤕯𧘍姜将𡷍茳浆畕䜫豇將𥆅𨜰𥬮葁畺摪𥔣翞僵𠘌漿𤛜螀壃缰𦦗薑𨃇橿殭㹔螿鳉疅礓疆繮䗵𥗪韁鱂 # jiāng
    <*讲奖𣫳桨䋌傋蒋𡏞奨奬㢡蔣槳㯍獎𡑶𤖛耩膙䁰䉃䒂講顜𩌾𥷃 # jiǎng
    <*匞匠夅弜降𢘸洚绛弶𥞜袶𡲣𣨣絳䞪酱勥𠼢滰嵹摾彊𣚦犟糡醤𩷄𪀘𣩴糨醬𩷭櫤謽䥒𩝽𩴒𨯞 # jiàng
    <*杢 # jiang
    <*艽芁交𦫶𥃪𠩏郊姣娇峧浇𥄉茭茮骄𠝑胶䢒𨓩𡟠椒焦𥹜䍊蛟𣺳𧣦跤𩎔僬嘄𡏭𢧱虠鲛嬌嶕嶣憍澆膠蕉𨸋𩵰𩿑㲬燋𥉼𦌆膲礁穚𨨴𨱓鮫鵁𪁉䴔鹪𣝞㶀簥𦅃蟭轇𡓖𨎦鐎𨶲䶰𪚰𩴧䌭驕鷦鷮 # jiāo
    <*𥃤㭂𣏑㳅㽱㽲臫角佼侥𠜅恔挢𣧦狡绞饺捁晈烄笅𣁹𤶀皎𥅟矫脚铰𨺹𡙎搅𢯴湫𤉧𤶳絞䘨𠕧剿𠞰敫湬煍𥇟腳賋僥摷暞踋𨝰鉸餃儌劋𢄺徺撟撹𢻟𣩓𥉒𥏹𧎙𨖵隦𢅎徼憿敽敿燞缴𧎸曒璬𥂨矯皦𥳴蟜䀊繳𦗵䚩譑𨶟𨶪孂㩰𤃭𧂈纐䥞𢀌𨇕攪灚鱎 # jiǎo
    <*叫𢒾𥘊呌𡥈𤕝峤挍訆𢼫珓窌𦮁𧺜轿较敎教𤫷窖㰾滘𥦢較嘂嘦斠漖酵𨡃噍嶠㠐𢕪潐𩊔噭嬓獥𥡤藠𠘣趭轎𨎬醮𨲭譥𧾐𢥚𡬋㬭皭𩯘䂃𩱞釂𪖄 # jiào
    <*鵤櫵 # jiao
    <*阶疖皆接掲𣶏痎秸菨階喈喼嗟堦媘嫅揭㫸椄湝𦈰脻街𠙤煯𦝨䦈𤭧䃈稭𦁉鞂擑蝔𪉚𤮌癤謯𩘅𩩰𧞝䥛鶛𥷫䕸 # jiē
    <*𠂈𠄍卩卪孑尐𢎡𠅂节讦𠬮㞯𡵒刦刧劫𠯙𡉷岊𢪍𢻮昅刼劼㔚𢫐杰𣳟疌𥁂𥝔衱㘶㛃拮洁䂝𥝥𥾌结迼𩧵倢𡔣𡸎𢬱桀桝莭訐偼婕𡨲崨𢈻捷掶𥅴袺𨓰𨥂𪉋傑媫㨗𢱄𣮌𣮍㼪䀷䀹䂶結絜颉𡙣𡩣嵥㨩楬楶㮞滐睫𥇒𥓐節𦀖𦎒蜐蝍詰𨕽鉣魝㓗截榤㮮碣䅥竭𦵴蓵鲒𢢂𣙴潔𥠹𦈜羯𧍠𧍩誱踕䣠鞊𩾶幯𣚃𦺢𧏥𧼨𧽄𩢴𠐉𡽱嶻 # jié (p1)
    <*𢎔擮礍𧫑𨃲鍻鮚𪀾𪌧𡣯巀㦢𢷿櫭𣰞𤁢㸅𥢻䌖𦿐𧽟𩔄𪁍𢨜䗻蠞𥵞䕙蠘𧞩𧞬𪃈𧾢𩟦𪅸𧾯𩯰䲙𪇲蠽𪖋⺋ # jié (p2)
    <*姐毑媎解觧飷𠎿檞 # jiě
    <*丯介𠓢吤𡗦𡗲㝏岕𡵚㠹庎戒芥𩧦屆届𣬫𤘦玠㑘界畍疥砎衸诫借悈蚧徣𤙩㾏𧣋𨐑𠷟堺楐琾蛶骱犗誡𩡺䯰褯𧜅魪䰺䲸䇒䛺𨵠䱄鎅㿍𪑹𪙏 # jiè
    <*巾今斤𠂟钅𢎭㧆𠰇𤣶兓金釒津矜砛𦘔荕衿觔埐珒矝紟惍堻琻筋釿𦞬𦩏䘳嶜㻱䈥𧗁鹶黅㦗𦈟𥂵䃡䈽䤺𪉢襟䌝𨆃𩀿𩤿𪑙𨭺𪖼𢦊⻐ # jīn
    <*仅尽𨚡侭卺巹𢬬紧堇菫䒺僅厪谨锦嫤廑漌盡緊蓳馑㝻槿㹏瑾𥯑儘錦𪏴䌍㯸𣝌𥖜謹䥆䤐饉䭙 # jǐn
    <*伒劤劲𠬶妗近进枃㶦𤘡勁浕荩𢙿𢬶晉晋浸烬㶳𤵞𦧈䑤赆唫𢉅𢽖㴆琎祲進𣓏煡𠞱𠞾寖𡺽搢𢱷溍禁缙䝲靳墐㨷㬐瑨𤧫䀆䋮僸凚𠢱𠢵𠾤𠾬歏殣璡䆮觐噤𡢳㬜濅𥧲縉賮嚍壗嬧㯲㱈濜𦎷𦽔藎燼璶䗯覲𩖗䶖贐𤄼𧔷䫴齽 # jìn
    <*𢀖坕坙巠𤜰京泾经茎亰秔荆荊𠳬涇莖婛𢈴惊旌旍猄経菁晶𦜳稉𦀇腈葏𤷦睛粳經兢𣻒𥠛精聙𦂠橸䪫鲸𡁔𦽁𩓨𩳯𣋢𦾿𧤵鵛鯨鶁鶄𪂴䴖麖𧓔𩹢鼱驚麠𪇒 # jīng
    <*井丼𨙷阱刭坓㘫宑汫汬肼剄𠭉𤰳穽𠭗颈景𨥙儆頚幜憬璄憼暻璟璥頸𧑊蟼警𢹘䜘𩻱𠑱 # jǐng
    <*𠦋妌净弪径迳俓𠗊𠗌婙浄胫倞凈𠲮弳徑痉竞逕婧桱梷淨𥅸竫脛𩇕竟𠷐㣏敬痙竧靓傹㬌𦳲靖境獍誩踁静䵞𥯙䝼𩃋靚㢣曔𦥍镜靜瀞䔔𨵼𩓞𩰹鏡競𣬙竸𥶹 # jìng
    <*燝 # jing
    <*⺆冋𠕕坰扃埛𢂶絅𣕄𨴀𪔃駉駫𪕍蘏蘔 # jiōng
    <*冏𠖷囧㢠泂炅迥侰㓏炯逈㤯浻烱䌹䢛煚窘颎𢄗𣔲㷗綗𦀝𩚱僒煛㷡𤌇㯋熲𧍮澃燛褧𩓺 # jiǒng
    <*丩𠖬𠃖𠕴𠚨𠠳勼𢀙纠朻牞㸨𤴥𣁭𤴦𤴪究糺鸠𥤳糾赳䡂𦭺𨳊阄𢜥萛𩱼啾揂揪𦱠𦱱𦱲揫鳩摎𥠃樛𠿈䆶𦽬𩭓鬏𣟼𩏶𩏷鬮 # jiū
    <*㺵 # jiú
    <*九久乆乣奺𡚮㡱汣𣲄杦灸玖𠛩𠜉舏韭𠴄紤酒镹𨾉𤉥𨾞韮 # jiǔ
    <*匛𡆥旧㝌㺩臼𠜃咎疚𥘦䆒柩柾𧾻𠃺倃𠙔捄桕𦭻匓厩救就廄廐𢽭㲃𥆷䊆𤷑舅䬨僦𠣿廏䅢𨖏㠇慦㩆䊘𧡑䛮𩒦殧𦠢𨘂𩢹舊𩶧䳎鹫𨘮匶𧫾鯦麔𢑇欍齨鷲 # jiù
    <*𣐤 # jiu
    <*凥抅匊𠰾居㞐㡹拘泃狙苴䢸驹𥘮挶疽痀眗砠罝𦛓𨛮陱㖩娵婮𡨢𡱾崌𡸘𡸨掬梮涺菹椐琚腒𦜛𦱅𧵞𧹕趄跔锔𥇛䅕𥪏𦀣裾雎𣻐艍蜛䪶𠟰諊䝻踘𨁺鋦𨧙駒𠤄𨨠鮈鴡㪺鞠𩋜𪗖鞫𠮑𡫬鶋𪂓𩍔𥷚𩍸 # jū
    <*𠨭𡉎𦥑局㘲𡶋泦侷𢩁狊𦙮𠜹𡨅桔毩𩧺𠋬啹婅𡿾㥌淗焗㹼䏱菊郹椈㮂毱湨𧿻𨋧𩫴𣖣犑㽤𤼳䎤𧻗輂僪𥮗粷䋰䗇跼閰𡳘䜯趜躹䡞𩬜𣎛橘𦺖𧤑𩛺檋𥢧𨍯䪕駶𩭊䳔𪀣𩳵𩷐鵙𦅽𧷾𧽻蹫䤎䱡鵴巈蘜鶪䴗鼰㩴䕮𧄛𧾣䰬鼳𤜔驧⺽ # jú
    <*𡕖咀弆沮䢹举𣌬矩莒挙𥄷𢯺椇䅓筥𧺹榉榘𦞇蒟龃𥈋䃊䄔𥯔聥𡢒舉踽擧𢤫𥴧櫸齟欅𦇙襷 # jǔ
    <*㠪巨句乬𠚵㞫巪讵姖岠怇拒洰苣邭𨸰具𠙆怐怚拠昛歫炬𤔋𤖵秬钜俱倨倶𠉧冣剧𢚆烥䀠粔𦊐耟蚷袓埧埾惧据𣶝𥬙詎距𡥶犋𧣒跙䣰鉅飓𤷢虡豦锯㜘寠愳㨿㩀𥂃窭聚𨝮𩉸駏劇勮屦𣍇𥉁𦟳𧣻䛯踞鮔壉懅據澽𤢓窶䈮𦼈遽鋸𩜃𩿝𪀏𡒍屨𥲜颶㘌𧝲貗𪁥簴𥴪𦗻䱟𧂜𧲋躆醵𩰤𩴘䵕䶙懼𧸧鐻㬬𩧒 # jù
    <*爠 # ju
    <*姢𡱑𦬾𠡶娟捐涓焆瓹𥅬脧𦮻𢝓䅌裐鹃勬䣺𧎖𨌫镌𩎳鎸鵑𩔱鐫蠲 # juān
    <*卷呟帣𦊌埍𨹵捲菤𩠉锩𡫂𢋄㷷𤎱臇錈𩜇𩏗𧕲 # juǎn
    <*㢧𢎥𠔉奆劵巻倦勌𡘰𢍏桊狷䌸绢隽𣬋淃𥁠眷䄅鄄𨤑㢾睊𥆞絭罥䖭雋𠢚𤲨睠絹𦳽𧯦䡓飬𡡀慻𣬏蔨𣙢餋㯞𣚓獧䚈𣜨𥱽縳𦼱𤺻羂𨆈䳪𧭦㪻𦦽𩏹 # juàn
    <*𪨗𢱺𫏋噘撅撧𢴭屩蹻 # juē
    <*亅𠄌𠄑孒孓𡳾𠀔决刔𢩯氒𦓐诀𢁪𢎹弡抉決㹟芵𧮫䦼𫘝𣅡㭈泬玦玨䏐㤜挗珏疦䀗砄绝䏣虳觉𫛞倔𠜾捔欮𤞴𥾮蚗𧺐𠊬崛𢏷掘斍桷殌𤟎𦛲覐觖訣赽趹䡈𨊿逫傕厥𠶸𡈅𡲗𢔱㭾焳㻕𥆌絕絶𧗫覚趉𧿺鈌㟲㲄𥏘䇶䐘䖼𠎮劂㔃勪㔢𠢤𣖬𣬎㸕瑴𦁐䘿谲𨼎駃𠨊嶥憰㵐熦爴獗瘚𤹋蕝蕨𧍕𧣸䝌𧱝䞷䠇𨼱鴂鴃噱憠𢨏橛橜 # jué (p1)
    <*𤛦𥛯𦠒𩊺㷾爵𥕲臄𧝃镢𫔎𩓻𠫃䁷𦏅𦪘蟨蟩䙠𪁠屫𡾜爑𧤼譎𧽸蹶蹷鶌𪖜匷嚼㰐矍覺鐍鐝𨬐㩱灍爝觼𩪗𧥎𡚠彏𢖦戄攫玃𤼗䣤𩰨鷢欔𩍷矡𥤘龣𨰜𩧏貜𧾵躩𨏹钁䦆𩏺𩧡𪈴𪚅 # jué (p2)
    <*䞵 # juě
    <*𣨢𥈾 # juè
    <*军𠣕君均㚬汮𢻸𠀹姰袀軍钧莙蚐桾皲菌鈞碅皸皹覠銁銞鲪麇𧽔鍕鮶麏麕𦌺𦇘 # jūn
    <*𢉦 # jǔn
    <*呁俊㽙郡𨛐陖埈峻捃浚馂骏㖥晙焌珺𥚂𧥺㑺棞㻒畯竣䐃䜭𠨢㝦㴫𥇘䇹𦴌儁箘箟𦵼蜠𨌘𨲄㕙寯懏餕燇𥡣䝍㒞濬駿𨶊鵔鵕鵘攈䕑𪍁𪕞𢹲𤮪𧯖攟𥜮 # jùn
    <'\uFDD0K' # INDEX K
    <*咔咖喀衉擖䘔 # kā
    <*卡佧垰胩裃鉲 # kǎ
    <*开奒㚊𡙓𢔡揩𦈲锎開𢾆𨴆䤤𤡲𥻄𦂄鐦 # kāi
    <*凯剀䒓垲恺闿铠凱剴嘅慨蒈塏嵦愷楷輆暟𥏪锴𠢲䁗𢋝鍇鎧闓颽𥃣 # kǎi
    <*忾炌炏欬烗勓愒𤉫𡳂愾𩫀㪡𥎆𢢚𤐩鎎𤻜䡷 # kài
    <*刊𢦟栞勘龛堪嵁𡺗戡𦞖𩑟𧡵龕㘛 # kān
    <*冚坎侃𥤱砍𥑫莰偘𠝲埳𡸞惂欿𣣒𥦔塪歁䖔𧱄槛𩒃𣽌輡㙳𧇦𨍜𩐬𩓟𩜱檻顑竷轗 # kǎn
    <*𡶪𨒞𢙮看衎崁墈䘓𧯰𣊟瞰磡䳚闞𪉯矙𥍓䀍 # kàn
    <*𡵻忼闶砊粇康𥹺𨀫𨝎𨻷𡐓嫝㝩嵻慷漮𠾨槺㱂㼹𨂟𤮊𥉽𥕎穅䆲糠䗧𨄗躿𨎍鏮𩾌鱇 # kāng
    <*扛摃𢴦 # káng
    <*䡉𣔛𠻞𡻚 # kǎng
    <*亢伉匟邟囥抗犺炕钪𥒳鈧閌𪎵㢜 # kàng
    <*尻䯌髛𩩾 # kāo
    <*丂攷考𣧏拷𣐊洘栲烤𥬯𥹬𣨻𣩅䯪 # kǎo
    <*𡭳铐䎋𧋓犒䐧銬鲓靠鮳𨘴𩝝鯌 # kào
    <*𤰙匼㸯苛𠲙𢈈柯𣧤牁珂科𥝹胢轲疴砢趷钶𡸡𧿫嵙棵𤖇萪𧵛軻颏嗑搕犐稞窠鈳𡻘𢩘榼𥠁𥧇䐦薖颗𠏀樖瞌磕䈖䌀蝌𧎗𧨵錒𨍰醘顆𩜭髁礚𨢸𪍎𥃕𩏭𨏿 # kē
    <*壳揢殼翗 # ké
    <*可坷岢㞹𢼐㪼炣𢩐渇嵑敤㪙渴𤸎嶱㵣𪓮 # kě
    <*𣲊克刻𠛳𠡜㕉剋勀勊𠡤客㝓恪𠩧𠳭娔尅㤩𧠋课𠶲堁𡱼𢩏氪䆟骒㕎𠷄𡞢𣹇缂𠪒愙溘𥦨锞𠪟𢾩𣩄碦𤛗𥔽𥯚緙艐𧛾課𥊉䙐𧜡𠢹𩰻礊騍𩭽𪃭䶗𧈗𩱘 # kè
    <*𩎤 # kēn
    <*肎𣍟肯肻垦𣥤𠳁恳啃豤龈𨼯墾𤀊錹懇𥖞齦 # kěn
    <*㸧掯裉褃 # kèn
    <*𠠷劥阬吭坑妔㰢𥑅𡷨挳㧶𣢴硁牼𥒁𥥳硜𥒱𨋔铿硻摼誙𨌳𨌶銵𥉸䃘𨍑䡩鍞𣫒𧀘䡰鏗 # kēng
    <*𡞚 # kěng
    <*𠀝空㚚倥埪崆𢃐悾涳𢽦㲁𦱇硿䅝𧚬𥔇箜𧌆躻錓𢷙鵼𪔣 # kōng
    <*孔𢪬𣏺𤤲𥥅恐㤟𦶐𩲧 # kǒng
    <*控㸜𤗇𦁈鞚 # kòng
    <*𠛅抠𦬅芤𢂁眍剾𢄠彄摳瞘䁱 # kōu
    <*口𨙫𤘘劶𢼃𨥴 # kǒu
    <*叩扣㓂敂𫃜冦宼𢚫𧥣寇㰯釦窛筘𡠆𦴎𢟭滱𣻎𦶲蔲蔻瞉𣿟𥊧䍍簆𥲃𩀠鷇䳹𪄺𪇄 # kòu
    <*𠠶扝𡗵㩿䂗刳𡶏𢏆㪂𢼁矻郀枯㱠哭桍䧊堀崫㗄圐𦜇跍𩑔䯇窟𩑡𣗺𥈷𥟾𥧋骷𩨳𡑚𡀙𡑣𡼿㵠𦡆𧷎鮬䉐𥌄𧠂𪍠 # kū
    <*𦛏 # kú
    <*狜苦䇢𡞯𩇵𥯶 # kǔ
    <*㠸库俈绔庫秙趶𧿉𧿋焅袴喾𥞴絝𧊘裤𠺟瘔酷廤褲𪌓𨐡𨡱䔯嚳䵈𩱙 # kù
    <*夸𡗢𠇗𡇚姱𥑹㛻舿誇䠸𨕺䓙𨵧䯞 # kuā
    <*侉咵垮㡁銙𢄳𩊓 # kuǎ
    <*㐄𡕒𢓢挎胯𥏤跨䦚骻𨃖 # kuà
    <*㧟𠣲䓒𦳋蒯𡚅擓𣫉𩦱 # kuǎi
    <*巜凷圦块快𫐆侩郐𠜐哙狯𨛖㔞脍㙕塊㟴𢾒㱮筷鲙儈墤䈛鄶噲𡼾廥獪膾𥢶旝糩𦔦䭝䯤鱠 # kuài
    <*宽𥦀寛寬𣎑臗髋鑧髖 # kuān
    <*欵𣢻款歀𥟓𢕫𢴪𣽟㯘窽窾䕀䥗䲌 # kuǎn
    <*匡㑌劻诓邼匩哐恇𢼑洭𤝿𢼳框𦚞硄筐䒰䖱筺誆𧻔𨀕軭𨴑𩢼䯑𩬹𨏆 # kuāng
    <*忹抂狂狅诳𣴥軖軠㾠𦥰誑𨖢𩷗鵟 # kuáng
    <*夼儣懭 # kuǎng
    <*卝邝圹纩况旷岲𡶢況矿昿𣍦贶眖砿𧿈𣒸眶絋絖貺軦𨥑鉱𥈏鋛鄺𨨭壙黋𡾇懬曠爌矌礦穬纊䊯𧥌𨇁鑛䵃𪍿𪏪 # kuàng
    <*亏刲岿𥁇悝盔㨒窥𡐠聧窺䯓虧顝𡤞闚𡓰𪖢巋蘬𩏣𧢦 # kuī
    <*𢌳奎𡌤晆𤵮𠊾逵鄈隗𨾎頄馗喹㙓揆葵䖯䧶𨾗骙𩲅戣暌楏楑𦝢魁睽䟸𩲷蝰𧍜𧡦䤆頯㙺櫆藈鍨鍷𩠮騤𩹍䳫夔蘷𩕜䕫巙虁𪆴犪𥜶躨𩵉 # kuí
    <*𢼀𣄲𣥮𢜽煃𥪊跬頍㒑䠑𩓗㚍蹞䫥 # kuǐ
    <*𤆂𠣠㕟尯𣧼匮欳喟媿愦愧溃腃蒉馈𥏙瞆嘳嬇憒潰篑聩聭蕢䙆䙌𠿥樻𤏜謉𧷛餽簣聵𧑋䙡𧝷𨣈籄䕚𧂠鐀饋𧄑鑎䯣䰎 # kuì
    <*𠚯𡖉坤昆𨱙堃堒婫崐崑晜猑菎裈㡓焜琨𥚛䐊䖵䪲髠裩貇锟髡鹍潉蜫褌髨熴瑻醌錕鲲𥊽𩓽騉鯤鵾𪋆𦌸鶤𧥊𩻋㱎𩽞 # kūn
    <*悃捆阃壸梱祵硱稇裍壼稛綑𧋕𩨫𨁉䠅閫閸𦄐㩲 # kǔn
    <*困𣏔𢈛涃㫻睏𣰘𩤋𣱂 # kùn
    <*尡 # kun
    <*𠚳扩拡括挄𦧍𨓈桰𤫵𦧔𡎒筈萿葀蛞阔廓㾧䟯㗥𡻙𢠛頢𥕏䦢髺𠠎擴濶𨨱闊鞟韕䯺懖𨶐霩𩋻鞹𪗽鬠 # kuò
    <'\uFDD0L' # INDEX L
    <*㕇𤰚垃㡴拉柆翋菈𩨉搚𣤊𤛊𩃜𦒆邋𩤲 # lā
    <*𡉆旯剌砬揦磖嚹 # lá
    <*喇𦎏藞𥗿𥘁 # lǎ
    <*𧗩𧙀㻋𢃴𢉨溂䂰腊揧楋𤊶㻝𩑮瘌𥈙䓥蜡蝋辢辣𠾩䏀蝲臈𧩲𤀦𥖍𥀥𩘊攋爉𦅶臘䗶鬎䱨瓎𥀰䃳𧞪镴鯻䱫𦆻𦒦蠟𨭛䶛𡅘𦇛鑞𩯽𪇹 # là
    <*啦𤷟鞡𩋷 # la
    <*来來俫倈崃徕涞莱郲婡崍庲徠梾淶猍萊逨䧒㥎棶琜𤦃筙铼𣖤𤲓䅘𠎙𢑬箂䋱𦓹𧳕𧯲𧳟𨂐𤢗錸騋鯠鶆麳𪑚䠭 # lái
    <*㚓䂾𧵭𨦂𢅭 # lǎi
    <*唻赉睐睞赖䓶䚅賚𩳆濑賴頼顂𠘝𡂖𡃄癞鵣𡓒瀨瀬籁𦆋藾櫴㸊癩䄤襰籟𨇆䲚𪈈 # lài
    <*兰㞩岚拦㳕栏㑣婪惏𢛓嵐𢉧葻阑𢊓蓝𠼖谰厱澜褴𧼖儖斓篮䍀䦨𢅡懢燣燷藍襕镧闌𡮻𣋣璼𥜓𩈵䆾襤譋𨅏𨅬㘓幱㦨攔瀾灆籃繿蘭𨬒𩔵斕欄䑌𨊔𥌻礷襴𠓖囒灡籣𦧼欗讕躝䰐襽𪇖䪍𨷻钄韊 # lán
    <*览𠓭浨㛦揽缆㨫榄𥦝漤罱醂壈𡒄懒覧𡽳㩜擥𡓔嬾懶孄㰖𤑸𨎹覽䌫孏𨣸攬灠𤣟囕欖爦顲𩟺纜𧮤 # lǎn
    <*烂𢒞㱫滥燗嚂㜮濫爁𤂺𢹙𤃨𩉀爛瓓𧸦𨣨䃹爤鑭𥗺糷 # làn
    <*啷 # lāng
    <*勆郎郞㝗㟍㢃欴狼阆嫏廊𢽂斏桹㱢琅蓈榔瑯𥍫硠稂䆡锒筤艆蜋郒𦵧螂躴䡙㾿𥧫鋃𨱍𩛡鎯𨞿駺䯖𩷕𪁜䱶 # láng
    <*㓪朗朖烺𧚅塱㙟𥇑蓢𠻴樃誏㮾𣊧朤 # lǎng
    <*埌崀浪莨㫰䍚𠺘蒗𩲒𢳑𣻡𧻴閬𦺫𩳤𨶗䕞 # làng
    <*唥 # lang
    <*捞粩撈 # lāo
    <*劳労牢𠈭窂哰唠崂㟉𢚄𢭂浶勞㨓痨铹僗㗦㟹嘮𡑍㞠嶗𣘪䃕𨦭憥朥𤎤𤛮𤩂癆磱𥢒䝁簩蟧醪𪁔䜎𨣃𨲮鐒顟髝䲏 # láo
    <*耂老佬𦒴咾姥恅㧯狫荖栳珯𤶁硓铑䇭蛯㺐銠潦𨡤橑鮱䳓𪀧𡂕䝤轑䕩𣠼䵏⺹ # lǎo
    <*涝烙𤉍嗠耢酪嫪憦澇躼橯𦺜耮𧢋𧯍軂𣟽𡬘 # lào
    <*𦛨 # lao
    <*肋𡃖 # lē
    <*仂㔹阞乐叻忇扐氻艻𣂒玏泐竻㖀砳𤟓楽韷樂𤨙簕㦡𥖪鳓𩐾鰳 # lè
    <*了饹餎 # le
    <*勒 # lēi
    <*雷㒍嫘𡻱𤡂缧蔂䨓𢴱㹎畾䐯擂𣚎㵢㔣𣀀檑𤮎縲𨞽𤮚礌䍣镭櫑瓃羸𧒜𧒽𡈶𤳳𤳴礧𧞭纍罍蘲鐳𡰠𦣄轠儽壨鑘靁𤼘虆𩴻鱩欙𣡧𤜖𥍔𤮸纝鼺 # léi
    <*厽耒𦓥诔𠱤垒䣂㼍𥑶塁絫腂𨻌傫誄𡻭𡼊樏磊蕌䛶磥蕾儡䉂壘㙼𡚗𡾋𡾖㵽𤢹癗藟𨄱櫐矋𦢏㒦𤃻㿔礨𢹮灅𦇄蠝𡿉𣠠蘽讄𨊚𥗬𡿛㶟鑸鸓䴎𣡺 # lěi
    <*㑍泪洡类䣦涙𣨅㲕淚㴃𥅦累䒹𨀤𩵓酹銇頛頪𩛝錑䢮䮑攂𩔗颣𣀜類𥣬𨶺䉪纇𪑯𡔇蘱禷𥤐𥗶 # lèi
    <*嘞 # lei
    <*㘄 # lēng
    <*𨈓崚塄棱楞碐稜𥈮𧼔輘𦼊薐䉄䬋𩩡 # léng
    <*冷 # lěng
    <*倰堎愣睖踜䮚 # lèng
    <*哩 # lī
    <*刕𠛘杝厘𣐬剓㓯㛤狸离荲𨛫骊悡𢛮𢮃梨梩梸犁琍菞䖥䣫𠞙喱𡥽棃𣮉㴝犂鹂剺𠭰漓㹈𤚓𤭜睝筣䋥缡艃蓠蜊䖽𧋎𧋠𧚩䣓𨝏𨝖𨝟𨤫𠻗𠼝嫠孷𢄡𢟢𢟤樆璃盠竰䊍䖿貍𠾆㦒𣁟𣘬𣯤𤗫糎蔾褵鋫鲡黎𥊈䄜䅻篱𦃇縭罹䍠䔆𦺙錅䵓𥲧𥲪𥻿𥼅𦔓䔣䔧蟍謧醨𩭇𪏼嚟㠟𢤂藜𧑇𧫬𨄛邌釐離鯏䱘𪁐𪌱𡃷斄㰀𣞴瓈𥣥鏫鯬鵹䴻 # lí (p1)
    <*䵩𥌛𦢱𪐅黧囄灕䉫蘺蠡蠫𩥬𩥴㒿孋𡿎廲𢌈𧄚𨇎𩻌𪅆劙㰚𣫥鑗𩁟𪒔穲籬䍦𧕮𩆲𪖂纚𧅯𧕯䙰𨯽𩧋𧮛驪鱺鸝 # lí (p2)
    <*礼𠚄𡆯𢏃李里㸚俚峛峢𨛋娌峲浬逦𨓦䧉理䤚㾖裡锂粴𦎐𦕸裏豊䗍鋰𨴻鲤兣澧𣿞𩳓𣀂禮𩷋𥎓𥎔鯉𥴡蟸醴𦪶鳢邐𪕴𣀷鱧欚𧅮𦫈𩽵 # lǐ
    <*力𠠵历𢍼厉𡯄屴𤜜立吏𢨨朸丽利𠛦励呖坜沥𣲒苈例㕸岦戾枥沴疠𥝢苙隶俐俪㡂㤡㤦㧰栃栎𤇃疬砅茘荔𧘫𧲡赲䡃轹郦㑦𠝄𠩵唎娳𡸉悧栗栛𣧿涖猁珕砺砾秝𫁡莅莉𧙉𠪄唳婯𤟑㻎㽝㾐𥁟䅄笠粒粝脷蚸蛎𧉲傈凓𠞉𠞤厤𢩑棙痢𥓃𥬭𦜏蛠詈跞𨜼雳𠌯厯㗚塛㟳慄搮㮚溧𤠫䇐蒚蒞𧧋鉝鳨𠢠厲暦㬏歴瑮綟䓞蜧𢡑 # lì (p1)
    <*𤔨𤡿𤹇𤹈𥉆𥠲蝷𨽻䬅𩗅䰛䴡勵𠪺𡮰𢻠曆㯤歷篥𦃊𦠓䔁䔉隷䬆䮋䰜𩰲𩶘䲞鴗㔏𠠏巁檪濿㻺𤩮㽁𤳓癘磿𨃙𨍫𨞺𨢌隸𩗭𩣫鬁儮𠘞𠘟𠠝𡾒𢤆𢸀曞櫔𤁼爄犡䃯禲𧒈蠇𧽲𨟑鎘𨪹𩄞嚦㘑壢𡤌𡫯㠣𢤩攊櫟瀝𤃀㺡瓅𤻤礪䊪𦅺藶𧯏𨘸𩘟𩘡麗𣀥𣌅櫪𣟌㱹爏𤖢𤘃瓑皪盭𥌤礫糲蠣𨬑𩅩𩞨䮥𩱇䶘儷㒧癧㿨𥌮礰𥨻𥶗𥽗䍥𧓽酈 # lì (p2)
    <*𩴣鷅麜囇𡳸𡿋攦𣦯𤄽𥌿𥷅𦇔䍽𦘊𦪾䘈𧔝𧢝觻䟏躒轢𩆝𠫌欐𥷗𧄻讈𧴠䟐𨇗𨊛轣𪅼攭𣫧瓥㿛𤼚𨏬䥶𨷦靂𣌜䕻𧰡𩙖𩧃𩪸鱱㼖䚕𧥖𩯺鱳靋𩽏䤙𪓀𪖍𪗁𪙺𪙽 # lì (p3)
    <*俩倆 # liǎ
    <*奁连㟀帘怜涟莲連梿𦈐䙺㥕联裢亷𠔨嗹㡘廉慩溓漣蓮匲奩㜕㝺槤熑覝𨽷劆匳噒嫾㢘㦁憐㼓𤬓䁠磏聨聫褳𧡙鲢𢅏𢅖濂濓䃛縺翴𦖾聮薕螊𣀃櫣燫𥲥𦔖聯臁𧐖謰蹥𣝈𥖝䆂䏈鎌镰𩄡𤣆𤾲簾𦆆蠊𨬁䨬䭑𩞙㶌㺦𨎷鬑鐮䥥鰱𪐋籢籨𪍴𪐍𨏩𪖳𨏶𪛒𪚁 # lián
    <*敛琏脸𠗳㪘㰸裣摙璉蔹嬚斂㯬臉鄻襝㰈䌞羷𤑿蘝蘞𩟅𤼏𪍦 # liǎn
    <*练炼恋浰𠋖殓僆堜媡㜃𡟤㱨湅萰链㪝楝煉𤗛瑓潋㼑𠒵練𧍴澰𣿊𤹨𧡴錬殮鍊𧽫鏈𣞰瀲㶑𧸘鰊𣟺𤒦戀𥽸𡆕㜻纞𦣸 # liàn
    <*良俍凉梁涼𤙝𡮎椋㹁辌粮粱墚綡踉𡑆樑𥛫䝶輬䣼𨵶𩘁糧𨄈𨎛𩞯䭪 # liáng
    <*𠓜両两㒳𠯱兩㔝唡啢掚𣓈脼裲𥈘緉䓣蜽䠃魉䩫𩗾魎 # liǎng
    <*亮哴悢谅辆喨𣄴晾湸㾗䀶量䁁輌𨱉諒輛鍄 # liàng
    <*煷簗 # liang
    <*撩蹽 # liāo
    <*辽𠖂疗𣁰𢨺𢼙𤵠聊䒿𩖝𦕵僚𠨥寥嵺𡻪憀漻膋䜮𨖚嘹㙩嫽寮嶚嶛𢄷𢊻敹獠缭遼暸燎璙膫𦺹𠐋㵳療竂𥲊𦗖𧝜鹩屪廫𢸘簝繚𦪕蟟豂賿蹘𪌵爎䜍𧽽𣟆𧂏鐐䨅髎藔飉𩯊鷯 # liáo
    <*叾㝋𣎸䄦𧘈钌䑠㶫釕鄝𪌀蓼憭𧡜𢻢𢿞瞭曢𤑗𨣀镽爒𥗀䩍 # liǎo
    <*尥尦㡻炓料䉼䎆尞𤊽廖撂䢧𣩢𥛰窷𦌒镣𩕐𩴤𪖷 # liào
    <*𦾳 # liē
    <*毟咧挘𨤤䟩 # liě
    <*列劣𡿩𦓤𡭣冽𠛱劽㧜𡊻姴挒洌𤓿𤞊𤱃茢迾𩧮哷埒埓㤠栵㭞浖烈烮𤖺𤱛𥸸捩𣁷𣁻㭩㸹猎猟䅀䋑脟㽟𥪂蛚裂𨕜𣖊煭睙聗趔𡏵𤡕㼲䟹巤𦖩颲𩢾儠𠠗𡁓𡒏𢣓𣰌𤢪𥲁𩭌鮤鴷䴕𡂏𡂩𡓍擸𣝚𤁯𤐱獵𩨐𣋲㯿㲱犣𧀨𧞕䁽𧓐𨆍䉭𥶢𧭌𧭞䜲䝓躐𩆣鬛𤜓𥷨𧰠䪉𩙑㬯𩧆鬣𩼭鱲 # liè
    <*拎 # līn
    <*厸邻林临冧啉㝝崊𡹇淋晽𣇰琳粦痳碄㔂𡻫㷠箖粼鄰隣嶙潾獜𥻋𧹩遴𡰚斴暽燐璘辚霖瞵磷臨䫐𥼭繗翷䢯麐䚬𧲂轔壣瀶鏻𩞻鳞𧃮驎鱗𩻜麟䮼𡿠𩱬 # lín
    <*㐭𠓮㨆菻𥓆亃𧵧凛凜撛廩廪懍懔澟𤎭檁檩癛癝䕲𡬜 # lǐn
    <*吝𨸻㖁𡶱恡悋赁焛賃僯𤌎蔺𧶆𡳞橉𤗷甐膦𦺸閵疄𩣖𥳞䗲𠐼𡃦𤂶藺䚏蹸𥶒躏䫰𩴠䉮𥷖躙𨏨躪轥𧖔 # lìn
    <*〇𠄖伶刢灵囹坽夌姈岺㡵彾泠狑苓𠱠昤朎柃𣬹㸳玲瓴𫐉凌𠡭𤫲㾉皊砱秢𥥋竛铃陵鸰㖫婈𢔁㥄掕棂淩琌㻏笭紷绫䍅羚翎聆舲菱蛉衑𣣋㱥祾詅𧰻跉䠲軨𨠎䧙𡈍𡕮𢩗𤧘蓤𧆺裬鈴𨱋閝零𩂙𩚹𪋾龄𠻠𠻱䈊𥺙綾蔆𧨈𩊂𩖵𩲩𠾥𧱢霊駖䯍𩬔𪌏㲆澪蕶錂霗𩃞𩜁魿鲮鴒鹷㬡㯪燯䉁䔖霛霝齢䉖䨩𪕌𠠢䌢䙥𧾇酃鯪孁𢹝 # líng (p1)
    <*𤃩䕘蘦齡㪮櫺𩟃𤣘𥌼𩆒𩆚𩪥𪅋𦉢𦫃𧕅𧾮䡼醽靈𩆮䴇䴫𩆻𩆼𪋳𥤜𨽲𩇄𩖊𩵀𡿡𢌔㦭𢺰𣌟欞爧𤖦𤜙𤫩麢𤿅䄥𥤞𥩔𧟙𩇎䉹𥾂𦫊䖅𧖜䚖䡿𩑊龗𪛈䰱䴒 # líng (p2)
    <*阾岭𦊓袊领領嶺𥵝 # lǐng
    <*令另呤炩𤷖𨞎𠟨𤨻𩄊𧲙 # lìng
    <*瀮 # ling
    <*𠺕溜熘蹓 # liū
    <*𣱳刘㐬沠畄浏𢏭流留旈琉𤥗㽞𠪐畱𥆦硫𦊿裗𨻧𠗽媹嵧旒𥹷𦀠蒥蓅遛馏骝榴瑠飗劉瑬瘤𥀓磂𥠷𨦰镏駠𩢞鹠橊璢疁𥰣𦃓𦑾䗜𧏓镠癅蟉䝀𩗩駵嚠懰𢤐𢷶瀏藰䚧鎏鎦𨪕𨪿䱖麍𪎣𣞗𣟑鏐飀䱞鐂騮𪃂䉧𥶅飅𩙄䰘鰡鶹𣠚驑䶉䬟𪆱𧮗𪇯 # liú
    <*𠛓㧕柳栁桞珋𦊑𦊗桺绺𨋖锍鉚綹𩖴熮罶鋶橮𦌁𨍸嬼羀 # liǔ
    <*六畂㶯㙀䄂翏𥥹塯廇𢔲𢞭𥛅澑𥧕磟𦉉鹨𢣠𥨌𨢇霤餾𥌐雡飂鬸𩆎鷚㽌𤮷 # liù
    <*囖 # lo
    <*龙屸咙泷茏𩧪㚅昽栊珑胧𨐇眬砻竜𥬆𨺚𤵸笼聋𦨩𧙥隆湰滝㝫嶐槞漋𥪢蕯𠾐㦕𧍰𩂽㡣癃窿篭龍䃧𥪻𥳌𩄺嚨𡃡巃巄𢤲𢸭瀧𤾭蘢鏧霳𪚑𪚓曨朧櫳㰍爖瓏𪚘矓礱礲䆍䙪襱䥢龒籠聾䏊𦪽蠪蠬𪚝𣫣豅躘𨇘𨏠𪚠𡬍鑨靇𩟭𡬕䪊𩙘𪔳𥸉驡䮾鸗𪔷𩙠⻯⻰ # lóng
    <*陇垄垅拢㙙㴳篢儱隴壟壠𢤱攏竉龓䡁𪐖 # lǒng
    <*𠮽㑝𠱚𨛓哢㛞𡱯㟖㢅𢙱㳥梇𥦌𧚂徿𤼃贚 # lòng
    <*䁖瞜 # lōu
    <*㲎剅娄𠳴𡇭偻婁喽㥪溇𤠋蒌𩨇僂𠞭楼𤋏𨻻嘍㟺㡞廔慺𣫻漊㺏蔞遱䣚樓熡耧蝼𤬏䄛𦎹耬艛螻𧢃謱𧰃䝏𧷡軁髅𧁾鞻𩏝䫫髏䮫䱾 # lóu
    <*𢈢嵝搂𧯨塿𡰌嶁摟㪹甊篓𥕍䅹𡗆簍𪍣 # lǒu
    <*㔷陋𠗩屚𠖛𨝢𡪅漏瘘𨦖镂𣤋𦸢瘺瘻𨱐𧫞𨄋鏤𨫒 # lòu
    <*噜撸謢 # lū
    <*卢𡉴庐芦垆枦泸炉㢳𣆐栌㭔胪轳舮鸬玈舻𧆣䡎颅鈩鲈𧇄魲盧䮉𩄅櫚𦿊𪑄嚧壚㠠廬攎瀘獹璷蘆𡳴㪭曥櫨㱺爐瓐臚𤬛𤮧㿖𥀵矑籚纑罏艫蠦𨇖轤鑪𩍼顱髗䰕鱸鸕黸𪖌 # lú
    <*卤𣥐虏掳鹵硵鲁㔪虜塷𢟧𢲸滷蓾𪉖樐澛魯𠿛㢚擄橹磠㯭镥嚕𢋡擼瀂𤣃𧫓𪉣櫓氌艣𧀦鏀𥶇艪鐪𣱀鑥𩯜䲐⻧ # lǔ
    <*圥甪𡴆𤝮陆侓坴彔录峍𡷏𢫫𠀽㓐勎𥫰赂辂陸㖨娽㛬㟤𢯅淕淥渌𤟘硉𥒨菉逯鹿㪐㪖㫽椂琭禄祿𥚊䐂僇剹勠𤽺𤿴盝睩碌稑𦋔賂路塶㜙廘𢊩㦇摝𢾬漉𣼟𤨍𥈛箓粶䎑䎼蔍𧌉𧌍䘵𡀔戮樚𣩏熝𤢊𥛞𥛪膔𦸐䚄觮𧨹趢踛䟿𨁸䡜𨌠辘醁㯝㯟潞㼾𥀔𥉶䃙穋䍡蕗𦼋錄録錴𩛼璐簏𥲎䌒𦌕𦗓𦪇𦽂𦽎𦾞螰𧐳𨽐䩮𩓪𤺼簶𦌟𦾷 # lù (p1)
    <*𦿖𧽥蹗轆騄𩣱鹭𣞓𥣤簬簵鏕𩅄鯥䱚鵦鵱麓𪍄𤻱𩌫鏴露騼籙𨏔𪒏虂鷺䴪 # lù (p2)
    <*氇 # lu
    <*驴郘闾榈𦝼閭馿氀𤗬膢𥰠𢣻𤁵藘𥶆䕡鷜驢 # lǘ
    <*吕呂侣侶挔捛𣭇㛎𢈚𢙲捋旅㭚梠焒祣𦭯稆𦛗铝屡㾔絽缕𦳭𡡎屢膂褛鋁履㻲𧜊膐褸儢穞縷𩄽穭𤾺𧃒𧈔𪈜 # lǚ
    <*寽𠜈垏律𤝽虑率绿𠷈嵂𢯰氯𦊼葎滤𥭐𢟳綠緑𩲦慮㲶箻膟𧍶𢅞𥡢𩳡勴𡀿繂䔞㔧𡾅濾𣀞櫖爈𥖼𩥆𩴐㠥𥶌𦆾𧓻𧭜䥨鑢𠣊 # lǜ
    <*娈孪峦挛栾鸾脔𪢮滦𤲶銮𨄄鵉䜌圝奱孌孿巒㡩𢺈攣曫欒㱍灓𦣋𦣏𤼙羉㝈臠圞灤虊𨇼𨊟𢌕鑾癴𩪾䖂𧖘癵𨈌鸞𨈎 # luán
    <*卵𡡗 # luǎn
    <*乱𠦨𡭸𣨀釠亂𢿢𡄹 # luàn
    <*掠略畧䂮𦊹𠢌㗉锊㑼稤䛚䤣㔀𠼟圙㨼鋝鋢𧎾䌎𧐋𧐯𧑀擽𪅅𧕌 # lüè
    <*抡掄 # lūn
    <*仑伦囵沦纶侖轮𠔕倫陯㖮圇婨崘崙惀淪菕棆㷍腀𤷔𠼩䈁綸䑳蜦𧱜踚輪磮錀鯩 # lún
    <*埨𤲕碖稐耣𦓾 # lǔn
    <*论溣𧣵論𡃝 # lùn
    <*罗𠜖啰頱𪑋囉 # luō
    <*罖𫌨㑩猡脶萝逻椤腡覙锣箩骡𥡜镙𣜄螺䊨𦿌𧷳𦆁羅覶鏍儸覼騾𩮹𡤢𡿏攞𤄷玀蘿邏欏㼈𦣇𧄿驘㽋𩼊鸁籮𦣖𦣛鑼𨰠饠𩎊𩵇䯁𩽰𪈰𪎆 # luó
    <*剆倮𣵟𣂞𤗀𣨪𤔖𤔝蓏裸𠻡𤨗躶瘰𣜢㩡㰁蠃𨬅臝𨟥𢅾㦬㒩曪𡆆癳𩉙 # luǒ
    <*㓢泺𧈦𠉗峈洛络荦骆㪾𣧳洜珞𠶱㞅𤽥䀩㴖硦笿絡䎊落𠻐𣎆𤽼摞漯犖鉻雒𩂣𠏢𥯛𩊚𣛗䈷駱𡁆鮥鴼鵅濼䇔䉓𪌳𩌭𢺆𢺑𧭥𨏒㱻𩍪㿚䌱𧟌纙䌴𧹐𨇽𪇱 # luò
    <'\uFDD0M' # INDEX M
    <*呣 # ḿ
    <*妈孖媽𢳀嬤嬷 # mā
    <*麻痲𡻤蔴㦄犘𤳂𥀏𥉵蟆蟇𢋚䗫𩀪𩔶𩔷䳸𪐎𪓹 # má
    <*马㐷玛码𨰾蚂馬溤遤䣕瑪碼𥧓螞䣖鎷鰢鷌⻢ # mǎ
    <*犸杩祃閁骂唛傌𣨜㑻𢉿獁睰䧞嘜㨸榪禡𩊃𩨲㾺𥉊罵㜫駡𩶞𧪨礣鬕𪒜䯦 # mà
    <*亇吗嗎嘛嫲 # ma
    <*埋𨤢㜥𢠼䁲薶㦟䨪䚑𩍃霾 # mái
    <*买荬買嘪𠿆蕒鷶 # mǎi
    <*劢迈佅売麦卖脉𦙻脈䘑麥衇鿏𥇯勱𩈗𩊍𧱘賣邁霡霢䨫𥌚䜕𦏢䮮𪄳𪒪⻨ # mài
    <*嫚颟 # mān
    <*姏悗䒥㒼蛮僈谩㙢慲馒樠瞒䛲䯶瞞𥊑䅼𥧭䐽𧜞𨲛鞔𥲑䊡𦔔蹒謾𧱼䟂饅𩮉鳗顢䰋鬗鬘𪑪𨲾𩆓鰻𪍩𤜘蠻𢦈𪈿 # mán
    <*屘𥬈㛧満睌满𦎌𧖵滿𩛎螨襔𩈦𥲈蟎䜱鏋矕𧆏 # mǎn
    <*曼㗈㬅鄤墁𡻩幔慢摱漫獌缦蔄蔓𢿜𣁜槾熳𡢚㡢㵘澷镘縵䝡䝢䡬鏝𩅍䕕蘰𤅎 # màn
    <*牤𡘪𤛘𩛲 # māng
    <*邙吂𡵀忙汒芒㝑尨杗杧氓𤰡盲𥐞𥝕恾笀茫𨛌哤娏㟌庬㤶浝狵牻㻊硭釯铓痝𥆙䅒𡩩㡛蛖𡩽䈍鋩𣙷𦎨䓼𩒿駹𩭒𩷶䵨 # máng
    <*𥤩𠈵䖟㟐莽莾硥𦜭茻壾漭㟿𥮎㬒𣯬蟒䁳蠎䒎𪁪𩅁𩙸𩪎𡅖𪚢 # mǎng
    <*𠮵𥁃𥭚 # màng
    <*猫𤚜貓 # māo
    <*毛矛𤝄枆𣬵牦茅茆旄𣭮罞兞㝟渵𨈥軞酕堥𡹰㮘㲠𣹪𨥨锚䅦𨦜䭷髦氂犛𤛖蝥𧍟髳𩬞錨蟊𧐟𧒚𩭾鶜𥎟𧓿𧔨 # máo
    <*𠔼冇卯夘乮㧇戼㚹峁𢨯泖𡜢昴𥄸铆笷𨺸蓩 # mǎo
    <*冃㒵㧌皃芼冐𢘅茂冒𠤝柕㺺㿞眊贸𢂹𣴟𣴼䀤䋃耄𧠊㒻㡌㫯𣨇𤥰袤覒媢帽𢝌𢯾𢽢㴘萺貿鄚愗㪞暓楙𣔺毷𣯀瑁𥟪𦀸𤲰瞀𥈆貌䡚鄮𩫁𢅉𣊃䓮蝐𩛨𩿂䫉懋𦼪𨩩𪃑 # mào
    <*嚒 # mē
    <*么麼濹嚜癦 # me
    <*呅坆沒没枚玫㺳苺栂眉㙁娒脄莓𠪃梅珻脢郿𨜘堳媒嵋湄湈猸睂䍙葿楣楳煤𤚤瑂禖䊈塺槑酶镅鹛𪉏鋂霉穈𧳬𨉭䤂徾𦼻鎇矀𩋿𪂜攗蘪鶥𪃏𣟸𪎭黴 # méi
    <*毎每凂美挴浼𢮇媄嵄渼𠍨媺腜䜸镁嬍䓺燘躾䆀鎂𪎦黣 # měi
    <*妹抺沬𤽃旀昧㭑䀛祙袂𠊉眛𥞊媚寐痗跊鬽𩲈𡲭煝睸𩈐韎𩎟魅篃蝞𩫍𥧴䵢䉋䰨𩴈䰪𧭵 # mèi
    <*椚 # mēn
    <*门扪玧钔門閅捫菛𨳔𩑥𣯩璊𨴺鍆䊟䫒𩔉亹𧄸𤅣虋⻔ # mén
    <*闷㥃焖𧴺悶㱪㦖暪㵍燜懑懣 # mèn
    <*们們 # men
    <*擝 # mēng
    <*甿𥄁虻冡䇇莔萌𦊽𦱋䟥𢄐溕盟䀄𥭮𦳶𦴔蒙𢿂甍𦷹䗈儚𣊔橗瞢蕄蝱鄳鄸𠐁㠓幪懞濛𨞫𨼿㙹𡚔㩚曚朦檬氋𨢊𨢠𨨸𩄖𩶡𠐧𢤘𣰥矇礞䉚䑃䑅𦿏𧀆鯍鹲𣞑𥣛艨𧁊蘉𧞑矒𦆟𦢧𦫰𧂛𧂡䙦䙩𨣘𤼁𥌯𥌱𧭊𧲍䤓霿靀饛䴿䒐顭𩟞䥰𩴲鼆𩦺䰒鸏䴌䵆䲛 # méng
    <*勐猛𤱴䏵𣓝瓾𥂂䁅锰𢕙艋蜢懜獴錳懵𥋝𤯻𤾬蠓鯭𧓨𡬆𩕱 # měng
    <*𠖆孟𠵼梦夢夣䓝𣽭𥉕𡒯䠢䥂霥㜴𧀧㝱𨮒𪅇𡬌𩆽𪇓𪈆 # mèng
    <*掹 # meng
    <*咪眯瞇 # mī
    <*冞𢇲弥𡇒祢迷𨒲袮𡝠㟜猕𥹄䍘谜𤦀𥇆𥿫𦰴蒾𧠟𠞧𥇎𥭫詸𥈕𥮜𦞟𦟂䛧𦖬䴢𪎗謎醚彌擟糜縻䌕𦗕麊麋𪕈禰䤍𨢥𥎖靡𩔢𩞇𩸹𡄣㜷𡾱瀰獼𥵨麛㣆镾𪋗𪓬戂攠瓕蘼爢㸏䉲𥽰䕳䕷𪋢𡬐醾醿𨣾䊳䥸鸍釄 # mí
    <*米芈侎沵羋弭𢘺洣敉𣧲眫粎脒㳽㥝渳𥹫䋛葞㝥蔝銤𪎔濔䱊𪀿𡓭孊㠧灖𨷬𨇻䭧 # mǐ
    <*冖𢆯糸汨沕𡊭宓㫘泌㸓觅峚祕宻𥁑秘密淧㳴𦣥覓覔幂𣓔䖑䛑谧塓㜆𡲼幎𢞞㨠𢱮㴵䁇覛𧵬嘧榓滵漞熐蔤蜜𧼊鼏冪樒㵋𥧧𦸡𧶡䣾幦濗𤛬𥉴𥉿䈿䌏䌐藌𧐎謐䤉𨢎櫁簚羃𧱻𧷦𧽨䮭𪑸𨣯𪅮𪒄𧕵 # mì
    <*宀芇杣𡯫眠婂绵媔棉㮌䃇綿緜臱蝒㒙䏃嬵𢣔𥊿𡒳㝰檰櫋㰃矈矊𥌂𪁼矏𧭇𧸨䫵𣡠䰓 # mián
    <*丏汅免沔䀎𡕢㤁𦬛黾勉眄娩㝃𣧾偭冕勔渑𨟺喕𢃮愐湎缅葂絻腼䩄黽㨺㻰緬𨡞𩾃澠䤄𩋠鮸⻪ # miǎn
    <*𡧍𡧒𣅍靣𥄝𥤵面㴐䛉糆麪麫𥻩𨉥麺𦽃𩈹麵 # miàn
    <*喵 # miāo
    <*苗䖢㑤媌描瞄鹋嫹緢䁧𩳸鶓𪃦鱙 # miáo
    <*杪眇秒𠋝淼渺缈𦳥𡡺篎緲𢷕藐邈㦝𢤧𪃐 # miǎo
    <*妙庙玅竗𢚋庿𥭝廟𤾛 # miào
    <*乜吀咩哶孭𠺗 # miē
    <*𥄲 # mié
    <*灭𢦼烕𥸴𥾝𡞙覕𡟬𢧞搣滅𤊾𡖺蔑𥉓薎鴓㒝幭懱𢨖𤏿篾䈼㩢櫗𥋚𧀅𪌺𥵒𩔠䁾𥣫𧂝蠛衊䌩𨣱鑖𪒍𦇪䘊䩏鱴𪇴𩱷 # miè
    <*民姄岷忞怋旻旼苠𣱈𤇜珉盿砇䂥罠崏捪𣷠䋋𦈏䝧㟩㟭㨉琘琝缗䟨䡑瑉痻碈𦳜鈱𪉎𤸅䁕䃉緍𧌙䪸緡錉鴖鍲𩭷𪂆䡻䲄⺠ # mín
    <*皿冺刡㞶闵抿泯勄敃𢼖𣱉闽𠊟悯𤿕敏笢笽惽𢽹湣𣹒閔愍敯暋㬆㥸閩僶慜憫潣𤛎𦫮𤺖𥜐簢𦌡𧁋𧲃鳘蠠鰵𪄴𨏵 # mǐn
    <*垊 # min
    <*名明鸣洺眀茗冥㝠朙眳𥹆铭䊅𥿨鄍嫇溟猽䆩蓂暝榠銘鳴瞑䄙螟𦡉覭𧱴𥌏䫤䳟𪗸 # míng
    <*佲姳㫥𥥊𠋶凕㟰慏酩𩣶 # mǐng
    <*𧟠命𡥸椧詺䒌𦫭𪂤 # mìng
    <*掵 # ming
    <*𨱯 # miǔ
    <*谬謬 # miù
    <*摸 # mō
    <*庅尛谟𨱱嫫𤋂馍𠻚𡠜𡡉摹模𣻕膜麽摩𦟟魹橅𤹴𥂓磨糢謨謩嚤𡾉擵𨟖饃嚩嚰蘑𩞁髍魔劘𨆽䯢𩟠䃺饝𨰞䭩 # mó
    <*抹𡢜懡𢣗𪎠𣋟䩋𩪮 # mǒ
    <*𠬛𠆮末𠇱劰圽𡊉妺帓𢗿歾歿殁沫𤣻茉𧥟陌𠡞帞昩枺𣧣㶬㹮𥄕䏞唜皌𤿖眜眿砞𥙎秣𦮅莈莫𣶊眽𥞪𥬎粖絈𦥦𦫕䒬𧠓𧰱湐蛨貃𧿴𠢓嗼塻寞𢄏漠獏蓦貊𧻙𩑦𡈗𡻟𢊗𢐖暯銆靺𩑷䬴嫼㱳黙㷬瘼瞐瞙镆𩃁𩢖魩墨㷵𥕓𧼟𩢷䱅𩿣䴲默瀎𥱹貘𦅔藦蟔鏌爅𩄻𪍇䁼𩌧𩐻𩥔驀䳮䁿礳𥽘纆䘃䮬耱𪍤𪏟𪒂𪒇𧕤𧕥𦔭 # mò
    <*怽麿 # mo
    <*哞 # mōu
    <*𣫬牟侔劺㭌恈洠䏬𦭷眸谋𢃱𥿵蛑缪踎鉾𨴍䋷䗋𧎄𩢫謀瞴繆鍪𩶢鴾麰䱕䥐𠥨 # móu
    <*𠀱某䍒𦊋𦊎𦳑𦋡 # mǒu
    <*𥆆𦺒 # mòu
    <*𢘃毪𢜯𤚅氁墲𨡭𨢢䱯 # mú
    <*母亩牡坶姆㟂拇𤝕峔牳畆畒胟畝畞𤵝砪𩡨畮𧰷𧿹𨈶𠺖鉧𢟨踇𩬍𧩒𧬏䥈𪎫 # mǔ
    <*木仫㧅朰目凩𡵬沐狇𤝂炑牧苜𥄈毣㾇䊾莯蚞钼㣎募𣈊䀲𦱒𧚀雮墓㜈幕幙慔楘睦鉬慕暮䑵艒霂𩵦穆𥰻𦃤縸𨍎𩶖𩶩鞪𥣸𨎸⺫ # mù
    <'\uFDD0N' # INDEX N
    <*嗯 # ń
    <*㕶 # ň
    <*𠮾 # ǹ
    <*𧗈 # n
    <*𤓷拏𤔀𦬻拿挐𧘽𡰀𢜲𣸏𧦮嗱䛔镎𧤣鎿䫱 # ná
    <*乸𦙜哪𥑒雫𢡏𪐀𣡰 # nǎ
    <*𠕄那𨙻吶呐妠纳𨚗𩟿𢇵𣅚𤝒肭𩏼𠱲娜𤱅𤱆衲钠𡷝𤬷納䏧𦛐袦𠴾捺笝𥹉𥿃䖧豽䟜軜䇱𧰹貀鈉𩚛㨥𣹵𤭠𤷈𥍲䎎蒳䖓𧋡靹䪏𤸏㵊𤸻魶𪌅䈫𩮅𪗝𡤙𩹾𦣀 # nà
    <*㾍腉䯮熋䍲㜨摨𪌞孻䘅 # nái
    <*乃奶艿氖疓𠧤妳廼迺倷釢𢉓𦶅𦠸嬭𨎡 # nǎi
    <*奈𦓎柰耏耐𦔹𨒨𡨵㴎萘𡞫㮈𣮦渿𡮙㮏㲡𦳐𣉘鼐𥉃褦螚錼𩹟 # nài
    <*囡 # nān
    <*𢪈男㽖抩枏侽南柟娚畘𤱣莮难㓓䛁喃𤽲遖暔楠𨴌𤌔𦶈𨴘𧇙諵䔜𨵴難𩹞䶲𧕴 # nán
    <*𡆤𡆱𡆲㫱赧揇湳萳𧹞煵腩𦝧𨠹𩈑䈒䊖蝻𨦳𩈶戁 # nǎn
    <*𤿏𢬷𦛚婻𩅠㬮𦍀 # nàn
    <*囔 # nāng
    <*乪嚢䁸𦗳譨囊蠰鬞馕欜𦣘𧖒饢 # náng
    <*擃𩜒曩㶞攮灢 # nǎng
    <*𠶬儾㚂𡿝𢖧𧅺𧟘𦈃𨳆齉 # nàng
    <*孬 # nāo
    <*㞪呶怓𢪼𫍢𢙐挠𤞍𥐻峱𥑪硇铙𢜸猱蛲詉碙𨥸𩖯䛝撓𤡤嶩憹𩫔𡽧𡾂䃩蟯夒譊𧴓鐃巎𤫕䴃 # náo
    <*㑎垴𡿺恼𠊦𠡷悩脑匘𡍍𣭺𥒢脳堖㛴𢉵惱㺁嫐𤊲𤋫瑙腦𨱵𩫺𤷻碯𩛋𢅈𩩀𧩣𧳦𩬷䜀䜧獶𦗮𥀮𩤘𧴙獿 # nǎo
    <*闹𣧽婥淖𥆲閙鬧𩋈臑𩯆 # nào
    <*疒讷㕯𢗉抐𣧍眲訥䅞䎪𧤜䭆 # nè
    <*呢 # ne
    <*𨡌𡣢𠑚𠑛𢅼 # néi
    <*娞馁脮㼏腇餒𥡭𩗔鮾鯘䲎 # něi
    <*內内㐻𢁩氝𢛉㨅𣓃𩬀錗 # nèi
    <*㶧恁𨈗𡞾嫩嫰㜛㯎𧮠 # nèn
    <*能䏻㴰𨃳𢆂 # néng
    <*𠹌𨶙 # něng
    <*㲌 # nèng
    <*妮 # nī
    <*尼𠆵坭㞾怩泥𣢞𣭙籾倪屔㹸秜郳铌埿婗淣猊𦤽蚭䘦㪒棿𤦤䛏䝚跜𨋗𫐐𡎿腝𩚯聣𦦃蜺䘽𠽬觬貎輗霓鲵𩾆𩩢𩱄鯢𩸦𩸧麑齯臡 # ní
    <*伱你拟𢘝抳狔苨𡥦柅𤙌𡥨旎晲𦰫𨀀孴鈮𩉹馜儗儞㩘隬𢅟𢣚擬薿𪏸檷𩋪𦆦聻𥜦䕥𧃩𥜬𥷄䦵𩍦𣡋𩯨𩰞 # nǐ
    <*屰氼㲻伲𧈞𣲷迡𠱘𢦱昵胒逆匿𢚮眤𥄽𨺙堄𢛜𦮾𧺰𡞭惄𥇄𠸺𡎳嫟愵溺睨腻𧖷𧵼㥾暱𥺜㦐𣘗縌誽䵑𡣁㵫䁥膩𩈢䵒𪏵嬺㠜𧏾𡫸𨽦𩺝𩺱䘌𪐌𡬗𪙛 # nì
    <*拈𥺴蔫 # niān
    <*年秊䄭𨚶哖𠫺秥䄹鲇𦷙䬯鮎鲶鵇黏鯰𪐇𩽴 # nián
    <*㞋𡰫𠗋𣐏𦭁𠕟涊捻淰焾跈𨋚辇㮟辗𨴞㜤撚撵碾輦𩊫簐蹍攆𤁥䚓蹨𠣇躎𩉄𪑮𨇍 # niǎn
    <*卄廿㲽念姩唸埝𡝟䧔𤽿𥮘𦁇艌𣎔𨢯 # niàn
    <*娘嬢孃 # niáng
    <*𪓃 # niǎng
    <*酿醸𥽬釀䖆 # niàng
    <*鸟𥾇茑𡘏𡝋𡝒㭤袅鳥嫋裊𡠿蔦䦊𠒰樢嬝𢶑褭䮍嬲䙚𩭑㒟𨽖㜵㠡𢸣𣟊䃵𥤂𪅝𩖔𪈼⻦ # niǎo
    <*尿㳮㞙脲𨳀 # niào
    <*捏揑 # niē
    <*苶𢫻𪌿㡪 # nié
    <*𠈊 # niě
    <*㘝𡆣帇𦘒圼㘨㚔𡴎𡶫枿𤴘陧㖏㖕㖖㘿涅痆聂臬啮𡸣𢈸惗𤭂䇣𥬞𦛠𦯖菍隉喦𠶿𡍤敜㮆湼𤶚𥬬𨻄嗫㙞𡰆嵲㴪䂼䄒𦈙𦞆𦵐𧋖𨱺𥔄𥮤𧻼踂𨲀噛摰槷𣙗𣯭踗踙镊镍𩒕䯵𪌊嶭篞臲錜颞𤺐𦄌蹑𩋏𩐭𩣘嚙聶鎳闑䳖孼孽𡾦䌜𧁈𧞍𨶠㜸𡾲櫱籋蘖䯅囁𨙓齧巕𣀳𣌍𣰼㸎糱糵蠥鑈㩶囓𡿖𡿗䌰𩖁讘躡𨊞鑷䡾顳钀䯀𪎃𪎅 # niè
    <*囜㤛您䚾𠽝䋻 # nín
    <*拰 # nǐn
    <*脌 # nin
    <*宁咛拧狞苧㝕柠𫛢聍寍寕甯寗寜䆨寧𣍆𤕦𥧤儜凝𡫃𤹧嚀嬣擰獰薴檸㲰𦡼𤻝𥣗聹䗿𧃱𧭈鑏䭢𧕝鬡鸋 # níng
    <*橣𥳥𦡲矃𩕳 # nǐng
    <*佞侫泞倿澝㿦㣷濘䔭𧑗 # nìng
    <*妞 # niū
    <*⺧牜汼䒜㖻𩲍𩵠𨷁 # niú
    <*𨙺忸扭狃纽𣧊𣲶炄㺲䏔䂇𥝦𧘥钮紐莥𨋀鈕𨳞𥍳𩈇靵𥀝𪏲 # niǔ
    <*𩚖䋴𩙷 # niù
    <*农侬哝浓㶶脓秾農儂𥂒辳噥濃㺜蕽檂燶禯膿穠襛𨑊䢉醲𨲳欁𩅽𩟊𪆯𪒬𩇔 # nóng
    <*繷䵜 # nǒng
    <*弄挊挵𠘊癑齈 # nòng
    <*𠲴𢉕㝹𤟦𣻖𩒔𥀫羺𧂦𧃨䨲𩆟𧅘 # nóu
    <*啂𡝦𡨻𡭾㳶㜌 # nǒu
    <*𢉚䘫槈䅶耨獳檽鎒鐞譳䰭𪋺 # nòu
    <*奴㚢孥𥤨驽笯駑𥱂 # nú
    <*伮努𢪦弩𢫓𠴂𥅄砮胬𧉭𪺹 # nǔ
    <*怒𢫭𧿔傉搙𥛑𧪅 # nù
    <*𦓕 # nǘ
    <*女钕籹釹 # nǚ
    <*沑𥍞𥄋衂恧朒䖡衄䘐䚼𦓖㵖䶊 # nǜ
    <*奻 # nuán
    <*渜暖㬉煖煗餪 # nuǎn
    <*𪋐 # nuàn
    <*疟䖈虐䖋䨋硸瘧𨵫 # nüè
    <*黁 # nún
    <*𡬥𤘟郍㑚挪梛傩𡖫𢰜𠹈𦩜𨁌𦡃𨎭𩴓儺㔮𡿊㰙 # nuó
    <*㛂㡅𡖔𣆚𣃽橠𩷁𩈺 # nuǒ
    <*诺㐡㖠喏掿𥑽逽𠸱愞𢜪𧣚搦𦀨锘搻𢾲榒稬𦂍𧣺諾蹃糑𥻾懦懧䚥糥穤糯𦓢 # nuò
    <'\uFDD0O' # INDEX O
    <*喔噢 # ō
    <*哦 # ó
    <*筽 # o
    <*讴沤欧殴瓯鸥𡈆𠢔塸𡩾漚𥈬𠥝𣂻歐毆熰𤛐甌鴎𥱸䌔䙔𡂿櫙藲謳鏂𩔸䉱鷗䥲 # ōu
    <*𦂕膒齵𪙃 # óu
    <*𠙶吘呕𤵎𣢨偶𠴰腢嘔㼴𥧆𧖼㒖𥻑耦蕅𧪓𥐂𪊪藕 # ǒu
    <*怄𣓕慪𣉾𣽕䌂𤁮𩀫𩥋 # òu
    <'\uFDD0P' # INDEX P
    <*𣱺妑𥐙𣧜𤆵皅𤽉趴𦐆舥啪𧣃葩𨋐𩈆䯲䔤 # pā
    <*杷爬掱琶筢𧣣潖𣚒𧑡 # pá
    <*𥩙 # pǎ
    <*帊帕怕袙𪗔 # pà
    <*拍𦫖𣖐𩛇 # pāi
    <*俳徘排猅棑牌𦩯輫𥱼𣝁簰簲𥴖犤䱝 # pái
    <*廹 # pǎi
    <*𠂢𣲖𣏟哌派㭛𣴪渒𠸁湃𥿯蒎䖰𧵠𥯟㵺鎃𦔠 # pài
    <*㐴眅畨萠㢖潘㽃𤺏𥕿䆺攀𤄜 # pān
    <*爿𤖭洀盘𣔚跘媻幋𤠍蒰搫槃𠽲盤𥈼𥉟磐縏𨂝磻𨃞𨃟𣁦瀊蟠蹣鎜鞶𤻷䃲䰉𦪹𪄀𪒀䰔 # pán
    <*𧺾 # pǎn
    <*冸判沜拚泮炍𦙀𨒃叛牉盼畔聁袢𡞟詊溿𢰿頖鋬鵥𥌊𤄧襻鑻 # pàn
    <*乓沗胮𧿆䏺𠗵𠦲雱滂𣂆膖𩐨䨦𪐿𩅅𪔔霶𦣂 # pāng
    <*厐庞㫄厖逄旁舽𨜷嫎𢐊徬㥬𤧭䅭𩃎螃䠙鳑龎龐𡅃𧔧 # páng
    <*嗙耪䒍覫 # pǎng
    <*㕩炐肨胖𦜍𩈈𥪴 # pàng
    <*抛拋㲏脬萢䫽㯱𣟏𩆘 # pāo
    <*𡯈刨咆垉㚿庖狍炰爮𤔉袍𧙌匏𣮃軳鞄䩝𩎘𩐜褜麃𩗥麅𩎾𪊳𡂘𡾌𥶔 # páo
    <*跑𦐸𢾳 # pǎo
    <*奅𡧙泡炮疱皰砲𠣳𣶐𨋛𣕅𩂞㯡𣚇𦠖麭㘐礟䶌𨣙礮 # pào
    <*呸㚰怌肧𦙂柸胚衃𥹂𤬃𩎜醅𩵣 # pēi
    <*阫𣬆𧴥𨛬陪培㟝𨓿毰𤗏赔锫𩑢裴裵𧳏䣙㯁𣯱𦸪賠駍䫊 # péi
    <*俖𣍺 # pěi
    <*伂𢁖𨙶㤄沛㳈佩帔𢘀姵㧩斾𥄔旆浿珮配䊃㾦蓜辔𩖭馷嶏霈𢥐轡 # pèi
    <*喷㖹噴𠽾歕 # pēn
    <*瓫盆𡺜湓葐𪂽 # pén
    <*呠翸 # pěn
    <*喯𠺔 # pèn
    <*𨑎匉㛁怦抨恲𤘾㧸𢼩砰𦚝𨺀𢏳梈烹硑䍬𦯰𢽩軯𨠟閛漰䦕嘭𡼜㠮澎磞𩱀䥋 # pēng
    <*芃朋挷竼倗莑堋弸㥊彭棚椖𧚋𩖛塳硼稝蓬鹏槰樥熢𧌇𩐛憉䄘𨂃輣㱶篣篷膨錋韸𥕱𨍩髼𪔍𡂫蟚蟛𧴂䡫𩄦鬅䰃䴶纄𦪪蘕𨎧𨲰韼𩡕鵬𨎳騯鬔鑝 # péng
    <*𡗗𢪋捧淎皏𣨞剻 # pěng
    <*𤖳㼞掽椪碰踫𥕽𣟀𨅘𩸀 # pèng
    <*丕伓伾𠡄批纰邳坯𡛡𢓖披抷𢻹𣢋𣬮炋狉㱟𣬼𤬭𤿎𤿐砒𠜱悂𤱍秛秠紕𨤽铍旇翍耚豾鈈鈚𠹦𡲮𢞗㨢𢱧𦀘鈹鉟𢾱𧧺銔䯱劈磇駓髬𪉔噼錃錍𨧦魾鮍憵𧪫𩣚礔礕䫠霹𪄆 # pī
    <*皮𠨸阰㓟芘岯𡶌𢇳枇毞𤘢狓肶毗毘𤘹𥤻𦊁𣪉𣬉疲蚍郫陴啤𠵬埤崥𦨭蚽蚾豼𨈚𢰘𣓋𣔬焷琵脾腗𧲺𨻀㼰𤷒𦳈鲏㮰𣖰罴膍蜱㯅𥯡𦹽魮𪊕𪌈壀𡦟𦃋䲹篺螷貔𧳼𩗫鵧𧑜𧴉羆䴽𧓎朇鼙蠯𩫫𤼜 # pí
    <*匹庀疋仳圮𦘩𦘲𨑜𡛘𤿇苉𡊝䚰脴䚹痞𦰽𡺮𥔁銢諀𨲐鴄擗𥀘噽䫌𤴣癖䰦嚭䤏𩔙 # pǐ
    <*𠯔𠯭屁𤘤䏘㳪𤖿淠𨺤揊𣹚釽𨸆媲嫓𢾇𣹮睥辟㨽潎𤚪稫䤨僻𠪮䡟澼𨵡嚊㵨甓䑀𦤢䠘𨵩𩜰𤂃𨐴䑄𪖞疈譬𧾑闢㿙鷿鸊𪇊䴙𪛎 # pì
    <*囨偏㓲媥𢉞𢐃犏㾫篇翩𧡤鍂𨲜鶣 # piān
    <*骈胼谝𠷊㛹腁𨸇楄楩𦳄賆跰𢕨㼐𪚏𧍲諚䮁骿𧱩蹁𨂯駢𨵸騈𪘀 # pián
    <*覑𡎚貵諞 # piǎn
    <*片𠯯䏒骗魸㸤騗騙 # piàn
    <*𠷻剽慓缥𧌠𩗏飘𡢱𡣋旚翲螵𧽤犥飃飄魒𪋖𨮬𩙒 # piāo
    <*𨝓嫖瓢㼼薸𣝐闝䕯䴩𩡦 # piáo
    <*𦭼殍㹾彯瞟㵱篻縹醥𣋳皫顠𪅃 # piǎo
    <*𣳭票僄勡嘌徱漂㬓䏇𩄷𩮳𪏫 # piào
    <*氕𠟈𠢪撇𢳂𩠿撆暼瞥𩓼𦒐𦗥 # piē
    <*丿苤鐅䥕 # piě
    <*嫳𤮕 # piè
    <*姘拼𢬵𢶳㡦𢣐礗𥖶穦䎙𩰗馪驞 # pīn
    <*𡛞玭贫娦貧琕嫔㺍频頻嬪薲𠐺嚬矉㰋蠙颦𦇖𧔪𧭹𨏞𩕵顰𧮝 # pín
    <*𠮰品𥑓榀 # pǐn
    <*𣎳牝汖聘 # pìn
    <*乒甹俜𦥚娉涄砯𦥤𥪁聠艵𥭢𦀔竮䛣𩈚頩𨂲𩩍𢖊 # pīng
    <*平评凭呯坪𡊞岼泙苹郱屏帡枰洴玶胓𦚓荓㺸㻂瓶𠗦屛帲淜䍈萍蚲塀幈焩𤭔甁缾蓱蛢評𢆟䓑軿鲆凴䈂𦶊慿㵗箳輧𩂾憑𤳊𧏑鮃檘簈𪔾䶄蘋𪋋𪕒𥵪𧂋 # píng
    <*𠗥䀻 # pìng
    <*㧊钋𨸭𠰼坡𡊟岥泊泼𢂤𤽌𧘟䍨𧙅𥬒𦫔𠷑溌𨠓鉕䥽頗𩑼㗶潑𨡩𤀪𨫁鏺𩸿 # pō
    <*婆㨇𢱨嘙𡼃蔢鄱𦃡皤謈櫇𨅅㩯𧂉𩕏 # pó
    <*叵𠰐尀𡶆𣲳𤝯钷𠵳笸𥹖颇𧿽駊𩢘𡽠𨆵 # pǒ
    <*𨑝岶迫敀昢洦珀𧴤㛘烞𤖼破砶䄸釙粕䎅䣪𣍸𦐦𦥭𦥲䞟䣮酦𦑀蒪𩊀魄𠾌𢶉𦑵𨂩醗𦾕䯙𦒟𦿍䪖𩔈䪙𥵜䨰𥗟𦍁𣬚 # pò
    <*桲 # po
    <*剖娝𦵿𧠾䬌 # pōu
    <*抔抙捊㧵掊裒𩚭箁𦺎錇䯽𢒷𩔻 # póu
    <*咅㕻哣婄㰴犃䳝 # pǒu
    <*仆攴攵扑炇𤆝𦬙陠𡜵𢼹𨁏噗撲潽𫚙擈𤾣𧱹䮒𪔿𥼜鯆𧭎䲕𪒢⺙ # pū
    <*圤㺪𡰿匍𨛥𢈲𦮑莆脯菩菐葡蒱蒲僕酺㒒墣獛䧤㲫𤗵璞䈬𨽂濮瞨𥐁穙䈻䔕镤㯷𥣈䑑䗱贌纀鏷𩪛𤰑䴆𪋡𩯱𪖈 # pú
    <*朴𥐚圃浦烳普圑溥暜谱𥛟諩樸氆㹒檏镨譜蹼鐠𩑀 # pǔ
    <*𧙛𧦞铺𩂗舖舗鋪𣋏㬥瀑曝 # pù
    <*巬巭 # pu
    <'\uFDD0Q' # INDEX Q
    <*七𠀁迉沏𥤥妻𣏶柒倛凄㩻栖桤郪娸悽㥓戚捿桼淒𣶠萋攲期棲欺㱦𤘌紪蛣𥇚𧋉褄𧠪僛𠎰嘁𡖾慽𣉓榿漆緀𦖊䣛㠌慼𢴰槭𤳃𥉐𦸓諆𨞢𩒛𡫁𥉷諿霋𣛺䗩蹊䫏魌𠔶㬤𤳤𠐾𥖫𧒕鏚䥓鶈𢻪𩺲𪄭𪒆𧕉𪅾𪒑 # qī
    <*亓𨸒𨸔𢁒祁𨙸齐圻岐岓忯芪亝其奇𢍁𢺷斉歧祇祈肵𠁭俟𠓪𠫸疧竒𠅚剘㟓𢍑斊旂䉻耆脐𦭲蚑蚔蚚颀㖢埼崎㟚㟢𡹉帺掑㩽𢻋淇猉畦萁萕䞚跂䟚軝䡋釮𨱜骐骑嵜棊棋琦琪祺蛴䧵𡦍𡺸愭𤷍碁碕䓅𧌞褀𨥦锜䩓𩉬頎䭶𩨝鬿𢻚𢾦𢾪旗𣯆粸綥綦綨䑴𦫡䓫蜝蜞䭼𩲪齊𡪵璂𥉙禥䅲𦸗蕲𧯯踑䲬㯦𤹸𦔌䐡螧𧎪錡䱈鲯𪗅 # qí (p1)
    <*懠濝藄𧡺𨉸𩳣𪀩䶒𪗆𢩡檱櫀𤪌簱𥼘臍𨪌騎騏鳍䄢蘄䰇鯕𩷾鵸鶀䳢𪂛麒籏纃艩蠐𧓑𩥂鬐騹𩴪鰭𩹵𪄖㰗玂𧰙𩦋𪗍䶞麡𪗏𪙧⻫⻬ # qí (p2)
    <*乞𠧒邔𨙬企屺岂芑启呇㫓杞玘盀䄫𧘗𥫟䎢唘𡷞豈起啓啔婍𡹘啟绮𧙾𡺓晵棨䏿䒻䄎䡔㒅𥔩綮綺䋯𦸆𧼘𩒨䭫䭬䔇諬𩠦𦄊闙 # qǐ
    <*气讫忔𢺵気汔䏌迄弃汽矵𦘸芞𨑤呮𣫱泣炁盵𦙊𨒅咠契㞓𢍆䀙𥄜砌䏠𦚊䒗𧘧𠊔栔氣𦈦𦧉訖𨊰䢀唭𠴹𡹓𡹩𢔆欫𦛰𧙞𡍪夡㞚㣬𢔠𢜱棄𣔘湆湇葺𩨘𢞒䁈䁉碛𧚨𧻕𡻧𡻰摖暣甈碶𥓾䅤𨁐䰴噐憇𣾤𦩣䙄𧡘𧼕𨵆器𡢖憩𢢖𢢞𥉻磜磧磩𦧯𧇜䚉𡽼𤺗䌌䏅𦪊𧽓𦡹䔾䚍䟄䫔𥌁罊蟿𤼅𥷇𪔪鼜𥽳𩧌𥀻 # qì
    <*缼緕簯 # qi
    <*㤉𠜼𠝛掐𢮌葜𣣟𣘟𡤫 # qiā
    <*拤𡘧 # qiá
    <*峠跒酠鞐 # qiǎ
    <*㓞圶冾㓣㓤𠜤帢恰洽𠝘𠳌𢼣𣁴𣨄𥎸㡊殎𤫶𤵹䂒硈𠕣愘𫈰𥦞𦝣䁍䨐𦸉䯊𧩶髂𩩱𥴭𩮁𩷻𩥌䶝𪘺 # qià
    <*千仟阡圱圲奷扦汘䇂芊迁佥岍杄汧瓩茾𨐋𠬾欦䀒竏臤𧘜钎拪牵粁兛悭𣢬𣢲蚈谸𧮮铅婜孯𢃥牽𨓲釺𩨓𢜩掔谦鈆雃僉㗔愆𤿷𥏥签𨝍鉛骞鹐慳𢧥搴撁㪠𤠿箞𦖎𧛓𨦄㩃𣘝諐遷𠠃𢍱褰𨨘𢋔𥱺𥲢謙䞿𧽐𨐩𩋆顅檶𧲀𠔺攐攑櫏簽鵮孅攓𣟋騫䉦𧢞𩪢鬝鬜𪉻𢌍㩷籤𥜴韆𪇇𧟑𠑲 # qiān
    <*仱岒𢁮忴㦮扲拑㸫前钤𠀼歬虔䖍钱钳偂掮揵軡𨺩𠢍𠷁媊𧣑𨜻鈐𨥞𨱫靬𩨃𩨊㨜𦴑鉗墘榩𣖳箝𥮒銭潛潜𥔮䈤𦂒羬蕁𩬚橬𦼓錢黔䁮黚騝濳𥴤騚㩮𨽨灊𧃑鰬䕭𥷪𪈇 # qián
    <*凵㧄𧥛㦿浅肷𠳋䇜𣍰𠊭𢮄淺脥𨺫𠋵𣓅㹂𥦃嗛嵰遣槏膁蜸𩑳谴𩒣𥧬缱𨗦𡒌𧪯𥳐𦅋繾譴鑓䭤𪘦 # qiǎn
    <*欠刋㐸芡𣢖俔茜倩𢂺悓堑𢃘傔嵌棈椠慊𣹥皘蒨𧚫塹㜞㟻歉綪䑶蔳儙槧㯠篏𧮽輤篟䈴壍嬱縴䥅䵖鰜䪈䵛䊴𨰂 # qiàn
    <*鎆鏲籖 # qian
    <*呛羌戕戗斨枪玱羗猐𢈵㳾𦯤跄嗴𡺛椌溬獇腔嗆㾤𦳟蜣锖嶈戧槍牄瑲羫锵𧱡𩿄篬𧇞錆𪎞謒蹌䤌镪𩩝𧽩蹡𨄚鎗𨶆𩣼𣫝鏘𪁸𪙎𡬎 # qiāng
    <*丬𢏄𡸤強𢧅𤕽强墙嫱𡠥蔷樯漒蔃墻嬙廧㩖薔檣牆艢蘠𧭚𩼒𧖑⺦ # qiáng
    <*抢㛨羟搶𥇉𥓌羥墏𢐩繈襁繦鏹𥶑 # qiǎng
    <*炝唴熗𦷦𥴻羻䵁 # qiàng
    <*㤍𡌔悄𢮉硗䂭𥟅郻𨜑𡩇㡑嵪𣖄跷鄡鄥𩨟䯨劁敲𣂇毃踍锹𠏖墝𢄹𢐟頝骹墽幧𢻤𢿣橇𣦜燆𥉾缲𨞶𣜽磽𨃤鍫鍬繑趬蹺䫞鐰𩖇䵲 # qiāo
    <*乔侨𢘟荍荞桥𥁢硚菬喬僑槗谯𨝱嘺嫶㝯𡰑憔蕎鞒樵橋𣯹犞䱁癄䀉瞧礄䎗藮趫𨅣鐈䩌鞽顦𧄍 # qiáo
    <*𨸑巧𢩨㚽䂪釥𡺘愀𥹶䲾髜𦢺 # qiǎo
    <*俏诮陗峭帩窍𨜍𣒆殻𧣌䇌翘㴥𣹝𣺰誚髚僺𡰐㢗撬𠿕撽𢶡䃝鞘韒䆻竅翹鞩譙𪑊躈㚁 # qiào
    <*苆𡛠㛗𠋧𥕑 # qiē
    <*癿𨚧㚗𡶐䦧聺 # qié
    <*𠀃且 # qiě
    <*切𠩂厒妾怯㹤郄匧𤴼窃𠲵㛍𡝍悏挈洯㾀㓶㤲惬淁㼤笡𥿚䟙愜㾜蛪㥦𧚪𧻘𧻧㗫𢲶朅𤷾箧緁𨖰锲𡐤篋踥𨉪穕𥪵𦼰藒鍥𡂠𦿋𧑨𧫕𨄊䤿𩣴𦆍鯜𠁠鐑𪑗𢺅竊籡𣠺𪙌 # qiè
    <*𡵑𣢐亲侵㓎钦𤥓衾骎𣆲媇嵚欽𥍯㾣綅誛䜷嶔親𧯃䃢顉駸鮼寴 # qīn
    <*㘦𥘋𨙽庈芩芹㪁𣪄𤴽𨛣㕋埁珡秦耹菦蚙捦菳琴琹禽鈙鈫雂勤嗪嫀㮗溱𨾰靲𩎖𠘅慬𤚩噙擒斳䰼鳹㢙懄㩒檎澿瘽𥎊𥱧螓䦦懃𣜣䔷蠄鬵鵭𠓿𥎡𪒭𪒯 # qín
    <*𠔎坅昑𢫲𤙋笉梫𦯈赾寑㾛锓寝𤿳𠻨寢𧼒鋟𩓒螼𡫧𩔟𥵧𧾏㝲𪙟 # qǐn
    <*𠖶𠦎㞬吢吣㤈抋沁𠜘𤵂唚𦧋𡹢菣揿𣨠𩂈搇𢱶𩐙𣖯撳䈜瀙藽𩔝 # qìn
    <*𠨍靑青氢轻倾卿郬圊埥寈氫淸清𨓷傾𨻺𩑭蜻輕䨝鲭𩗼𪏅𨆪鑋𧕙𣫨𥃟𠑴⻘ # qīng
    <*夝甠𧖪剠勍情殑晴棾氰葝暒擏樈𣩜䞍擎檠㯳𩷏黥𪄈䲔𩽡 # qíng
    <*苘顷𠗝请𡲀庼頃䯧廎漀㷫請𩒵䔛㩩檾𡄇𢹃𩔥 # qǐng
    <*庆凊掅殸䋜碃䡖𤭩箐靘慶磬𥱨𩇝儬濪罄𩇟㵾謦櫦𡄔 # qìng
    <*硘 # qing
    <*芎𥑎 # qiōng
    <*卭邛宆穷㑋穹茕𡊼桏𤤑㧭𣑦𤤶𥑱𦭭𡸕㷀䅃笻筇赹𠌖𡞦惸𣇬焪焭琼䊄舼𦨰蛩蛬𩑓𡦃𡺺𢞏煢熍睘䓖跫𨀯㒌㮪銎𩨯瞏窮䛪䠻𩬛儝憌𢶇橩璚䆳𩢽𩬰𠤊𣜧藑𨍶𪀛𤢶瓊竆𥳎𦦧𦾵藭𣋶𥨪㼇瓗 # qióng
    <*𢮍𣶆 # qiòng
    <*𠀉丘㐀丠邱𠰋坵𡊣㚱㳋恘秋秌𥫷蚯媝萩𧲰楸䐐蓲鹙𥔻篍緧蝵穐𧏋趥䠓𨍊𧇸䨂鳅蟗鞦鞧蘒鰌鰍䲡鶖𪍗䆋蠤𪚺龝 # qiū
    <*叴㕤囚扏犰玌𢦎汓㺫肍求虬𢘄泅䊵𦬖虯𨒊俅𠗈㧨𣧝觓訄訅䜪酋釓唒㛏㞗㟈𢈝㤹㭝浗𤞰紌莍逎逑䣇釚䤛𢛃梂殏毬𣭳𤕾球赇𧺤𨟽釻𨺧𡲚崷巯㥢渞湭皳盚𥥽𦰪𧣕遒𨱇煪㷕𥭑絿蛷裘𩵍巰觩賕𧻱䟵璆䎿蝤銶𨲒𩾁𧤕醔𩒮𩗕鮂鼽𩔕鯄𧔭鰽 # qiú
    <*𧻁搝𦦄糗𩝠𩈸 # qiǔ
    <*䟬𨕦䠗𪖛 # qiù
    <*区曲𨸟伹佉匤岖𢌷诎阹驱坥屈𡱅岨岴抾㭕浀㸖祛胠𢼰㻃袪䢗區𥬔紶𦛕𦛱䒧蛆䖦躯𣮈筁粬䒼蛐𧠢詘趋𨱊𡳆嶇憈䈌𥺷䓚䓛𧌑䧢𩖷駆㠊𢴮敺𦸶誳镼駈麹𨧱髷魼𧐅趨麯𪌬覰𨄅軀𩣹麴黢覻𩪍㘗驅𥶶𥽧鰸鱋𪛃𧾶 # qū
    <*𢦌佢劬㖆斪朐胊𠣪菃衐鸲𡱺㲘淭渠絇翑𦐛𦕙葋𧊛𧲵䞤軥𪉌𡲰𠍲𣖪𤨎䋧蕖𩉿𠏛𡡥㣄璖𨞙𨼫𨼽𪌆𣯸磲𥧻螶𨐣𨞳𩢳鴝𩿥𩿩𪀊㯫𣰋璩𦼫蟝𧝔𣰠𣰡瞿䆽𦄽𪁖䵶鼩蘧䝣䟊𨎶㜹𢌄𢎖忂灈𪄊戵欋氍𣰻𥃔籧臞𧄒癯䂂𥗫𧕎𩴹𪆂𦔬𦣒蠷衢𪍸𧾱躣蠼鑺𩵅𩧘𩽩鸜𩇐 # qú
    <*取𤖬竘娶𧉧𨓭𡟥詓竬蝺𦗛龋𪋄䶚齲 # qǔ
    <*厺去𠇯刞呿㧁㫢㰦𤙏唟耝阒觑趣閴䁦䠐𩿟麮闃覷鼁 # qù
    <*迲 # qu
    <*𠛮奍峑弮恮𩧴悛圈㒽圏𡈉棬𥁸𦋓駩𨩸𨟠鐉䌯 # quān
    <*𢎠㒰全权佺𠤹诠𨛈姾𡴔泉洤荃𡇮拳牷𧈾辁啳埢𡙅婘惓𣍴𤥷痊䀬硂𨜩铨𡙐㟫𡺟湶犈筌絟𦓰葲搼楾瑔𤷄觠詮跧輇𠥙蜷銓権𧍭踡縓醛𩜬闎𩓫鳈𩘘鬈騡孉巏鰁𡰝𢑆權齤𤜍䑏𤬠𥤊蠸颧䟒䠰𦏮顴𪈻 # quán
    <*𡿨犭犬汱𤰝畎烇𦨚𢔑绻𣸋䅚𥹳䊎綣𪐂虇𧸾⺨ # quǎn
    <*劝券牶𢍕勧䄐韏𨨗勸𦍅 # quàn
    <*椦 # quan
    <*缺𥆸蒛阙𩨭𩨷𧎯𩫠𥗮 # quē
    <*瘸 # qué
    <*𡉉却㕁𤿋卻埆崅㱿㹱𥩢𡇱悫琷雀𠞗㾡𤿩硞确阕塙搉㴶皵𤿵碏䇎𨴊鹊愨𢠬㩁榷𣤇𤷽䍳𨴒墧慤𣪹𥀎確碻趞䲵𨞩𨵗䧿𣛵㲉燩𥕹𨢜闋䦬礐闕𩤈𤣅鵲𪏈㰌㱋礭𥗙𥜵𪏨𪖀𧢩𧢭 # què
    <*夋囷峮㟒逡𡈀𢛕𩎗𦽖𩤁 # qūn
    <*宭帬㪊裙羣群裠䭽𤸷𨞗𤛭𣀄㿏 # qún
    <*𦃢 # qǔn
    <'\uFDD0R' # INDEX R
    <*𠯍呥𢓒肰𤱋衻袇𠊌㾆蚦袡𡖝蚺然𤙼𠤀髥嘫㜣𤡮髯燃䫇𪓘㲯𣰦𥳚繎䔳𪓚𪚮㸐䳿䕼𦫉䖄 # rán
    <*冄冉㚩姌苒𨹌𩧬𠱞𡜉𡜫染珃䒣𥬕䎃媣蒅𤲗䣸䤡㒄㿵𩢡橪𩶎𩃵𥀭 # rǎn
    <*𥣹𥣺 # ràn
    <*穣儴勷𨟚瀼獽蘘𣰶禳瓤𤰂穰𧟄䉴躟𩆶鬤𤬥 # ráng
    <*壌嚷壤攘𣩽爙䑋𥗝𨏛𤅑纕 # rǎng
    <*让懹譲讓 # ràng
    <*娆荛饶桡嬈蕘橈襓𦪛饒㹛 # ráo
    <*扰㑱隢𡈦𠒸𧳨擾𨇄 # rǎo
    <*绕遶繞 # rào
    <*惹𢞇 # rě
    <*热𧧏熱𤑄𩭿 # rè
    <*人亻仁壬𡰥忈朲𢇦忎秂芢𧥷鈓䛘魜銋䌾𦏀鵀⺅ # rén
    <*𢆉㣼忍𦬄𠲏荏栠栣荵秹𩠈棯稔綛躵䭃𩑉 # rěn
    <*刃刄认仞仭讱任𠯄屻岃㠴扨纫⺶妊𣅉杒牣纴肕轫韧饪䀔䏕姙祍紉衽㶵紝訒𧴬軔梕㸾袵䇮絍䋕腍葚靭靱韌飪𨉃認餁𩵕𪔺⺷ # rèn
    <*扔 # rēng
    <*仍𨸐𠮨辸㭁礽𠯷𠯹䄧𠧟𥾋㺱䚮陾𣗐𧹈 # réng
    <*芿 # rèng
    <*⺜𡆸𡉭𤝍驲囸𦨙䒤釰鈤馹⺛ # rì
    <*茸 # rōng
    <*戎㝐肜栄狨绒茙荣容峵㭜毧㲓烿𥑳䡆𠞕媶嵘搑䇯𥬪絨羢䘬嫆嵤搈榵𣮪溶蓉㣑榕榮㲨𣯏𣯐熔㺎瑢穁㼸𥎂縙蝾褣镕䈶𦗋融螎𧎣駥髶㘇嬫嶸䠜𨉴𨉷䡥䤊𨲟爃𥼬𦗨鎔巆瀜䩸曧䇀𥨳蠑𩮠𩍉𪃾𩎂 # róng
    <*冗宂𡦼坈𠰽𡊫𣲽𨒆𡊸𢫨𤘺𤘻傇𡖢𢦿𣭲𧉡㲝軵𨋠𩚗𣯍𦶇𨌣𨍅䢇𡭋氄𣰇𦔋𨍷𪕁𡫦𪕎𥎜𢐿𪗴𩼅 # rǒng
    <*𠌚 # ròng
    <*穃 # rong
    <*厹禸柔粈𨛶𦍭媃揉渘葇煣瑈䐓䧷㽥𥠊糅蝚蹂輮𠠐鍒鞣瓇騥䰆鰇鶔𪑶 # róu
    <*𢔟楺韖𡗑 # rǒu
    <*⺼肉宍腬 # ròu
    <*㐵邚如侞𨚴𡜚帤茹桇𣭠𥙦𦤊𦭰㾒𥞚䋈袽铷㨎渪筎𧊟𦳾蒘𣖹𦷸銣𣽈𣽉蕠蝡儒𠟺𣚐鴑嚅嬬孺濡薷𩄋𩶯鴽曘燸襦𩸐蠕颥𡄲䞕醹顬䰰鱬 # rú
    <*汝肗乳𡜃辱鄏𡮚𪏮𨨜擩𡫽𪑾𩍥 # rǔ
    <*入扖𢖵杁洳𢛚䄾嗕媷溽缛蓐鳰㦺𣯋褥縟𩶫㹘𩱨 # rù
    <*嶿 # ru
    <*挼 # ruá
    <*堧𢱾𤲬𥈇撋𣽳䙇壖 # ruán
    <*阮𢘧朊𥩗软耎𨒩䎡偄㓴軟媆㮕瑌𤧠㼱𠤦𥎀碝𢡵𥯬緛䓴𣃅𦺾䞂輭𥊶瓀𩏈䪭㽭𥎘礝𣡗 # ruǎn
    <*𨨰𨪳𨬔 # ruàn
    <*婑桵甤䅑緌蕤𦼆䬐𣬘 # ruí
    <*𡯒蕊蕋橤𣛚𥳝繠蘂蘃𧄜 # ruǐ
    <*汭芮枘䄲蚋㢻䇤㓹䂱锐𨳙瑞䌼蜹睿䓲銳鋭叡𨧨𢣳㪫㲊壡𪏩 # ruì
    <*𥆧瞤𩀋 # rún
    <*𠷀 # rǔn
    <*闰润䏰閏閠㠈潤䦞橍膶𨷎 # rùn
    <*捼 # ruó
    <*叒𤣼若偌弱鄀渃焫楉嵶蒻𨀝箬䐞𨴚𤍽篛𦩸爇鰙𧃪鰯鶸 # ruò
    <'\uFDD0S' # INDEX S
    <*仨𣬬挱挲撒𥋌𠬙 # sā
    <*洒訯靸𨐖𩎕𩨞潵𡄳灑躠𥸗 # sǎ
    <*卅𠦃㚫𢓔泧钑𠱡𢫬飒脎萨鈒摋隡馺㒎颯䬃𠎷𡐥𢕬𩗉𠿓𡒁㪪䊛𥻦𦻅𦼧薩𩗞𢻨𣜂㽂𦠿𨃛𩐅櫒𧀕䙣𥵯𨆂𣀯𨷆𩆅𧭝虄 # sà
    <*𠮿 # sa
    <*毢愢揌塞毸腮嘥噻㩙䚡鳃顋䰄鰓𪃄 # sāi
    <*㗷䈢㘔 # sǎi
    <*嗮𦞫赛僿賽簺𡬉 # sài
    <*三𣬛𢁘弎叁𦙱𦙸毵毶厁䈀𧱆毿犙𧽾𣀫鬖𩯑 # sān
    <*仐伞㧲傘𡙘𥒬䊉𢕕糁𦷻糂馓𦺻糝䉈糣糤繖鏒𩀲𩞀鏾𩀼霰䫩饊 # sǎn
    <*𨸃俕帴悷㤾散㪔㪚𣮠閐䫅𦡨𧗋𣀧 # sàn
    <*壭橵 # san
    <*桒桑䘮𡠏槡𧍨𨢆𦅇𩐷𩦌𪔬 # sāng
    <*嗓搡𥔫𦟄𤸯磉褬颡䡦鎟䫙𣞙顙𩺞𡕏 # sǎng
    <*丧喪𣉕𣊝 # sàng
    <*掻𠋺慅搔溞骚𢔳㥰𤠘𣉔缫𦞣𤢖𥰱螦繅臊𩙰鳋𨪊騒𦏛騷𧂩𩮚鰠𩙈鱢𧖠 # sāo
    <*扫掃㛮嫂𦺋𦾘䕅 # sǎo
    <*𦕏埽𢮞𢜶𢠡㲧瘙𨧪氉𣰕𨃣𢤁㿋矂𧑫𩫦髞𪍻 # sào
    <*閪 # sē
    <*色𡵶洓栜涩𦐅啬𠵭𢃢渋铯雭歮琗嗇瑟㒊㥶歰銫𠎸𠟦𠟩𠢳𠽼𢡉澁𣽤㻭𥈽𧨷𩃑𠿗懎擌𣚟濇濏𤖗瘷穑𥱁𥻨䨛𩊯㱇澀𤛷璱𡫟瀒𤁧穡䔼𩄜䉢繬𦆄𧈈𧒓𧒗𢀋穯𨆙轖鏼譅𩇣𩍙𩏫𩕡飋𩰙𤾿𥷹 # sè
    <*森椮槮襂𧂅𣟹 # sēn
    <*𩕌 # sěn
    <*僧䒏鬙 # sēng
    <*𡬙 # sèng
    <*杀㠺沙𣲓𣲡纱乷刹剎砂𦭉唦𢼵殺猀粆紗𦕉莎桬毮㲚𣶤㸺铩𡺧痧硰𦱵𢩖煞𦀛蔱𧋊裟𣉜榝𣻑𤍁樧䤬魦𩵮鲨𢅑𢶌𩊮𣛶𨪍鎩鯊鯋𪌮𤑣𩮫𪄅𣡽 # shā
    <*傻儍𧫝 # shǎ
    <*𠚺𢇗𦔯𦔰倽唼啑啥帹㰱𤟃萐厦喢𣓉廈歃㰼𣣮翜𠍽𣣺𥈊箑䈉翣𧻵𦩿䝊𧳛𨖷閯㵤𧏫霎䬊𦾚𨘉𧲌 # shà
    <*繌 # sha
    <*㴓筛酾㩄篩簁簛釃 # shāi
    <*𢄌繺 # shǎi
    <*晒𩂃𩂝𧜁閷㬠𨢦𩴇䵘曬 # shài
    <*山彡邖圸𣲀删刪杉芟姍姗䀐苫衫钐埏挻柵狦珊舢𣧺痁脠軕𣆴笘閊𩁺跚剼搧𣖉𦳫䘰𧛄𧲾𨝩嘇幓煽㺑𦎞𧛡𨁆𨝵潸澘𥊀𦺭檆縿𦏂膻鯅羴𪑃羶㰑𩌰𨏪 # shān
    <*𧨾 # shán
    <*闪㚒𢒉陕𨹈𨹊炶𤇄𥄘陝𧴭閃㪎晱鿃𡟨㨛㴸煔𤊼睒熌𥈚𧧵𢿈𣪶覢𠿞䠾㶒𢒹𩆤𩆫 # shǎn
    <*讪𠚹汕𦘹㣌𢫔疝剡𠫹㣣扇訕䚲赸掞𦍸釤傓善椫𣓒銏骟僐𦶋鄯䴮墠墡潬𥔱缮嬗𢕻擅敾㪨樿歚𣩧𥰢膳𧎥䱇䱉𤺪磰謆赡䡪𤮜䄠繕蟮𧷶䥇䦂蟺譱贍鐥䦅饍騸鳝𢩢𩟋灗𩦐𧭽鱓鱔𪍶𥸣 # shàn
    <*伤殇商觞傷𠼬墒慯滳漡𥏫蔏殤熵𤎘𧶜𤳈螪觴謪𨢩𨶼鬺𪄲䵰䵼 # shāng
    <*垧扄晌赏賞𧡮𩞃𩞧贘鑜 # shǎng
    <*丄上尙尚恦𤵼绱𤔚緔鞝 # shàng
    <*裳 # shang
    <*弰捎烧莦𢼼梢𥙬𠷃焼稍𨱭旓筲艄蛸輎𨲆𩬏𡡏蕱燒䈰颵䈾𦄏髾𥳓鮹 # shāo
    <*勺芍苕柖㸛玿𢦽𤱠𦯐韶㲈 # sháo
    <*少𨙹䒚𨈘𢾐㪢𧣪䔠𦿃𥵦 # shǎo
    <*劭𠧙卲邵绍𨛍𠣫哨娋袑𤉎紹䏴睄䙼綤𦓴䬰潲𧳹 # shào
    <*奢猞𥿞赊畬畲輋賒賖𠾏檨𩩗𨣍𡄢 # shē
    <*舌佘虵㓭𠋞𦯬蛇𧉮𥝀𣸚蛥𦴍𧵳䞌㵃𢶅𦼢 # shé
    <*舍𢉃捨䬷 # shě
    <*厍设𢗭社舎厙射涉𠴯涻渉設赦弽㴇𤙱䠶慑摂摄𣣭滠𤠭䀅𥁹𠪣慴摵𥔡䄕𦁗蔎𨝫𩂨𩂴𧮿䤮歙𤺔𣝒蠂韘騇𩮐䜓懾攝灄麝欇𥍉𩙝 # shè
    <*谁 # shéi
    <*㕥申屾扟伸𠃫身侁呻妽𢏎𢘊籶绅罙诜㑗姺柛氠珅穼籸𥸬娠峷𢈯甡眒砷𥥍莘𧢹𨐍堔敒𣇗深紳兟𡖬棽𣔗𤶴𥆣𥥿𦜊葠裑訷𦐹蓡詵𨐔𨐕𨝐𠻝㮱甧蔘𩉼𣘘𣘲𦸂𦸯㜪燊䅸𦺷薓𨞲駪鲹曑𥳱鯓鵢鯵𨊘鰺𩺵䯂 # shēn
    <*什甚神榊䰠鰰𤕊 # shén
    <*㚨邥弞审矤哂𢈇矧宷𢏦谂谉㚞婶渖𥬐訠㾕𥏖𠘆審𡼬𢊲諗頣魫曋𣿇𤏗𩶇瞫嬸𢸙瀋㰂𧀯覾讅 # shěn
    <*𠂧肾侺昚胂涁眘㰮渗祳脤腎𦜜𠗿愼慎椹瘆䆦罧𦕽蜃蜄𢊖滲𨴐㵕鋠瘮𦌀 # shèn
    <*升生𢦑阩𠇷呏声斘昇枡泩狌𥘥苼栍𣢡殅𣬺牲珄竔陞𠴢曻㱡陹笙𧿘湦焺甥𤚣𥟎𨕻鉎𦖞𨁠䲼䴤聲鍟鼪鵿 # shēng
    <*绳縄𦩱憴䱆繩譝𩍋 # shéng
    <*省眚偗𨜜㗂𡞞𡨽渻㮐𦳗㼳㾪䁞𦔄𧍖䪿䚇𨲓𨵥 # shěng
    <*圣𨚱胜晠剰𤯡盛𦛙剩勝𦕡貹嵊琞聖𠓸墭榺蕂橳𧡶𠓽𧪝賸䞉𪅻 # shèng
    <*尸𢀕失师𠇳𠓤𢻫呞虱诗邿鸤屍𢺿𢼉𢼊施浉狮師𣁒絁釶𠷇𡟕𢧏湤湿葹䙾𧠜𧠡𡠋溮溼獅蒒蓍詩鉇鉈瑡𥍸𧍀𩒂𫚕鳲𤹌𥛨蝨䗐𧜂𩬭鳾䴓𣤘褷𧩹鲺濕𦒈鍦𪀔𡂓鯴䌤䏉𩥐鰤鶳𥜰𦌿襹䌳𪓻𪓿 # shī
    <*十饣𠥿𨙩石辻䦹乭䂖𠯰𡚼时𥐘竍𠩔𠰴实実旹𣏚𣧚飠姼峕拾炻祏蚀食埘時䄷莳䖨㖷寔𡺔湜遈塒嵵𢻘溡𥇲蒔鉐實榯𤸤蝕㵓䈕𦔂鲥𡀗鮖䲽鼫𡫵𢨝識鼭鰣𧄹䶡⻝⻠ # shí
    <*𠘪史𢁓矢乨㕜𡰯豕使始𡱁𡶈驶兘宩屎㹬𣆘㹷䂠𥑏笶䒨𦰯榁𦳊鉂𨴯駛𩰢𪊢𩭐𪗧 # shǐ
    <*士氏礻丗世𠀍仕市示⺬似卋㔺式忕𤜣⺮𨸝亊叓𡉸戺㹝识事侍势呩𠰚柹㳏𤆰视试𨒍饰冟𠡥室𡷈𢂑恀恃拭是昰枾柿𤯄𤯜眂䏡贳适𨒧栻烒𤖻㸷眎眡𥅔𥫴𦚨舐轼逝铈𤉏𥅞視𥥥𥿅豉䟗釈𨱡媞崼𢃰弑徥𢝬揓𧊖䛈谥貰𧵋释㒾勢嗜弒煶睗筮觢試𧧅𧳅軾鈰鉃䩃飾㱁𣬐舓誓𧻸適鉽𩛌𩛏奭䊓銴䤭䤱𩗎餙餝𠁗噬嬕澨𥰰 # shì (p1)
    <*諟諡遾𨽄螫𧝊謚𨟂䭄𡣪𤢼䁺簭𦿇𩋡𤑦𥼶襫釋鰘𧞲𡅵⺭ # shì (p2)
    <*佦𥫽匙篒籂 # shi
    <*収㧃收𠈅𤙘𤱜𥅪𤚔 # shōu
    <*手㝊守𦣻垨𡭮首𥾹𥅷𧵃艏䭭𩠶 # shǒu
    <*寿受𠱔狩兽售㖟㥅授𣒻涭𥙰绶痩膄𧚯壽夀瘦綬𧌅𧜃䛵獣𧤙𨱒𥨝𧯼獸鏉𩴍𧈙𪈀 # shòu
    <*扌⺘ # shou
    <*𠘧书殳尗𡧔抒纾㑐𠙎叔杸枢𨐅陎姝𤕟倏倐書殊㸡𤱐紓𦈌𦤂𨛭掓梳淑焂㼡𥿇菽軗鄃疎疏𤴙𦐣舒𧠣𢞣摅毹毺綀𦈷输𩛅𣉛瑹𦶕跾踈𨁀樞蔬𩳅𦺗輸𩾈橾鮛𩷌儵攄𥳕瀭䱙鵨𣰿𪅰𦍄䨹 # shū
    <*秫婌孰𢧇赎塾㒔𡦛熟䴰䃞𧇝𩢻𡒒㯮璹𣤯𨶝贖𨷙 # shú
    <*𡤽𥍝𡱆鼡䞖䑕属暑暏䝪黍署蜀鼠潻𢋂𦺪薥薯𨽉曙㻿癙𤻃𥣋藷𧑓襡糬𧒑襩屬𧄔蠴鱪鱰𣀻 # shǔ
    <*朮术戍㣽束𡊍𣏗沭𤘷述侸咰𠲌怷树𤞉竖𦒶荗恕捒㾁𠊪𡔪庶庻絉蒁術䘤隃㛸尌㡏㫹㷂𧗱裋䢞𨔦㜐数㽰竪腧鉥墅𢠫漱潄㵂𣻚䜹䢤𠾢數澍𤍓𤗪豎樹濖𦠦𧼯䠼錰𪐧𠐊𡣈䉀䝂𡂡𧞀䩱𪌶𨅒鏣鶐𧞫㶖虪 # shù
    <*𠛚刷㕞唰 # shuā
    <*耍𤔙𩈥𩤤𩉆 # shuǎ
    <*誜 # shuà
    <*衰𤠠摔㲤𤸬𤺀𨄮 # shuāi
    <*甩 # shuǎi
    <*帅帥𠌭𢕅𢕑𣼧𣘚𧍓䢦𧜠蟀𧗿𩘱卛 # shuài
    <*闩拴閂栓𣔫𢩠𣟴𣠸 # shuān
    <*𢮛涮腨䧠𦺲𡭐𨄔𨏉𤅲 # shuàn
    <*双㕠霜雙孀𩅪骦孇騻欆礵𧄐鷞鹴䌮䉶艭𧕟䝄𨇯𩆿驦鸘𩽧 # shuāng
    <*爽𠗾塽慡漺樉𡑽𥡠縔𥱶𦄍䔪䗮𧴅𦆌鏯䫪 # shuǎng
    <*㦼𥲚灀𧕺 # shuàng
    <*脽誰𧀣 # shuí
    <*水氺𡯑𢏅𤆙𡱊𦙙𥫸⺢ # shuǐ
    <*𢇤㽷帨涗涚𦣢𨓚祱稅税裞㥨睡𠻜瞓𨿠䬽𩩞𥌘䳠𩟥䭨 # shuì
    <*氵閖⺡ # shui
    <*吮𨺠 # shǔn
    <*顺䀢㥧䀵舜順𨝜蕣橓瞚䑞瞬鬊䴄 # shùn
    <*说哾說説 # shuō
    <*妁烁𠲾𠲿朔䀥铄欶𣷥硕𣸛矟搠蒴槊㮶𣻘獡碩𦋞𪎒𤡯箾𦂗𦃗𨨺𣝇𤢴鎙𣀝爍䁻𥌞鑠𩟧 # shuò
    <*厶纟丝𠀓司㺨糹㠼𤣵私咝㟃𣂖泀𤆟𥝠俬思𢦲𦭡虒恖𥄶鸶𠖓𢛥𦮺媤斯絲缌蛳𢊀楒㴲㺇禗鉰飔凘厮榹禠罳蜤銯锶嘶噝𡡒廝𢠹撕澌磃𥠱𥯨緦𦸷蕬鋖𣚄燍螄㽄𥐀𥕶𦽕𧝤䔮𧀚蟖蟴颸䡳䫢騦鐁𩅰𩺛䇁𨮭𪕳䲉鷥𪆁𪆗鼶𦇲𦇵籭𩆵𪖉⺯⺰ # sī
    <*死𣣑 # sǐ
    <*巳亖四𣱻寺汜佀兕姒泤祀価㕽㚶孠杫泗䇃饲驷𠭈娰柶㭒牭𥙉䏤𠳎洍涘肂飤𠋡㸻𤱸笥𥹊耜䎣釲𥒲竢覗𧣛嗣肆𧱅貄鈶鈻飼𢍭䦙𩵗𪊍𣽷禩𧳙駟㣈𣙼𣩠㹑蕼𨽼儩瀃𧀩𩸟⺒ # sì
    <*忪松枀枩娀㣝𢓣柗倯凇崧庺𢔋梥淞菘𨱛𧊕嵩硹𨠤𨱿蜙𧌻䯳憽𣽫濍𣚜檧𩃭䯷𤾥鍶𪀚𢤄鬆 # sōng
    <*𪨊㞞𩩺 # sóng
    <*㧐怂𡷽悚耸竦䜬傱愯㨦𢱤楤嵷𨴏慫聳駷𢖗𥳺䉥𡾼㩳 # sǒng
    <*讼宋𡇝诵送𠳼颂𦯕訟䢠頌𩠌㮸𦷴誦䛦𩃍鎹餸 # sòng
    <*凁捜𠝬鄋嗖廀廋搜溲獀蒐蓃馊𠘂摉𣔱𣮬𩙫飕𩨄𡠼摗𢲷𣯜锼𢴼䑹艘䗏螋𡣂䈭䐹𨡻醙𩗣𧳶𧽏䤹鎪餿䩳䬒颼颾𩘠䮟騪𩮃𩮶𩮸䱸𨤇 # sōu
    <*叜叟㛐𠋢傁𨺦𠪇𠌞㟬𠌟嗾𥈟瞍擞䏂𦺌薮䈹擻藪櫢䉤𥖻𤕇籔 # sǒu
    <*嗽𥯪瘶𧔅 # sòu
    <*苏㲞甦𧺷酥稣窣𩲵𢋈穌䌚鯂㢝𢸫𣩷蘇蘓櫯𤼀𧔖囌䲆 # sū
    <*俗𦎄𠐍 # sú
    <*𣷶 # sǔ
    <*玊夙诉㑉泝肃㑛洬𤤐㕖𢚑涑珟𤥔素莤速𫗧㓘宿㝛梀殐㴋𣶘䅇粛骕傃𢎎㴑粟訴谡𨱈𩙨嗉塐塑𡎮𡖯嫊愫㨞溯溸𤌂𤠚肅䏋遡鹔僳㔄㜚愬榡㴼𤡃𤭴膆蔌觫趚遬憟樎樕㯈潥𤛝𤢂𤸮碿𧩝鋉餗𢢒㪩㬘𣯼潚𣿈𤢘縤𦌉𦌊𧜦𧼭𩐫𩳒𪌔𪐮橚𣫎璛䃤簌𫂙䑿䔎藗𧐁𧐒𧐴謖䛾𢖏𣝝䎘𧀌蹜𩝥𧽷𪁽𧥆䥔𩐼𩘰𧞺𩘹𪄑𪍛𪅄𪋝驌鱐鷫 # sù (p1)
    <*𪖶 # sù (p2)
    <*狻痠𤶤𨠡䝜酸𦾹𩆑𪘑𪘝 # suān
    <*𠥘匴 # suǎn
    <*祘笇筭蒜算𥳪𩈲𥴵 # suàn
    <*夊芕𤯖𧈧虽倠哸𡝓浽荽荾䧌𣮄眭葰𠌱滖睢綏𨾡𦵭𣯯熣𦸏𩃃濉𦉎鞖雖𩞅𩌩𩏘𩮴䪎𠨌 # suī
    <*绥隋随遀㻟隨㵦䢫瓍䜔𧲈𩙇𥶻 # suí
    <*𠕸𨾬瀡膸䭉髄䯝𧃚髓 # suǐ
    <*亗岁㞸𢇥𡶣𤬫㒸砕𥤼𡷼祟谇埣𡹖𢈼𠭥嵗㥞㴚遂𡻕歲歳煫睟碎䅗𢟩㻪𧌢隧嬘澻𤡪穂𧡏誶𧨧賥𡑞𢅕𢒱檖𣩡燧璲禭𦃒䠔𩎰㻽𥊴𥕸穗𥢍穟繀𦄑襚邃𩗶𩝌旞𤻄䉌繐繸䔹𥴦𦅵䍁譢䡵鐆𧸙𨆏𨣢䥙鐩𩏚𦇀𨷃韢𣄧𩍚𩏲 # suì
    <*孙狲荪孫飧搎猻蓀飱槂蕵薞𧎤 # sūn
    <*𠣬损笋隼筍㔼損𣕍榫䐣㦏䁚箰𦠆簨鎨鶽 # sǔn
    <*𠈱𠱗𢘿唆娑㛖莏傞桫梭𣒹𥁲睃𥆝𥇇嗍羧蓑摍𣯌缩𧨀趖䯯𦟱簑䓾䔋𤀤簔縮髿鮻𩌢 # suō
    <*𩡾 # suó
    <*𠩄所乺㪽唢𡱳𢚭索𧴪𧴲琐琑𠋲𠝿惢锁𨻈𨻨𠞯嗩𡩡𢱡𢱢暛溑䂹䣔㮦瑣𦵫褨𩙭璅𤸴𥔭䅴䈗𧛻𥰼𧎫𧎳𤺫䞆䞽鎈𩋝𦅊䖛鎍鎖鎻鏁𩌆𩌈𩘝𩪈𩮛𪍔𩹳䵀𪍟𪍨 # suǒ
    <*𠘺逤𠗼溹䐝蜶𢷾𪍌 # suò
    <*嗦 # suo
    <'\uFDD0T' # INDEX T
    <*他它她牠祂𦭟趿铊𡌩𦱆塌𢞠榙溻𦈖褟嚃㯚䌈𧪦闧 # tā
    <*𨓬蹹 # tá
    <*鿎塔溚𨸉𩨌墖㗳𩫊獭㺚𦑼𨶀鳎獺𩷽𩥑鰨𩺗 # tǎ
    <*𣥂拓𠉂㣛挞㳠狧𦍒𦨎闼𦐇𠴲㛥崉𢃕㧺𣥷涾㹺䍇𠷍㭼𦧛𨔯搨𤠐𤠟𤿽䂿䍝𦧞遝遢榻𣗶毾𣯚禢䈋䎓𦑇𦧟𦧥䓠𦶑𧌏㒓撻澾䑜誻踏𨌭㣵㯓橽𤛣䈳𦑲𦑶䑽錔𨵝濌𦧱蹋𨃚鞜𩋅𩎽鮙𣝋㿹𦪙𦾽闒鞳𩌇𩌉𩌐𩌘𪂌䶀𪔕嚺𨙎闥䵬𤄥𥗓譶䜚𨆰䳴䶁𪘁𢺉𤒻𧔣𧮑躢𨰏𧖆 # tà
    <*侤咜 # ta
    <*囼孡胎𧉟𩬠𧭏 # tāi
    <*台旲邰坮㣍抬苔枱炱炲菭跆㬃㷘䑓鲐𣣿箈臺颱㒗䈚駘儓㙵鮐𩿡𡒢嬯擡㸀薹檯籉𢖤𪒴 # tái
    <*㘆𤗿 # tǎi
    <*太冭夳忲汰态肽钛泰舦𧉑𡇷酞䣭㑷鈦㥭溙態𧮼燤𪐥𦒰 # tài
    <*粏 # tai
    <*坍㘱𣢌𦙇贪𠫶怹㳩𣵢䑙𦧏㴂痑舑貪㨏𣸙𦨸摊滩㵅𣼚𣽯瘫𦸁䆱𦼎擹𦧴攤灘癱 # tān
    <*坛𢇧𢇰𡊨昙倓谈郯婒惔𧣁㲜㷋𥹠覃榃㽎痰锬𩠽𠻪谭𨝸𩖖𩡄墰墵𢅀憛潭𧣹談醈壇曇燂𥰨錟餤檀𤐔㽑磹顃䃪䊤𥼟𥼮罈𦗡藫壜䉡䕊譚貚𧽼醰𧂇譠𡅄𧰘𩡝罎𪍵𥩒𩪺 # tán
    <*忐坦䏙㫜袒钽菼𧺟毯䞡鉭䦔嗿𨁴𩑰憳𨡍𩒢憻暺㲭𤎥𦃖醓璮襢𦌪𧫿𨅍𨣕 # tǎn
    <*叹𧥞炭𣴽埮探傝㛶湠僋𣁗嘆碳舕䗊歎賧䐺𨂞𩤞𣞔𪉧䜖 # tàn
    <*汤㓥铴湯𦳝嘡耥劏𢴳羰蝪䞶䠀薚镗𨲗蹚鏜鐋鞺鼞 # tāng
    <*饧坣𢻿唐𠢃堂傏𠗶啺棠㭻鄌㑽𠹔塘㜍搪溏𤠯蓎䧜隚榶㲥漟煻𤚫瑭禟膅䣘樘𣙟㼺磄䅯糃膛𨌩㙶橖篖糖䌅𦪀螗踼糛螳𧱵赯𨍴醣餳𥋡䉎𨎋鎕𨶈餹䕋闛𩘜饄𨆉𩥁𩹶鶶𪕹 # táng
    <*伖帑倘偒淌傥㒉㼒𤾉𢠵躺镋𨎖鎲儻𡿓戃曭𣎲爣㿩矘钂 # tǎng
    <*烫䟖摥趟燙𨉱 # tàng
    <*𠓝𠬢夲𠇏𠗆弢㣠𤘸𤙎䀞𩏾㫦涛绦掏𦍷𠞞絛䑬詜嫍𡺫幍慆搯滔槄瑫𩎢韬飸𠚜𨌨䈱縚縧𦺰濤謟轁㹗䤾鞱韜𩥅𩹴饕 # tāo
    <*匋迯咷洮𤴻逃桃𤵟陶啕𡍒𢔇梼淘䄻绹萄𩙧祹䛌𤚟裪綯蜪鞀䛬醄𨡒鞉𥰜鋾錭𩛽駣檮饀騊𪌼鼗𣰺𩘿䬞 # táo
    <*讨䚯討䵚 # tǎo
    <*㚐套𣨔𣺮 # tào
    <*忑忒𢘋𠈸特貣㥂㧹𤙰铽慝𣘱鋱螣𥊸蟘𥌩 # tè
    <*𢚺熥膯𤳘𦡪𤃶鼟𪔶 # tēng
    <*疼痋幐腾誊𢟱漛滕𣽨𥉋邆𤹤縢駦䒅謄𨃗儯𦪝藤𩩻𢥂騰籐𧭔𩴝鰧䲢籘𦫀䕨虅䠮䲍𧈜驣𪒿 # téng
    <*霯 # tèng
    <*剔梯𨔛𠞄㔸锑𢱦𤗢𨁃踢𩓂擿䖙䢰𩤽鷈鷉䴘𪖦 # tī
    <*苐厗荑㖒㣢绨偍𧙣啼崹惿提𣸒𤟥𤟾𤭌稊缇罤遆𨠏𫘨鹈嗁㡗𣄍𣖅𣹲𤗘𤚢瑅綈𧋘𡰎𣖸碮䅠褆䨑䬫𩛑𫛸徲漽𥉘緹蕛蝭䛱銻𨴼题𩛶𦻀𧡨䚣趧蹄醍䬾𩿷謕蹏鍗𩝊鳀鴺𥳳𦌢䔶𨪉𩋣題鮷鵜𧀠𧀰騠鯷䱱鶗鶙𥶛禵𧔩鷤 # tí
    <*体𡥩挮𣈡躰𣉆骵鮧䌡軆䪆體 # tǐ
    <*戻𣧂屉剃朑洟倜悌涕𥫵逖屜𡸑悐惕掦逷𡲕惖𢝹𢧑揥替𡲿𢞖楴裼㗣𢳓褅𧛒歒𣤖殢𥉈𧨱𨲎髰㬱㯩𥡦薙𧼮𩬲嚏𣜹䎮䙗𧝆𧝐𨲞鬀嚔瓋䯜籊𩮜趯𪕩䶏𪍲䶑 # tì
    <*笹 # ti
    <*天兲𢓍𦬞䀖𦊊婖添𦧒䚶𡙒酟靔𦧝䋬𣊖黇㬲𪎾靝𪅉 # tiān
    <*田屇𢇶沺䧃恬㧂𤤦畋畑盷胋畠䑚甛甜菾湉䟧䡒𩚣塡填搷𦳇鈿阗碵緂䡘𨌈磌窴𥧑𥪧𧨸𦗀鴫璳𪌩𨉾闐𧰊䥖鷆鷏𤫞 # tián
    <*忝殄倎𠗘𧉂𨹻唺㖭㙉悿㥏淟䄼䄽晪琠腆䐌觍𧹖𤲖痶睓𥪌舔𧌎𨡁𩈍餂覥𧨩賟䠄𨡏錪鍩靦𡒧𥳫𥵶𨆁𩉁 # tiǎn
    <*㐁𨸱𤘠𦔿掭㶺㮇𦧖睼𦗁舚 # tiàn
    <*旫佻𠛪𢈄庣𢓝恌挑祧𡯿𣂥㬸聎𣂁𦩄𨋫𡳏 # tiāo
    <*芀条𠤺岧岹䒒迢𠧪𣬸祒條㟘𣒼笤萔蓚䟭𡠊𦴚蓨䖺𧌁趒龆樤蜩𩲤鋚鞗髫鲦䩦鯈鎥䯾䱔𣟐齠𥶏鰷 # tiáo
    <*宨晀朓㸠脁窕誂䠷𢳙斢窱嬥𢺫 # tiǎo
    <*眺𥎺粜絩覜跳𨾾𢖈𪌪糶 # tiào
    <*螩 # tiao
    <*帖怗贴萜聑𦝒貼 # tiē
    <*䩞 # tié
    <*铁蛈僣銕鋨𢶋鴩鐡鐵䥫驖 # tiě
    <*呫𤝓𪎋飻𦧢𦧤䴴餮䵿 # tiè
    <*㓅厅庁汀艼𤘖听町𦉬耓厛烃𧰩𨊡𥑈𠄚桯烴𩨑綎䋼鞓聴䯕𦗟聼廰聽廳 # tīng
    <*邒廷㼗𧖨亭庭莛㹶𨓍停婷嵉渟𥥶筳葶蜓𣂴楟榳𤗞𦐿𦝞閮霆聤蝏諪𧶺𨉬𥴑𩐴䱓䗴鼮𩹇𧓴𩆆 # tíng
    <*𡈼𠕊圢𡔛𣄿𨸁甼侹𥫙娗挺涏梃烶珽脡𢽄𤱹𨳑䅍艇䦐𨳝颋𣉡誔𩑙𨁗𠘋𩒞頲䵺𪊶 # tǐng
    <*𢬫𥆑𦕢 # tìng
    <*囲炵通痌嗵𣌾蓪𧳆𨀜𡠙𢄟𣻢𥲆𧳿 # tōng
    <*仝同佟彤𠖄峂㠽庝𢓘㤏𨚯哃峝𢈉𢏕狪𤱇茼晍桐𣑸浵烔㸗砼蚒眮䂈秱䆚铜㼧童粡𦨴𧊚𨜳𨠌筩𧋒𧋚詷赨酮鉖僮勭𣪯𧇌𧌝𨝯鉵銅餇鲖𡦜㠉潼獞𩩅曈朣橦氃燑犝膧㼿瞳鮦䳋𪀭𥫂𦏆𦒍𩍅䶱䮵𩻡䴀𥩌 # tóng
    <*㣚统㛚捅㪌桶筒統綂𨈹𢳟樋𪌢 # tǒng
    <*恸痛𥦁衕慟憅 # tòng
    <*𡇧偷偸婾媮𨱎鋀鍮 # tōu
    <*亠头投𡷠㓱𣪌㢏𦈕骰緰𪉘頭𪁞䵉𪎨䕱𨯲𨷩 # tóu
    <*㳆妵钭紏㼥䚵敨㪗飳𩿢𪌘黈𩜶䱏蘣 # tǒu
    <*透㖣𧺢䟝𨔙綉䞬𣛾 # tòu
    <*𠫓凸宊𣲱禿秃怢𣅝突唋𠳶𡸂𢬳涋𥥛𠊲捸𣒇𠞀𠸂堗㟮湥痜葖𪉍嶀𤷿䛢𧳌䞮𠟶㻬𥯝𦩤鋵𥨜鵚鼵 # tū
    <*𨑒図𠫮图凃𡇩峹庩徒悇捈涂荼途䣄𨱄屠梌𣥳𤙛㻌菟𢝀揬㭸𤟪稌圕塗嵞𡺴𣈥𣔻㻠瘏筡腯𦝬蒤𨝛鈯𠻬圖圗廜潳𧛗𧧶跿酴㻯𥂋𥧣𦔅䠈䣝𨴩䅷䖘䤅䩣馟鍎𨨷駼鵌䳜𪑏鶟𩥽鷋鷵 # tú
    <*土圡𨙭吐钍釷 # tǔ
    <*兎迌兔莵堍𩾅𩣮𩸃鵵 # tù
    <*汢 # tu
    <*湍猯煓䝎貒䵊𧰄𪏖䵎 # tuān
    <*团団抟𣶣𩠊剸團慱摶漙槫𩃘𡁴㩛篿䊜𧐕𩜵檲𧽢𨪒鏄糰𧓘𩘯鷒鷻𩠹𪈋 # tuán
    <*𤱝𢣎疃䜝䵯 # tuǎn
    <*彖湪褖𧳩 # tuàn
    <*推𧆸㞜蓷𨌴藬 # tuī
    <*弚𡷜㢈𢉭䀃㢑颓𩙬𢟴𤸉䅪隤尵𢊮𨗞𤗴𨘃頹頺頽𥢢𧝋𩓬魋𨽟穨蘈蹪𨆨㿗𥶐𩘺𧮓 # tuí
    <*俀㞂𡯵㱣腿僓㾼蹆骽㿉 # tuǐ
    <*𢓇侻退娧㥆𦜄𠺙煺蛻蜕𢠮㷟褪𤍐𦖦𩳕𥲣駾 # tuì
    <*吞呑𨹙涒啍朜焞噋𨧐暾𣋄㬿黗𧑒𩷵𪏆 # tūn
    <*屯𨙲𡉒坉忳㹠芚饨㼊𦍓𥸵𧰭豘豚軘𦜴𨳘𩂄飩鲀𦟓𩖤𠭿𪎴魨𪌋𪎶㩔霕臀𥴫臋 # tún
    <*氽㖔𣵞𢞋𦜯畽𦟙𢥽 # tǔn
    <*旽㧷𤶕𨁇𪑒 # tùn
    <*乇仛讬托扡𢩷汑饦𠈁杔𤣯侂咃𠰹拕拖沰𨒙挩捝莌袥託𠴻涶脫脱飥𧦭𨞌魠𪌂𢄿𩢵䴱𢸨䜏𩟰驝𩧐 # tuō
    <*𢩻驮佗陀陁坨岮沱沲狏𤝛迱𨹔驼𢏜㸰㸱𤤩𦚐𤱡㼠㾃砣砤𥞒袉鸵𢑠𣶦紽䍫堶𡩆𡹬𧣖跎𧿶𨈷䡐酡碢𧧉馱𦑑槖𥓿𨉋𩉺䪑駄䭾𩢊駝駞橐𧤓𩃰𩃱鮀䰿鴕𩿽𩎼鼧騨鼍𧔳驒𪘕𪘗𧕦鼉 # tuó
    <*彵妥𡛵㟎𢓰𨺖庹𤱧媠椭𣷿楕𦝦𡐏嫷䓕𨁡橢𤹢鵎𣟁鬌鰖 # tuǒ
    <*柝𦚈毤唾𣮆萚𧿧跅𩱾毻𣗸箨𧜲𨂫蘀𣟄𩅡𥩀籜 # tuò
    <'\uFDD0W' # INDEX W
    <*屲穵劸𣢉挖洼𥤺娲畖窊𠴺媧𤬿嗗蛙𩨚搲溛𧧊漥窪𦞭䯉𩿺𡁌𨩶䨟𩩤鼃䵷𡚟攨𤮰 # wā
    <*娃𣢚𤞇𩨾 # wá
    <*瓦佤邷咓𦘵㧚㼘𣐎砙𦚩𨀄 # wǎ
    <*𤬦𡧗𤿗𥥟䎳袜𥿉䍪聉䚴嗢𠹁腽膃𦤙𦫪䠚襪韈韤 # wà
    <*瓲哇 # wa
    <*歪㖞喎㗏𤟷𨵞竵𪉭䴜 # wāi
    <*𨈕崴𢱉𨂿 # wǎi
    <*外𠰻𤤫夞𠨃𤷹𩔀䠿顡𩕕𪑷𦘍䶐 # wài
    <*弯剜𠝪婠帵𡇿塆湾𧯡㘤蜿潫豌𨉝𨂺𩅦𠠪彎壪𡤶𢺯灣𣡩䘎𨈊 # wān
    <*丸刓𢓃汍纨芄完㝴岏𢓆抏玩𥤸笂紈捖顽烷琓𤥙𧲦貦𧿙𠒢頑䯈𩾞翫𪐬𨩯𤻆 # wán
    <*宛𧠆𦣾倇唍挽㽜盌埦婉𡸥惋𢛙晚晥梚绾脘菀萖䖤𡩄晩晼椀𤗍琬皖䅋𦜐𧚇畹睕碗𥟶𨥧綩綰䑱䗕䘼輓𨌔𩊁䛷䝹踠鋔㿸䳃𪎛𢨔𨩵𨩻䩊𩣵𪂦𪂧𪋅𪑉㜶 # wǎn
    <*万卍卐𢀗𣥃妧忨杤𦙵捥㸘脕䛃𢯲𥆶萬腕𦲯𤧩𥝄輐𩢄澫𦂔𧹗鋄瞣薍錽𦽞蟃𨞼𩈬贃鎫䯛贎䥑𠣉𡆅 # wàn
    <*𡯁尣𠕿尪尫汪尩𡝝𤷀𥆚𪁘⺏⺐ # wāng
    <*亡亾兦王仼彺𡷢莣蚟𦯌𦣦𧎕𩵭 # wáng
    <*㓁罒㲿网𡔞𢁶往徃枉罔𦬣徍𢼟𣢫䋄𥾼𧈿惘㳹𣶈𣷪菵暀棢㴏䋞𦣩䒽蛧辋𨳠𧧜𨕿𩖩網𦖉蝄誷輞䰣瀇魍⺴⺲ # wǎng
    <*妄忘𣥊迋旺盳𢛛望𥆜𧧄朢𥲠𧫢䤑𦓋 # wàng
    <*危威𠳿𢼸烓偎㣦萎逶隇隈喴㙎㙗媙㟪愄揋揻㮃渨𦈓葨葳𨻒微椳楲溦煨𧚷詴𦓽蜲𧛚㕒縅䋿𦩬蝛𧍥覣𨖿嶶薇𧟼𧤖燰䫋鳂䴧巍鰃鰄𩹥𪑭𩼌𣫪 # wēi
    <*囗韦圩围帏沩𣲗违闱峗峞洈韋𠙕𡇦桅涠𠥎唯帷惟𥅵硙维喡圍媁嵬幃湋溈琟違𢾁𨠥𠄿㣲潍維蓶鄬𨴓𡼱潙潿磑𧳞醀䧦𡚈𣄺𨿭𩎵濰𧝕鍏闈鮠癓䔺䙟䜅𨱖𩀣𩋾𩏉䉠䝐𩠯䑊覹𧢒𩀶犩𥌰𧞸𩁌霺𩴞欈𧲗䥩𧢧𩽎⻙ # wéi
    <*厃伟伪尾纬芛苇委㞑㭏炜玮洧㖐娓屗𡷕捤浘荱诿偉偽崣梶痏硊骩㙔㛱㞇嵔徫愇㨊𢯷𣨙猥𥒮葦蒍𨝀骪骫𩲂暐椲㱬煒瑋痿䇻腲艉韪𩏿僞撱𤸆磈䍴䞔鲔寪𢊯䈧𥯜𥯤緯䍷蔿諉踓韑頠㠕㬙薳𨗨𨵋𩗘䬿𩜧儰濻𤛲𤺉𥊪𦾛𧐌鍡鮪𡂗壝𤁿瀢䃬𨟗𨪈韙䪘颹䵋𢸦𧲄𩏏韡䦱𦇅𩹷𦢿𩟟𤼒𠆟斖𩼂 # wěi
    <*卫为未位𨚘味𡶎苿𢙓為畏胃叞軎尉菋谓喂𡔱媦𢉝𢍚㥜𣈎渭㷉爲猬䙿𩨅𩲄𠹤煟䊊𦝛𦳢墛𢲴碨蔚蜼𩑵慰𣽴熭犚𥉖𥧙緭𦩝蝟𧍫衛懀璏罻𦠻衞謂𧳪𨃄𩗜餧鮇𢣘𣩪𤀷螱褽𨢉餵魏𤻅𦪒藯轊䬑𧒭鏏霨𩤸鳚𪂄𪑐㦣𤜂蘶䗽䘙𧴖𨾂𩹂䜜饖𥶽𧔥讆躗䡺䲁讏𧸽躛䮹𧕞䪋䵳𧲝䭳 # wèi
    <*煀 # wei
    <*昷𥁕塭温𨜵㬈榅殟溫瑥辒榲瘟㼔蕰豱輼轀鎾饂鳁鞰𩥈鰛鰮𪉸 # wēn
    <*匁文彣纹芠炆玟𤵒闻𪉃紋蚉蚊珳阌雯䎹𢾿瘒聞䎽馼駇𩢌䰚魰鳼鴍螡閺閿𣜺蟁闅𩭋鼤𨶭闦䘇 # wén
    <*刎吻忟抆呡肳紊桽𣶌脗𦮶㗃𥦊𥬼䐇㝧𦝮稳𦟕𥧚䦟穏𡁋穩𨆲 # wěn
    <*问𨸩妏汶𥃮㡈莬問渂𨟸揾搵𤛁𠐢顐𦦯璺 # wèn
    <*呚 # wen
    <*𠰈翁𧚐𨜺嗡𡻐滃㺋㮬𩰎𥕀𧛹鹟䈵螉鎓䩺𩔚䱵鶲 # wēng
    <*㘢勜奣塕𡩥嵡蓊暡𤌏䐥𦞡瞈聬𩄘㜲攚㹙𩡓𩮬 # wěng
    <*瓮𡍻𨞑蕹甕罋齆𦧅 # wèng
    <*挝倭涡莴唩涹渦㹻猧萵𠷏𤉦窝窩蜗撾蝸踒𡑟𡁮𩭝 # wō
    <*我㦱𢦴𢫷㧴𥑣婐捰𣇫𡖲䂺𠪧𥟿𧶕𨁟𣚝𩭏䰀𩮑 # wǒ
    <*仴沃𤆏肟卧枂䀑臥𥄗𣁳偓捾涴𦯏𡎔媉幄握㱧渥焥硪𦰖楃𥪍腛𦳹斡𤡓瞃䁊𦷵𨌝𣂽𩐦𠿟擭𧤒䠎㠛濣瓁臒雘𩈱龌𤻌𩷯𪁕𪎤𦤨𧥋𩟓䮸齷 # wò
    <*𥦷 # wòng
    <*乌𠛆圬𢁢弙汙汚污𤣬邬呜巫杇屋洿𥎮诬钨烏剭𥁡窏𠞆𧆹鄔嗚𡈎誈㮧歍𥟽𦶀誣𧨆箼𦼇螐䡧鴮䖚𧑕鎢𩝷鰞𪄝𪑱 # wū
    <*无毋𠘻吳吴吾呉芜郚唔娪𡷤𢃀𢓲洖浯㹳茣莁梧珸㻍祦無𤭑铻鹀禑𥭠𦥁𦨳䓊蜈𦷽𧳎𨼊蕪䦜𨿏㷻璑𩒾𩳌𥕻𥲐䍢䫓䮏𩶭䉑蟱鯃鵐𢋹譕𣟒鼯𩻚鷡 # wú
    <*乄㐅五午仵伍𠯃㑄妩庑忤怃𣲘旿㬳武𤆡玝侮俉𢫸倵𢩈捂啎𠵦娬𢑟牾𧺴𢜮珷摀𣺀碔鹉㒇𡈞熓瑦舞嫵廡憮𢨂潕𤸼䟼𨖴𨡡𩠟𩵱儛𠥢橆甒䳇㵲𧽋𧴇𨶇𦌬鵡䒉躌 # wǔ
    <*兀勿㐳务𡯇戊阢伆屼𡵉扤坞岉𢗳杌𦬂芴迕𨑥𠒄忢物矹𦨉卼𡬫𢙁敄𣬽𤵐𥾕𧈭误務悞悟悮㽾粅逜晤𣨓焐𥒀䦍婺嵍㡔𢝴痦𥏒隖靰骛塢奦嵨𢄓溩䎸雺雾𠼘寤𣯎熃誤鹜𥎈䃖𦎦䛩鋈𨧗窹𧎻𨂣𨨡䑁𧐙𧰈䨁霚𩓦𩗽𩝕鼿𨲬𩄯霧齀蘁䜑騖𦆞鶩䳱⺎ # wù
    <*錻 # wu
    <'\uFDD0X' # INDEX X
    <*夕兮𠔃㲸𠆱邜㕃𠬬㕧吸𡗞忚扱汐西覀𠔍𡗳希𢗴扸𣢁𣢂卥昔析𣢍𣢎𣢑穸肸肹𦙝俙𠜗𠨚徆怸恓𣅾㿽𥄖𥄛䒊郗饻唏奚𡘡㛓屖息悕𢬾氥浠牺狶𤥒䏩𦤈𦮐莃𧈼𧥤𠩺唽𠴭𠶨㛫㛭悉惜𢜣晞桸欷淅渓烯焁焈琋𤶈硒𦐠菥赥𧿝釸傒惁晰晳㱤𣨗㴔焟焬犀𤶰睎稀粞翕翖䐅𦜱舾䙵䛊𨋦鄎𨳛𨻁厀𠺒𡏛㜎𡩤嵠𡻎𢑧徯溪㴧𤠓𤷡 # xī (p1)
    <*皙䐖蒠䖒䖷𨀙锡僖㓾𠟊㗩㗭榽㮩㰿煕熄熈熙𤡡𥈻緆𦞽蜥䛥豨𧶖𧻶𨡂餏嘻噏嬆嬉𡳚嶲𢡁潝𤢀𤬕𤲺瘜㾷𤹊磎膝𦩭𧹨𩗊𩾼凞𠘕憙㪧㬛樨橀㯕熹熺熻𤮆窸𥰝縘羲𦠪𦼗螅螇錫𨵎𩒽𡁱㜯㱆燨犠𤺊瞦䁯礂蟋谿豀豯貕𩗱㘊𤬘𤮙𤳥𥋟糦繥雟𩭡鯑鵗䶋𢀊㶉𧀬觹譆醯鏭隵𩅖䭒㚀巇𢋼𢨟𢹍曦𣎮𣤳𤃪爔犧㺣酅𣟵𣤴𤄬䂀䳶 # xī (p2)
    <*𪃼𪄛觽𤓔鼷𤓚蠵𧲘鸂觿𧯗鑴𩽨⻄⻃ # xī (p3)
    <*习郋𢙅𣳬席䏮𧿅𨛳𣒃習袭觋喺𨻥𩲁媳椺蒵蓆𧋐嶍㠄漝𥺚覡趘㦻槢𦸚㩗㿇薂隰檄䒁𧐔謵鎴霫䫣鳛㔒䚫飁騱騽𦪿襲鰼𪄶𪕯㽯𪓷驨 # xí
    <*𠉢枲洗𤤱玺徙𫍰𧺨𨜐铣喜𤟧𦱓葈葸鈢鉨鉩𠪙屣𢊚𢒩漇𤨐蓰𧣩憘𣯪𨞘𢒲暿橲歖禧諰壐縰謑蟢蹝璽䢄囍𡅕𪖥𨮪鱚矖躧𩎉 # xǐ
    <*匸卌𠦌戏𠤴屃系饩𠦜呬忥怬𣢓矽细𨰿係咥㚛𡘐𡜧𡶯㣟恄㰥𣳦盻郤㤸𢭁㭡欯绤𧉁䧍𡝧細𧦁釳阋㑶𡙋椞𣣉𥿭舃舄𧚃趇隙䬣𡦎慀滊禊綌䓇赩隟墍熂𤌷犔𥈜稧𥮬𦞝𦷲𧧹𨐛䲪𢧽潟澙𤡬𥎃𥪦蕮覤𩎥𩛹𩿛戱𣚔䈪𥰥𥻥𦃝䐼𧎵黖戲𣤢𥋁磶䊠𧤟䜁𧪢𧯈𧱲𩊿䮎𢤋虩𧯊𧹶餼鬩𡃢㙾㦦繫𧈅𧬈𧬊嚱𧂙𧈍闟𤄎㸍𧹽𩍆䀌𨷘霼䨳 # xì (p1)
    <*𩦇𪅲屭衋䵱 # xì (p2)
    <*虲㰨𣢗疨𥁆虾𨳉㔠㰰𧦎谺傄閕煆颬𧇍𠽫𤗭瞎蝦𧪕䠍𧯋𩮂鰕 # xiā
    <*匣𢑓侠㘡𢘉狎俠𠩘峡柙炠𤙇狭陜峽𢈙𢈤𢚌烚狹珨祫硖翈舺䖎𧆥䘥陿𠢆㗇𢝅㽠硤䛅遐𢻗敮暇𣹱瑕筪舝䖖𩐀碬𦵯辖𩉾磍𥯾縀蕸𨲑𥰶縖𦦕赮𩎲魻𡈮𤪆𦾏轄鍜霞𤪍鎋䪗䫗𩝛黠𩏓騢𧔂鶷𪗾𪘘𧕱 # xiá
    <*閜 # xiǎ
    <*丅下乤吓圷𢗄𢩹疜夏𡨄㙈梺𤟝𡏘𡺷㰺𨻲㙤睱𥻴嚇懗罅𧪹𨩽𧈄𧫒鎼𩄗夓鏬𪄂𨽯 # xià
    <*㔾仙仚屳先奾𢒆纤佡忺氙杴㸝祆秈苮𨚾𢫿枮䄳籼𣑹珗𦧐莶掀㲔𤈷𥑻𥬍铦𣔙䯭㰹𣮾𥟕𧱀跹酰锨䩂僊僲嘕𢕖𨁅銛𩈖鲜𠏡𠏓暹㾾𦸊韯嬐憸薟鍁𢖎㷿繊褼韱䯹鮮𠫄㿌𧫹𣞘𦒜𧸂蹮馦䵌廯攕𢹚㺤𣰷纎鶱𪄏䆎襳躚𪄷䉳䊱纖𨇤䂅鱻 # xiān
    <*𢎙𡰲伭𠛑㳄闲妶弦贤咸唌挦涎胘娴㳭𨺘娹婱㡉㢺𢛆𢮂𤉌絃舷蚿衔䝨啣㛾㭹湺痫𦱁蛝閑閒鹇𠷢嫌𢐐衘㮭甉銜嫺嫻憪撏澖稴𦑘誸賢𧼏𠿢𣊺㯗㵪𥻧𦎵𦠹𦽭諴輱醎䦥㘅癇癎瞯𥲋𢖋𩝈㘋藖𧈁𢅮𠓌𩤥𩤦𩱆𡫹㰊礥䕔𧂞𪂶鹹麙贒𩦂𪔩鷳鷴鷼䲗𡿤 # xián
    <*𢁗冼狝㧥显䢾险崄𡸃㫫㭠毨𣭡烍猃𤞤𦭶蚬䧋険赻筅尟尠搟𣕎禒䚚跣𩨡㬎銑箲險𠠁嶮獫㿅𢷑獮藓鍌𩶤燹顕幰攇𡾮𢥌櫶㶍蘚䗾譣𣟲𤼂玁䘆䥪𩏩𥜲𧕇䜢𨙡韅顯𡗏灦𤓤𧖙 # xiǎn
    <*伣𠚆县𠯟咞岘苋𠜎现线臽限𩧩姭宪㡾県𪾢𥙆𨸄陥哯垷娊娨峴𢚀㪇𣆕涀莧陷晛𤟅現硍䏹䙹𧠒馅𪎉𡞣睍絤缐羡䐄献㺌䁂𥓒𥦶粯𦋈羨腺蜆𧻒䧟僩僴𡐖綫誢𨖱䦘𢕭㦑㦓撊𥻇線𦩢鋧䨘䵇憲㬗橌𥰳縣𨍒錎餡壏𡒓豏𨘙𨘞䤼𨵬𤁦𤑃𩤊麲𢋮瀗㽉臔䧮䱤𢖝獻䃱糮𥽏𨐊䃸䉯𧾨𨏥鼸䶟䨷𩦹 # xiàn
    <*鑦 # xian
    <*乡芗𢪷相香郷厢啌鄉鄊廂湘𤉪缃葙鄕㐮楿稥𤷼薌箱緗膷襄䬕𩡌忀骧𪂼麘欀瓖𩡠镶鱜𩑇𥫖鑲驤 # xiāng
    <*瓨佭𤰅详㟄庠𤝷𢭎栙祥𦍲𦍴𡹷絴翔𦎈詳䜶跭𨀘𤭬𩾬䔗 # xiáng
    <*享亯响蚃饷晑𠸮𥿧䖮飨想𢞡𦕺𤍀䊑䐟銄餉鲞曏㗽𥊾蠁鮝鯗𩝾響𩞥饗饟鱶 # xiǎng
    <*𨙵向𨷿𣅰姠巷𨛜项𣂝𤖽珦㟟𢛖象塂缿萫衖項像勨𣨳䢽嶑𧖿銗𢄵𢠷橡𨖶𨧑𤩪𦺣𦺨襐嚮蟓𨉽𥣟鐌𧬰䦳𨷄鱌䴂𥗵𥀾 # xiàng
    <*灱灲𠈬呺㕺𢪶枭侾哓枵𦏷骁哮宯宵𡯩𡷸庨𢓮𢭦消㹲𤞚绡虓逍鸮婋梟㲖焇猇䎄萧𡟣痚痟𥆔硝硣窙翛萷销𠹎㚠揱𣕇𤠖綃𦐺𧵱𩾒𩾓嘐㪣歊潇㺒𤡔箫𧳍踃𩙮𩫂嘵𡼚憢㩋獢䌃𦟞銷𨴹霄𩾾彇膮蕭魈鴞𤺃穘簘藃蟂蟏𩋍鴵嚣𨶅𪁎䴛𡣾𢸳瀟簫蟰𨊅䨭䬘髇櫹𤑳嚻囂𣠎髐鷍𧄤蠨驍𠑪毊𤣠虈𩙚𩧓𩫳𩱴 # xiāo
    <*㚣𡧕𣏠洨㬵𥾤䒝郩𠴳崤𢛘淆𤕢訤㮁殽筊𣔷𤷤𨠦𧍂𡦝誵𦺔䟁 # xiáo
    <*⺌𡱉䒕晓𫍲暁𤽳筱筿𥔑𩵖皛曉篠𧩮謏皢𥕾𧡼䥵𧢬 # xiǎo
    <*孝𡥍㤊肖効咲俲𠴡效校涍笑啸𦯪傚敩𢽾𣂬𤟞𤿨𦱜㗛詨㔅嘋嘨誟𧱐𠏕嘯𣿣歗𣤡熽𦦛𣱓㵿䊥𪊷𤣌𥽁𨅋𡦳斅斆𣟇𦢩𢹳䉰䕧𪛀 # xiào
    <*恷 # xiao
    <*些𡭥㱔𣆟𣒄揳猲㾚㨝楔歇𣣩㗨蝎𨧥𧳧𤺎𦪬蠍𧓂𥌨𥗧𩫲 # xiē
    <*劦协旪邪㐖𠖹協胁𠗉垥奊峫𢂐㢵恊拹挟䀘𢓬挾𣫴𤙒𤞡脅脇脋𦚫衺偕𡸔𢯉斜㭨𤱷谐㖿㥟𥆥翓䙽嗋㙝愶携㨙𣹩瑎綊𦋅𦳃䝱㙦𣣲𣻠熁膎𨁂䦖勰撷𢴲擕緳缬蝢鞋頡𡀺𢿡𧏂𧏃䙎諧䡡𨵚䩤𩰳燲𥊯䔑𧐃𧷑𨵪𩋘𩷂擷㩦㩪𤢺𥢹𧑦𩋧𧀺鞵𩤠襭𢥘攜𤣑纈𩺫𤮯𧟃䕵𨷥𪆋𡰢讗𨏳龤 # xié
    <*写㝍䥾冩㕐寫𣬕藛𣞐𧭠䥱 # xiě
    <*伳𢗊灺𡗼𡛶㰡泄泻祄绁缷卸𠲊㞒㞕洩炧炨卨㖑娎屑屓𢬿㳦𦔼𦚡偞偰𡞘徢械㳿烲焎禼紲䚸𨈙亵㓔𠸴𠅱媟屟𢜨渫𤗈絏絬谢䦏𨳚僁塮𡟩㣯𢞜㴬㴮𥇱𩐁𠨆㡜㣰榍榭𣣶㴽䁋𦁛𦖐𦞚𦩌𦵱𧌊𧌋𧌖𧍁褉𩂪噧屧暬𣽒𤡧緤䙊𧛼𧜔𨼬𠿇㙰嶰𡽖廨𢖆懈澥獬糏薢薤𧜵邂𩃖䩧韰㔎燮䊝褻䙝𧝫謝㒠𡃂夑𡣹瀉𥎎䉣𧷧𨤴鞢䵦𠑄𡤋 # xiè (p1)
    <*𢤯𢤰瀣爕㸉𤑪䉏繲䕈𧀢蟹蠏𩐉齘𡄕𢌀㦪𢹒齛㰔𤫉𧓺齥㽊𥍆𩍝齂𧭸䪥𥀺躞𨇨䲒𧖁𩎃𩙜𩽍𪙥 # xiè (p2)
    <*心𢗀邤妡忻芯辛𣂗昕杺欣炘盺俽𡌜㛙𢭧𣂜㭢𤙖惞𤙣訢䜣𨊳𠷓𦰸鈊锌新歆𢠝𦁍廞鋅𩾽𩿃噺嬜𣃄䅽薪馨𠑰鑫馫 # xīn
    <*㚯枔𩖣㜦襑鐔𤫨 # xín
    <*伈𨓇 # xǐn
    <*㐰阠伩囟𢩲𤜢孞㭄𣥇𤣲信𤴾䒖㛛䚱軐脪衅訫焮㾙𦜓𡈏𤷓𧳄𦞤䛨馸𧗹𢋆𤹩𦤟㔤顖𦉝𦢯舋䜗𩟍𧴢釁 # xìn
    <*忄⺖ # xin
    <*星垶骍𤙡惺猩𦈒𠬋㙚𣨾煋瑆腥蛵㷣䃏𥠀𧌚𧛟觪𨌍箵篂𦂅𦖤𦩠䗌謃鮏曐𤏽觲𨞾騂皨𡃳鯹䕟 # xīng
    <*刑㓝行邢𠀦形陉㐩侀郉型𡶭㣜洐㼛荥钘陘娙𦈨𧗦䣆硎铏𣸝𤶲𧊞𧊽鈃𦈵滎鉶銒𤬐鋞䤯𩩋 # xíng
    <*𢜫㨘睲㝭醒擤𥨕䳙 # xǐng
    <*兴杏姓幸性𣢝荇倖㓑𢙼莕婞悻涬㼬䁄䂔緈䓷䛭興𩈡䰢嬹臖 # xìng
    <*哘裄 # xing
    <*凶匂兄㐫兇匈讻忷汹㚾𦙄哅恟洶𧘮胷胸訩𧿖𨥍詾𧵣𦵡賯𩴂𩌠 # xiōng
    <*𧰯雄䧺熊𧞞 # xióng
    <*焽 # xiǒng
    <*诇𥃴𣅷𦈤𦬺𡨳𥥧焸詗𥦥夐𡪰敻𢿌𤔫𢢹𤛪𦓈𧽒𡬁𠓙𩧊 # xiòng
    <*休𡯐俢修咻𡜨庥㳜𡔨烋烌羞䏫脩㾋脙鸺𡟞𥞼臹𢊒貅馐𢕦樇㱗㹋𧌌銝髤䐰𦟤𩛢䗛𩢮髹㵻𦪋鎀𩭘鮴鵂𪀪䡭鏅饈𩡎𩮄𥌪𩘭鱃𪘆飍 # xiū
    <*苬 # xiú
    <*朽㱙𣧬𦈋滫潃綇糔𪕦 # xiǔ
    <*秀岫峀𢓵珛绣袖𧙏琇锈嗅㗜溴𤚯璓褎褏銹螑繍𪁮繡鏥鏽齅 # xiù
    <*吁𢖳戌旴䏏𦘼𢨰𣅤疞㽳盱𠧰欨胥𧆜须晇㰭𧙆訏顼虗虚𧟬谞媭幁㥠𢩕揟湑𤚉𤟠𦰰𦰲𦲰虛裇𩂉須𩑕楈窢頊嘘墟𥈈𥮪𨼋需𩒇𩖕魆噓𠾫嬃𢄼𢨁歔𤡣䈝縃蕦蝑𨞣𩒧𣚏𣰃諝𨂠𥕰䇓𦈡𧪮𩓣𩾊𥳗𦄼𦅏𦪡譃𨅑繻𨬗魖䱬驉鑐鬚𪆛𪙫 # xū
    <*俆徐𣆒𥅺䍱蒣𨌎 # xú
    <*许㞰㑔呴姁诩䧁冔栩珝偦㑯許𡹲𩠋暊𥚩詡𨋾𤸀稰䅡鄦糈䋶𩰠𦠷𨍐醑盨䔓𩝔𧕼 # xǔ
    <*㕛旭伵㘧㜿序汿芧䦽㐨侐𠜄卹怴𣢊沀𤆞䂆叙㖅恤昫洫㳚㺷𤬱𥍟䘏𨹘垿𡱣欰殈烅𤇳珬𥄵𧆡䢕勖敍敘勗烼绪续𦕓𦜃𦯅酗𫚈喣𠷙壻婿𡦁朂𣨤溆𣸃𥆛絮䎉聓𧊥訹𨜿𨻍𠹘㜅㞊慉煦𤷇𥇏𥇿続𦝳蓄䛙𧧓賉䣱䣴槒漵潊㷦盢瞁緒𦑍聟𧶍銊䦗𨴎㗵獝𤡶𤭽𤲸稸緖𧼑䬄魣𠆐𣊞𥊊藇䙒𧹭𩣊㵰瞲𧏺𧹴𨵮𥎕藚𥎗𧁃𩌮𩌲𩔴𩔼𩪉 # xù (p1)
    <*續𨣦䳳𪖩𨷔𩍳鱮𩽆 # xù (p2)
    <*蓿 # xu
    <*吅轩昍㓩㝁宣𢙂弲𢏧軒梋谖喧塇媗𡬳愃愋揎𢰊𤟿萱萲暄煊瑄𦐽蓒䚙睻䁔儇𡈣㩊禤䆭箮縇翧𦑙蝖鋗懁蕿𧤎諠諼㻹鍹駽𧑩𩋱㦥矎翾藼蘐蠉𩤡譞𧾎鰚䳦𩕖𩕪䚭 # xuān
    <*玄𠣖㔯㹡玹㘣㳬痃𧉎𧟨悬旋琁𠗻蜁嫙漩𠥞暶璇䮄䁢𧜽䲻檈䗠𧐗璿𡈴𡾥懸𣟳𧔤䲂𩙢 # xuán
    <*㧋咺𢈋选晅烜㾌𥥾㔵𣉖𣎓𧡚選𧡢𦌔顈𩘒癣䠣癬𥶷 # xuǎn
    <*䀏𢂄怰泫𨹆㧦昡㳙炫绚眩䍗袨铉䧎𠵷琄眴𦛔衒𨊼渲絢䝮楥楦鉉𩉥𢳄碹蔙𨁁䩙𩑹㯀𦈝䃠镟𩃚鞙颴縼繏䍻䩰𩋢𩋫𤂿𧾆鏇𥌭讂𪍧贙 # xuàn
    <*𢪎削𥄒疶蒆㻡靴㗾薛辥辪鞾𪃅 # xuē
    <*穴斈乴学岤峃茓泶袕鸴𢼺䋉𧉢㖸𢯳㿱𦥯踅壆學嶨澩燢𥀣䱑㶅㰒觷𧸗雤鷽 # xué
    <*雪膤樰艝轌䨮鳕鱈 # xuě
    <*血吷㕰𨑣坹㞽𣧌狘𣧡𥄎桖𣧵𥄴𦐍𥅧䆝䎀谑䒸𦰾䛎䦑𣪨𣺭趐䫼𩖱䬂𩖶謔𤀰䆷瀥𩌊𨭁𧔗䤕䭥𧮞 # xuè
    <*坃𦘶勋埙焄勛𡺕塤熏窨蔒勲𡑎勳薫駨嚑壎獯𫄸薰䠝曛燻臐𤑕矄蘍壦爋纁䗼䵫醺𩪱𧰣 # xūn
    <*廵寻旬巡驯杊畃询㖊峋㡄恂𣌨洵浔紃荀荨栒桪㰬毥珣𥙣𥾡偱𤿟𥒘㜄尋循揗䖲䘩㨚𩖰𦳣詢𨀴馴𣖼鄩𨼔鲟噚潯㵌㽦䋸䙉攳樳燅燖𤛧璕𦠅𪀠𪀽𥳍𦅀𦅑蟳𤃺𧾝𧾠𧾩鱏鱘灥 # xún
    <*卂训讯伨汛迅侚巺㢲徇狥迿逊𡿼𢏤殉訊訓訙𩠇𠊫奞𧥿𨺮巽殾稄𠹀𣹯䛜遜愻賐𩾧噀潠蕈𩾄𩊻䭀𩷰𦫯𧸩顨䞊鑂𪇑 # xùn
    <'\uFDD0Y' # INDEX Y
    <*丫圧压吖𣏎𨸺庘押枒㳌垭鸦𠜲桠𤵭䆘鸭𠋗埡孲㝞㾎铔椏𥇠䃁鴉𩿔錏𨨙鴨壓𩭯鵶鐚 # yā
    <*牙伢厑岈㧎𤘅芽厓𤘆玡䄰琊笌蚜堐崕崖涯猚瑘睚衙漄𨖭𩃐齖𧓪𧬬𪗹𪘲 # yá
    <*𤴓厊庌哑唖㿿啞痖雅瘂𧧝䪵𤹎蕥𨁶 # yǎ
    <*劜𠮜圠𡴭轧亚𥐕襾讶亜犽𧈝迓亞𠄮𡶦軋娅挜砑俹𡷻氩𠵣婭𡸗𡹄𢛄𢛟掗𢮊𥒧䅉訝𨓴𡇼揠㰳氬猰聐𦜖䢝䰲圔𥏝稏𩨠𣉩窫䝟䦪𩮝𦉟𪆰𦉧齾 # yà
    <*⺄呀⺂ # ya
    <*𠛭恹剦烟㸶珚胭偣𠝢崦㤿淊淹焉焑𦛞菸䞛阉㖶湮𤟟腌㮒煙硽𦝪鄢嫣漹𤡖䅧嶖樮𣩙𤎄䊙𦎣䗎醃𧹬閹嬮懨篶𨽑𩈯懕𢤍𩣲臙𦏥䑍黫𥷀𧺅𨣻 # yān
    <*讠延闫严妍㳂芫言訁𨸮𠰖岩昖𣥡沿炎郔姸娫㫟狿㿼研莚娮㝚盐啱𢉘𢌨𣭻琂硏𦛣訮閆阎嵒嵓㺂䀽䂴筵綖蜒𧻃塩揅楌𤲩䇾䓂詽𣼞碞蔅䢥𨡄㗴𤡥𤢋𦫤䖗𧍢𧎘颜𩩄厳虤閻檐𤖝𥕼𦌚𧇱䗡顏顔𩩴嚴壛𡣽巌㶄簷𥴿𧬌䫡𪂈櫩㘖𤯐㿕䀋䦲黬𠘥壧孍巗巖𥶿㘙欕礹鹽𣡞䉷𤅸𧴣𣡶𥤟麣𨤎𨷽⻈ # yán
    <*㕣𠆲夵㚧𢇘㫃抁沇𧥜乵兖奄𢈂𥃿𨒄俨兗匽㢂弇𥤴𦏹衍𣃧䍾偃厣掩𣃳𤟇眼萒䣍郾酓𨟹𨺥嵃𡹶愝扊揜𢯼棪㭺渰渷𤗎琰𧊔𧠦𨀅遃隒𠍛𢾑𣄉椼𤯇䄋罨裺𨠭𠻤𡙶𣄑演𣼠𥍻𥯃𦁙䎦𦖈𦧡褗戭𤸹䁙蝘𨁹魇噞𨂪躽𢅠縯𧽉𨃰䤷𩗷檿𣝎𤂠𥜒𧽞黡𪗙厴𢸴𥀬𥣘䗺𧞣𪗤甗鰋鶠黤齞龑䶮儼黭䌪𧾤顩𩻖鼴巘巚曮魘鼹䲓𪒝𪒠齴𤫣 # yǎn (p1)
    <*黶 # yǎn (p2)
    <*厌妟𤜵觃牪咽姲彥彦砚唁宴晏烻艳覎验偐㛪𢇈𢔂焔䂩谚隁喭堰𢜰敥𣃾焰焱猒硯葕𨻂雁傿椻㰽溎滟㷔𨻳鳫厭墕暥熖𦁏𦑎𨁍酽𨴣嬊𦖧䛳𧩅谳𨡎𨡣𩃀𩒖餍鴈𡚇㢛㦔燄燕㷳㷼諺䞁赝䢭鬳𣄝曕𩜽𩳢鴳酀𨪶𨶁騐験𩩶䳛𪁡嚥嬿艶贋軅䨄𩸞䳡𪑈曣㬫爓醶騴𤬝鷃灔贗䳺𤅊觾讌䜩醼饜驗鷰𣡕艷𩪴𪙊灎釅驠灧讞豓䴏 # yàn (p1)
    <*豔灩䶫 # yàn (p2)
    <*央𠮴咉姎抰泱𥃽𣐫殃胦眏秧鸯𧲱𦴊鉠雵𤸡鞅𩲴㒕𤢐䱀鴦𪓛𪚻 # yāng
    <*扬羊阦阳旸杨炀飏佯劷氜疡钖垟㟅𢏙徉昜洋羏𦍕𨒫烊𤞢珜𦭵𡹕𢽕眻𥒞陽崵崸揚𥬴𦍹蛘𡩶㦹敭暘楊煬禓䖹𨋽𣉚瘍䁑㬕諹輰𤢮𦼴鍚鴹𥂸𥳜𩋬颺䬗鐊𩤟鰑霷𩴨𪕫鸉 # yáng
    <*仰佒坱岟𩧫养𣃝柍炴氧䍩痒紻䒋𦯒𨱝傟楧𧵌軮慃氱蝆養𠢴𩊑駚㔦懩攁癢礢䑆𧓲𦏱 # yǎng
    <*怏恙样㿮𥥵羕𧥴詇𨋕㺊𠍵𡡂𢟣㨾様𣗹漾𥠜𨖌𡠘𢵇樣䬺瀁𧫛𨎔䭐䵮 # yàng
    <*羪 # yang
    <*幺夭𠕻𠣑吆𡆩妖𢆷𢆽枖殀祅𦔷𡝩𥹱訞䛂𨓳喓㙘𣨘葽𩑗楆腰䌁𧍔䙅鴁𡢹𧷋邀𡣠𩜸䳩⺓ # yāo
    <*爻𡔜尧尭𢈆肴𨹋垚姚峣䂚轺倄𡝛烑珧䆙䋂窑䚺䚻傜㑸𠌠堯揺𤫺䖴谣軺㑾嗂媱𡩸𡺯徭愮搖摇滧猺遙遥𢊙摿㨱暚榣𣣳𤚭瑤瑶䢣銚飖餆𠏈嶢嶤𤬔磘窯窰𩲻𩿕𢋇𤬖䌊䔄餚繇𧤮謠謡𧽎䠛𨍳𨘔𩋃䌛𦾺𦾾鎐鳐颻䬙𠑐𦆸蘨𩥣𢑈邎顤鰩𧄎 # yáo
    <*仸㫐宎岆𥤣𡛙𢂊抭杳狕苭咬㝔柼𡨇眑窅窈䆗舀𦥝偠䆞婹崾𥦖𨱧㟱溔㴭蓔𠢩㢓榚䁏𧠽𩨴㫏䁘𦦌𩢒𩬗䴠㹓鴢𪐯闄䯚𩩼騕齩鷕䶧 # yǎo
    <*𡶂㔽𥃺㞁穾𥤹药要钥𥁒𦤋袎窔𥬓𢝍筄葯詏𠍩𠹑㿢𠟋熎覞靿𩑴獟鹞𪖐薬𧇠𩳔鼼㵸𥪯曜燿𦡱艞藥𤂼㿑𤾫矅𢅹𤒝耀纅鷂𢺇𤄶𥌺𦇬𩯛𧢢讑鑰 # yào
    <*倻掖椰暍噎潱𨸌𧏽䭇𩜺𧒐𨶮蠮 # yē
    <*爷耶捓𦕆㡋揶铘爺𦰳釾䥺䓉𨈺鋣𥯘𣚋鎁擨𣩯𤑷𩸾㱌 # yé
    <*也𢀘吔冶𤝉𠥇埜野㙒嘢漜𡑀壄𧐓 # yě
    <*业叶曳页𡛌𢪧曵𤝇邺夜𡛽抴𣐂𠀸亱𠱝枼洂𤝱頁捙晔枽烨啘㖡液谒堨𢉥㪑殗腋葉鄓墷𢱴楪業䁆𦀕𨉅䢡馌𠄅僷㥷曄曅歋燁璍𥠍𥮧䎨𨼥𠟪㩎擛皣瞱䈎𦂡𨂒鄴靥㗼嶪嶫𢢜𣚕澲𦠜𧎭謁䤳䤶䧨𨽀餣嚈𡀽𡁁𡽣擫曗㱉𣩫㸣瞸鍱擪𣎩𣰛爗礏䊦鎑𩐱𩘏䭎饁䱒𤳪𥌅𦤪鵺𪍅𧗖鐷䥟䥡𩉂𪑦𧔦𩑃䭟靨驜𩱝𩼋鸈𪋫𩼴𪒲䲜⻚ # yè
    <*亪 # ye
    <*一乊弌辷衤伊衣医吚𠰄壱𢨮依祎咿𠲔𠲖㛄𡜬洢㳖䧇𣐿𣢷𧉅悘渏猗畩䚷郼铱壹㥋揖欹䒾蛜㾨禕㙠嫛𢊘漪稦銥嬄𣘦噫𠿣夁𢣉瑿䃜𧜤鹥繄䫑檹毉䉗䔱𧫦醫𪁚黟譩𡄵𩥯𩮵䪰鷖𩕲黳𧮒𪈨⻂ # yī
    <*乁㐌仪匜𠛃圯夷㚦𢩼迆冝𠤕宐㦾沂𤖪诒𫍟𠅌侇𠜁宜怡沶狋𥃸䄬衪迤饴𠄱𠈶𠤗𠤘𠩗咦姨㝖㞔𡱐峓𢂒𢓡恞拸柂𣐓𤆾㹫𤝻珆瓵𥙁𥙇贻迻䧅𠲻宧𡷪巸弬扅栘桋𣐵𣢭𤇴𤈙㺿眙𥄻𥄿胰𦚟袘訑貤𨛯𤘊㼢痍移𥹋耛萓𩚇𢞉𢱁椬𣸘羠蛦𧣟詑詒𧦧貽遗𨜽𨠑𠍫𠗺𠪗媐㥴暆椸𣕁䇵誃𧳁跠𨠶𨳷頉颐飴𠼪𡻣疑𧡇𧣬䬁𩖹𩖾䬮儀 # yí (p1)
    <*𢕷𣙛熪箷𦟧遺䩟𩗑𩛮𠏩𠐀嶬彛彜螔𢖅䣡頤頥䮊寲嶷簃𧷅𦡫䔟䞅顊𩓧䱌𪀓彝彞𥫃謻𩤒鏔𩔦𩸨𥌟籎𧓗觺𨣬㰘讉𪘬䲑鸃䴊𡬓𩼨𪐔 # yí (p2)
    <*乙已以𠮙㠯钇佁𠯋𢦕攺㰝矣苡㕈𥫜苢𩠂庡𢙇𤝳舣蚁釔倚扆笖逘酏偯㫊𥑴𦮸崺旑椅鈘鉯鳦㰻𥏜裿𩛆旖䰙𩾠𡼎䝝踦輢𪐣㠖敼𥰧螘䧧𢷔檥䭲礒䉝艤蟻顗轙𪘃𧔮𩡣齮𪙴 # yǐ
    <*乂𠂆义亿弋刈忆艺𠚮匇𡥁𢖫㲼肊议𫍙亦伇㐹𠨾㚤屹𢇙𢇚异𢓀㣻𢖴𢖺𢩮𦘳芅伿佚劮呓坄𡉛𡊁𢎀𢎃役𢗎抑杙𣧄𤣮𤴧𥘒𥩖耴𦨇苅译邑佾㑊𠡔𠡝呭呹𡊶峄𢇸㣇怈怿𢨳易枍欥泆㳑炈𤬩𥘠秇䄩绎𦙨诣驿𩧭俋㑜㖂𠲚奕帟帠𢂗㡼弈𢎉𢏗𢘽枻㱞浂㹭玴疫𥫝𥾐羿𦏸𦭥䘝衵𧺎轶𨱁𨹝𩚂㑥𠩫唈𠲺垼㛕𢂼悒挹栧栺欭浥浳 # yì (p1)
    <*𤤺益𥅓䄁𥥌䖊䖌𧈻袣谊䣧陭𪎈勚埶埸𡍡𢈶悥掜殹㴁𣶫𣷩異硛䄿𥥴羛翊翌萟𧆦𧙡訲訳豙豛䝘𧺝逸釴隿䯆㓷𠶷㛳㝣𢀁幆𢄅㡫敡晹棭殔𣨟湙㴒焲𤥿𤶛𥒵䇩䋚𥿹䌻䎈𦥱蛡𧊣𧊤詍䝯跇軼𨜶鈠𨻊𨻏䬥骮亄兿㔴㜋㜒意𣎅𣦌溢獈𤧕痬𤷅睪𥍴𥟘竩䇼缢義肄䓃䓈𧋏裔裛詣𧱊𨋯𩂒𩾘䵝𪐘𠍳勩𠽜嫕廙榏㱲潩𤣨瘗𦎝𦓻膉 # yì (p2)
    <*𦶂蓺蜴䘸𧱏靾駅𩾢䴬億㙪㙯㦉𢡃撎槸毅熠熤熼瘞𤸸䋵䓹䗑誼䢃𨦯镒𨽹𩂹𩎭䭿𩳇鹝鹢黓劓㘁圛墿嬑嬟嶧𢍰憶懌曀𣚘㱅殪澺㵝㵩𣿉燚瘱瞖𥡪穓𥱃縊𦠉艗薏螠褹𩎷䭂㘈寱斁曎檍歝燡燱𥜃翳翼臆䔬䗟貖賹𩈭𩋌𩣞鮨𪀕𣤪癔𤻂𦌩𦔜藙藝𧑌𧢂贀𧷥鎰镱𩷍𩷘𪁛𠓋𠥦𣫙㽈䆿繶繹𦔥䕍䗷𧬇豷霬𩘧鯣鶂鶃鶍㢞㦤瀷𤑹 # yì (p3)
    <*蘙譯議醳醷𨣠饐𡄻囈𡾾𥜥䉨𧃟鐿䦴𩟉𩪟𩴜鷁鷊𪗷懿𤼌𩍖䭞𩪣𩴮𣡊襼驛鷧𪒕𪕶𧅖虉䰯鷾𥃠讛𧾰齸㶠𥸊䖁 # yì (p4)
    <*囙𫡑因阥阴𡇂𤝎侌垔𡋪姻㧢𣱜洇茵荫音骃栶殷氤陰凐𡖣𣸊䄄秵裀铟陻隂喑堙婣𢉩愔筃絪𦈑𧊭歅溵禋蔭慇瘖𠖟銦緸䓰鞇諲䜾䤃霒𩃬駰噾闉霠𡈲㶏韾 # yīn
    <*冘㞤乑㐺㕂吟犾㹞苂𢓕斦烎㸒㹜𨛊垠𢂨泿𥤷㖗圁㝙峾狺珢荶訔訚婬寅崟崯𡸛淫訡𨓮银𢝯𣓆䖐𧦸鈝龂滛𤷏碒䓄鄞䪩𠪚𡐔夤𥮍蔩銀𨦆𩂢噖㙬𣘴殥𣽮璌𦟘誾𧩬嚚檭蟫𨟏䴦𡓓䖜霪齗𡓿𪛊𪘎鷣䕾𪙾 # yín
    <*乚𠃊廴尹引㐆㧈吲饮𢓙𨒦䇙䒡蚓𢛦𥬜赺𨈧𨐐隐淾鈏飲𩚕𣔸隠靷飮㥯朄輑𠽨㱃磤趛𨡢𡼽檃瘾隱嶾濥濦𦈠螾𦾻𤂹𤻘𥖵蘟𢋻㦩櫽䌥癮𨏈讔𩖄䨸𪙤⺃ # yǐn
    <*印𢌲𢪪茚洕胤垽𤵯㣧㴈䚿𧥸𨟴堷𡩘湚猌𦜲𧦹𨋙廕𦝴蒑㥼𢳃𣱐䡛酳𩂥慭㪦癊𩐞㒚憖憗𨢂𩬵鮣䲟㡥懚𢷍𤢦𤯸𪔽檼𣦫䕃𪔰 # yìn
    <*粌 # yin
    <*𠮳应応英偀桜珱莺啨婴媖愥渶绬𠸄𡎘㡕朠煐瑛䣐嫈𢄋碤锳䧹嘤撄𤭫甇䁐𥍼緓缨罂䓨蝧賏樱璎𦔃罃褮𧯀𨍞鍈𨵛霙鴬鹦嬰應膺䦫韺𠠜甖𩄪鹰𧓀𨟙䪯鶑鶧嚶孆孾攖𤣎罌蘡譍𩹅櫻𤜉瓔礯𧢛譻鶯𥌽𥌾𥐑鑍纓蠳𧕄鷪𧮆軈鷹𦦿鸎䴍鸚 # yīng
    <*𣲜盁迎茔盈荧莹営萤营萦蛍𨜏𡺡㨕溁溋𤟣萾僌塋楹滢𦝚蓥潆熒蝇瑩𤹜䁝䊔蝿䤰嬴㵬營縈𦖽螢濙濚濴藀覮謍赢𡃅瀅鎣攍瀛瀠㶈瀯蠅𩸥𢥏櫿瀴䑉贏灐㹚䃷𧭓㿘籝䕦灜𧅋𧕍𩻷籯 # yíng
    <*矨郢浧㹵𠝟梬㢍䀴𥏎䨍颍㲟颕颖摬𤌌𨠸䬬影潁瘿穎䚆頴𩳍𡂚𤁽𦡺𦢆𩘑䭊𪊵巊廮𣟤鐛䭗𣤵䭘癭𩖍 # yǐng
    <*㑞映𤇾𠊶暎硬䤝媵𥚿膡𦩩噟𡀘𤹥鞕𡁊𢣙𣋋𨪄𩋹𡄖䙬鱦䵴 # yìng
    <*哟唷喲 # yō
    <*佣拥痈邕庸𥑿傭嗈㜉𪪝㴩鄘雍墉嫞㟾慵滽䧡𢧳槦牅𤛑𦤘𠆌噰壅𢢓擁澭𥧱𦃽郺镛㐯臃㻾㽫癕𧝸𧴄雝䗸鏞鳙𣋿𧴗廱灉𩟀𪄉𢀍𩍓饔鱅鷛癰𪇛𩟷 # yōng
    <*㝘𧲤喁揘𧺸𨦡颙䗤顒𩔔𩤛鰫𪅟 # yóng
    <*永𣏀甬咏怺泳俑勇勈栐𠳀埇悀柡涌𨓨恿㦷㴄𦨤𦨬傛惥愑湧硧詠𠹍塎嵱彮愹㷏蛹𧗴慂𧻹踊禜𨴭鲬㙲䞻踴𩜳鯒𩆄𨤂𧖇 # yǒng
    <*用㞲𡵜苚㶲𥁎砽𥥝𧙇𩬮醟𨶽 # yòng
    <*𠘳优𠮫𢆶忧攸㳊呦怮泑幽逌悠㗀𡺒𡺖㴗𦎓麀滺憂𢿚𧍘優𠨦鄾嚘𢋣瀀𩘈櫌㱊𧀥𩤹𣁨𥣯𤄘𥽟纋耰𤣙䥳𩽇 # yōu
    <*尢尤由𨸙㕱𡇀㚭𡯙沋犹㽕䢊𨑫邮𠧠𣏞𣧗油𤘜肬𡋧怣斿𤤧疣𨛕𠧴㛜峳𢓿浟秞䍃𦥣莜莸郵铀偤㳺蚰訧𧰰逰㫍𣓐游猶㾞䢟遊鱿𢟅楢猷𦳧𦳷䖻鈾鲉𡈙𤸈𦵵䚃輏駀𥯞䑻𦷿𦸙蕕蝣魷𦑸𧳫輶𨗰𨘁𩗚鮋𩿬𡈰𧡹𥴕𨘵𩘓㒡㘥𡈵𢖟𨙂𩥘𩹊櫾 # yóu
    <*友有丣卣𢪥𣢄苃酉𡊧𥝘𠖋𣅺𣢜𣧥㶭羑庮栯𤱎羐莠梄聈脜铕㰶𣣜湵𣸠䅎䒴㮋禉蜏𧠶𠢢𣣸銪䬀槱𣤎𤍕牖牗𦩲𣿤𨡴䱂䳑黝懮𤪎𦏇𥜚𧆕 # yǒu
    <*⺀㓜右𡯉幼佑𣅄𤴨侑孧㤑狖㹨糿哊囿姷宥峟𢈓柚牰𤤬祐诱迶唀𡜳㕗䀁𥙾䆜蚴亴𣓛貁釉𦳩䞥酭𩑣𩲎誘䛻𩜷㺠鼬𩴑𩴙𧅲𧆘 # yòu
    <*蒏 # you
    <*込㝼扜纡迂迃穻陓紆虶𧈯唹淤盓㰲𤥽𤕘瘀箊𨖛𩂧䣿䆰䩽 # yū
    <*亐于邘伃㚥㬰余妤𢎻扵㪀杅欤𤜹玗玙㺮於𣢒盂䄨臾衧鱼乻俞兪㤤㳛䂛禺𥝨竽䍂𦈣𦏻舁茰娛娯娱桙狳㻀谀𨊱䢓酑馀渔䏸萸𧙶𨜖隅𨾌雩魚堣堬崳嵎嵛𢔢愉㥚㥥揄楰渝湡畭硢腴𦱃萮𧊠逾䩒𩨈骬𩨗𩨙𠸹愚𢾄旕𣄊㬂楡榆歈㷒牏𤚎瑜𤧙䄏艅虞觎𠎳𢊧漁㼶睮䃋𥔢窬舆褕𩡃𪉐歶𥯮𦋯羭䐳𦩞蕍蝓𧍪諛雓餘䰻𡑾嬩 # yú (p1)
    <*𢋅澞䁩覦䜽踰𩢶𠧇𡁎𡂊歟㺞璵䔡螸䗨輿鍝𨨶𨵦謣𧰇䬔髃鮽𪊻旟籅𦦫𧞏𨶢騟𩤺鯲𢹏蘛鰅𪃍𪃎𪑝𣟰𧃠𧾚𩥭䱷䲣鷠𩺰㶛𥷔𩦡𩦢𩟳鸆𪇝𨰸⻥ # yú (p2)
    <*与予伛宇屿㡰羽㲾⻗俁俣𠱐𡷎挧𣢦禹语䣁㑨𠋟圄峿㼌祤𦭳偊匬㔱圉庾𢮁敔𤗃鄅㙑㝢斞𣨝㺄𥒾萭𨝈傴㒁寙楀瑀瘐𦀡與𦳅𩵎𡻢㣃語𥛩窳鋙頨龉㒜噳嶼懙𤹪𦥉𧱬貐𨵉𩃯𩩑㠘䨞𩩘㦛斔麌䥏𪂕𦦲蘌齬𪋬 # yǔ
    <*肀玉驭𠫣圫𠀛𡬞𥝍聿芋芌妪𡿯忬饫𢌻㧒𥸪育郁𡋬㤢昱狱秗茟俼𠊏峪彧浴𤞞砡䢖钰预𩚄喐𡇺域堉㚜𡨣悆惐㥔𢛨欲淢淯𥆉𥙿𥹔𧉣𧗪袬谕逳阈喅喩喻媀寓𡨿庽御𢔥𢯮棛棜棫𣣎焴琙矞硲䋖𦱀𦱂𢔬裕䞝𧿷遇飫馭鹆𠕦𡔴𢔴愈𣕃滪煜㽣稢罭艈蒮蓣䘱誉䛕鈺預䫻嫗嶎戫毓獄瘉𤸒䁌䈅緎䋭𦈸䍞𦋢𦎘蜟蜮䘻輍銉䨒 # yù (p1)
    <*𩈕𩊇𠏚噊𠽵𡈨慾𢡎潏𥉑稶蓹薁豫𧶠𨉗䢩遹𨗝𨞓鋊𩛪𩛭𩲾鳿𡒃𢒰澦𤀝燏燠蕷䘘諭𧼫錥閾䮇鴥鴧鴪儥𡒊㦽𣋉𤳕䂊𥎐礇禦𦡭𧐄𧫊䤋𨩬𩋉𩎹𩝗魊𪁀鹬𣝑癒礖礜穥篽繘𦒑𧑐𨄯醧𨪎𩋤䮙鵒䵥𪑆櫲䉛𦦩𩘤饇𪂉𪂵𪋉𪑌𣩺𦏜𢖡譽轝鐭霱𩏟𩘳𩘻𩟑𩱌𡬊欎䜡𨮔驈鬻𣡉籞𥷞鱊鷸䴁鸒欝𩏴𪋮龥軉鬰㠨𣍛𩰪鬱𩱱𡿥𢺴灪籲𥸤 # yù (p2)
    <*爩𥘄䖇𪓊⺺ # yù (p3)
    <*澚 # yu
    <*囦㠾鸢剈𢍈冤𡷡悁眢鸳寃𢏮渁渆渊渕𥿎𨓯惌淵㾓葾𡈒𢱽棩𣹠蒬蜎裷𨀮鹓箢𨖳鳶𡢊蜵䡝𩛟駌鴛𪀈𡣬𩝸嬽䥉鵷𪔗𪔙灁鼘鼝䨊 # yuān
    <*元円𨸘贠邧员园𢗯沅杬𠩠垣爰䖠貟原員圆笎蚖𧉗袁䦾𠝳厡酛圎援湲猨缘𦍼茒𨕗鈨𨻣鼋園圓塬媴嫄㟶㥳源溒猿獂蒝𧻚𩉯䬧榞榬㹉𤬌辕緣縁蝝蝯魭䲮𪔅橼羱薗螈𧳭𩰵謜轅䳒黿𪕀𢷻𦿂鎱櫞邍䳣騵䱲鶢鶰𪄁𢆀𧔞𩍻厵 # yuán
    <*远盶𡯱𠒜逺䛄䛇遠𩐘鋺䩩𩔃𩌑 # yuǎn
    <*夗䏍肙妴㭇苑怨院垸𢂱㤪衏䅈𧙮傆媛𢐄㥐掾𡈓𢕋瑗禐𥭞愿裫褑褤噮𫖸䬇䬼𩘍願𩟁𩕾 # yuàn
    <*曰曱𢁞约約𦚢𩚈𢾔𧨄𠏃𡡕箹𩜌矱彟𪘳彠 # yuē
    <*𢯵 # yuě
    <*⺝𠨲𡆦戉刖𨸀𠩉𠯲𡆽妜岄抈礿𫐄𡛟岳玥𨒋恱𢦰𣐋䆕悅悦𥩡蚎蚏軏钺阅捳䋐跀跃䡇𨊸䢁𨳕𠔠𣨡𥆟䆢粤越䟠鈅𣦏粵䋤鉞𣻮㹊𦋩𦤕𨁑䤦𨿁𩎙𠪶𠾲㜧𧇓閱閲𠿋嬳樾篗𩿠嶽𩓥龠㜰㬦䥃𪁑𣤰𤑓籆𧀲𧤽瀹蘥𨙄𨸎黦爚禴躍䶳𣎱㰛籥𧕋𣌗𧅚𧹊䟑䠯䢲𪒥𤓝𨷲鸑籰𩁯𩱪𦣜鸙𥸘䖃𨈋𩱲 # yuè
    <*𠚓晕㚃缊蒀暈氲煴蒕氳奫𥠺蝹𨍆赟頵馧贇𨷐𩁴 # yūn
    <*云勻匀𠣐伝囩妘沄纭芸䢵昀畇眃𥐩秐郧𨛡𡖒㛣涢𥬀紜耘耺𤈶𧥼鄖雲㜏愪𣖆溳筠筼蒷熉𧶊澐蕓鋆橒篔縜䉙𧬞 # yún
    <*允阭夽抎狁𠱳䇖陨荺𧉃殒喗鈗䤞隕䪳殞褞䞫馻㩈磒䆬𧼐𩂿賱霣𪏔𪏚齫䨶𪘩齳 # yǔn
    <*孕㞌运㚺𠈤枟郓恽𦈉𪉂𣍯鄆酝傊𡲪㟦惲愠𤶧運慍腪韫韵熅𣂊熨𤸫緷緼蕴䲰𡢘𡽅縕薀𧡡醖䚋醞餫藴䩵韗𩏅𩏆韞𦅿蘊韻𩴉𪍝𡅙 # yùn
    <*抣繧 # yun
    <'\uFDD0Z' # INDEX Z
    <*帀匝𠯗沞迊咂拶紥紮㞉鉔𧌃𨠿𠽷魳𦠛𦾬臜𣤷𩞶㦫𣤺臢 # zā
    <*杂沯𣴖砸偺𢽜䞙喒𣸐𤠀䨿䪞韴雑𩇺𢶍𡁕磼襍雜𧾁𧬩𢹼𤄔囋囐𥷩䕹雥𪚇 # zá
    <*咋𠷿 # zǎ
    <*𡿧𢦏𢦒災灾甾哉𢎋栽烖菑𣔮渽溨𦞁𦳦睵賳 # zāi
    <*𣅃𤝖宰䣬崽𠎶㱰𣪮𤌊䏁䮨 # zǎi
    <*𡉄再在扗𨚵洅𤞳载傤𧯥𨀬載酨儎𩛥𩛳縡䵧 # zài
    <*兂𡡖糌䐶簪簮䍼鐕鐟𥸢 # zān
    <*咱 # zán
    <*昝桚寁㳫揝𣸄𢄤𨖋噆撍𨘄儧攅攒䭕儹攢趱趲 # zǎn
    <*㟛暂䬤㔆𠼗㣅暫賛赞錾𩛻𥎑鄼濽𥜙𥳋蹔瓉贊鏨瓒𨙏酇㜺灒讃𩯒瓚禶𧄽襸𩯳讚饡 # zàn
    <*𢍿匨𢈜牂羘赃㮜賍𣻟𦟃臧蔵賘𡁧𤛻𤃼𡅆贓髒贜𪓅 # zāng
    <*驵駔 # zǎng
    <*㘸奘弉𤞛脏塟葬𨌄銺臓臟𧕨 # zàng
    <*傮𡐋㡟𦵩遭𨠷𣩒㷮𥀛糟䜊蹧醩𣍖㯾𪙡 # zāo
    <*凿䥣鑿 # záo
    <*早枣𢑖𨚰栆𤞋𧈹蚤䖣𢄀棗𠙬澡𤩨𧎮𨐉璪薻䗢繰藻𨎮䲃 # zǎo
    <*灶皁皂𨒽唕唣𡌣𡨗𣴢𤟀造𠴵梍𦯑喿慥煰艁𢲵𢵥𤍜噪簉燥竃𥖨譟趮躁竈 # zào
    <*则択沢择泎泽责迮則唶啧㟙𡸦帻㳻笮䇥舴責㖽𥍱溭𤾀矠𨕠𩂖嘖嫧幘㣱𣼦㺓箦蔶𨖊樍𣤈歵𤖓𦔈𦟜諎赜䰹𠟻擇澤𣿐𤢟皟瞔𥎍𧶷䯔𪌟𣛸簀𥼃礋襗謮賾䕉蠌𩄾𩌪𩔳齚䕪齰鸅䶦 # zé
    <*夨仄庂汄𠨻𡵗㳁昃昗𣬿𡸈捑𡹨𢮚𣆽崱𢯩𢧠𥟔𩾸 # zè
    <*伬 # ze
    <*贼戝賊鲗𢨗𦽒鯽蠈𧒿𨆎鰂鱡 # zéi
    <*㻸 # zēn
    <*怎 # zěn
    <*谮譖譛 # zèn
    <*囎 # zen
    <*𦀓増鄫增𡡑憎缯橧熷𤎯璔𦼏矰磳罾繒䎖𧢐譄𨲯𡾽鱛 # zēng
    <*㽪 # zěng
    <*锃鋥甑赠䙢贈䰝𪒟𪙭 # zèng
    <*扎吒𠯩抯奓挓柤査哳偧𥹁喳𢄄揸渣𠭯楂䐒𦳏劄㗬摣㾴皶𠽣㦋㪥樝𦟰觰𤹡皻𥡧𧩫譇𧬅𩮎𪗭𪗵䵙齄齇䶥 # zhā
    <*札甴𠓣𠰏㱜𣧖㳐闸𠝚𤵦蚻𧉫铡𡎫𡟢𠢙𢧖煠牐閘𠍹𠢡箚𧶇𢧻𣽛𤡨𧼰𧼶𧽅𩃡𩿤耫鍘𩃹𩩥𤁳𩳶譗䮜䮢𣟦𩥠𧄠䥷 # zhá
    <*厏拃苲眨砟𤈩㴙搩鲊㷢𥀈𥀉鲝䋾𦂉𦑯𧨿踷䛽𨂵鮓鮺𨅓䕢䱹𩻢𩼫 # zhǎ
    <*乍灹诈𡗸㡸𤰦咤柞栅炸宱痄𧿌䆛蚱溠䖳詐𨋘搾䄍榨䃎𧧻𧨊𩽽𢕮𨡗霅𩬟𣛽醡𩶱 # zhà
    <*夈粂捚斋𤞮𠵠斎𠷒㒀𠞶摘榸𢴨䔝齋𤻦𨅪𩝿𢋿𡅓𪘇𪘨𪗒𩱳𪗓𪚎 # zhāi
    <*宅㡯𩏽𦑱檡𪀥𩏪 # zhái
    <*𥞅窄䍉𧲻𧻍鉙𩬫𠏰𤢒 # zhǎi
    <*债𢯌砦𡍥𥍪債𨝋寨䐱瘵𥰾㩟𣩭𦤧𠑞𪑽 # zhài
    <*𡭞𧮪枬沾𣢤毡𤘇旃栴𥙡粘蛅飦惉𦧚詀趈𠌲𢧗𣮿𧋱詹閚䦓㮵䩇𠟧谵𪡏噡嶦㣶薝𧽆邅霑𫗴𪉜𡕁氈氊瞻𦪣鹯旜𧒝𨊈𩔣𪏉譫𧾍䱳𪃋𥶕饘鳣驙魙𡅹鱣鸇𩼼𩉗䶨 # zhān
    <*讝 # zhán
    <*斩飐展盏崭斬𥿜𨺿㠭琖𧲮㜊搌盞𥇢𠟉嶃嶄榐𦈻䎒䩅䩆颭㔊嫸醆橏䁪𧎰𡽻𣀁𣛷輾䁴䆄𥴐𦗢𨫀㞡𧬆𨣁𢅺䟋䡀𨣚𨭖𩕊䱼𧔡黵𧖉 # zhǎn
    <*占佔战栈𣳤桟站偡㟞𢈽䋎绽菚𧙭棧湛𤖆戦𨼈𩨍綻䗃䘺嶘㺘𧮺輚𨼮戰㻵虥虦𡁳𧝑𢤚覱𧀡轏䱠𡓦𧂁譧𩥇𪗦𤜇𧸪蘸驏𪘪𨇩𩆯䪌𩰃 # zhàn
    <*张𫗠張章傽𢕎鄣𡈠嫜彰𢕔慞漳獐粻蔁遧暲樟𤍤璋䛫餦𢷢蟑𧐊𧽣𨄰𩌬騿鱆𪅂麞𣌞 # zhāng
    <*仉𤓯长𠫝𢩰長涨掌漲𡑄幥𣾦𦺡礃𥳶𩭫𤕄⻓ # zhǎng
    <*丈仗𡚹扙帐杖𢪾㽴胀账粀帳涱脹𠅹痮障墇㙣嶂幛賬瘬瘴瞕 # zhàng
    <*鏱 # zhang
    <*𢗈佋钊𡖎妱巶招昭盄𤿘釗啁𥏨鉊𨱻𤍒䞴駋窼𦺓鍣𣋍𦗔皽 # zhāo
    <*㕚爪⺥𢁬找𠕖沼𦬔䝖瑵䈃𧳻⺤ # zhǎo
    <*召兆诏枛垗𡱜㡽炤狣赵𤙔笊肁𨹸旐棹䍮詔𩙩㑿照㷖罩䍜𠟅𠻥䃍䈇肇肈䑲趙𢡰𦹫𧳝𠕭𠠄曌㷹燳𩘀鮡櫂瞾羄𥵤𣠜 # zhào
    <*罀 # zhao
    <*𠌮㸙蜇嗻嫬遮𡂭𨰵 # zhē
    <*𠚱厇𤜤𠯓折䎲𦔮𦬃㞏歽㸞矺𢫰砓𥐽籷虴哲𡇠埑𡘭𡜯𡝊㡇𢬴㪿㭙粍袩𧲢𠝝啠悊晢晣㭯𤟍辄𠞃喆㢎蛰詟䇽䐑䓆谪馲𢟯摺𣻩𥏯𦞥輒𠽻𠾀𢢍𣙵磔𥛧䐲輙銸𩢐㯙𥕣𥧮𦠣𧎴辙𨵊𩊵㯰䊞𦗑𦗗蟄𧤠𩣩嚞𦅄𧑧謫謺䜆鮿𨅊轍𩐶讁䝃䮰𣠞𤮱𥤋讋𪐏䝕𨐃𪚥 # zhé
    <*者乽啫禇锗赭褶𩤜襵 # zhě
    <*这柘䂞浙𥑡這淛𣶋䏳𦯍𣇧𥭙蔗樜潪𦠟𦠠鹧蟅䗪䠦䩾䵭鷓 # zhè
    <*着著𡄡 # zhe
    <*𡈿贞㘰针侦𠛶𡇑𡇖浈珍珎胗貞㖘帪栕桢眞真砧䂦祯𧮬針𨱅偵桭𣓀㲀酙寊葴遉𠸸嫃𡻈搸斟楨𤚨獉甄禎𦳳蒖蓁鉁靕榛殝瑧碪䃌禛𥪘𩇜潧箴𦸮樼澵𣿎䈯臻薽錱轃鍼籈𪉕鱵𪇳 # zhēn
    <*𠵧 # zhén
    <*㐱𠘱𣱽𠠹诊𢏈抮枕㱽弫昣𣬻轸屒畛疹眕𥅘䂧袗紾聄䑐萙裖𧠝診䠴軫㪛𤷌缜䪴䪾𩒀𩒈稹駗𩬖𠬓縥𧤛𥖘𥌃鬒䫬𪑳黰𨏤 # zhěn
    <*圳阵𥤤纼𨸬𣏖甽䏖侲挋㼉䀕䊶陣鸩振朕栚紖𨳌𣃵𣒅眹赈酖塦揕䝩𩑘㣀㴨絼敶㮳瑱誫賑䟴𨌑㓄鋴镇震𩊡𩊨𩒪鴆䲴𩾺㯢𪐲鎭鎮𩄛𪁧䨯䳲 # zhèn
    <*凧争佂姃𢁿征怔爭诤𠲜埩峥𢓞挣炡狰𦙫烝眐𦚦𧘿𨛰钲崝崢掙𢮐猙睁䋊聇𨜓铮𨺟媜揁筝䇰㬹𦜎𦱊徰蒸睜𧗲踭鉦𩚫徴𢾧箏䋫䍵𦓺𧯫錚𡪺徵𨌢篜𧗆鬇䆸𦡅𧪣𨟃𩗲𤪡𨢹𠑅鯖䱢癥𩘼𩘽𩺄 # zhēng
    <*氶抍𤿆糽拯掟晸𨀧䡕𨋬愸撜𤸲𠏫整𩗵 # zhěng
    <*正㱏证𨚣郑帧政𢌦症𢏰𥒛幀証塣䂻諍𧶄鄭䦛䦶㡠䈣𨧭鴊㽀𥊼𪎻證䥌㡧𢹑𩏠䥭𠔻 # zhèng
    <*之支卮汁芝吱𠰅巵汥𤽁𥃫𥝑坧枝㲍泜知𥘡织肢𢎈栀㽻𤵋祗秓秖𥝮胑胝𦭜衼𫛛倁𠦧㩼㸟疷祬秪𥾣脂𨜎隻梔𦯫𧹛𨟾𪉆戠椥𦝔臸䞠䟡𨕕䧴搘㴯𥇭禔稙綕䓋𦴀榰䓜䓡蜘𧌔𧱒𨌌馶㯄䝷䣽鳷𥻬𧐉鴲織𧽦𨢮𪂅𦏤蘵鼅𪒊𩍲𩍵䵹𩙾 # zhī
    <*执𡰹侄妷𣳀直姪値值聀釞埴執𡌴𡸜𢃜㥀淔𥏅职植殖犆禃絷䐈跖嗭𡈊𡏀瓡𦳮鉄墌𡖻摭𣖭𣖿𥮖𨼓馽嬂慹漐𣽚踯𨂂樴膱𨤱𡁉㙷縶𧏸𡂣職蟙蹠𧀿𧾂軄𤃲䟈𪗨𧃐𧓸躑𩯈䵂㜼𪙹 # zhí
    <*夂止只𠮡凪劧㕄旨㫑阯址坁帋㡳𢇨扺汦沚纸芷㡶怾抧𣲵祉茋咫𡱔恉指枳洔砋衹轵淽疻䇛紙𢛍𢽃𢽗𤶓𥒗𦐖𦰘訨趾𡙑𢰙𣔐㲛𧊙軹䤠黹𣖌𧠴䛗酯𠼠𢾫㮹𤸓𥔊䅩𧛢𧜚𨵂𣚠𩬺䳅𧝉𢷸藢𨎌襧𧸅𧸕𨬚𪑜𨰛 # zhǐ
    <*阤𠚅𢖿至芖志忮扻𤆒豸𨑨制厔垁帙帜治炙质迣𨒉郅俧峙庢庤挃柣栉洷𤞂𤞌祑陟𠊤娡㝂徏𢙺𢚨挚晊桎𣥰狾𤿙秩致𦭮袟𧙁贽轾乿偫𠊷𠋤徝㣥掷㨁梽楖𣨋猘畤痔𥎹𥏄𥏊𥒓秲秷䄺窒紩翐䏯𦛧𦤻𦯯袠觗䚳貭铚鸷傂㗌𡍶𡖧㛿崻𢐂彘𢯶㨖智滞㴛𤦄𤦮𤴛痣𥍭䇧𥹩𥿮𦜋蛭䘭軽𨻆骘𠍜𠓶𡏚寘廌𢊁搱𢻙滍𤧜𥇕稚筫𥭡 # zhì (p1)
    <*置𦟔䓌𧠫䝰跱輊锧雉㗧墆𡠗𡠹𡮞𢄢𢄱𢍧𢕞𢧤𣗻滯潌疐𥏰𥠈䎺製覟𧣭誌銍𡑘幟𢅁憄𢡒摯𢴠𢴧熫𥏷稺𥠽膣䐭觯𧣾𧨰質踬𨁷𨖹𨡐鋕𨿛𩊝䬹𡀹𡽆𢖇擳旘瀄𤴟𤴢㿃緻𦃘䞃𨧵隲䩢𩊴䭁駤䱃鴙儨𠘖劕懥擲櫛𤖞𤛱穉䉅𦥎螲䚦𧤡𨃯𨎉𨟊䦯𪏀㘉𡂒㜱懫𥴒𦥏𦥐𧫡贄𩋩𩷓𪁊𪁓𪁩櫍瓆䉜䑇䕌觶䥍𨫔騭鯯䱥礩䆈𥣮豑𨆧𩹈䡹 # zhì (p2)
    <*騺驇𪗻𧸲躓䲀鷙𤓕鑕𩻼豒𩧄 # zhì (p3)
    <*徔 # zhi
    <*中伀𠛀汷刣𡖌妐𢁷彸𤝅忠𢨱泈炂㹣终𦬕柊𤯚盅衳钟䇗舯衷𣷡終𢃭鈡𨳗𧆼幒蔠锺𦉂銿螤䈺螽鍾𧑆鼨䝦蹱鐘𩅞𩅧𥗦𥷈籦 # zhōng
    <*肿种𠊥冢喠尰㣫塚塜𡻑歱𣹞煄腫瘇種𡰒踵𤺄穜 # zhǒng
    <*仲众妕狆㲴祌𠱧茽衶重蚛偅眾堹媑𡥿𢝆筗衆𣱧𤚏𥻝𦔉𩿀𦌋諥𧳮𨉢𩾋𧬤䱰 # zhòng
    <*𠚴州舟诌侜𠣘周𠱙𢏝洲炿诪𩧳烐珘𦭴辀郮徟掫㨄淍矪𥑸週䧓鸼喌𢽧粥𥿦䎇赒𦩈𧧔𧻖輈𥺝𥺞𨦞䓟銂𧣷賙𨉜輖𡀑𢐫䑼𧇟霌駲𩢸盩謅𩶣鵃𥼫騆𥌆𠤍譸𪆀𨏺 # zhōu
    <*𡊡妯𥾓轴㛩軸𥖠 # zhóu
    <*肘帚疛𢫧䖞𣥯菷𨥇晭㫶睭箒𦈺𧳜鯞 # zhǒu
    <*纣伷㑇呪咒宙㤘㼙绉𩧨冑咮𢓟昼紂胄荮𠊣𢼲𣆔皱酎晝粙䋓㑳𢃸葤詋䛆㥮甃詶𣻱㾭𦁖䎻䩜𩊄僽皺䈙𦂈𧛸駎噣𤏲𥀙縐𢷗𥲝𩗪骤𩋰𥣙籀𦅸籕籒𧭍𩍌䶇𩍧驟𪇞 # zhòu
    <*𡴅朱劯侏诛邾㧣洙𤝹茱㦵株珠诸猪𤥮硃秼袾铢𢔪䇬絑𦧙蛛𡻌𥛂䐗誅跦䣷槠潴蝫銖𠧀橥諸豬𩊣䡤駯鮢鴸瀦𧑤𩋵𩴀𪏿櫫櫧㶆鯺鼄𪋏𪋑䃴蠩 # zhū
    <*竹𡧨泏竺𥾅䘚炢笁𦬸茿烛𥞏窋逐𣵸笜舳𠷅𡎺瘃𩲠𢲿𣤁𩲬𣽆𨞕𨲈𠮌築𩶄燭𧏿𩳥蠋𩞈䟉躅䮱鱁䥮孎灟曯欘爥䕽䌵蠾䠱钃 # zhú
    <*丶主𠰍宔𢁼拄𤆼罜陼渚𧉞䘢𡺐𣔯煮煑詝𤲑㔉𩒊𩨻嘱濐㵭麈瞩𦉐𥋛𦅷劚囑斸䰞𪋰矚 # zhǔ
    <*㝉伫佇住助𠩈纻苎㑏坾㤖杼注㹥贮迬驻壴𢩄柱殶炷𤕞祝𦙴𡱱𡸌𢚻𠴦疰㿾眝砫祩竚𥩣莇䇠䇡𥹍紵紸䍆羜蛀嵀𣥼筑䎷註貯䝬跓𨈫軴铸𤋰𤾄筯鉒馵墸𡻠箸翥䐢䪒㫂樦㾻𥯸鋳駐𤎧㺛篫霔𩶂麆䬡𪊹𢥃𤳯𡤗𥵟𨆄𨭅䭖䘄䝒𨙔𪚹鑄𧈚 # zhù
    <*抓𥬲𥮣檛膼簻髽 # zhuā
    <*𣑃𡎬 # zhuǎ
    <*拽 # zhuāi
    <*跩 # zhuǎi
    <*𢶀 # zhuài
    <*专叀𥫛䏝専𢂘砖專𢞬鄟塼嫥𡭇瑼甎磗膞颛磚諯蟤顓𡰞鱄𤮳 # zhuān
    <*转孨𡇰転𦝏𣕏竱𦓝𦄯轉䡱𡤛𨷱𩧜 # zhuǎn
    <*𠨎灷𠊩啭堟蒃䧘𢐎𣂵瑑腞僎𦁆赚𡢀撰𥛥篆馔𣚢𤩄篹𩳏襈賺𤂤𩔊𤪪譔𦧸𧂍𧸖饌囀籑䉵𩻝 # zhuàn
    <*妆庄妝庒𦚏荘娤桩莊梉湷粧装裝𣻛樁糚𣞝𩮱 # zhuāng
    <*𢙳 # zhuǎng
    <*壮壯状𤘲狀壵𣴣𣶍焋𪉉𤶜𠌴𦀜漴撞𪁈𢤤𩅃𩯲戇 # zhuàng
    <*隹追㚝骓㮅𣨫㗓锥𨾻錐䨨騅𩪀鵻𪋇䶆 # zhuī
    <*沝𩬳 # zhuǐ
    <*坠桘笍娷缀𨺵惴㩾甀缒𧿲𢊅畷硾䄌𥟒膇墜綴𦥻赘㾽縋諈醊𩛵𡑻錣餟𩜀𤺅礈贅𣝸𨪗𣦬轛鑆 # zhuì
    <*宒迍肫窀谆㡒𥇜諄衠 # zhūn
    <*准埻凖準綧 # zhǔn
    <*訰𥚠稕 # zhùn
    <*𣄻㑁卓拙炪倬捉桌䂐棁涿㓸棳𥞺𠭴槕䪼𧱰穛䫎𥼚䮓䦃穱蠿 # zhuō
    <*圴彴㣿汋犳灼𨑽𠡑叕妰茁𧘑斫浊丵𡷿浞烵诼酌𨺝啄啅娺𢁁㧻梲㭬𤉐㹿𧢼𢧈𢽚斱晫椓琸䐁𦜰𦰹𩲃𥇍硺窡罬𦳡㒂𢳇撯擆斲禚𥮥𨖮劅䅵𥯩諁諑𧨳䟾鋜𠿡𢢗濁䆯篧𨡸𨧧𩩔䶂擢斀斵𣃈濯𤏸㺟𥢔𩋁櫡𥋮𥐊謶𨢬镯䮕𣃑𧞐鐯𩷹鵫𤃮灂𥗁𧂒蠗𧃔鐲籗𩑂鷟𥷘䕴𨮿𢺡𥷮𩆸籱 # zhuó
    <*㧳𤓦 # zhuò
    <*窧 # zhuo
    <*𠀢乲孜𨚖㠿茊兹咨姕姿㰣𣳩茲栥𣥨玆紎赀资崰𡸟淄秶缁䖪谘赼𧿞䣎嗞孳嵫𢱆椔𣣊湽滋𥚉粢葘辎鄑𡙛孶𣯃㿳禌䅔觜𧣤訾貲資趑𨀥锱稵緇䎩𧛏𨝳鈭镃䰵龇㽧𥕁𥻍𦖺輜鼒𣚀𣚁澬𥀖𦺱諮趦輺𨍢錙𩜊髭鲻𡗈鍿𨩲鎡璾䆅𥼩𧀗𩄚頿頾𪕊𥼻鯔鶅齍𪗉鰦𪗋𪑿𪅵𧕓𧥕𧹌𪗐 # zī
    <*蓻 # zí
    <*𠂔仔吇㜽𡉗㞨䦻姉姊杍㺭𨹀㧗矷秄胏呰秭𥫞籽耔虸𠡸㾅𥞎笫梓𧆰䘣釨啙𣸆𥬳紫𣖨滓訿𡪒榟橴䔂𥲕𩐍 # zǐ
    <*字自𦣹芓𣄮㧘茡荢倳剚恣𢼱㰷牸𡸪渍眥眦䅆𣓊𣣌𥿩𦍺胔胾䐉𧧕漬㱴𧨴𨧫𦎸𧂐 # zì
    <*子 # zi
    <*𠕌宗㚇倧𠵻综𧺣𨺡骔堫𡞧嵏嵕㣭惾㨑棕猣腙葼𡕰朡椶𥚾㙡嵸䁓𥍺𥓻稯綜緃䑸𣯨熧䈦緵翪蝬踨踪𨌰磫㯶𦡙䗥鍐𩰽豵蹤騌鬃騣鬉𩮀鬷鯮鯼鑁𩦲𪖁 # zōng
    <*总偬捴惣愡揔搃傯㷓㹅蓗㢔摠𥠡総縂燪𨍈總䙕𨎢𩭤鏓䰌 # zǒng
    <*纵昮疭倊𠡻猔碂𤡆粽䍟糉𦖸䝋𠏭瘲縦錝縱𣀒𩋯糭𩤗 # zòng
    <*潈 # zong
    <*𠂑邹驺诹郰陬菆棷棸㻓鄒𨜗箃緅諏𣙻鄹𨽁鲰𨃘𥋜鯫黀騶𣠏𥶈齱齺 # zōu
    <*赱走𨑿𧌗鯐 # zǒu
    <*㔿奏揍楱㔌𨂡㵵𪃆䠫𩼦 # zòu
    <*租葅蒩𪙳 # zū
    <*卆𤬧足卒㞺𢫵哫𣢰𧺒崒崪族𥞯㰵𣨛𤽱傶𠻏𡻬𢳈㵀箤𦑋䚝踤𩐡𧎲踿𨧰镞𥼀𧐈𨃭𨨳𨩰𩩠𢅪𥣆𧑙𧗎𨄕䯿鏃䱣𪋍𧞰𩥿𣤶𩺯𪘧 # zú
    <*𤓵诅阻组俎爼珇祖唨𤱌𣇙組𢉺詛䖕靻𥛜𨂀䔃鎺𥼪 # zǔ
    <*𦵬𧇈𩲲𧇿 # zù
    <*𡉺钻𨉖𣀶𣪁躜䡽鑽𩎑 # zuān
    <*𦙉繤㸇𦆈缵纂䌣纉䂎籫纘𨰭䰖 # zuǎn
    <*䤸攥鑚 # zuàn
    <*厜𢈡朘㭰䘒𧻝嗺𡙭𣖱𦸺樶䮔𩣷蟕𥍋纗 # zuī
    <*𦏳𠲋𦈬嶊𢊛𨿇𩲨𠾋嘴𠿘嶵𡽛噿璻𪋌 # zuǐ
    <*𦙈栬㝡絊酔最晬祽稡罪辠𩚻槜䘹酻𡡔𣩑蕞醉㠑𡽁檇𧎹鋷錊檌𨢅𥳣𥳵㰎𪓌 # zuì
    <*枠穝 # zui
    <*尊墫壿嶟遵樽𤮐𨱔繜罇鶎鐏鳟鱒鷷𦨆 # zūn
    <*僔𠟃噂撙䔿𦢐譐 # zǔn
    <*𠱜捘𥞘銌𥊭𥢎𦪚𩯄 # zùn
    <*𠹠𩛠㵶 # zuō
    <*𢂃昨㸲秨莋捽䋏椊琢䝫䞢𣹧稓筰鈼𦁎䞰𡪳𨞒䎰𦦹𣠹𤿀𧮙𪎇 # zuó
    <*𠂇左佐㝾𥙀𧲭𨀨𦈛繓 # zuǒ
    <*作㑅坐阼㘴岝岞怍侳𠱯祚胙唑𡯨座𥅁𥥏袏做𡹥㤰㭮𦥬葃葄蓙𨝨飵䟶㘀䔘𨐳𧃘糳𥽿𪎲 # zuò
    <*咗 # zuo
    # END AUTOGENERATED PINYIN LONG
  ]])
  tailoring("&'(一)'<<<㈠")
  tailoring("&'(七)'<<<㈦")
  tailoring("&'(三)'<<<㈢")
  tailoring("&'(九)'<<<㈨")
  tailoring("&'(二)'<<<㈡")
  tailoring("&'(五)'<<<㈤")
  tailoring("&'(代)'<<<㈹")
  tailoring("&'(企)'<<<㈽")
  tailoring("&'(休)'<<<㉁")
  tailoring("&'(八)'<<<㈧")
  tailoring("&'(六)'<<<㈥")
  tailoring("&'(労)'<<<㈸")
  tailoring("&'(十)'<<<㈩")
  tailoring("&'(協)'<<<㈿")
  tailoring("&'(名)'<<<㈴")
  tailoring("&'(呼)'<<<㈺")
  tailoring("&'(四)'<<<㈣")
  tailoring("&'(土)'<<<㈯")
  tailoring("&'(学)'<<<㈻")
  tailoring("&'(日)'<<<㈰")
  tailoring("&'(月)'<<<㈪")
  tailoring("&'(有)'<<<㈲")
  tailoring("&'(木)'<<<㈭")
  tailoring("&'(株)'<<<㈱")
  tailoring("&'(水)'<<<㈬")
  tailoring("&'(火)'<<<㈫")
  tailoring("&'(特)'<<<㈵")
  tailoring("&'(監)'<<<㈼")
  tailoring("&'(社)'<<<㈳")
  tailoring("&'(祝)'<<<㈷")
  tailoring("&'(祭)'<<<㉀")
  tailoring("&'(自)'<<<㉂")
  tailoring("&'(至)'<<<㉃")
  tailoring("&'(財)'<<<㈶")
  tailoring("&'(資)'<<<㈾")
  tailoring("&'(金)'<<<㈮")
  tailoring("&0点<<<㍘")
  tailoring("&10日<<<㏩")
  tailoring("&10月<<<㋉")
  tailoring("&10点<<<㍢")
  tailoring("&11日<<<㏪")
  tailoring("&11月<<<㋊")
  tailoring("&11点<<<㍣")
  tailoring("&12日<<<㏫")
  tailoring("&12月<<<㋋")
  tailoring("&12点<<<㍤")
  tailoring("&13日<<<㏬")
  tailoring("&13点<<<㍥")
  tailoring("&14日<<<㏭")
  tailoring("&14点<<<㍦")
  tailoring("&15日<<<㏮")
  tailoring("&15点<<<㍧")
  tailoring("&16日<<<㏯")
  tailoring("&16点<<<㍨")
  tailoring("&17日<<<㏰")
  tailoring("&17点<<<㍩")
  tailoring("&18日<<<㏱")
  tailoring("&18点<<<㍪")
  tailoring("&19日<<<㏲")
  tailoring("&19点<<<㍫")
  tailoring("&1日<<<㏠")
  tailoring("&1月<<<㋀")
  tailoring("&1点<<<㍙")
  tailoring("&20日<<<㏳")
  tailoring("&20点<<<㍬")
  tailoring("&21日<<<㏴")
  tailoring("&21点<<<㍭")
  tailoring("&22日<<<㏵")
  tailoring("&22点<<<㍮")
  tailoring("&23日<<<㏶")
  tailoring("&23点<<<㍯")
  tailoring("&24日<<<㏷")
  tailoring("&24点<<<㍰")
  tailoring("&25日<<<㏸")
  tailoring("&26日<<<㏹")
  tailoring("&27日<<<㏺")
  tailoring("&28日<<<㏻")
  tailoring("&29日<<<㏼")
  tailoring("&2日<<<㏡")
  tailoring("&2月<<<㋁")
  tailoring("&2点<<<㍚")
  tailoring("&30日<<<㏽")
  tailoring("&31日<<<㏾")
  tailoring("&3日<<<㏢")
  tailoring("&3月<<<㋂")
  tailoring("&3点<<<㍛")
  tailoring("&4日<<<㏣")
  tailoring("&4月<<<㋃")
  tailoring("&4点<<<㍜")
  tailoring("&5日<<<㏤")
  tailoring("&5月<<<㋄")
  tailoring("&5点<<<㍝")
  tailoring("&6日<<<㏥")
  tailoring("&6月<<<㋅")
  tailoring("&6点<<<㍞")
  tailoring("&7日<<<㏦")
  tailoring("&7月<<<㋆")
  tailoring("&7点<<<㍟")
  tailoring("&8日<<<㏧")
  tailoring("&8月<<<㋇")
  tailoring("&8点<<<㍠")
  tailoring("&9日<<<㏨")
  tailoring("&9月<<<㋈")
  tailoring("&9点<<<㍡")
  tailoring("&'〔三〕'<<<🉁")
  tailoring("&'〔二〕'<<<🉂")
  tailoring("&'〔勝〕'<<<🉇")
  tailoring("&'〔安〕'<<<🉃")
  tailoring("&'〔打〕'<<<🉅")
  tailoring("&'〔敗〕'<<<🉈")
  tailoring("&'〔本〕'<<<🉀")
  tailoring("&'〔点〕'<<<🉄")
  tailoring("&'〔盗〕'<<<🉆")
  tailoring("&一<<<⼀")
  tailoring("&一<<<㆒")
  tailoring("&一<<<㊀")
  tailoring("&一<<<🈩")
  tailoring("&丁<<<㆜")
  tailoring("&七<<<㊆")
  tailoring("&三<<<㆔")
  tailoring("&三<<<㊂")
  tailoring("&三<<<🈪")
  tailoring("&上<<<㆖")
  tailoring("&上<<<㊤")
  tailoring("&下<<<㆘")
  tailoring("&下<<<㊦")
  tailoring("&丙<<<㆛")
  tailoring("&丨<<<⼁")
  tailoring("&中<<<㆗")
  tailoring("&中<<<㊥")
  tailoring("&中<<<🈭")
  tailoring("&丶<<<⼂")
  tailoring("&丿<<<⼃")
  tailoring("&乙<<<⼄")
  tailoring("&乙<<<㆚")
  tailoring("&九<<<㊈")
  tailoring("&亅<<<⼅")
  tailoring("&二<<<⼆")
  tailoring("&二<<<㆓")
  tailoring("&二<<<㊁")
  tailoring("&二<<<🈔")
  tailoring("&五<<<㊄")
  tailoring("&亠<<<⼇")
  tailoring("&交<<<🈘")
  tailoring("&人<<<⼈")
  tailoring("&人<<<㆟")
  tailoring("&企<<<㊭")
  tailoring("&休<<<㊡")
  tailoring("&優<<<㊝")
  tailoring("&儿<<<⼉")
  tailoring("&入<<<⼊")
  tailoring("&八<<<⼋")
  tailoring("&八<<<㊇")
  tailoring("&六<<<㊅")
  tailoring("&冂<<<⼌")
  tailoring("&再<<<🈞")
  tailoring("&冖<<<⼍")
  tailoring("&写<<<㊢")
  tailoring("&冫<<<⼎")
  tailoring("&几<<<⼏")
  tailoring("&凵<<<⼐")
  tailoring("&刀<<<⼑")
  tailoring("&初<<<🈠")
  tailoring("&前<<<🈜")
  tailoring("&割<<<🈹")
  tailoring("&力<<<⼒")
  tailoring("&労<<<㊘")
  tailoring("&勹<<<⼓")
  tailoring("&匕<<<⼔")
  tailoring("&匚<<<⼕")
  tailoring("&匸<<<⼖")
  tailoring("&医<<<㊩")
  tailoring("&十<<<⼗")
  tailoring("&十<<<〸")
  tailoring("&十<<<㊉")
  tailoring("&卄<<<〹")
  tailoring("&卅<<<〺")
  tailoring("&協<<<㊯")
  tailoring("&卜<<<⼘")
  tailoring("&卩<<<⼙")
  tailoring("&印<<<㊞")
  tailoring("&厂<<<⼚")
  tailoring("&厶<<<⼛")
  tailoring("&又<<<⼜")
  tailoring("&双<<<🈒")
  tailoring("&口<<<⼝")
  tailoring("&可<<<🉑")
  tailoring("&右<<<㊨")
  tailoring("&右<<<🈮")
  tailoring("&合<<<🈴")
  tailoring("&名<<<㊔")
  tailoring("&吹<<<🈥")
  tailoring("&問<<<㉄")
  tailoring("&営<<<🈺")
  tailoring("&囗<<<⼞")
  tailoring("&四<<<㆕")
  tailoring("&四<<<㊃")
  tailoring("&土<<<⼟")
  tailoring("&土<<<㊏")
  tailoring("&地<<<㆞")
  tailoring("&士<<<⼠")
  tailoring("&声<<<🈤")
  tailoring("&夂<<<⼡")
  tailoring("&夊<<<⼢")
  tailoring("&夕<<<⼣")
  tailoring("&多<<<🈕")
  tailoring("&夜<<<㊰")
  tailoring("&大<<<⼤")
  tailoring("&大正<<<㍽")
  tailoring("&天<<<㆝")
  tailoring("&天<<<🈗")
  tailoring("&女<<<⼥")
  tailoring("&女<<<㊛")
  tailoring("&子<<<⼦")
  tailoring("&字<<<🈑")
  tailoring("&学<<<㊫")
  tailoring("&宀<<<⼧")
  tailoring("&宗<<<㊪")
  tailoring("&寸<<<⼨")
  tailoring("&小<<<⼩")
  tailoring("&尢<<<⼪")
  tailoring("&尸<<<⼫")
  tailoring("&屮<<<⼬")
  tailoring("&山<<<⼭")
  tailoring("&巛<<<⼮")
  tailoring("&工<<<⼯")
  tailoring("&左<<<㊧")
  tailoring("&左<<<🈬")
  tailoring("&己<<<⼰")
  tailoring("&巾<<<⼱")
  tailoring("&干<<<⼲")
  tailoring("&平成<<<㍻")
  tailoring("&幺<<<⼳")
  tailoring("&幼<<<㉅")
  tailoring("&广<<<⼴")
  tailoring("&廴<<<⼵")
  tailoring("&廾<<<⼶")
  tailoring("&弋<<<⼷")
  tailoring("&弓<<<⼸")
  tailoring("&彐<<<⼹")
  tailoring("&彡<<<⼺")
  tailoring("&彳<<<⼻")
  tailoring("&後<<<🈝")
  tailoring("&得<<<🉐")
  tailoring("&心<<<⼼")
  tailoring("&戈<<<⼽")
  tailoring("&戶<<<⼾")
  tailoring("&手<<<⼿")
  tailoring("&手<<<🈐")
  tailoring("&打<<<🈱")
  tailoring("&投<<<🈧")
  tailoring("&指<<<🈯")
  tailoring("&捕<<<🈨")
  tailoring("&支<<<⽀")
  tailoring("&攴<<<⽁")
  tailoring("&文<<<⽂")
  tailoring("&文<<<㉆")
  tailoring("&斗<<<⽃")
  tailoring("&料<<<🈛")
  tailoring("&斤<<<⽄")
  tailoring("&新<<<🈟")
  tailoring("&方<<<⽅")
  tailoring("&无<<<⽆")
  tailoring("&日<<<⽇")
  tailoring("&日<<<㊐")
  tailoring("&明治<<<㍾")
  tailoring("&映<<<🈙")
  tailoring("&昭和<<<㍼")
  tailoring("&曰<<<⽈")
  tailoring("&月<<<⽉")
  tailoring("&月<<<㊊")
  tailoring("&月<<<🈷")
  tailoring("&有<<<㊒")
  tailoring("&有<<<🈶")
  tailoring("&木<<<⽊")
  tailoring("&木<<<㊍")
  tailoring("&株<<<㊑")
  tailoring("&株式会社<<<㍿")
  tailoring("&欠<<<⽋")
  tailoring("&止<<<⽌")
  tailoring("&正<<<㊣")
  tailoring("&歹<<<⽍")
  tailoring("&殳<<<⽎")
  tailoring("&毋<<<⽏")
  tailoring("&母<<<⺟")
  tailoring("&比<<<⽐")
  tailoring("&毛<<<⽑")
  tailoring("&氏<<<⽒")
  tailoring("&气<<<⽓")
  tailoring("&水<<<⽔")
  tailoring("&水<<<㊌")
  tailoring("&注<<<㊟")
  tailoring("&満<<<🈵")
  tailoring("&演<<<🈦")
  tailoring("&火<<<⽕")
  tailoring("&火<<<㊋")
  tailoring("&無<<<🈚")
  tailoring("&爪<<<⽖")
  tailoring("&父<<<⽗")
  tailoring("&爻<<<⽘")
  tailoring("&爿<<<⽙")
  tailoring("&片<<<⽚")
  tailoring("&牙<<<⽛")
  tailoring("&牛<<<⽜")
  tailoring("&特<<<㊕")
  tailoring("&犬<<<⽝")
  tailoring("&玄<<<⽞")
  tailoring("&玉<<<⽟")
  tailoring("&瓜<<<⽠")
  tailoring("&瓦<<<⽡")
  tailoring("&甘<<<⽢")
  tailoring("&生<<<⽣")
  tailoring("&生<<<🈢")
  tailoring("&用<<<⽤")
  tailoring("&田<<<⽥")
  tailoring("&甲<<<㆙")
  tailoring("&申<<<🈸")
  tailoring("&男<<<㊚")
  tailoring("&疋<<<⽦")
  tailoring("&疒<<<⽧")
  tailoring("&癶<<<⽨")
  tailoring("&白<<<⽩")
  tailoring("&皮<<<⽪")
  tailoring("&皿<<<⽫")
  tailoring("&監<<<㊬")
  tailoring("&目<<<⽬")
  tailoring("&矛<<<⽭")
  tailoring("&矢<<<⽮")
  tailoring("&石<<<⽯")
  tailoring("&示<<<⽰")
  tailoring("&社<<<㊓")
  tailoring("&祝<<<㊗")
  tailoring("&禁<<<🈲")
  tailoring("&禸<<<⽱")
  tailoring("&禾<<<⽲")
  tailoring("&秘<<<㊙")
  tailoring("&穴<<<⽳")
  tailoring("&空<<<🈳")
  tailoring("&立<<<⽴")
  tailoring("&竹<<<⽵")
  tailoring("&箏<<<㉇")
  tailoring("&米<<<⽶")
  tailoring("&糸<<<⽷")
  tailoring("&終<<<🈡")
  tailoring("&缶<<<⽸")
  tailoring("&网<<<⽹")
  tailoring("&羊<<<⽺")
  tailoring("&羽<<<⽻")
  tailoring("&老<<<⽼")
  tailoring("&而<<<⽽")
  tailoring("&耒<<<⽾")
  tailoring("&耳<<<⽿")
  tailoring("&聿<<<⾀")
  tailoring("&肉<<<⾁")
  tailoring("&臣<<<⾂")
  tailoring("&自<<<⾃")
  tailoring("&至<<<⾄")
  tailoring("&臼<<<⾅")
  tailoring("&舌<<<⾆")
  tailoring("&舛<<<⾇")
  tailoring("&舟<<<⾈")
  tailoring("&艮<<<⾉")
  tailoring("&色<<<⾊")
  tailoring("&艸<<<⾋")
  tailoring("&虍<<<⾌")
  tailoring("&虫<<<⾍")
  tailoring("&血<<<⾎")
  tailoring("&行<<<⾏")
  tailoring("&衣<<<⾐")
  tailoring("&襾<<<⾑")
  tailoring("&見<<<⾒")
  tailoring("&角<<<⾓")
  tailoring("&解<<<🈖")
  tailoring("&言<<<⾔")
  tailoring("&谷<<<⾕")
  tailoring("&豆<<<⾖")
  tailoring("&豕<<<⾗")
  tailoring("&豸<<<⾘")
  tailoring("&貝<<<⾙")
  tailoring("&財<<<㊖")
  tailoring("&販<<<🈣")
  tailoring("&資<<<㊮")
  tailoring("&赤<<<⾚")
  tailoring("&走<<<⾛")
  tailoring("&走<<<🈰")
  tailoring("&足<<<⾜")
  tailoring("&身<<<⾝")
  tailoring("&車<<<⾞")
  tailoring("&辛<<<⾟")
  tailoring("&辰<<<⾠")
  tailoring("&辵<<<⾡")
  tailoring("&遊<<<🈫")
  tailoring("&適<<<㊜")
  tailoring("&邑<<<⾢")
  tailoring("&酉<<<⾣")
  tailoring("&配<<<🈻")
  tailoring("&釆<<<⾤")
  tailoring("&里<<<⾥")
  tailoring("&金<<<⾦")
  tailoring("&金<<<㊎")
  tailoring("&長<<<⾧")
  tailoring("&門<<<⾨")
  tailoring("&阜<<<⾩")
  tailoring("&隶<<<⾪")
  tailoring("&隹<<<⾫")
  tailoring("&雨<<<⾬")
  tailoring("&靑<<<⾭")
  tailoring("&非<<<⾮")
  tailoring("&面<<<⾯")
  tailoring("&革<<<⾰")
  tailoring("&韋<<<⾱")
  tailoring("&韭<<<⾲")
  tailoring("&音<<<⾳")
  tailoring("&頁<<<⾴")
  tailoring("&項<<<㊠")
  tailoring("&風<<<⾵")
  tailoring("&飛<<<⾶")
  tailoring("&食<<<⾷")
  tailoring("&首<<<⾸")
  tailoring("&香<<<⾹")
  tailoring("&馬<<<⾺")
  tailoring("&骨<<<⾻")
  tailoring("&高<<<⾼")
  tailoring("&髟<<<⾽")
  tailoring("&鬥<<<⾾")
  tailoring("&鬯<<<⾿")
  tailoring("&鬲<<<⿀")
  tailoring("&鬼<<<⿁")
  tailoring("&魚<<<⿂")
  tailoring("&鳥<<<⿃")
  tailoring("&鹵<<<⿄")
  tailoring("&鹿<<<⿅")
  tailoring("&麥<<<⿆")
  tailoring("&麻<<<⿇")
  tailoring("&黃<<<⿈")
  tailoring("&黍<<<⿉")
  tailoring("&黑<<<⿊")
  tailoring("&黹<<<⿋")
  tailoring("&黽<<<⿌")
  tailoring("&鼎<<<⿍")
  tailoring("&鼓<<<⿎")
  tailoring("&鼠<<<⿏")
  tailoring("&鼻<<<⿐")
  tailoring("&齊<<<⿑")
  tailoring("&齒<<<⿒")
  tailoring("&龍<<<⿓")
  tailoring("&龜<<<⿔")
  tailoring("&龟<<<⻳")
  tailoring("&龠<<<⿕")
  return collator_obj
end

languages.zu = function(collator_obj)
  return collator_obj
end

return languages
