\version "2.24.0"

meta = {

  \tempo "?" 4 = 130
  % \tempo "?" 4 = 202

  \time 4/4

  \override Score.BarNumber.break-visibility = ##(#t #t #t)

  \key g \major

}

\include "upper.ly"
% \include "lower.ly"
\include "percussion.ly"

\score {
  
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    % \new Staff = "lower" \lower
    \new DrumStaff = "percussion" \percussion 
  >>
  % \layout { }
  \midi { }
}
