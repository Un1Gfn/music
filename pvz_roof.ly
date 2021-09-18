% Plants vs Zombies Soundtrack. [Roof Stage]
% https://www.youtube.com/watch?v=GX_RRosndQk

\version "2.22.1"

segmentZero = {
    a8 r dis e
    a,8 r dis e
    g8 d e g e4 g8e
}

% https://lilypond.org/doc/stable/Documentation/extending/simple-substitution-functions
% https://lilypond.org/doc/stable/Documentation/notation/using-music-functions
% https://lilypond.org/doc/stable/Documentation/notation/substitution-function-syntax
% https://lilypond.org/doc/stable/Documentation/notation/substitution-function-examples
segmentA = {

  <<

    % https://lilypond.org/doc/stable/Documentation/notation/using-midi-instruments
    % https://lilypond.org/doc/stable/Documentation/notation/midi-instruments
    \new Staff \with {midiInstrument = "shamisen"} {

      \repeat unfold 2 { a,8 e16e a8e r8e r8e }

      \repeat unfold 2 {

        a,8 e16e a8e r8e r8e
        c8  d16d g8e r8e r8e

        d8a16a c'8a r8a r8a
        <f,g,>8 e16e a8e
        <g,a,>8 e16e a8e

      }

      % 00:20

      \repeat unfold 2 {

        a,8 e16e a8e r8e r8e
        c8  d16d g8e r8e r8e

        d8a16a c'8a r8a r8a
        f,8 e16e a8e
        g,8 e16e a8e

      }

    % http://lilypond.org/doc/stable/Documentation/notation/multiple-voices#-The-double-backslash-construct
    % http://lilypond.org/doc/stable/Documentation/notation/writing-pitches
    } \\ \fixed c' {

      r1 r2. dis8e

      \segmentZero

      d8 e d c a, r g, a,
      c8 d e d c8r8 dis8e

      \segmentZero

      d e d c a, r g, a,
      c8 d e d c8r8 d8a,

      % 00:20

    }

  >>

}

arpeggioZero =
#(define-music-function
    (x y z)
    (ly:pitch? ly:pitch? ly:pitch?)
  #{
    $x 16 r8 $y 16 r8 $z 16 r16
  #})

segmentB = {
  <<

    \new Staff \with {midiInstrument = "shamisen"} {

      % Written-out (unfold) repeat
      % https://lilypond.org/doc/v2.20/Documentation/notation/long-repeats#written_002dout-repeats
      \repeat unfold 2 {

        \repeat unfold 2 \arpeggioZero f, c f

        \repeat unfold 2 \arpeggioZero e, b, e

        \arpeggioZero d, f, a,
        \arpeggioZero e, gis, b,

        \arpeggioZero a, b, g,
        \arpeggioZero c cis a,

      }

      \arpeggioZero f, a, c
      \arpeggioZero d, d, d,

      % 01:15

    } \\ \fixed c' {

    }

  >>

}

\score {

  {

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
