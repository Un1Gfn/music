################################################################################

URL:=''
ARTIST:=''
ALBUM:=''
COMPOSER:=''

################################################################################

EXT:=wav

# test:
# 	@echo $(MAKEFLAGS)

# default: luext
default: standalonestaves

.PHONY: all clean entrpdf luext m4a nemo play standalonestaves view

all: m4a standalonestaves

clean:
	/usr/bin/rm -fv *.pdf *.aiff *.midi *.wav *.m4a CTRL

entrpdf:
	/usr/bin/entr <<<"$$(/usr/bin/ls -1 *.ly)" $(MAKE) -B lu.pdf

luext: lu.$(EXT)
lupdf: lu.pdf

m4a: lu.m4a
	cp -v $^ $(ID).$(TITLE).m4a

nemo:
	( /usr/bin/nemo . &>/dev/null & )

play: lu.$(EXT)
	/usr/bin/mpv --loop-file=inf --no-resume-playback --no-save-position-on-quit $^

# standalonestaves: $(addsuffix .$(EXT),l u)
standalonestaves: $(addsuffix .m4a,l u)

view: lu.pdf
	( /usr/bin/atril $^ &>/dev/null & )

################################################################################

# .NOTPARALLEL:
MAKEFLAGS:=-j1

# SF:=/usr/share/soundfonts/Arachno.sf2
SF:=/usr/share/soundfonts/Unison.sf2

# IDTITLE:=$(patsubst ly.%,%,$(shell basename $(shell pwd)))
# TITLE:=$(word 2,$(subst ., ,$(IDTITLE)))
ID:=$(word 3,$(subst ., ,$(shell basename $(shell pwd))))
TITLE:=$(word 4,$(subst ., ,$(shell basename $(shell pwd))))

# 3/3 encode
l.m4a: SUFFIX:=_L
u.m4a: SUFFIX:=_U
%.m4a: %.$(EXT)
	/usr/bin/fdkaac -o $@ -p 2 -m 5 -f 0 $^ --title $(TITLE)$(SUFFIX) --artist $(ARTIST) --album $(ALBUM) --composer $(COMPOSER)

# 2/3 synthesize
%.$(EXT): %.midi
	../../ly.script.fluidsynth.sh $^ $@

# 1/3 compose
lu.pdf lu.midi &:
	>CTRL
	echo '\new Staff = "upper" { \set Staff.midiMaximumVolume = #0.7 \upper }' >>CTRL
	echo '\new Staff = "lower" { \set Staff.midiMaximumVolume = #1.0 \lower }' >>CTRL
	/usr/bin/lilypond -o lu --pdf main.ly

l.midi:
	>CTRL
	echo '\new Staff = "lower" \lower' >>CTRL
	/usr/bin/lilypond -o l main.ly
	rm -f l.pdf

u.midi:
	>CTRL
	echo '\new Staff = "upper" \upper' >>CTRL
	/usr/bin/lilypond -o u main.ly
	rm -f l.pdf
