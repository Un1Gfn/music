#!/bin/bash

function r {
  for i in $(seq 1 $1); do
    printf "%s" $2
  done
}

{

  t0="b'b'xc'' d''x e''x c''xa'x a'xxx"

  segA=(
    "e''xb'c'' d''d''c''b'"
    "a'a'xc'' e''xd''c''"
    "$t0"
    "d'd''xf'' a''a''g''f'' e''e''xc'' e''e''d''c''"
    "$t0"
  ); segA="${segA[*]}"

  segB=(
    "$(r 4 e\') $(r 4 c\') $(r 4 d\') $(r 4 b) $(r 4 c\') $(r 4 a) $(r 4 gis) $(r 4 b)"
    "$(r 4 e\') $(r 4 c\') $(r 4 d\') $(r 4 b) c'c'e'e' $(r 4 a\') $(r 4 g\'is) $(r 4 e\')"
  ); segB="${segB[*]}"

  tetris=(
    "$segA"
    "$segA"
    "$segB"
  ); tetris="${tetris[*]}"

  printf "$tetris" | tr -d ' '

}; exit
