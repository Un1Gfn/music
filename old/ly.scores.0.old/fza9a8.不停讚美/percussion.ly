% percussion.ly

drumPitchNames.o=#'bassdrum
drumPitchNames.x=#'hihat

A = \drummode { | o16 r o o x8 o   o x o o | }
B = \drummode { | r16 r o o x8 o   o x o o | }

percussion = \drummode {
  \set Staff.midiMaximumVolume = #0.6
  \B
  \repeat unfold 16 { \A \B }
  \fine
}
