MAKEFLAGS := $(MAKEFLAGS) --no-print-directory

CFLAGS := -std=gnu11 -g -O0 -Wextra -Wall -Winline -Wshadow -fanalyzer
LDLIBS := -lm
BIN    := main.out
# RATE   ?= 8000
# RATE   ?= 16000
RATE   ?= 192000

.SILENT: default
default: null
# default: aplay

aplay: $(BIN)
	./$< $(RATE) | aplay -r $(RATE)

null: $(BIN)
	./$< $(RATE) >/dev/null

gdb: $(BIN)
	gdb ./$<

$(BIN): main.c
	gcc $(CFLAGS) -o $@ $< $(LDLIBS)

.SILENT: clean
clean:
# 	rm -fv *.out
	rm -fv $(BIN)
