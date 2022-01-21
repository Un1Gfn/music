\version "2.22.1"

\score {

  {

    % https://en.wikipedia.org/wiki/Tempo
    \tempo "Vivace" 4 = 170
    \key c \major
    \time 4/4

    \new PianoStaff <<
      \new Staff \relative c'' {
        \clef "treble"
        r1 |
        r1 |
        r1 |
        r1 |
        b8 r8 e8 d4. c8 r8 |
        b8 r8 c8 b4. a8 r8 |
      } \new Staff \fixed c {
        \clef "bass"
        c8 r8 <e g b>8 r8 g,8 r8 <e g b>8 r8 |
        c8 r8 <e g b>8 r8 g,8 r8 <e g b>8 r8 |
        c8 r8 <e g b>8 r8 g,8 r8 <e g b>8 r8 |
        c8 r8 <e g b>8 r8 g,8 r8 <e g b>8 r8 |
        c8 r8 <e g b>8 r8 g,8 r8 <e g b>8 r8 |
        c8 r8 <e g b>8 r8 g,8 r8 <e g b>8 r8 |
      }
    >>

  }

  \layout{}
  \midi{}

} 
