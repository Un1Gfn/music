#!/bin/bash

{

  # SF=/usr/share/soundfonts/FluidR3_GM.sf2
  # SF=/usr/share/soundfonts/GeneralUser.sf2
  SF=/usr/share/soundfonts/Unison.sf2

  CMD=(
    /usr/bin/fluidsynth
    --audio-driver=file
    --gain 1.3
    --sample-rate 44100
    --audio-file-type wav
    # --verbose
    -o synth.cpu-cores=4
    --disable-lash # no interactive shell
    -F "$2"
    "$SF"
    "$1"
  )

  "${CMD[@]}"

}; exit
