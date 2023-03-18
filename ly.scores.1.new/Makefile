MAKEFLAGS:=-j1
LY:=~/music/ly.script.lilypond.sh
SYNTH:=~/music/ly.script.fluidsynth.sh
N2L:=~/music/ly.script.1234567.cdefgab.sh
ZIP:=2023-03-12.zip

default: mid wav play
# default: mid wav m4a zip

clean:
	/usr/bin/rm -fv *.pdf *.aiff *.midi *.wav *.m4a cdefgab.txt

mid:
	$(LY) main.ly
# 	$(LY) -o main main.ly

wav:
	for i in *.midi; do $(SYNTH) $$i $${i%.midi}.wav; done

m4a:
	@echo
	@/usr/bin/parallel -V
	@echo
	/usr/bin/ls -A1 *.wav | /usr/bin/parallel /usr/bin/fdkaac -o {.}.m4a -p 2 -m 5 -f 0 {}

zip:
	/usr/bin/rm -fv $(ZIP)
	/usr/bin/zip -0 $(ZIP) *.m4a
	@echo
	@realpath $(ZIP)
	@echo

# --loop-file=inf
play:
	/usr/bin/mpv --keep-open=yes --no-resume-playback --no-save-position-on-quit --start=00:00 *.wav

n2l:
	$(N2L) 1234567.txt >cdefgab.txt
