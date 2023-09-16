\version "2.24.2"

% https://static1.squarespace.com/static/5716a5ea7da24f462d7beeca/t/5e8cc3aa38e3a94d069854f7/1586283435215/354_in_christ_alone_hymnal.pdf

% Lyrics Video
% https://youtu.be/16KYvfIc2bE

%{

  E . #### . 00:00~02:20
  F . b    . 02:20~02:55
  G . #    . 02:55~04:07
  https://youtu.be/cjzMGjzCe6Y

  E major key signature is C# D# F# G#

  PartOne   = BOF                          ~~~ 10/4811L-3 "storm <REST>"
  PartTwo   = 10/4811L-3 "What heights of" ~~~ 10/4811L-6 <bar_40>
  IGNORED   = 10/4811L-6 <bar_41>          ~~~ 10/4811L-7 <bar_48>
  PartThree = 10/4811L-7 <bar_49>          ~~~ 10/4811L-8 <bar_57>
  PartFour  = 10/4811L-8 <bar_58>          ~~~ EOF

%}

global = {
  \time 3/4
  \tempo 4 = 80
  \key e \major
}

ready = {
  % \repeat unfold 3 { | <. . .>4 . . . | }
}

kcsiqr = {

  cis8 e | e4.

  b8 cis e | fis2

  gis8 fis16 e | cis8 gis' fis4. e8 |

}

xldoqm = {

  e8 gis8 b | cis4.

  cis8 b gis16 fis16 | fis4 r8

  e8 e' dis | cis4.

  cis8 b     gis8    | fis4

}

fdgwhm = {

  e8 8 | 4.

  e8 8 8 | dis4 r8

  e8 8 8 | 4.

  e8 8 8 | dis4 r8

}

ukxeux = {

  %{ d8 %} c c | b4.

  b8 c c | d2

  d8 16 16 | c8 c d4. c8 | b4 r8

}

msfiwf = {

  %{ c8 %} d8 f | f4.

  c8 d f | g2

  a8 g16 f | d8 a' g4. f8 |

}

ohhebq = {

  %{ d8 %} e8 g | g4.

  d8 e g | a2

  b8 a16 g | e8 b' a4. g8 |

}

PartOneSA = \relative b {

  | r4.

  b8 \kcsiqr | e4 r8

  b8 \kcsiqr | e4 r8

}

PartOneBass = \relative b, {

  | r4.

  b8 \kcsiqr | e4 r8

  b8 \kcsiqr | e4 r8

}

PartTwoSoprano = \relative e' {

  \xldoqm r8

  b,8 \kcsiqr | e2. | r2. | r2. |

  | r4. b8 \kcsiqr | e4 r8

  b8 \kcsiqr | e4 r8

  \xldoqm r8

  b,8 \kcsiqr | e2. |

}

PartTwoAlto = \relative e' {

  e8 \fdgwhm

  {

    b8 cis cis | b4.

    b8 cis cis | dis4. r8

    gis8 fis16 e | cis8 gis' fis4. e8 | e2. | r2. | r2. | r4.

  }

  {

    b8 cis cis | b4.

    b8 cis e | dis4. r8

    e8 fis16 e | cis8 cis dis4. b8 | b4 r8

  }

  {

    b8 cis cis | b4.

    b8 cis cis | dis4. r8

    e8 b16 b | cis8 cis dis4. b8 | b4 r8

  }

  b8 \fdgwhm

  {

    b8 cis cis | b4.

    b8 cis cis | dis4. r8

    e8 b16 b | cis8 cis dis4. b8 | b2.

  }

}

PartTwoBass = \relative e {

  {

    e8 e gis | a4.

    a8 a a | b4 r8

    a8 gis gis | a4.

    a8 a cis | b4 r8

  }

  {

    b8 a a | gis4.

    gis8 a a | b4. r8

    gis8 fis16 e | cis8 gis' fis4. e8 | e2. | r2. | r2. | r4.

  }

  {

    b'8 a a | gis4.

    gis8 a a | b2

    b8 b16 b | a8 a b4. a8 | gis4 r8

  }

  {

    gis8 a a | gis4.

    gis8 a a | b2

    b8 gis16 gis | a8 a b4. a8 | gis4 r8

  }

  {

    gis8 b gis | a4.

    a8 a a | b4 r8

    a8 gis gis | a4.

    a8 a cis | b4 r8

  }

  {

    b8 a a | gis4.

    gis8 a a | b4. r8

    b8 gis16 gis | a8 a b4. a8 | gis2. |

  }

}

