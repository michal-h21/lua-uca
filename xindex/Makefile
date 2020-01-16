lang_czech = cs
dir=examples

idx = .idx
tex = .tex
czechexample=$(dir)/czech
russian = $(dir)/russian
testidx = $(dir)/testidx
norwegian = $(dir)/norwegian
german = $(dir)/german


all: $(czechexample)$(idx) $(russian)$(idx) $(testidx)$(idx) $(norwegian)$(idx) $(german)$(idx)
 
$(czechexample)$(idx): $(czechexample)$(tex)
	cd $(dir) && lualatex `basename $<`
	xindex -c uca -l cs $@
	cd $(dir) && lualatex `basename $<`


$(russian)$(idx): $(russian)$(tex)
	cd $(dir) && lualatex `basename $<`
	xindex -c uca -l ru $@
	cd $(dir) && lualatex `basename $<`


$(testidx)$(idx): $(testidx)$(tex)
	cd $(dir) && lualatex `basename $<`
	xindex -c uca -l en $@
	cd $(dir) && lualatex `basename $<`


$(norwegian)$(idx): $(norwegian)$(tex)
	cd $(dir) && lualatex `basename $<`
	xindex -c uca -l no $@
	cd $(dir) && lualatex `basename $<`


$(german)$(idx): $(german)$(tex)
	cd $(dir) && lualatex `basename $<`
	xindex -c uca -l de_din2 $@
	cd $(dir) && lualatex `basename $<`
