O:=builddir
N:=ninja -j4 -v -C $(O)
IN?=sample.txt
OUT?=/dev/stdout

default: build

help:
	@echo '$(MAKE) run IN=/path/to/hangul OUT=/path/to/romanized'

$(O):
	@echo "/Makefile --> /meson.build --> /builddir/build.ninja"
	@rm -rf $(O)
	meson setup $(O) .

# order-only prerequisite
# no rebuild on outdate
build: | $(O)
# 	meson compile -v -C $(O)
	$(N)

run: build
	file $(IN)
	>$(OUT)
	$(O)/hangul-rr <$(IN) >$(OUT)

valgrind: build
	file $(IN)
	valgrind $(O)/hangul-rr <$(IN)

gdb: build
	file $(IN)
	gdb $(O)/hangul-rr \
		-ex 'set debuginfod enabled off' \
		-ex 'b -function tb_emit -label lb' \
		-ex 'r <$(IN)' \
		-ex 'c 16'

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?h=v5.19#n1561
clean:
	{ [ -e $(O) ] && $(N) -t clean; } || true
	rm -fv cscope.out
mrproper:
	rm -rfv $(O)/
distclean:
	rm -rfv $(O)/
