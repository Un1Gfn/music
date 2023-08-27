MAKEFLAGS:=-j1

LY:=./script_lilypond.zsh
SYNTH:=./script_fluidsynth.zsh
# N2L:=~/music/ly.script.1234567.cdefgab.sh
PARALLEL:=/opt/homebrew/bin/parallel
FDKAAC:=/opt/homebrew/bin/fdkaac
ZIP:=/opt/homebrew/opt/zip/bin/zip

default: clean midi wav m4a zip

clean:
	grm -fv *.tmp *.midi *.wav *.m4a SATB.zip
	grm -iv *.pdf; gtrue

midi:
	$(LY) main.ly
# 	$(LY) -o main main.ly

wav:
	# gls -Al *.midi | $(PARALLEL) -- $(SYNTH) {} {.}.wav
	for i in *.midi; do $(SYNTH) $$i $${i%.midi}.wav; done

# aiff:
# 	for i in *.midi; do $(SYNTH) $$i $${i%.midi}.aiff; done

m4a:
	@echo
	@$(PARALLEL) -V
	@echo
	gls -A1 *.wav | $(PARALLEL) -- $(FDKAAC) -o {.}.m4a -p 2 -m 5 -f 0 {}

zip:
	grm -fv SATB.zip
	$(ZIP) -X -0 SATB.zip *.m4a

share:
	T=/tmp/SATB-$(shell date +%s).zip; \
	gcp -v SATB.zip $$T; \
	gcp -v $$T '/Users/darren/Library/Mobile Documents/com~apple~CloudDocs/euw9o3/'; \
	sudo zsh /usr/local/bin/tgbot.zsh $$T; \
	grm -v $$T

# --loop-file=inf
# play:
# 	vlc *.midi
# 	# /usr/bin/mpv --keep-open=yes --no-resume-playback --no-save-position-on-quit --start=00:00 *.wav

# n2l:
# 	$(N2L) 1234567.txt >cdefgab.txt
