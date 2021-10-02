% ISBN 7-80171-812-7
% 9-787801-718129
% echo -e "\xe5\x85\xa8\xe5\x9c\x8b\xe9\x9b\xbb\xe5\xad\x90\xe7\x90\xb4\xe6\xbc\x94\xe5\xa5\x8f\xe8\x80\x83\xe7\xb4\x9a\xe4\xbd\x9c\xe5\x93\x81\xe9\x9b\x86\x28\xe7\xac\xac\xe5\x9b\x9b\xe5\xa5\x97\x29\xe7\xac\xac\xe5\x9b\x9b\xe7\xb4\x9a\x2d\xe7\xac\xac\xe5\x85\xad\xe7\xb4\x9a"

\version "2.22.1"

% http://lilypond.org/doc/v2.22/Documentation/notation/displaying-pitches#key-signature
harmonicMinor = #`(
  (6 . ,NATURAL)
  (5 . ,FLAT)
  (4 . ,NATURAL)
  (3 . ,NATURAL)
  (2 . ,FLAT)
  (1 . ,NATURAL)
  (0 . ,NATURAL)
)

segmentMain = {
  % http://lilypond.org/doc/stable/Documentation/music-glossary/anacrusis
  c16(b c4 ees16 d |
  c16 b c4 ees16 c |
  d16 c d4 ees16 f |
  % Double-dotted notes - x*(1+0.5+0.25)
  % http://lilypond.org/doc/v2.22/Documentation/notation/writing-rhythms#durations
  ees8 d16 ees c16.) \breathe r32 ees16( f |
  g8 d8..) \breathe r32 d16(ees |
  f8 c8..) \breathe r32 c16(d   |
}

\score{

  {

    \time 2/4
    \tempo "Andante" 4 = 70

    \relative c'' { % Part A
      % http://lilypond.org/doc/v2.22/Documentation/learning/pitches-and-key-signatures#key-signatures
      % \key c \minor
      % \key c \aeolian
      \key c \harmonicMinor
      % http://lilypond.org/doc/v2.22/Documentation/learning/advanced-rhythmic-commands#partial-measure
      \partial 8 { g8 }
      \segmentMain                 |
      ees8 f16 ees d c b c b4.) g8 |
      \segmentMain                 |
      ees8 f16 ees d c b c b4.) \key ees \ionian bes8 | % \key ees \major
    }

    \relative c'' { % Part B

      \repeat unfold 2 {

        ees16(d ees4  g16f   |
        ees16d  ees4  g16ees |
        f16ees  f4    g16aes |

      } \alternative { {

        g8  f16g ees16.) \breathe r32 8~( | % http://lilypond.org/doc/stable/Documentation/learning/ties-and-slurs.en.html
        8   d16c d16.)   \breathe r32 8~( |
        8   c16b c16.)   \breathe r32 8(  |

        bes c16 bes aes g f ees |
        d4.) bes'8 |

      } {

        aes'8 g8..)   \breathe r32 g16(aes |
        bes8  f8..)   \breathe r32 f16(g   |
        aes8  ees8..) \breathe r32 ees16(f |
        g8 aes16 g \key c \harmonicMinor f ees d c |
        b4.) g8 |

      } }

    }

    \relative c'' {
      \segmentMain |
      ees8 f16 ees d c b d |
      \partial 8 { c4.) }
    }

    % http://lilypond.org/doc/v2.22/Documentation/notation/bars
    \bar "|."

  }

  \layout{}
  \midi{}
}
