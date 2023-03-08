MAKEFLAGS:=-j1
LY:=~/music/ly.script.lilypond.sh
SYNTH:=~/music/ly.script.fluidsynth.sh
N2L:=~/music/ly.script.1234567.cdefgab.sh

default: mid wav

clean:
	/usr/bin/rm -fv *.pdf *.aiff *.midi *.wav *.m4a cdefgab.txt

mid:
	$(LY) -o main main.ly

wav:
	for i in *.midi; do $(SYNTH) $$i $${i%.midi}.wav; done

P:=有一位神
play:
	/usr/bin/mpv --loop-file=inf --no-resume-playback --no-save-position-on-quit --start=00:00 $(P).wav
# 	/usr/bin/mpv --resume-playback --save-position-on-quit $(P).wav

n2l:
	$(N2L) 1234567.txt >cdefgab.txt
