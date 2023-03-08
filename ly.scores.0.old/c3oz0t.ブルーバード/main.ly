\version "2.24.0"

\include "predefined-guitar-fretboards.ly"

\include "../../ly.preamble.ly"
\include "chords.ly"
\include "melody.ly"
\include "lrc.ly"

speed = { \tempo 4 = 150 }

\paper {
  print-page-number = ##f
  print-first-page-number = ##f
}

\score {
  {
    \new StaffGroup <<
      \new ChordNames { \speed \Chords }
      \new FretBoards { \speed \Chords }
      \new PianoStaff { \clef treble \speed \Chords \fine }
      \new Voice \relative a' { \speed \melody \fine } \addlyrics \lrc
    >>
  }
  \layout {
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}

\pageBreak

\score {
  {
    \new StaffGroup <<
      \new ChordNames { \speed \Chords }
      \new FretBoards { \speed \Chords }
      \new PianoStaff { \clef treble \key fis \minor \speed \Chords \fine }
      \new Voice \transpose a fis' \relative { \speed \melody \fine } \addlyrics \lrc
    >>
  }
  \layout {
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
