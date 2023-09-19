MAKEFLAGS:=-j1
LY:=./script_lilypond.zsh
SYNTH:=./script_fluidsynth.zsh
# N2L:=~/music/ly.script.1234567.cdefgab.sh
PARALLEL:=/opt/homebrew/bin/parallel
FDKAAC:=/opt/homebrew/bin/fdkaac
ZIP:=/opt/homebrew/opt/zip/bin/zip
ZIPFILE=SAB.zip

CURRENT:=2562095675

default:
	$(MAKE) clean
	$(MAKE) midi
	$(MAKE) wav
	# $(MAKE) play
	# $(MAKE) m4a
	# $(MAKE) zip

clean:
	grm -fv -- $(ZIPFILE) *.tmp *.midi *.wav
	grm -iv -- *.m4a; gtrue
entr:
	$(MAKE) clean
	echo $(CURRENT).ly | entr sh -c ':; echo; $(MAKE) midi; echo'

midi:
	$(LY) $(CURRENT).ly
# 	$(LY) -o main $(CURRENT).ly

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
	grm -fv $(ZIPFILE)
	$(ZIP) -X -0 $(ZIPFILE) *.m4a

share:
	T=/tmp/SATB-$(shell date +%s).zip; \
	gcp -v $(ZIPFILE) $$T; \
	gcp -v $$T '/Users/darren/Library/Mobile Documents/com~apple~CloudDocs/euw9o3/'; \
	sudo zsh /usr/local/bin/tgbot.zsh $$T; \
	grm -v $$T

# --loop-file=inf
# vlc *.midi
play:
	mpv \
	  --keep-open=yes \
	  --no-resume-playback \
	  --no-save-position-on-quit \
	  --start=00:00 $(CURRENT)$(C).wav

# n2l:
# 	$(N2L) 1234567.txt >cdefgab.txt
