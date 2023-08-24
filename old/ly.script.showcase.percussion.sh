#!/bin/bash

# https://en.wikipedia.org/wiki/Percussion_instrument
# https://lilypond.org/doc/v2.24/Documentation/notation/percussion-notes

INSTRUMENT=(
  agh agl 
  bd bda boh bohm boho bol bolm bolo
  cab cb cgh cghm cgho cgl cglm cglo cl cuim cuio cymc cymca cymcb cymch cymr cymra cymrb cyms
  gui guil guis
  hc hh hhc hhho hho hhp
  mar
  rb
  sn sna sne ss ssh ssl
  tamb timh timl tomfh tomfl tomh toml tommh tomml tri trim trio tt
  vibs
  wbh wbl whl whs
)

echo

echo "${#INSTRUMENT[@]}"
echo

echo "${INSTRUMENT[*]}"
echo

