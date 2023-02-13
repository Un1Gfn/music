# $(error WIP)

# this file should be included instead of invoked directly
# https://www.gnu.org/software/make/manual/html_node/Include.html

MAKEFLAGS:=-j1

# (1) Makefile - include ../../ly.mk      - path relative to Makefile
# (2) ly.mk    - include ../../ly.conf.mk - path relative to Makefile
include ../../ly.conf.mk

# IDTITLE:=$(patsubst ly.%,%,$(shell basename $(shell pwd)))
# TITLE:=$(word 2,$(subst ., ,$(IDTITLE)))
ID:=$(word 1,$(subst ., ,$(shell basename $(shell pwd))))
TITLE:=$(word 2,$(subst ., ,$(shell basename $(shell pwd))))
BASENAME:=$(ID).$(TITLE)

PDF:=$(BASENAME).pdf
MIDI:=$(BASENAME).midi
WAV:=$(BASENAME).wav
M4A:=$(BASENAME).m4a

default: m4a

pdf: $(PDF)
wav: $(WAV)

entrpdf:
	echo; { /usr/bin/printf '%s\n' $(LY) $(PREAMBLE); /usr/bin/ls -1 *.ly; } | /usr/bin/entr sh -c "$(MAKE) -B $(PDF); echo;"

view: $(PDF)
	( /usr/bin/atril $^ &>/dev/null & )

play: $(WAV)
	/usr/bin/mpv --loop-file=inf --no-resume-playback --no-save-position-on-quit $^
# 	/usr/bin/mpv --loop-file=inf --no-resume-playback --no-save-position-on-quit $^ --start=01:20

# 3/3 encode
m4a: $(WAV)
	/usr/bin/fdkaac -o $(M4A) -p 2 -m 5 -f 0 $^ --title $(TITLE) --artist $(ARTIST) --album $(ALBUM) --composer $(COMPOSER)

# 2/3 synthesize
$(WAV): $(MIDI)
	$(SYNTH) $^ $@

# 1/3 compose
$(PDF) $(MIDI):
	$(LY) -e '(define-public qihocu "$(BASENAME)")' --pdf -o $(BASENAME) main.ly

clean:
	/usr/bin/rm -fv *.pdf *.aiff *.midi *.wav *.m4a

nemo:
	( /usr/bin/nemo . &>/dev/null & )
