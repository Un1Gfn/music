% upper.ly
% melody (main theme)

upper = \transpose c d \relative d {

  \meta
  \clef "treble"

  % \relative
  % \fixed

  % \repeat unfold _ r1


  % https://lilypond.org/doc/v2.24/Documentation/learning/advanced-rhythmic-commands#partial-measure
  % https://lilypond.org/doc/v2.24/Documentation/music-glossary/anacrusis
  \partial 8 g16g | 

  % https://lilypond.org/doc/v2.24/Documentation/notation/long-repeats#written_002dout-repeats
  % https://lilypond.org/doc/v2.24/Documentation/notation/using-repeats-with-midi
  \unfoldRepeats

  \repeat volta 2 \relative d' {

    | d8e e8r d16.e16.d16 e16.d16.c16 | d8c a4 r4.

    g16g | d'8e e8r d16.e16.d16 e16.d16.c16 | d2 r4

    e16.d16.c16 |

    \alternative {

      \volta 1 \relative d' {

        | d8c a4.r8 c8d | e8g d8e c4 r8.

        a16 | e'8 d4 r16a e'8d d16.d16.c16 | d2 r4.

        g,16g |

      }

      \volta 2 \relative d' {

        | d8 a4. r4

        c8d | e8g d8e c4 r8.

        a16 | e'8 d4 r16g, e'8d c16d8c16 | c2 r8.

        c16 e8g |

      }

    }

  }

  % \resetRelativeOctave d''

  % https://lilypond.org/doc/v2.23/Documentation/notation/long-repeats#other-variation-in-repeated-sections
  % \repeat volta 2 \relative d'' {
  % AlternativeBlock.Ending ok
  % AlternativeBlock.Within conflict

  \repeat unfold 2 \relative d'' {

    | a4. r8

    g16a16a16g a8.c,16 | g'8. e16 e4 r8.

    % AlternativeBlock.Within
    \alternative {
      \volta 1 {
        c16 e8g | a4. r8
      }
      \volta 2 {
        g16 c8b | a4. r8
      }
    }

    g16a16a16g a8.c,16 | e8.d16 d4 r4

    e8g | a4 a4.r8

    c8a | g4 a8g e4 r8.

    c16 |

    % AlternativeBlock.Ending
    \alternative {

      \volta 1 {

        | e8 d16d8. r16

        d e8d d16a'8g16 | g2 r8.

        c,16 e8g |

      }

      \volta 2 {

        | e8 d16d8. r16

        a e'8d c16d8c16 | c4

      }

    }

  }

}