PartThreeSA = \relative b {

  | r4.

  b8 \kcsiqr | e4

}

PartThreeBass = \relative c {

  \key f \major

  c8 \msfiwf | f2.

}

PartFourSoprano = \relative f' {

  | r4.

  \key f \major

  {

    f8 a c | d4.

    d8 c a | g4 r8

    f8 f' e | d4.

    d8 c a | g4 r8

  }

  c,8 \msfiwf | f2. | r4.

  \key g \major

  d'8 \ukxeux

  d8 \ukxeux

  {

    g8 b d | e4.

    e8 d b16 a | a4 r8

    g8 g' fis | e4.

    e8 d b | a4 r8

  }

  d,8 \ohhebq | g2.~ | g4 r4

  {

    b8 a16 g | e2 b'4 | a2.~ | a4 r4 g4 | g2.~ | g2.~ | g2.~ | g2. |

  }

}

PartFourAlto = \relative f' {

  | r4.

  \key f \major

  {

    f8 a c | f,4.

    f8 f f | e4 r8

    f8 f f | f4.

    f8 f f | e4 r8

  }

  c8 \msfiwf | f2. | r4.

  \key g \major

  d8 \ohhebq | g4 r8

  d8 \ohhebq | g4 r8

  {

    g8 b g | g4.

    g8 g g | fis4 r8

    g8 g g | g4.

    g8 g g | fis4 r8

  }

  {

    d8 d d | d4.

    d8 c c | d2

    d8 d16 d | c8 e fis4. c8 | b2 fis'4 | e4 r4

  }

  {

    e8 16 16 | 2 4 | g2. | fis4 r4 g | g2.~ | g2.~ | g2.~ | g2. |

  }

}

PartFourBass = \relative f {

  | r4.

  {

    f8 a c | bes4.

    bes8 a c | c4 r8

    bes8 a a | bes4.

    bes8 bes bes | c4 r4 r4 | r8

  }

  {

    c,8 d f8 f4~ | f8

    c8 d f g4 |

    | bes8 bes c4. bes8 | a2. | r4.

  }

  \key g \major

  d,8 \ohhebq | g4 r8

  d8 \ohhebq | g4 r8

  {

    g8 b b | c4.

    c8 b g | d4 r8

    g8 b b | c4.

    c8 e, e | d4 r8

  }

  {

    d8 c' c | b4.

    g8 g e | fis2

    g8 g16 g | c,8 c d4. d8 | e2 d4 | cis4 r4

  }

  {

    cis8 cis16 cis | c2 g'4 | d2.~ | d4 r4 g4 | g2.~ | g2.~ | g2.~ | g2. |

  }

}

\book {

  \score {
    % https://lilypond.org/doc/v2.24/Documentation/learning/satb-vocal-score
    \new ChoirStaff <<
      \new Staff = "women" \with { \consists Merge_rests_engraver} <<
        \clef treble
        \new Voice = "sopranos" {
          \voiceOne \global \PartOneSA \PartTwoSoprano | r2. | \PartThreeSA r2 | r2. r2. r2. r2. | \PartFourSoprano
        }
        \new Voice = "altos" {
          \voiceTwo \global \PartOneSA \PartTwoAlto | r2. | \PartThreeSA r2 | r2. r2. r2.  r2. | \PartFourAlto
        }
      >>
      \new Staff = "men" <<
        \clef bass
        \new Voice = "basses" {
          \voiceTwo \global \PartOneBass \PartTwoBass | r2. | r2. r2. r2. r2. | r4. \PartThreeBass | \PartFourBass
        }
      >>
    >>
    \midi { }
    \layout { }
  }

  \bookOutputName "In.Christ.Alone-M"
}

% \book { \score { { \meta \ready \PartOneSA   \PartTwoSoprano             \PartThreeSA r2 | r2. | \PartFourSoprano  } \midi {} } \bookOutputName "In.Christ.Alone-S" }
% \book { \score { { \meta \ready \PartOneSA   \PartTwoAlto                \PartThreeSA r2 | r2. | \PartFourAlto     } \midi {} } \bookOutputName "In.Christ.Alone-A" }
% \book { \score { { \meta \ready \PartOneBass \PartTwoBass    | r2. | r4. \PartThreeBass          \PartFourBass } \midi {} } \bookOutputName "In.Christ.Alone-B" }
