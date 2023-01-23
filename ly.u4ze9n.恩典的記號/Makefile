# https://www.youtube.com/watch?v=5TlA9Ylalj4
# 恩典的記號 盛曉玫 06 幸福

M4A=$(shell basename $(shell pwd))

EXT=aiff
SF:=/usr/share/soundfonts/GeneralUser.sf2

.NOTPARALLEL:
default: lu.$(EXT)

# m4a: lu.$(EXT)
# 	/usr/bin/fdkaac -o h8mbr3.你們要讚美耶和華.m4a -p 2          -m 5 -f 0 $^ --title 你們要讚美耶和華 --artist 讚美之泉 --album 耶和華祝福滿滿

play: lu.$(EXT)
	/usr/bin/mpv --loop-file=inf --no-resume-playback $^

lu.$(EXT): lu.midi
	../ly.scripts/fluidsynth.sh $^ $@; \

lu.pdf lu.midi:
	/usr/bin/lilypond --pdf -o lu main.ly

clean:
	rm -fv *.pdf *.midi *.wav *.aiff
