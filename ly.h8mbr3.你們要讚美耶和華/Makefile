# ~/music/ly.ame/Makefile

SF:=/usr/share/soundfonts/GeneralUser.sf2

# .NOTPARALLEL:
# default: ly ly.U ly.L wav

default: lu.aiff

play: lu.aiff
	mpv --loop-file=inf --no-resume-playback $^

lu.aiff: lu.midi
	../ly.scripts/fluidsynth.sh $^ $@; \

# l_.midi:

# _u.midi:

lu.pdf lu.midi:
	/usr/bin/lilypond --pdf -o lu main.ly

clean:
	rm -fv *.pdf *.midi *.wav *.aiff
