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
