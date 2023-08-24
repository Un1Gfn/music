% Plants vs Zombies Soundtrack. [Roof Stage]
% https://www.youtube.com/watch?v=GX_RRosndQk

\version "2.22.1"

% https://lilypond.org/doc/stable/Documentation/extending/simple-substitution-functions
% https://lilypond.org/doc/stable/Documentation/notation/using-music-functions
% https://lilypond.org/doc/stable/Documentation/notation/substitution-function-syntax
% https://lilypond.org/doc/stable/Documentation/notation/substitution-function-examples
segmentA = {

  <<

    % https://lilypond.org/doc/stable/Documentation/notation/using-midi-instruments
    % https://lilypond.org/doc/stable/Documentation/notation/midi-instruments
    \new Staff \with {midiInstrument = "shamisen"} {

      \clef "bass"
      % http://lilypond.org/doc/v2.22/Documentation/learning/articulations-and-dynamics#articulations
      \repeat unfold 2 { a,8 e16e a8 e r e-. r e-. }
      \repeat unfold 2 {
        a,8 e16e a8 e r e-. r e-.
        c8  d16d g8 e r e-. r e-.
        d8 a16a c'8 a r a-. r a-.
      } \alternative {
        { <f,g,>8 c16c f8 f <g,a,>8 d16d g8 g }
        { f,8 c16c f8f g,8 d16d g8g }
      }

    % http://lilypond.org/doc/stable/Documentation/notation/multiple-voices#-The-double-backslash-construct
    % http://lilypond.org/doc/stable/Documentation/notation/writing-pitches
    } \\ \fixed c'' {

      \clef "treble"
      r1 r2. dis8^2 e^3
      % http://lilypond.org/doc/v2.22/Documentation/learning/articulations-and-dynamics#fingerings
      \repeat unfold 2 {
          a8^5 r dis e
          a,8 r dis e
          g8 d e g e4 g8e
          %
          d8 e d^2 c^1 a,^2 r g,^1 a,^2
      } \alternative { % Alternate endings
        { c8^3 d e d c^3 r dis^2 e^3 }
        { c8 d e d c r d a, }
      }

      % 00:20

    }

  >>

}

arpeggioZero =
#(define-music-function
    (x y z)
    (ly:pitch? ly:pitch? ly:pitch?)
  #{
    % $x 16 r8 $y 16 r8 $z 16 r16
      $x 8 -. r16
      $y 8 -. r16
      $z 8 -.
  #})

segmentB = {
  <<

    \new Staff \with {midiInstrument = "shamisen"} {

      \clef "bass"

      % 00:55

      % Written-out (unfold) repeat
      % https://lilypond.org/doc/v2.20/Documentation/notation/long-repeats#written_002dout-repeats
      \repeat unfold 2 { a,8 e16e a8e r8e r8e }

      \repeat unfold 2 {

        \arpeggioZero f, c f
        \arpeggioZero f, c f

        \arpeggioZero e, b, e
        \arpeggioZero e, b, e

        % 01:00

        \arpeggioZero d, f, a,
        \arpeggioZero e, gis, b,

        \arpeggioZero a, b, g,
        \arpeggioZero c cis a,

      }

      \arpeggioZero f, a, c
      \arpeggioZero d, d, d,

      r1
      r1

      % 01:23

    } \\ \relative {

      \clef "treble"

      % 00:55

      r1 r2. a''8b

      c8^. r16 b8^. r16 a8^. r16
      b8^. r16 c8a
      b2 g4 e

      % 01:00

      \repeat unfold 2 {
        dis8 e f dis e \tuplet 3/2 { dis16 e d } c8 b
        c8^. r d^. r e^. r a^. r
      } \alternative {
        { a2 g4 f e2 b4 e }
        { f8 \tuplet 3/2 { e16 f e } d8 c b a g f e8r e8r e8r e8r }
      }

      % 01:23
      %{r2 r8 e, fis gis
      a4.b8 c4 b4
      a4.b8 c4 b4
      a4.b8 dis4 b4
      e2%}
    }

  >>

}

\score {

  {

    % http://lilypond.org/doc/stable/Documentation/learning/simple-notation#time-signature
    \time 4/4

    % https://en.wikipedia.org/wiki/Tempo
    \tempo Moderato 4 = 120

    \segmentA

    % 00:55

    \segmentB

    % {
    %   r8 a,16e, g,8a,
    %   r8 a,16e, g,8a,
    %   r8 a,16e, g,8a,
    %   r8 a,16e, a8b
    % }

  }

  \layout{}

  \midi{}

}
