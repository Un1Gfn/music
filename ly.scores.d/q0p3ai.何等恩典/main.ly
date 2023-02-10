\version "2.24.0"

meta = {
  \tempo 4 = 70
  \time 4/4
}

percussion = \drummode {
  \meta
  \repeat unfold 2 { bd4 hh hh hh }
}

upper = \relative c' {

  \meta
  \clef "treble"
  \key c \major

  | r1 | <c e g>2. c8 d | \break

  | e4. d8 c4 c8 b | c4 b8 a g2 | a4 b8 c g4. g8 | a4 e'8 d d4 c8 d | \break

  | e4. d8 c4 c8 b | c4 b8 a g4. g8 | a4 f'8[e d c c b] | c2 r8 g e' d | \break

  | c4 c8 c d8. e8. c8 | a2 r8 a f' e | d4. c8 b c d16 e8. | d2 r8 g, g' f | \break

  | e4. c8 c d e g | g f f e c4 c8 d | e4. e8 d c c b | c1 | \break

  | g8 16 8. 2 8 | a8 16 8. f8~2 | a8 16 8. 2 c8 | c8. b a8 g2 | \break

  | e'8 16 8. 2 8 | e8. d c8 c4 c8 d | e4. e8 d c c b | c2 r8 g e' d | \break

}

\score {

  <<
    \new Staff \transpose c g \upper
    % \new Staff \upper
    \new DrumStaff \percussion
  >>

  \layout { }

  \midi { }

}
