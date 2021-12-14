% ISBN 7-80171-812-7
% 9-787801-718129
% echo -e "\xe5\x85\xa8\xe5\x9c\x8b\xe9\x9b\xbb\xe5\xad\x90\xe7\x90\xb4\xe6\xbc\x94\xe5\xa5\x8f\xe8\x80\x83\xe7\xb4\x9a\xe4\xbd\x9c\xe5\x93\x81\xe9\x9b\x86\x28\xe7\xac\xac\xe5\x9b\x9b\xe5\xa5\x97\x29\xe7\xac\xac\xe5\x9b\x9b\xe7\xb4\x9a\x2d\xe7\xac\xac\xe5\x85\xad\xe7\xb4\x9a"

\version "2.22.1"

% http://lilypond.org/doc/v2.22/Documentation/notation/displaying-pitches#key-signature
% \key c \harmonicMinor
% c d ees f g aes b 
harmonicMinor = #`(
  (6 . ,NATURAL)
  (5 . ,FLAT)
  (4 . ,NATURAL)
  (3 . ,NATURAL)
  (2 . ,FLAT)
  (1 . ,NATURAL)
  (0 . ,NATURAL)
)

segA_Treble = \relative c'' {
    % http://lilypond.org/doc/stable/Documentation/music-glossary/anacrusis
    % Double-dotted notes - x*(1+0.5+0.25)
    % http://lilypond.org/doc/v2.22/Documentation/notation/writing-rhythms#durations
             c16(b c4
    ees16d  | c16b c4
    ees16c  | d16c d4
    ees16f  | ees8 d16ees c16.)    \breathe r32
    ees16(f | g8   d8..)           \breathe r32
    d16(ees | f8   c8..)           \breathe r32
    c16(d   | ees8 f16 ees d c b
  }

segA_Bass = \fixed c {
           bes4 | aes ees | f g | c4.
  c'8 | b4 bes  | a   aes |
}

\score{

  {

    \time 2/4
    \tempo "Andante" 4 = 70

    { % Part 1/3

      % http://lilypond.org/doc/v2.22/Documentation/learning/pitches-and-key-signatures#key-signatures
      % http://lilypond.org/doc/v2.22/Documentation/learning/advanced-rhythmic-commands#partial-measure
      % \key c \minor
      % \key c \aeolian
      \key c \harmonicMinor

      \partial 8 {\fixed c' g8}

      << \relative c'' {
        \segA_Treble c16 | b4.)                    g8 |
      } \\ \fixed c {
        c'4  \segA_Bass | g4 f8 aes8 | r8 g16 aes g f ees d | 
      } >>

      << \relative c'' {
        \relative c'' \key ees \major
        \segA_Treble c16 | b4.) \key ees \ionian bes8 |
      } \\ \fixed c {
        c8 c' \segA_Bass | g4 f8aes | r8 g16aes16 g8 f8 |
      } >>

    }

    \relative c'' { % Part 2/3 

      \repeat unfold 2 {

                ees16(d ees4  
        g16f   | ees16d ees4  
        g16ees | f16ees f4
        g16aes |

      } \alternative {

        {

          % http://lilypond.org/doc/stable/Documentation/learning/ties-and-slurs.en.html

             g8 f16g ees16.)   \breathe r32
          8~(|8 d16c   d16.)   \breathe r32
          8~(|8 c16b   c16.)   \breathe r32
          c8(|bes c16 bes aes g f ees | d4.)

          bes'8 |

        }
        {

                    aes'8 g8..)   \breathe r32
          g16(aes | bes8  f8..)   \breathe r32
          f16(g   | aes8  ees8..) \breathe r32
          ees16(f | g8 aes16 g \key c \harmonicMinor f ees d c | b4.) g8 |

        }

      }

    }

    % \relative c'' { % Part 3/3
    %   \segA_Treble d16 | \partial 8 {c4.)}
    % }

    % http://lilypond.org/doc/v2.22/Documentation/notation/bars
    \bar "|."

    r1
    r1
    r1
    r1

  }

  % \layout{}
  \midi{}

}
