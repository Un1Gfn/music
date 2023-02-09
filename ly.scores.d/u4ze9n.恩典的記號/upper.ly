upper = \transpose c d \relative d' {

  \set Staff.midiInstrument = "marimba"

  \meta
  \clef "treble"

  | r2 r4. g16g |

  \unfoldRepeats
  \repeat volta 2 \relative d'' {

    | d8e e8r d16.e16.d16 e16.d16.c16 | d8c a4 r4.

    g16g | d'8e e8r d16.e16.d16 e16.d16.c16 | d2 r4

    e16.d16.c16 |

    \alternative {

      \volta 1 \relative d'' {

        | d8c a4.r8 c8d | e8g d8e c4 r8.

        a16 | e'8 d4 r16a e'8d d16.d16.c16 | d2 r4.

        g,16g |

      }

      \volta 2 \relative d'' {

        | d8 a4. r4

        c8d | e8g d8e c4 r8.

        a16 | e'8 d4 r16g, e'8d c16d8c16 | c2 r8.

        c16 e8g |

      }

    }

  }

  \repeat unfold 2 \relative d''' {

    | a4. r8

    g16a16a16g16 a8.c,16 | g'8. e16 e4 r8.

    % AlternativeBlock.Within
    \alternative {
      \volta 1 {
        c16 e8g | a4. r8
      }
      \volta 2 {
        g16 c8b | a4. r8
      }
    }

    g16(a16a16g16) a8.c,16 | e8.d16 d4 r4

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
