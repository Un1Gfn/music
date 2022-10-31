\version "2.22.1"

\include "meta.ly"

\include "accompanimentfunc.ly"
\include "lower.ly"

\include "upper.ly"

\book{

  % http://lilypond.org/doc/v2.22/Documentation/notation/creating-titles-headers-and-footers
  \header { tagline = ##f }

  \score {
    % https://lilypond.org/doc/v2.22/Documentation/learning/staff-groups
    % https://lilypond.org/doc/v2.22/Documentation/learning/solo-piano
    \new PianoStaff \with { instrumentName = "Piano" } <<
      %{ LB.U %} { \new Staff = "upper" \upper }
      %{ LB.L %} { \new Staff = "lower" \lower }
    >>
    \layout {}
    \midi {}
  }

}
