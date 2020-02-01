TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = ${TEXMFHOME}/scripts/lua/lua-uca/
LUA_DIR = src/lua-uca/
VERSION:= undefined
DATE:= undefined
README = README.md
DOC_BASE = lua-uca-doc
DOC_SOURCES = $(DOC_BASE).tex $(README)
DOC_PDF = $(DOC_BASE).pdf

ifeq ($(strip $(shell git rev-parse --is-inside-work-tree 2>/dev/null)),true)
	VERSION:= $(shell git --no-pager describe --abbrev=0 --tags --always )
	DATE:= $(firstword $(shell git --no-pager show --date=short --format="%ad" --name-only))
endif


all: data/allkeys.txt data/common src/lua-uca/lua-uca-ducet.lua src/lua-uca/lua-uca-reordering-table.lua $(DOC_PDF)



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

src/lua-uca/lua-uca-reordering-table.lua:
	mkdir -p src/lua-uca
	texlua tools/make_reordering_table.lua > $@

.PHONY: test install

test:
	busted spec/ducet-spec.lua
	busted spec/collator_spec.lua
	busted spec/languages-spec.lua
	busted spec/tailoring-spec.lua

$(DOC_PDF): $(DOC_SOURCES) install
	lualatex '\def\version{${VERSION}}\def\gitdate{${DATE}}\input{$<}'


install: 
	mkdir -p ${INSTALL_DIR}
	cp ${LUA_DIR}*.lua ${INSTALL_DIR}

xindex: 
	$(MAKE) -C $@

.PHONY: all xindex
