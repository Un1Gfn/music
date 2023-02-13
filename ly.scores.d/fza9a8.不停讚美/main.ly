\version "2.24.0"

\include "../../ly.preamble.ly"

speed = { \tempo \markup \italic "audio in D, sheet in C" 4 = 144 }

\include "upper.ly"
\include "lower.ly"
\include "percussion.ly"

\score {
  \relative c' {
    \speed
    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4
    <<
      \upper
      \addlyrics \lrc
    >>
  }
  \layout { }
}

\score {
  \new Staff <<
    \new Staff \transpose c d' \relative \unfoldRepeats { \speed \upper }
    \new Staff \fixed c' { \speed \lower }
    \new DrumStaff { \speed \percussion }
  >>
  \midi { }
}
