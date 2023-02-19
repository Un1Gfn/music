\version "2.24.1"

\include "../../ly.preamble.ly"

\include "var.ly"

% speed = { \tempo 4 = 113 } % test
speed = { \tempo 4 = 72 }

\score {

  \new Staff \relative c' {

    \speed

    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4

    <<
      \all
      \addlyrics { \lrcfont \allL }
    >>

  }

  \layout { }

}

\score {
  \new Staff {
    \speed
    \transpose c a {
      \fixed c, \chordmode { | c2 f | g:7 \invertChords 1 c | }
      \relative \all
    }
  }
  \midi { }
}
