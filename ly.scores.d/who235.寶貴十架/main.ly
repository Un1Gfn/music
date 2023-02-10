\version "2.24.0"

meta = {
  \tempo 4 = 72
  \time 4/4
}

upper = \relative c''' {

  \meta
  \clef "treble"
  \key c \major

  % \set Timing.measureBarType = #""

  r2 | f8 e d c b4 e | d8 c b a e2 | a8 g f e c a a'4 | g2. \break

  g,8 f | e2~8 f e d | c2~8 8 d c | a'2~8 g d f | e2 r8 c d c | \break

  | a'4 4. b8 c d | g,4 d'8 c c2 | r8 a g f e d c d~ | 2 r4 g8 f | \break

  | e2~8 f e d | c2~8 c d c | a'2~8 g d f | e2 r8 c d c | \break

  | a'4 4. b8 c d | g,4 d'8 c c2 | r8 a b c c a e' d | d2 r8 g, c d | \break

  | e4 8. f16 e4 d8 c | b8 a a4 r4 d8 e | f4. e8 a, b c16 e8 d16 | d2 r8 g, c d | \break

  | e4 8. f16 e4 d8 c | b8. a b8 c4. a8 | g e'4 e16 e f8. e d8 | c1 | \break

}

\score {
  <<
    % \new Staff \transpose c a \upper
    \new Staff \upper
  >>
  \layout { }
}

\score {
  <<
    \new Staff \transpose c a, \upper
  >>
  \midi { }
}
