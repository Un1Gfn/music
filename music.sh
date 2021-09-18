#!/bin/bash

# Author: Antonio Macchi
# Used in ABS Guide with permission.

DURATION=2000  # If 8000 bytes = 1 second, then 2000 = 1/4 second.
V=$'\xc0'      # Max volume = \xff or \x00
M=$'\x80'      # No volume  = \x80 (the middle).

# $1: Note Hz in bytes (e.g. A = 440Hz ::
# 8000 fps / 440 = 16 :: A = 16 bytes per second)
function mknote {
  case "$#" in

  0)
    for t in $(seq 0 $((DURATION-1))); do
      builtin echo -n "$M"
    done
  ;;

  1)
    if [ "${1: -1}" = "+" ]; then
      n=${1%+}
      for t in $(seq 0 $((DURATION-1))); do
        if ((t%(n*2+1)==0||t%(n*2+1)==n)); then
          builtin echo -n "$V"
        else
          builtin echo -n "$M"
        fi
      done
    else
      for t in $(seq 0 $((DURATION-1))); do
        if ((t%$1==0)); then
          builtin echo -n "$V"
        else
          builtin echo -n "$M"
        fi
      done
    fi
  ;;

  *)
    exit
  ;;

  esac

}

function mknotes {

  # https://en.wikipedia.org/wiki/Piano_key_frequencies

  # <xN>="$(mknote <n>)" #O# <f> # genuine 
  # <xN>="$(mknote <n>)" #.# <f> # inferred
  # <n> = 15913.7351000 / <f>    # ($AVG_PRODUCT)

  cis="$(mknote 29)"  #O#

  b3="$(mknote  8 )" #.# 1975.533
  a3="$(mknote  9 )" #.# 1760.000
 g3S="$(mknote  9+)" #.# 1661.219 g3♯ a3♭
  g3="$(mknote 10 )" #.# 1567.982
  f3="$(mknote 11+)" #.# 1396.913
  e3="$(mknote 12 )" #.# 1318.510
  d3="$(mknote 13+)" #.# 1174.659
  c3="$(mknote 15 )" #.# 1046.502

  b2="$(mknote 16 )" #.# 987.7666
  a2="$(mknote 18 )" #.# 880.0000
 g2S="$(mknote 19 )" #.# 830.6094 g2♯ a2♭
  g2="$(mknote 20+)" #.# 783.9909
  f2="$(mknote 23 )" #O# 698.4565
  e2="$(mknote 24 )" #O# 659.2551
  d2="$(mknote 27 )" #O# 587.3295
  c2="$(mknote 30+)" #O# 523.2511

  b1="$(mknote 32 )" #O# 493.8833
  a1="$(mknote 36 )" #O# 440.0000
 g1S="$(mknote 38 )" #.# 415.3047 g♯ a♭
  g1="$(mknote 40+)" #O# 391.9954
  f1="$(mknote 45+)" #.# 349.2282
  e1="$(mknote 48+)" #O# 329.6276
  d1="$(mknote 54 )" #.# 293.6648
  c1="$(mknote 61 )" #.# 261.6256

  a2F="$g2S"
  a1F="$g1S"

  b="$b1"
  a="$a1"
  g="$g1"
  f="$f1"
  e="$e1"
  d="$d1"
  c="$c1"
  gS="$g1S"
  aF="$a1F"

  # mknote 61 | head -c -1 | wc -c
  # exit

  n="$(mknote)"

  echo "notes are ready"

}

mknotes

slide="\
$c$d$e$f$g$a$b$c2$d2$e2$f2$g2$a2$b2\
$c3\
$b2$a2$g2$f2$e2$d2$c2$b$a$g$f$e$d$c\
"

original="\
$g$e2$d2$c2$d2$c2$a$g$n$g$e$n\
$g$e2$d2$c2$c2$b$c2$cis$n$cis$d2$n\
$g$e2$d2$c2$d2$c2$a$g$n$g$e$n$g$a$d2$c2$b$a$b$c2\
"

function aplay2 {
  [ "$#" -eq 1 ] || exit
  echo "$(printf "%s" "$1" | sponge | wc -c) bytes"
  printf "%s" "$1" | sponge | aplay
}

t0="b2b2_c3 d3_ e3_ c3_a2_ a2___"

segA=(
  e3_b2c3 d3d3c3b2
  a2a2_c3 e3_d3c3
  $t0
  d2d3_f3 a3a3g3f3 e3e3_c3 e3e3d3c3
  $t0
); segA="${segA[*]}"

segB=(
  e2e2e2e2 c2c2c2c2 d2d2d2d2 bbbb c2c2c2c2 aaaa gSgSgSgS bbbb
  e2e2e2e2 c2c2c2c2 d2d2d2d2 bbbb c2c2e2e2 a2a2a2a2 g2Sg2Sg2Sg2S e2e2e2e2
); segB="${segB[*]}"

alt_tetris=(
  $segA
  $segA
  $segB
); alt_tetris="${alt_tetris[*]}"

alt_tetris="$( \
  for i in {0..10}; do \
    printf "%s" "$alt_tetris"; \
  done; \
)"

function alt_aplay2 {
  # SPACE=" "
  local CONV="$(cat \
    | sed -e '/^#/d' \
    | tr -d "\040\t\n" \
    | sed -E \
      -e "s/([cdefgabn][123]{0,1}[SF]{0,1})/\$\1/g" \
      -e "s/_/\$n/g" \
  )"
  # printf -- "---%s---\n" "$x"
  local BIN="$(eval builtin printf "%s" "$CONV")"
  
  echo "$( printf "%s" "$BIN" | sponge | wc -c) bytes"
  printf "%s" "$BIN" | sponge | aplay

}

# main()
{

  # printf "%s" "$slide" | wc -c; exit

  # aplay2 "$slide"
  # sleep 0.3
  # aplay2 "$original"

  alt_aplay2 <<<"$alt_tetris"

}; exit
