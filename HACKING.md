# Lua-UCA hacking

You need the full installation from
[Github](https://github.com/michal-h21/lua-uca) in order to do stuff described
in this section. Package distributed on CTAN doesn't contain all necessary
files.

## Install 

The package needs to download Unicode collation data and convert it to a Lua
table. It depends on `wget` and `unzip` utilities. All files can be downloaded
using Make:

    make

To install the package in the local TEXMF tree, run:

    make install

## New language support

To add a new language, add new function to `src/lua-uca/lua-uca-languages.lua`
file. The function name should be short language code. Example function for
the Russian language:

    languages.ru = function(collator_obj)
      collator_obj:reorder{ "cyrillic" }
      return collator_obj
    end

The language function takes the Collator object as a parameter. Methods showed
in the *Change sorting rules* section can be used with this object.

The `data/common/collation/` directory in the source repository contains files from the `CLDR` project.
They contain rules for many languages. The files needs to be normalized to the
[NFC form](https://en.wikipedia.org/wiki/Unicode_equivalence), for example using:

    cat cs.xml | uconv -x any-nfc -o cs.xml

The `uconv` utility is a part of the [ICU Project](http://userguide.icu-project.org/).

Sorting rules for a language are placed in the `<collation>` element. Multiple
`<collation>` elements may be present in the XML file. It is usually best to chose the one with attribute 
`type="standard"`.

The following example contains code from `da.xml`:


    [caseFirst upper]
    &D<<đ<<<Đ<<ð<<<Ð
    &th<<<þ
    &TH<<<Þ
    &Y<<ü<<<Ü<<ű<<<Ű
    &[before 1]ǀ<æ<<<Æ<<ä<<<Ä<ø<<<Ø<<ö<<<Ö<<ő<<<Ő<å<<<Å<<<aa<<<Aa<<<AA
    &oe<<œ<<<Œ

This is translated to Lua code in `lua-uca-languages.lua` in the following way:


    languages.da = function(collator_obj)
      -- helper function for more readable tailoring definition
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




Pull requests with new language support are highly appreciated.

## Support files in the source distribution

The `xindex` directory contains some examples for configuration of `Xindex`, Lua based indexing system.
Run `make xindex` command to compile them.

`Xindex` has built-in support for Lua-UCA since version `0.23`, it can be requested using the `-u` option.

The `tools/indexing-sample.lua` file provides a simple indexing processor, independent of any other tool.  

## Testing

You can run unit tests using the following command:

    make test

Testing requires [Busted](https://olivinelabs.com/busted/) testing framework installed on your system.
Tests are placed in the `spec` directory and they provide more examples of the package usage.




