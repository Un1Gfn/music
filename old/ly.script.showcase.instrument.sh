#!/bin/bash

TMP_D_WAV=/tmp/instruments
THREADS=4

I=(
  "acoustic grand"            "contrabass"          "lead 7 (fifths)"
  "bright acoustic"           "tremolo strings"     "lead 8 (bass+lead)"
  "electric grand"            "pizzicato strings"   "pad 1 (new age)"
  "honky-tonk"                "orchestral harp"     "pad 2 (warm)"
  "electric piano 1"          "timpani"             "pad 3 (polysynth)"
  "electric piano 2"          "string ensemble 1"   "pad 4 (choir)"
  "harpsichord"               "string ensemble 2"   "pad 5 (bowed)"
  "clav"                      "synthstrings 1"      "pad 6 (metallic)"
  "celesta"                   "synthstrings 2"      "pad 7 (halo)"
  "glockenspiel"              "choir aahs"          "pad 8 (sweep)"
  "music box"                 "voice oohs"          "fx 1 (rain)"
  "vibraphone"                "synth voice"         "fx 2 (soundtrack)"
  "marimba"                   "orchestra hit"       "fx 3 (crystal)"
  "xylophone"                 "trumpet"             "fx 4 (atmosphere)"
  "tubular bells"             "trombone"            "fx 5 (brightness)"
  "dulcimer"                  "tuba"                "fx 6 (goblins)"
  "drawbar organ"             "muted trumpet"       "fx 7 (echoes)"
  "percussive organ"          "french horn"         "fx 8 (sci-fi)"
  "rock organ"                "brass section"       "sitar"
  "church organ"              "synthbrass 1"        "banjo"
  "reed organ"                "synthbrass 2"        "shamisen"
  "accordion"                 "soprano sax"         "koto"
  "harmonica"                 "alto sax"            "kalimba"
  "concertina"                "tenor sax"           "bagpipe"
  "acoustic guitar (nylon)"   "baritone sax"        "fiddle"
  "acoustic guitar (steel)"   "oboe"                "shanai"
  "electric guitar (jazz)"    "english horn"        "tinkle bell"
  "electric guitar (clean)"   "bassoon"             "agogo"
  "electric guitar (muted)"   "clarinet"            "steel drums"
  "overdriven guitar"         "piccolo"             "woodblock"
  "distorted guitar"          "flute"               "taiko drum"
  "guitar harmonics"          "recorder"            "melodic tom"
  "acoustic bass "            "pan flute"           "synth drum"
  "electric bass (finger)"    "blown bottle"        "reverse cymbal"
  "electric bass (pick)"      "shakuhachi"          "guitar fret noise"
  "fretless bass "            "whistle"             "breath noise"
  "slap bass 1"               "ocarina"             "seashore"
  "slap bass 2"               "lead 1 (square)"     "bird tweet"
  "synth bass 1"              "lead 2 (sawtooth)"   "telephone ring"
  "synth bass 2"              "lead 3 (calliope)"   "helicopter"
  "violin"                    "lead 4 (chiff)"      "applause"
  "viola"                     "lead 5 (charang)"    "gunshot"
  "cello"                     "lead 6 (voice)"
)

# synth <instrument> <thread no.>
# synth violin 01
function synth {

  [ $# -eq 2 ] || exit

  local LY="/tmp/instrument.thread$2.ly"

cat 1>"$LY" 0<<EOF
\version "2.22.1"
\score {
  {
    \time 4/4
    \tempo Moderato 4 = 120
    \new Staff \with {midiInstrument = "$1"} \relative {
      % r2
      r8 e fis gis
      a4.b8 c4 b4
      a4.b8 c4 b4
      a4.b8 dis4 b4
      e1
    }
  }
  \midi{}
}
EOF

  exec {FDBAK}>&1
  exec 1>/dev/null 2>/dev/null

  cd "$(dirname $LY)"
  lilypond "$(basename $LY)" || exit
  echo

  cd "$TMP_D_WAV" || exit

  fluidsynth \
    -l \
    -r 44100 \
    -T wav \
    -o synth.cpu-cores=1 \
    -F "$1.wav" \
    /usr/share/soundfonts/FluidR3_GM.sf2 \
    "${LY%.*}.midi" \
    || exit
  echo

  exec 1>&${FDBAK} 2>&${FDBAK} {FDBAK}>&-

}

{

  T=$(date +%s)

  echo

  rm -rf $TMP_D_WAV
  mkdir -v $TMP_D_WAV
  echo

  TOTAL=${#I[@]}
  PER_THREAD=$((TOTAL/THREADS))

  # ${I[0*PER_THREAD]} ~ ${I[$((1*PER_THREAD-1))]}
  # ${I[1*PER_THREAD]} ~ ${I[$((2*PER_THREAD-1))]}
  # ${I[2*PER_THREAD]} ~ ${I[$((3*PER_THREAD-1))]}
  # ${I[3*PER_THREAD]} ~ ${I[$((4*PER_THREAD-1))]}
  # ...

  echo "TOTAL $TOTAL"
  echo

  PIDS=()

  for ((th=0;th<THREADS;th=th+1)); do

    # B=$((th*PER_THREAD))
    (( B = th*PER_THREAD ))
    (( EE = (th+1)*PER_THREAD ))
    [ $EE -gt $TOTAL ] && EE=$TOTAL
    # echo "[$B,$EE)"
    ((CL=31+th))
    ((THREAD_TOTAL=EE-B))


    {
      for ((i=B;i<EE;++i)); do
        synth "${I[$i]}" $th
        printf "\e[%dm%s %s %d%%\e[0m\n" $CL thread$th $i $((100*(i-B+1)/THREAD_TOTAL))
        echo
      done
    } &
    PIDS[${#PIDS[@]}]=$!

  done

  # https://stackoverflow.com/a/356154/
  for i in "${PIDS[@]}"; do
    wait $i
    printf "proc %d finished\n" $i
    echo
  done

  ((T=$(date +%s)-T))
  printf "\e[7m %d:%02d \e[0m\n" $((T/60)) $((T%60))
  echo

  background nautilus $TMP_D_WAV

}; exit
