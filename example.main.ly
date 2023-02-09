\version "2.24.0"

meta = {
  \tempo "?" 4 = 92
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#t #t #t)
  \key c \major
}

\include "upper.ly"
\include "accompanimentfunc.ly"
\include "lower.ly"
\include "percussion.ly"

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
    \new DrumStaff = "percussion" \percussion 
  >>
  \layout { }
  \midi { }
}
