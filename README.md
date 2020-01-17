# The `Lua-UCA` package

This package adds support for the [Unicode collation algorithm](https://unicode.org/reports/tr10/) for Lua 5.3. 

## Install 

The package needs to download Unicode collation data and convert it to a Lua table. It depends on `wget` and `unzip` utitilities.

To install the package in the local TEXMF tree, run:

    make
    make install

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
    
    table.sort(t, function(a,b) return collator_obj:compare_strings(a,b) end)
    
    for _, v in ipairs(t) do
      print(v)
    end

The output:

> cihla
> čáp
> hudba
> chochol
> jasan

More samples of use can be found in the `spec` directory.
`tools/indexing-sample.lua` is a simple indexing processor. 

## Use with Xindex processor

[Xindex](https://www.ctan.org/pkg/xindex) is flexible index processor written in Lua by Herbert Voß. It supports Lua configuration files, which enables use of Lua-UCA for sorting of the index entries, as shown in [this example](https://tex.stackexchange.com/a/524014/2891) for Norwegian text.

The `xindex` directory contains more advanced version of such configuration file together with several examples. Run `make xindex` command to compile them.

## Change sorting rules

The simplest way to change the default sorting order is to use the
`languages.tailor_string` function. It updates the collator object using
special syntax which is subset of the format used by the [Unicode locale data
markup
language](https://www.unicode.org/reports/tr35/tr35-collation.html#Orderings).

    languages.tailor_string(collator_obj, "&a<b")

Full example with Czech rules:

    kpse.set_program_name "luatex"
    local ducet = require "lua-uca.lua-uca-ducet"
    local collator = require "lua-uca.lua-uca-collator"
    local languages = require "lua-uca.lua-uca-languages"
    
    local collator_obj = collator.new(ducet)
    local tailoring = function(s) languages.tailor_string(collator_obj, s) end

    tailoring "&c<č<<<Č"
    tailoring "&h<ch<<<cH<<<Ch<<<CH"
    tailoring "&R<ř<<<Ř"
    tailoring "&s<š<<<Š"
    tailoring "&z<ž<<<Ž"

Note that the sequence of letters `ch`, `Ch`, `cH` and `CH` will be sorted after `h`

It is also possible to expand a letter to multiple letters, like this example for DIN 2:


    tailoring "&Ö=Oe"
    tailoring "&ö=oe"

Some languages, like Norwegian sort uppercase letters before lowercase. This can be enabled using `collator:uppercase_first()` function:

    local tailoring = function(s) languages.tailor_string(collator_obj, s) end
    collator_obj:uppercase_first()
    tailoring("&D<<đ<<<Đ<<ð<<<Ð")
    tailoring("&th<<<þ")
    tailoring("&TH<<<Þ")
    tailoring("&Y<<ü<<<Ü<<ű<<<Ű")
    tailoring("&ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA")
    tailoring("&oe<<œ<<<Œ")

The `data/common/collation/` directory contains files from the `CLDR` project.
They contain rules for many languages. The files needs to be normalized to the
[NFC form](https://en.wikipedia.org/wiki/Unicode_equivalence), for example
using:

    cat cs.xml | uconv -x any-nfc -o cs.xml

The `uconv` utility is a part of the [ICU Project](http://userguide.icu-project.org/).

# What is missing

- Tailorings for most languages.
- There is currently no support for reordering of sorting character groups such as digits or specific scripts. 
- Algorithm for setting implicit sort weights of characters that are not explicitly listed in DUCET.
- Special handling of CJK scripts.
