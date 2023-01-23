\version "2.24.0"

% https://lilypond.org/doc/v2.22/Documentation/learning/staff-groups
% https://lilypond.org/doc/v2.22/Documentation/learning/solo-piano

\include "meta.ly"

\include "upper.ly"

% \include "accompanimentfunc.ly"
% \include "lower.ly"

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    % \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}
