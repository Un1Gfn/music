\version "2.24.0"

meta = {

  \tempo "Larghetto" 4 = 63
  \key d \major

  \time 4/4

  \override Score.BarNumber.break-visibility = ##(#t #t #t)

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
