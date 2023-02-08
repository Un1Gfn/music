################################################################################

URL:=https://www.youtube.com/watch?v=ouG12IsjTNU
ARTIST:=讚美之泉
ALBUM:=相信有愛就有奇蹟
COMPOSER:=余盈盈

################################################################################

EXT=wav
SF:=/usr/share/soundfonts/GeneralUser.sf2

# IDTITLE:=$(patsubst ly.%,%,$(shell basename $(shell pwd)))
# TITLE:=$(word 2,$(subst ., ,$(IDTITLE)))
ID:=$(word 3,$(subst ., ,$(shell basename $(shell pwd))))
TITLE:=$(word 4,$(subst ., ,$(shell basename $(shell pwd))))

.NOTPARALLEL:
default: m4a

view: lu.pdf
	( /usr/bin/atril $^ &>/dev/null & )

play: lu.$(EXT)
	/usr/bin/mpv --loop-file=inf --no-resume-playback --no-save-position-on-quit $^

# 3/3 encode
m4a: lu.$(EXT)
	/usr/bin/fdkaac -o $(ID).$(TITLE).m4a -p 2 -m 5 -f 0 $^ --title $(TITLE) --artist $(ARTIST) --album $(ALBUM) --composer $(COMPOSER)

# 2/3 synthesize
lu.$(EXT): lu.midi
	../ly.script.fluidsynth.sh $^ $@

# 1/3 compose
lu.pdf lu.midi:
	/usr/bin/lilypond --pdf -o lu main.ly

clean:
	/usr/bin/rm -fv *.pdf *.aiff *.midi *.wav *.m4a
