package = "lua-uca"
version = "dev-1"
source = {
   url = "git+https://github.com/michal-h21/lua-uca.git"
}
dependencies = {
   "lua >= 5.1"
}
description = {
   summary = "Implementation of the Unicode Collation Algorithm for Lua",
   detailed = [[
      This package adds support for the Unicode collation algorithm for Lua 5.3. It is mainly intended for use with LuaTeX and working TeX distribution, but it can work also as a standalone Lua module. You will need to install a required Lua-uni-algos package by hand in that case.]],
   homepage = "https://github.com/michal-h21/lua-uca",
   license = "MIT"
}
build = {
   type = "builtin",
   modules = {
      ["lua-uca.collator"] = "src/lua-uca/lua-uca-collator.lua",
      ["lua-uca.ducet"] = "src/lua-uca/lua-uca-ducet.lua",
      ["lua-uca.languages"] = "src/lua-uca/lua-uca-languages.lua",
      ["lua-uca.reordering-table"] = "src/lua-uca/lua-uca-reordering-table.lua",
      ["lua-uca.tailoring"] = "src/lua-uca/lua-uca-tailoring.lua"
   }
}
