#!/bin/bash

function help {
  echo
  echo "  $0 <in.midi> <out.wav|out.aiff>"
  echo
  exit 1
}

{

  [ 2 = "$#" ] || help

  # SF=/usr/share/soundfonts/FluidR3_GM.sf2
  # SF=/usr/share/soundfonts/GeneralUser.sf2
  SF=/usr/share/soundfonts/Unison.sf2

  CMD=(

    /usr/bin/fluidsynth

    # https://github.com/FluidSynth/fluidsynth/wiki/FluidSettings
    -o synth.cpu-cores=4

    # --audio-driver=file
    # --audio-driver=alsa
    # --audio-driver=pipewire
    --gain 2.0

    # https://www.fluidsynth.org/api/fluidsettings.xml#synth.sample-rate
    --sample-rate 96000

    --audio-file-type auto
    --disable-lash # no interactive shell
    # --verbose

    -F "$2"
    "$SF"
    "$1"

  )

  echo "${CMD[*]}"
  "${CMD[@]}"

}; exit
