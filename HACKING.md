# Lua-UCA hacking

You need the full installation from [Github](https://github.com/michal-h21/lua-uca) in order to do stuff described in this section.

## Install 

The package needs to download Unicode collation data and convert it to a Lua table. It depends on `wget` and `unzip` utilities.

To install the package in the local TEXMF tree, run:

    make
    make install

## New language support

To add a new language, add new function to `src/lua-uca/lua-uca-languages.lua` file. The function name should be short language code. Example function for Russian language:

    languages.ru = function(collator_obj)
      collator_obj:reorder{ "cyrillic" }
      return collator_obj
    end

Pull requests with new language support are highly appreciated.

## Support files in the source distribution

The `xindex` directory contains some examples for configuration of `Xindex`, Lua based indexing system.
Run `make xindex` command to compile them.

`Xindex` has built-in support for Lua-UCA since version `0.23`, it can be requested using the `-u` option.

## Testing

You can run unit tests using the following command:

    make test

Testing requires [Busted](https://olivinelabs.com/busted/) testing framework installed on your system.


