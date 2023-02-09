\version "2.24.0"

meta = {

  \tempo "Larghetto" 4 = 64

  \time 4/4

  \override Score.BarNumber.break-visibility = ##(#t #t #t)

}

\include "upper.ly"

% \include "accompanimentfunc.ly"
% \include "lower.ly"

\include "percussion.ly"

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    % \new Staff = "lower" \lower
    \new Staff = "upper" \upper
    \new DrumStaff = "percussion" \percussion 
  >>
  % \layout { }
  \midi { }
}
