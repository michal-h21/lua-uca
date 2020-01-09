all: data/allkeys.txt data/common src/lua-uca/lua-uca-ducet.lua

data/allkeys.txt:
	mkdir data
	wget http://www.unicode.org/Public/UCA/latest/allkeys.txt
	mv allkeys.txt data

data/common:
	wget http://unicode.org/Public/cldr/33/cldr-common-33.0.zip
	unzip cldr-common-33.0.zip "common/collation/*" -d data/
	rm cldr-common-33.0.zip

src/lua-uca/lua-uca-ducet.lua:
	mkdir -p src/lua-uca
	texlua tools/make_ducet.lua > src/lua-uca/lua-uca-ducet.lua

.PHONY: test

test:
	busted spec/ducet-spec.lua
	busted spec/collator_spec.lua
	busted spec/languages-spec.lua

