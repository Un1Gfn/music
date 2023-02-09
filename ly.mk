# this file should be included instead of invoked directly
# https://www.gnu.org/software/make/manual/html_node/Include.html

# relative paths are not based on ly.mk
# relative paths are based on Makefiles that include ly.mk

MAKEFLAGS:=-j1

# IDTITLE:=$(patsubst ly.%,%,$(shell basename $(shell pwd)))
# TITLE:=$(word 2,$(subst ., ,$(IDTITLE)))
ID:=$(word 2,$(subst ., ,$(shell basename $(shell pwd))))
TITLE:=$(word 3,$(subst ., ,$(shell basename $(shell pwd))))

# test:
# 	@echo '$(MAKEFLAGS)'
# 	@echo '$(ID)'
# 	@echo '$(TITLE)'

lupdf: lu.pdf

entrpdf:
	/usr/bin/entr <<<"$$(/usr/bin/ls -1 *.ly)" $(MAKE) -B lu.pdf

view: lu.pdf
	( /usr/bin/atril $^ &>/dev/null & )

play: lu.$(EXT)
	/usr/bin/mpv --loop-file=inf --no-resume-playback --no-save-position-on-quit $^

# 3/3 encode
m4a: lu.$(EXT)
	/usr/bin/fdkaac -o $(ID).$(TITLE).m4a -p 2 -m 5 -f 0 $^ --title $(TITLE) --artist $(ARTIST) --album $(ALBUM) --composer $(COMPOSER)

# 2/3 synthesize
luext: lu.$(EXT)
lu.$(EXT): lu.midi
	../../ly.script.fluidsynth.sh $^ $@

# 1/3 compose
lu.pdf lu.midi:
	/usr/bin/lilypond --pdf -o lu main.ly

clean:
	/usr/bin/rm -fv *.pdf *.aiff *.midi *.wav *.m4a

nemo:
	( /usr/bin/nemo . &>/dev/null & )
