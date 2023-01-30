% percussion.ly

o = #(define-music-function (x) (ly:duration?) #{ \drummode { hhp $x } #})

n = #(define-music-function (x) (ly:duration?) #{ \drummode { ss  $x } #})

p = #(define-music-function (x) (ly:duration?) #{ \drummode { hh  $x } #})
m = #(define-music-function (x) (ly:duration?) #{ \drummode { bd  $x } #})

C  = \drummode { | \m 4 \m 4 \m 4 \m 4 | }
A  = \drummode { | \m 8 \o 8 \n 8 \o 8   \p 8 \o 8 \n 8 \o 8 | }
B  = \drummode { | \m 8 \o 8 \n 8 \o 8    r 8 \o 8 \n 8 \o 8 | }
Az = \drummode { | \m 8 \o 8 \n 8 \o 8   \p 8 \o 8               \m 16 16 8 | }
Bz = \drummode { | \m 8 \o 8 \n 8 \o 8    r 8 \o 8               \m 16 16 8 | }

demo = \drummode {
  
  r4 bd hh hhp

  r4 bd ss ssh ssl

  % r4 bd sn sna sne

  r4 bd toml tomh

  r4 bd hho hhho

  r4 bd cymr cymc

}

percussion = \drummode {

  \meta

  \set Staff.midiMaximumVolume = #1.7

  % \demo

  \repeat unfold 2 { \B \A }
  \C
  \repeat unfold 2 { \A \B }
  \C
  \repeat unfold 2 { \B \A }
  \C
  \repeat unfold 4 { \B \A }
  \C
  \repeat unfold 2 { \B \A }
  \B \Az


}
