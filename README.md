# The `lua-uca` package

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

More samples of use can be found in the `test` directory. `tools/indexing-sample.lua` is a simple indexing processor.

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


