\iffalse
# The `Lua-UCA` package
\fi

This package adds support for the [Unicode collation algorithm](https://unicode.org/reports/tr10/) for Lua 5.3 and later. 
It is mainly intended for use with Lua\TeX and working \TeX\ distribution, but it can work also as a standalone
Lua module. You will need to install a required [Lua-uni-algos](https://github.com/latex3/lua-uni-algos) package by hand
in that case.


## Usage

To sort a table using Czech collation rules:

   
    kpse.set_program_name "luatex"
    local ducet = require "lua-uca.lua-uca-ducet"
    local collator = require "lua-uca.lua-uca-collator"
    local languages = require "lua-uca.lua-uca-languages"
    
    local collator_obj = collator.new(ducet)
    -- load Czech rules
    collator_obj = languages.cs(collator_obj)
    
    local t = {"cihla",  "chochol", "hudba", "jasan", "čáp"}
    
    table.sort(t, function(a,b) 
      return collator_obj:compare_strings(a,b) 
    end)
    
    for _, v in ipairs(t) do
      print(v)
    end

The output:

> cihla
> čáp
> hudba
> chochol
> jasan

More samples of the library usage can be found in the source repository of this package on [Github](https://github.com/michal-h21/lua-uca).
% See `HACKING.md` file in the repo for more information.

## Use with Xindex processor

[Xindex](https://www.ctan.org/pkg/xindex) is flexible index processor written
in Lua by Herbert Voß. It has built-in `Lua-UCA` support starting with version
`0.23`. The support can be requested using the `-u` option:

     xindex -u -l no -c norsk filename.idx

## Use with LuaJIT

The default version of `lua-uca-ducet` fails with Luajit. You can use alternative version of this file, `lua-uca-ducet-jit`.

## Change sorting rules

The simplest way to change the default sorting order is to use the
`tailor_string` method of the `collator_obj` object. It updates the collator object using
special syntax which is subset of the format used by the [Unicode locale data
markup
language](https://www.unicode.org/reports/tr35/tr35-collation.html#Orderings).

    collator_obj:tailor_string "&a<b"

Full example with Czech rules:

    kpse.set_program_name "luatex"
    local ducet = require "lua-uca.lua-uca-ducet"
    local collator = require "lua-uca.lua-uca-collator"
    local languages = require "lua-uca.lua-uca-languages"
    
    local collator_obj = collator.new(ducet)
    local tailoring = function(s) collator_obj:tailor_string(s) end

    tailoring "&c<č<<<Č"
    tailoring "&h<ch<<<cH<<<Ch<<<CH"
    tailoring "&R<ř<<<Ř"
    tailoring "&s<š<<<Š"
    tailoring "&z<ž<<<Ž"

Note that the sequence of letters `ch`, `Ch`, `cH` and `CH` will be sorted after `h`

It is also possible to expand a letter to multiple letters, like this example for DIN 2:


    tailoring "&Ö=Oe"
    tailoring "&ö=oe"

Some languages, like Norwegian, sort uppercase letters before lowercase. This
can be enabled using `collator_obj:uppercase_first()` function:

    local tailoring = function(s) collator_obj:tailor_string(s) end
    collator_obj:uppercase_first()
    tailoring("&D<<đ<<<Đ<<ð<<<Ð")
    tailoring("&th<<<þ")
    tailoring("&TH<<<Þ")
    tailoring("&Y<<ü<<<Ü<<ű<<<Ű")
    tailoring("&ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA")
    tailoring("&oe<<œ<<<Œ")


Some languages, for example Canadian French, sort accent backwards, like gêne < gëne < gêné. 
In this case, you can set the `collator_obj.accents_backward` variable to `true`.


% More information on a new language support is in the `HACKING.md`
% document in the [`Lua-UCA` Github repo](https://github.com/michal-h21/lua-uca/blob/master/HACKING.md).

### Script reordering

Many languages sort different scripts after the script this language uses. As
Latin based scripts are sorted first, it is necessary to reorder scripts in
such cases.

The `collator_obj:reorder` function takes table with scripts that need to be reordered. 
For example Cyrillic can be sorted before Latin using:

    collator_obj:reorder {"cyrillic"}

In German or Czech, numbers should be sorted after all other characters. This can be done using:

    collator_obj:reorder {"others", "digits"}

The special keyword "others" means that the scripts that follows in the table
will be sorted at the very end.

## Headers for index entries

In some languages, for example Czech, multiple letters may count as one
character. This is the case of the *ch* character. 

Lua-UCA provides function `collator_obj:get_lowest_char()`. It returns table with UTF-8 codepoints 
for correct first character for a given language that can be used for example as an index header.


    local czech = collator.new(ducet)
    languages.cs(czech)
    -- first we need to convert string to codepoints
    local codepoints = czech:string_to_codepoints("Chrobák")
    local first_char = czech:get_lowest_char(codepoints)
    -- it should print letters "ch"
    print(utf8.char(table.unpack(first_char)))
    -- you can also specify position of the character
    local second_char = czech:get_lowest_char(codepoints, 2)
    -- it should print letter "h", as it is second codepoint in the string
    print(utf8.char(table.unpack(second_char)))


## Unicode normalization

By default, no Unicode normalization is used internally. You can explicitly request normalization that use the
[Uninormalize package](https://ctan.org/pkg/uninormalize?lang=en). Note that it will significantly increase the
procesing time. 

There are two normalization methods, NFC and NFD. They can be enabled using
`collation.use_nfc()` and `collation.use_nfd()` functions.


# What is missing

- Algorithm for setting implicit sort weights of characters that are not explicitly listed in DUCET.
- Special handling of CJK scripts.

\iffalse
# Copyright

Michal Hoftich, 2021–2024. See LICENSE file for more details.


\fi
