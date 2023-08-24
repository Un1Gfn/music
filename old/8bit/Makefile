MAKEFLAGS := $(MAKEFLAGS) --no-print-directory

CFLAGS := -std=gnu11 -g -O0 -Wextra -Wall -Winline -Wshadow -fanalyzer
LDLIBS := -lm
BIN    := main.out
TMP    := /tmp/tetris.tmp

# RATE   ?= 8000
# RATE   ?= 16000
RATE   ?= 192000
# RATE   ?= 44100

.SILENT: default
default: tetris

tetris: $(BIN)
	./tetris.sh 1>$(TMP)
# 	./$< $(RATE) 0<$(TMP) 1>/dev/null
	./$< $(RATE) 0<$(TMP) | sponge | aplay -r $(RATE)

aplay: $(BIN)
	./$< $(RATE) | sponge | aplay -r $(RATE)

null: $(BIN)
	./$< $(RATE) 1>/dev/null

gdb: $(BIN)
	gdb ./$<

$(BIN): main.c
	gcc $(CFLAGS) -o $@ $< $(LDLIBS)

.SILENT: clean
clean:
# 	rm -fv *.out
	rm -fv $(BIN) $(TMP)
