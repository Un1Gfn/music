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

upper = \new Staff = "upper" {
  
}

lower = \new Staff = "lower" {
  
}

percussion = \new Staff = "percussion" {
  
}

% https://lilypond.org/doc/v2.24/Documentation/learning/organizing-pieces-with-variables
\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \upper
    \lower
    \percussion
  >>
  \layout { }
  \midi { }
}
