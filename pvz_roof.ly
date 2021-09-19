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

      \repeat unfold 2 { a,8 e16e a8 e r e r e }

      \repeat unfold 2 {

        a,8 e16e a8 e r e r e
        c8  d16d g8 e r e r e

        d8 a16a c'8 a r a r a
        <f,g,>8 e16e a8 e
        <g,a,>8 e16e a8 e

      }

      % 00:20

      \repeat unfold 2 {

        a,8 e16e a8e r8e r8e
        c8  d16d g8e r8e r8e

        d8a16a c'8a r8a r8a
        f,8 c16c f8f
        g,8 d16d g8g

      }

    % http://lilypond.org/doc/stable/Documentation/notation/multiple-voices#-The-double-backslash-construct
    % http://lilypond.org/doc/stable/Documentation/notation/writing-pitches
    } \\ \fixed c' {

      r1 r2. dis8e

      \repeat unfold 2 {
          a8 r dis e
          a,8 r dis e
          g8 d e g e4 g8e
          %
          d8 e d c a, r g, a,
      } \alternative { % Alternate endings
        { c8 d e d c8r8 dis8e }
        { c8 d e d c8r8 d8a, }
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
    $x 16 r8 $y 16 r8 $z 16 r16
  #})

segmentB = {
  <<

    \new Staff \with {midiInstrument = "shamisen"} {

      % % 00:55

      % % Written-out (unfold) repeat
      % % https://lilypond.org/doc/v2.20/Documentation/notation/long-repeats#written_002dout-repeats
      % \repeat unfold 2 { a,8 e16e a8e r8e r8e }

      % \repeat unfold 2 {

      %   \arpeggioZero f, c f
      %   \arpeggioZero f, c f

      %   \arpeggioZero e, b, e
      %   \arpeggioZero e, b, e

      %   % 01:00

      %   \arpeggioZero d, f, a,
      %   \arpeggioZero e, gis, b,

      %   \arpeggioZero a, b, g,
      %   \arpeggioZero c cis a,

      % }

      % \arpeggioZero f, a, c
      % \arpeggioZero d, d, d,

      % r1
      % r1

      % 01:23

    } \\ \relative {

      % % 00:55

      % r1
      
      % r2. a''8b c16 r r b r r a r

      % r b r r c r a r b2 g4 e

      % % 01:00

      % \repeat unfold 2 {
      %   dis8 e f dis e \tuplet 3/2 { dis16 e d } c8 b
      %   c8 r d r e r a r
      % } \alternative {
      %   { a2 g4 f e2 b4 e }
      %   { f8 \tuplet 3/2 { e16 f e } d8 c b a g f e8r e8r e8r e8r }
      % }

      % % 01:23

      r2 r8 e, fis gis
      a4.b8 c4 b4
      a4.b8 c4 b4
      a4.b8 dis4 b4
      e2

    }

  >>

}

\score {

  {

    \time 4/4

    % https://en.wikipedia.org/wiki/Tempo
    \tempo Moderato 4 = 120

    % \segmentA

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
