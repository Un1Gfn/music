\version "2.24.0"

\include "predefined-guitar-fretboards.ly"

\include "../../ly.preamble.ly"
\include "chords.ly"
\include "melody.ly"
\include "lrc.ly"

speed = { \tempo 4 = 150 }

\score {
  {
    \new StaffGroup <<
      \new ChordNames { \speed \Chords }
      \new FretBoards { \speed \Chords }
      \new PianoStaff { \clef treble \speed \Chords }
      \new Voice \relative a' { \speed \melody } \addlyrics \lrc
      % \new Voice \relative a' \melody
      % \new TabStaff \Chords
    >>
  }
  \layout {
    % \set Timing.measureBarType = #""
    % \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}

\score {
  {
    \new StaffGroup <<
      \new Voice \transpose a fis' \relative { \speed \melody }
      \new PianoStaff \fixed c, { \speed \Chords }
    >>
  }
  \midi { }
}
