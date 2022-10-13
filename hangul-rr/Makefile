O:=builddir
N:=ninja -j4 -v -C $(O)

default: build

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
	file sample.txt
	>out.tmp.txt
# 	$(O)/hangul-rr <sample.txt >out.tmp.txt
	$(O)/hangul-rr <sample.txt

valgrind: build
	file sample.txt
	valgrind $(O)/hangul-rr <sample.txt

gdb: build
	file sample.txt
	gdb $(O)/hangul-rr \
		-ex 'set debuginfod enabled off' \
		-ex 'b -function tb_emit -label lb' \
		-ex 'r <sample.txt' \
		-ex 'c 16'

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?h=v5.19#n1561
clean:
	{ [ -e $(O) ] && $(N) -t clean; } || true
	rm -fv cscope.out
mrproper:
	rm -rfv $(O)/
distclean:
	rm -rfv $(O)/
