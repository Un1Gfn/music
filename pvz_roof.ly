\version "2.22.1"

\score {

  {

    \time 4/4

    % https://en.wikipedia.org/wiki/Tempo
    \tempo Moderato 4 = 120

    % {
    %   r8 a,16e, g,8a,
    %   r8 a,16e, g,8a,
    %   r8 a,16e, g,8a,
    %   r8 a,16e, a8b
    % }

    <<

      % https://lilypond.org/doc/stable/Documentation/notation/using-midi-instruments
      % https://lilypond.org/doc/stable/Documentation/notation/midi-instruments
      \new Staff \with {midiInstrument = "shamisen"} {

        a,8 e16e a8e r8e r8e a,8 e16e a8e r8e r8e

        a,8 e16e a8e r8e r8e
        c8  d16d g8e r8e r8e

        d8a16a c'8a r8a r8a
        <f,g,>8 e16e a8e
        <g,a,>8 e16e a8e

        a,8 e16e a8e r8e r8e
        c8  d16d g8e r8e r8e

        d8a16a c'8a r8a r8a
        <f,g,>8 e16e a8e
        <g,a,>8 e16e a8e

        % 00:20

        a,8 e16e a8e r8e r8e
        c8  d16d g8e r8e r8e

        d8a16a c'8a r8a r8a
        f,8 e16e a8e
        g,8 e16e a8e

        a,8 e16e a8e r8e r8e
        c8  d16d g8e r8e r8e

        d8a16a c'8a r8a r8a
        f,8 e16e a8e
        g,8 e16e a8e

      % http://lilypond.org/doc/stable/Documentation/notation/multiple-voices#-The-double-backslash-construct
      % http://lilypond.org/doc/stable/Documentation/notation/writing-pitches
      } \\ \fixed c' {

        r1 r2. dis8e

        a8 r dis e
        a,8 r dis e
        g8 d e g e4 g8e

        d8 e d c a, r g, a,
        c8 d e d c8r8 dis8e

        a8 r dis e
        a,8 r dis e
        g8 d e g e4 g8e

        d e d c a, r g, a,
        c8 d e d c8r8 d8a,

        % 00:20

      }

    >>

    % 00:55
    {
      
    }

  }

  \layout{}

  \midi{}

}
