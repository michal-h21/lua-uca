# Lua-UCA hacking

You need the full installation from [Github](https://github.com/michal-h21/lua-uca) in order to do stuff described in this section.

## Install 

The package needs to download Unicode collation data and convert it to a Lua table. It depends on `wget` and `unzip` utilities.

To install the package in the local TEXMF tree, run:

    make
    make install
