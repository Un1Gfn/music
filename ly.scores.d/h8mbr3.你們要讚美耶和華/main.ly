\version "2.24.0"

meta = {

  \tempo "Allegro" 4 = 140

  \time 4/4

  \override Score.BarNumber.break-visibility = ##(#t #t #t)

  \key f \major

}

\include "upper.ly"

\include "accompanimentfunc.ly"
\include "lower.ly"

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}
