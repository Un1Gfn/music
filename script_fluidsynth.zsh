#!/bin/zsh

{

  CMD=(

    /opt/homebrew/bin/fluidsynth

    # https://github.com/FluidSynth/fluidsynth/wiki/FluidSettings
    -o synth.cpu-cores=4

    -a file
  
    --gain 2.0

    # https://www.fluidsynth.org/api/fluidsettings.xml#synth.sample-rate
    # https://github.com/audiojs/sample-rate
    # --sample-rate  8000
    # --sample-rate 44100
    --sample-rate 96000

    --audio-file-type auto
    --disable-lash # no interactive shell
    # --verbose

    -F "$2"
    RES/Arachno.sf2
    # RES/FluidR3_GM.sf2
    # RES/GeneralUser.sf2
    "$1"

  )

  echo $CMD[*]

  $CMD[@]

}; exit
