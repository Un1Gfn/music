\version "2.24.0"

#(set-global-staff-size 26)

meta = {
  \tempo 4 = 152
  \time 4/4
  \key g \major
}

\include "upper.ly"

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
  >>
  \layout { }
  \midi { }
}
