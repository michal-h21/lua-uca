lua_content = $(wildcard src/lua-uca/*.lua) 
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = ${TEXMFHOME}/scripts/lua/lua-uca/
LUA_DIR = src/lua-uca/
VERSION:= undefined
DATE:= undefined
README = README.md
DOC_BASE = lua-uca-doc
DOC_SOURCES = $(DOC_BASE).tex $(README) CHANGELOG.md LICENSE HACKING.md
DOC_PDF = $(DOC_BASE).pdf
BUILD_DIR = build

ifeq ($(strip $(shell git rev-parse --is-inside-work-tree 2>/dev/null)),true)
	VERSION:= $(shell git --no-pager describe --abbrev=0 --tags --always )
	DATE:= $(firstword $(shell git --no-pager show --date=short --format="%ad" --name-only))
endif


all: data/allkeys.txt data/common src/lua-uca/lua-uca-ducet.lua src/lua-uca/lua-uca-ducet-jit.lua src/lua-uca/lua-uca-reordering-table.lua src/lua-uca/lua-uca-implicit.lua src/lua-uca/lua-uca-ccc.lua src/lua-uca/lua-uca-chinese.lua $(DOC_PDF)

UCA_URL = https://www.unicode.org/Public/UCA/latest
UCD_URL = https://www.unicode.org/Public/UCD/latest/ucd
WGET = wget --no-use-server-timestamps

data/allkeys.txt:
	mkdir -p data
	$(WGET) -O $@.tmp $(UCA_URL)/allkeys.txt && mv $@.tmp $@

data/PropList.txt data/Blocks.txt data/UnicodeData.txt data/Scripts.txt data/PropertyValueAliases.txt:
	mkdir -p data
	$(WGET) -O $@.tmp $(UCD_URL)/$(notdir $@) && mv $@.tmp $@

data/CollationTest:
	mkdir -p data
	$(WGET) -O data/CollationTest.zip $(UCA_URL)/CollationTest.zip
	rm -rf $@
	unzip -q data/CollationTest.zip -d data/
	rm data/CollationTest.zip

# download all the Unicode data again, for a new Unicode version
fetch:
	rm -f data/allkeys.txt data/PropList.txt data/Blocks.txt data/UnicodeData.txt data/Scripts.txt data/PropertyValueAliases.txt
	rm -rf data/CollationTest
	$(MAKE) data/allkeys.txt data/PropList.txt data/Blocks.txt data/UnicodeData.txt data/Scripts.txt data/PropertyValueAliases.txt data/CollationTest

data/common:
	wget http://unicode.org/Public/cldr/33/cldr-common-33.0.zip
	unzip cldr-common-33.0.zip "common/collation/*" -d data/
	rm cldr-common-33.0.zip

src/lua-uca/lua-uca-ducet.lua: data/allkeys.txt
	mkdir -p src/lua-uca
	texlua tools/make_ducet.lua > src/lua-uca/lua-uca-ducet.lua

src/lua-uca/lua-uca-ducet-jit.lua: src/lua-uca/lua-uca-ducet.lua
	texlua tools/make_ducet_jit.lua > src/lua-uca/lua-uca-ducet-jit.lua

src/lua-uca/lua-uca-reordering-table.lua: data/allkeys.txt data/Scripts.txt data/PropertyValueAliases.txt data/UnicodeData.txt data/PropList.txt
	mkdir -p src/lua-uca
	texlua tools/make_reordering_table.lua > $@

src/lua-uca/lua-uca-implicit.lua: data/allkeys.txt data/PropList.txt data/Blocks.txt
	mkdir -p src/lua-uca
	texlua tools/make_implicit.lua > $@

src/lua-uca/lua-uca-ccc.lua: data/UnicodeData.txt
	mkdir -p src/lua-uca
	texlua tools/make_ccc.lua > $@

.PHONY: test install conformance fetch

conformance:
	@test -d data/CollationTest || { echo "The conformance tests are missing, run make fetch"; exit 1; }
	texlua tools/conformance.lua

test:
	luarocks make --local
	busted spec/ducet-spec.lua
	busted spec/collator_spec.lua
	busted spec/languages-spec.lua
	busted spec/tailoring-spec.lua

$(DOC_PDF): $(DOC_SOURCES) 
	lualatex '\def\version{${VERSION}}\def\gitdate{${DATE}}\input{$<}'


install: 
	mkdir -p ${INSTALL_DIR}
	cp ${LUA_DIR}*.lua ${INSTALL_DIR}

xindex: 
	$(MAKE) -C $@

build: $(DOC_PDF) $(DOC_SOURCES) $(lua_content) 
	mkdir -p $(BUILD_DIR)/lua-uca/lua-uca
	cp $(lua_content) $(BUILD_DIR)/lua-uca/lua-uca/
	cp $(DOC_PDF) $(DOC_SOURCES) Makefile $(BUILD_DIR)/lua-uca/
	@cd $(BUILD_DIR) && zip -r lua-uca.zip lua-uca


.PHONY: all xindex build
