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

languages.fr_ca = function(collator_obj)
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

languages.zj = function(collator_obj)
  local tailoring = function(s) collator_obj:tailor_string(s) end
  collator_obj:reorder{"han"}
  -- tons of tailorings ommited
  return collator_obj
end

languages.zu = function(collator_obj)
  return collator_obj
end

return languages
