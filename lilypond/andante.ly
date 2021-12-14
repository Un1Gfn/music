% ISBN 7-80171-812-7
% 9-787801-718129
% echo -e "\xe5\x85\xa8\xe5\x9c\x8b\xe9\x9b\xbb\xe5\xad\x90\xe7\x90\xb4\xe6\xbc\x94\xe5\xa5\x8f\xe8\x80\x83\xe7\xb4\x9a\xe4\xbd\x9c\xe5\x93\x81\xe9\x9b\x86\x28\xe7\xac\xac\xe5\x9b\x9b\xe5\xa5\x97\x29\xe7\xac\xac\xe5\x9b\x9b\xe7\xb4\x9a\x2d\xe7\xac\xac\xe5\x85\xad\xe7\xb4\x9a"

\version "2.22.1"

% http://lilypond.org/doc/v2.22/Documentation/notation/displaying-pitches#key-signature
% \key c \harmonicMinor
% ees aes (bes)
harmonicMinor = #`(
  (6 . ,NATURAL)
  (5 . ,FLAT)
  (4 . ,NATURAL)
  (3 . ,NATURAL)
  (2 . ,FLAT)
  (1 . ,NATURAL)
  (0 . ,NATURAL)
)

% C - harmonic minor - melody
Cm_M = \relative c'' {
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

% C - harmonic minor - accompaniment
Cm_Acc = \fixed c {
           bes4 | aes ees | f g | c4.
  c'8 | b4 bes  | a   aes |
}

% B-flat - major - melody
EES_M = \relative c'' {
         | ees16(d ees4  
  g16f   | ees16d  ees4  
  g16ees | f16ees  f4
  g16aes |
}

% B-flat - major - accompaniment
EES_Acc = \relative c {
  %{ees8ees'%} ees16.r32ees'8 d4 | c g | aes bes |
}

% \relative melody
switchingM = %{ no \relative or \fixed allowed here! %} {
  g16(aes | bes8  f8..)   \breathe r32
  f16(g   | aes8  ees8..) \breathe r32
  ees16(f | g8 
}

% \relative accompaniment
switchingAcc = %{ no \relative or \fixed allowed here! %} {
  ees8~(|8 d16c  d16.) \breathe r32
    d8~(|8 c16b  c16.) \breathe r32
     c8(|
}

\score{ \fixed c' {

  \time 2/4
  \tempo "Andante" 4 = 70

  % << \clef treble \\ \clef bass >>

   { %{ part 1/6 %}

    % http://lilypond.org/doc/v2.22/Documentation/learning/pitches-and-key-signatures#key-signatures
    % http://lilypond.org/doc/v2.22/Documentation/learning/advanced-rhythmic-commands#partial-measure
    % \key c \minor
    % \key c \aeolian
    % \key c \harmonicMinor
    \key c \harmonicMinor

    \partial 8 {
      << {
        \clef treble
        g8
      } \new Staff = "x" {
        \clef bass
        r8
      } >>
    }

    << \relative c'' {
      \Cm_M c16 | b4.) g8 |
    } \\ \change Staff = "x" \fixed c {
      c'4  \Cm_Acc | g4 f8 aes8 | r8 g16 aes g f ees d | 
    } >>

    << \relative c'' {
      \relative c''
      \Cm_M c16 | b4.)
    } \\ \change Staff = "x" \fixed c {
      % \clef bass
      % c8c'8
      c16.r32c'8
      % c16.. r64c'8
      % c16r8c'16
      \Cm_Acc | g4 f8aes | r8 g16aes16 g8
    } >>

  }

  %{ part 2/6 %}
  \key ees \ionian
  << { bes8 | \EES_M | }
  \\ \change Staff = "x" { f,8  | \EES_Acc | } >>

  { %{ part 3/6 %}
    << \relative c''' {
      % http://lilypond.org/doc/stable/Documentation/learning/ties-and-slurs.en.html
      g8 f16g ees16.) \breathe r32
      \switchingAcc | bes8 c16 bes aes g f ees | d4.)
    } \\ \change Staff = "x" { ees,4. \relative c'' {
      \clef treble  \switchingM) ees8 c aes |
      \clef bass r8 bes16 c bes aes
    }} >>
  }

  %{ part 4/6 %}
  << { bes8   | \EES_M | aes'8 g'8..) \breathe r32 }
  \\ \change Staff = "x" { g,16f, | \EES_Acc | ees8 bes, ees, } >>

  { %{ part 5/6 %}
    << \relative c''' {
      \switchingM aes16 g f ees d c | b4.)
    } \\ \change Staff = "x" \relative c' {
      \switchingAcc | b8 c) aes f | r8 g16 aes g f
    } >>
  }

  %{ part 6/6 %}
  { 
    \key c \harmonicMinor
    << \relative c'' {
          g8 | \Cm_M d'16 | \partial 4. {c4.)}
    } \\ \change Staff = "x" \fixed c {
      ees16d | c16.r32c'8 \Cm_Acc g8 aes f g | \partial 4. { c'8 g c }
    } >>
  }

  % http://lilypond.org/doc/v2.22/Documentation/notation/bars
  \bar "|."

  r1
  r1

} \layout{} \midi{} }
