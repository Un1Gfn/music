
SF:=/usr/share/soundfonts/GeneralUser.sf2

# .NOTPARALLEL:
# default: ly ly.U ly.L wav

default: wav

# https://www.gnu.org/software/make/manual/html_node/Multiple-Targets.html
# main.ly.midi main.ly.pdf: main.ly accompanimentfunc.ly upper.ly lower.ly
d.midi:
	lilypond --pdf -o d main.ly
u.midi:
	T="$$(mktemp /tmp/tmp.XXXXXXXXXX.ly)"; grep -v LB.L main.ly >"$$T"; lilypond --pdf -o u "$$T"; rm -fv "$$T"; unset -v T
l.midi:
	T="$$(mktemp /tmp/tmp.XXXXXXXXXX.ly)"; grep -v LB.U main.ly >"$$T"; lilypond --pdf -o l "$$T"; rm -fv "$$T"; unset -v T

# play:
# 	timidity -c <(echo "soundfont $(SF)") -ik -OsS $<

wav: d.midi u.midi l.midi
	for m in $^; do ./fluidsynth.sh "$$m" $${m%.midi}.wav; done

clean:
	rm -fv *.pdf *.midi
