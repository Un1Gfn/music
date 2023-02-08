# ~/music/ly.ame/Makefile

EXT=wav
SF:=/usr/share/soundfonts/GeneralUser.sf2

.NOTPARALLEL:
default: m4a
# default: lu.$(EXT)

m4a: lu.$(EXT)
	/usr/bin/fdkaac -o h8mbr3.你們要讚美耶和華.m4a -p 2          -m 5 -f 0 $^ --title 你們要讚美耶和華 --artist 讚美之泉 --album 耶和華祝福滿滿
# 	/usr/bin/fdkaac -o h8mbr3.你們要讚美耶和華.m4a -p 2 -b 96000 -m 0 -f 0 $^ --title 你們要讚美耶和華 --artist 讚美之泉 --album 耶和華祝福滿滿

play: lu.$(EXT)
	/usr/bin/mpv --loop-file=inf --no-resume-playback $^

lu.$(EXT): lu.midi
	../ly.scripts/fluidsynth.sh $^ $@; \

# l_.midi:

# _u.midi:

lu.pdf lu.midi:
	/usr/bin/lilypond --pdf -o lu main.ly

clean:
	rm -fv *.pdf *.midi *.wav *.aiff
