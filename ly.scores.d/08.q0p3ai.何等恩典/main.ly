\version "2.24.0"

\include "upper.ly"
% \include "lower.ly"
% \include "percussion.ly"

meta = {

  % https://en.wikipedia.org/wiki/Tempo#Basic_tempo_markings
  \tempo "?" 4 = 70

  % \numericTimeSignature
  \time 4/4

  % https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers
  \override Score.BarNumber.break-visibility = ##(#t #t #t)

  \key g \major

}

\score {
  
  % https://lilypond.org/doc/v2.22/Documentation/learning/staff-groups
  % https://lilypond.org/doc/v2.22/Documentation/learning/solo-piano
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    % \new Staff = "lower" \lower
    % \new DrumStaff = "percussion" \percussion 
  >>
  % \layout { }
  \midi { }
}
