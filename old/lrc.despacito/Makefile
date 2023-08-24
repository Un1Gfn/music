TXT:=despacito.txt
HTML:=/tmp/despacito.html
M4A:=despacito.m4a

default: $(HTML) seek

entr:
	entr <<<$(TXT) $(MAKE) -B $(HTML)

$(HTML): $(TXT)
	./script.txt2html.sh $^ $@

seek: $(TXT) $(M4A)
	./script.seek.sh $(TXT) $(M4A)

clean:
	rm -fv $(HTML) ??.??????.m4a