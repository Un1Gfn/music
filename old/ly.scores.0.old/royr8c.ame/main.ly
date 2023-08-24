\version "2.22.1"

meta = {
  \tempo "Vivace" 4 = 170
  \key c \major
  \time 4/4
}

\include "accompanimentfunc.ly"
\include "lower.ly"

\include "upper.ly"

\book{

  \header { tagline = ##f }

  \score {

    \new PianoStaff \with { instrumentName = "Piano" } <<
      %{ LB.U %} { \new Staff = "upper" \upper }
      %{ LB.L %} { \new Staff = "lower" \lower }
    >>

    \layout {
      % \override Score.BarNumber.break-visibility = ##(#t #t #t)
    }

    \midi {}

  }

}
