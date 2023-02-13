\version "2.24.0"

\include "../../ly.preamble.ly"

speed = { \tempo \markup \italic "audio in D, sheet in C" 4 = 200 }

prelude = {

}

main = {

}

lrc = lyricmode {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
  % ...
}

\score {

  \relative c'' {

    \speed
    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4

    \prelude
    <<
      \main \addlyrics \lrc
    >>

  }

  \layout {
    % \set Timing.measureBarType = #""
  }

}

\score {
  \transpose c d'' \relative \unfoldRepeats { \speed \prelude \main }
  \midi { }
}
