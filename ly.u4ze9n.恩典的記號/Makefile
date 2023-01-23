# M4A=$(shell basename $(shell pwd)).m4a
EXT=wav
SF:=/usr/share/soundfonts/GeneralUser.sf2

.NOTPARALLEL:
default: m4a
# default: lu.$(EXT)

m4a: lu.$(EXT)
	/usr/bin/fdkaac -o u4ze9n.恩典的記號.m4a -p 2 -m 5 -f 0 $^ --title 恩典的記號 --artist 盛曉敏 --album 幸福

view: lu.pdf
	( /usr/bin/atril $^ &>/dev/null & )

play: lu.$(EXT)
	/usr/bin/mpv --loop-file=inf --no-resume-playback --no-save-position-on-quit $^

lu.$(EXT): lu.midi
	../ly.scripts/fluidsynth.sh $^ $@; \

lu.pdf lu.midi:
	/usr/bin/lilypond --pdf -o lu main.ly

clean:
	rm -fv *.pdf *.midi *.wav *.aiff *.m4a
