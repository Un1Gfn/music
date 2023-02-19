\version "2.24.1"

\include "../../ly.preamble.ly"

\include "var.ly"

speed = { \tempo 4 = 66 }
% speed = { \tempo 4 = 122 }% test

\score {

  \new Staff {

    \speed

    \clef "treble"
    \numericTimeSignature \time 4/4

    <<
      \new Voice \allLayout
      \addlyrics { \lrcfont \allLrc }
    >>

  }

  \layout { }

}

\score {
  \new Staff {
    \speed
    \allMIDI
  }
  \midi { }
}
