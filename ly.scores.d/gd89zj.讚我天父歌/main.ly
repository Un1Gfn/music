\version "2.24.0"

meta = {

  \tempo "Allegro" 4 = 144

  \time 3/4

  \key g \major

}

\include "upper.ly"
\include "lower.ly"
\include "percussion.ly"

#(set-global-staff-size 26)

#(set-default-paper-size "a4landscape" )

\score {

  \new PianoStaff \with { instrumentName = "Piano" } <<
    \include "CTRL"
    \new DrumStaff = "percussion" \percussion
  >>

  \layout { }

  \midi { }

}
