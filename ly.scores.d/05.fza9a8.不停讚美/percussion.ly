% percussion.ly

drumPitchNames.o=#'bassdrum
drumPitchNames.x=#'hihat

A = \drummode { | o16 r o o x8 o   o x o o | }
B = \drummode { | r16 r o o x8 o   o x o o | }

demo = \drummode {

  r4.
  
  % short
  r hh hhp
  r ss ssh ssl
  r sne sna sn
  r tomh toml
  r bd

  % long
  % r hho hhho
  % r cymr cymc

}

percussion = \drummode {

  \meta

  \set Staff.midiMaximumVolume = #0.6

  % \demo

  \A \B
  \repeat unfold 16 { \A \B }

}
