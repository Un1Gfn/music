# ~/music/ly.ame/Makefile

EXT=aiff
SF:=/usr/share/soundfonts/GeneralUser.sf2

# .NOTPARALLEL:
# default: ly ly.U ly.L wav

default: lu.$(EXT)

play: lu.$(EXT)
	mpv --loop-file=inf --no-resume-playback $^

lu.$(EXT): lu.midi
	../ly.scripts/fluidsynth.sh $^ $@; \

# l_.midi:

# _u.midi:

lu.pdf lu.midi:
	/usr/bin/lilypond --pdf -o lu main.ly

clean:
	rm -fv *.pdf *.midi *.wav *.aiff
