\version "2.24.0"

% https://lilypond.org/doc/v2.22/Documentation/learning/staff-groups
% https://lilypond.org/doc/v2.22/Documentation/learning/solo-piano

meta = {

  % https://en.wikipedia.org/wiki/Tempo#Basic_tempo_markings
  \tempo "Allegro" 4 = 144

  % \numericTimeSignature
  \time 3/4

  % https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers

  \key g \major

}

\include "upper.ly"
\include "lower.ly"
\include "percussion.ly"

% https://lilypond.org/doc/v2.24/Documentation/notation/setting-the-staff-size
#(set-global-staff-size 26)

% https://lilypond.org/doc/v2.24/Documentation/notation/paper-size-and-automatic-scaling
% #(set-default-paper-size "a4" 'landscape)
#(set-default-paper-size "a4landscape" )

\score {

  \new PianoStaff \with { instrumentName = "Piano" } <<
    \include "CTRL"
    \new DrumStaff = "percussion" \percussion
  >>

  \layout {

    % \override Score.BarNumber.break-visibility = ##(#t #t #t)

    % https://lilypond.org/doc/v2.24/Documentation/notation/setting-the-staff-size
    % too tight
    % #(layout-set-staff-size 26)

  }

  \midi { }

}
