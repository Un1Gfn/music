\version "2.24.0"

\include "upper.ly"
% \include "lower.ly"
% \include "percussion.ly"

meta = {

  \tempo "?" 4 = 70

  \time 4/4

  \override Score.BarNumber.break-visibility = ##(#t #t #t)

  \key g \major

}

\score {
  
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    % \new Staff = "lower" \lower
    % \new DrumStaff = "percussion" \percussion 
  >>
  % \layout { }
  \midi { }
}
