\version "2.22.1"

meta = {
  % https://en.wikipedia.org/wiki/Tempo
  \tempo "Vivace" 4 = 170
  \key c \major
  \time 4/4
}

accompanimentStaccato =
#(define-music-function
    (x         y         z        )
    (ly:music? ly:music? ly:music?)
  #{
    $y r8
    $z r8
    $x r8
    $z r8
  #})

upper = \relative c'' {

  \meta
  \clef "treble"

  \repeat unfold 4 { r1 | }

  \resetRelativeOctave c''
  b8^1 r8 e8^4 d4. c8 r8 |
  b8^1 r8 c8^2 b4.^1 a8_3 r8 |
  g8 r8 a8 g4. e8 r8 |
  e2 r2 |

  \resetRelativeOctave c''
  ^"00:12"
  e8^3 r8 f8 e4. d8 r8  |
  c8^1 r8 d8^2 c4.^1 b8^3 r8  |
  a8 r8 b8 a4. b8 a8~ | a4 r2. |

  % https://lilypond.org/doc/v2.22/Documentation/learning/adding-text
  ^"Fm"
  \resetRelativeOctave c''
  e8 r8 f8 e4. d4 | c4 d8 c4. r4 |
  b8 r8 c8 b4. b4 | d2    c2     |

  ^"00:23"
  \resetRelativeOctave c''
  fis32 g16. r8 d8 c4. r4 |
  fis32 g16. r8 d8 c4 g'16 a8. <b, dis>8~ |
  8 r8 <g' ais>8  r8 <g ais>8 r8 <dis gis>8 <d g>8~ |
  2 r2 |

}

lower = \fixed c {
  \meta
  \clef "bass"

  ^"*8"
  \repeat unfold 8 { \accompanimentStaccato g,8 c8 < e   g  b  >8 }

  ^"*4"
  \repeat unfold 4 { \accompanimentStaccato g,8 d8 < f   a  c' >8 }

  ^"00:18"
  f8 r8   <aes c' f'>8 r8   c8 r8   <gis c' f'>8 r8   |
  f8 r8   <aes c' f'>8 r8   f8  r8   <gis c' f'>8 r8   |

    e8 r8   <g b>8 r8     e8 r8   <g b>8 r8   |
  dis8 r8   <g b>8 r8   dis8 r8   <g b>8 r8   |

  \accompanimentStaccato a,8 d8 <f a>8 |
  \accompanimentStaccato a,8 d8 <f a>8 |

  g,4 <f g b>4
  g,4 <f g b>4 |

  g,4 c16 d8. g8 r8 g,8 r8 |

}

\score {
  % https://lilypond.org/doc/v2.22/Documentation/learning/solo-piano
  \new PianoStaff \with { instrumentName = "Piano" } <<
    { \new Staff = "upper" \upper }
    { \new Staff = "lower" \lower }
  >>
  \layout {}
  \midi {}
}
