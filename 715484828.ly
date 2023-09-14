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
  PartThree = 10/4811L-7 <bar_49>          ~~~

%}

meta = {
  \time 3/4
  \tempo 4 = 80
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

  cis8 b gis16~fis16 | fis4 r8

  e8 e' dis | cis4.

  cis8 b     gis8    | fis4

}

fdgwhm = {

  e8 8 | 4.

  e8 8 8 | dis4 r8

  e8 8 8 | 4.

  e8 8 8 | dis4 r8

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

  % page 10/4811L-3

  %{12%} e8 e gis | a4. 8 8 8 |

  %{15%} | b4 r8 a8 gis gis | a4. 8 8 cis | b4 r8 8 a8 a |

  % page 10/4811L-4

  %{18%} |

}

%{ \book {
  \score {
    {
      \meta
      \ready
      <<
        \PartOneSA \\
        \PartOneBass \\
        { }
      >>
      <<
        \PartTwoSoprano \\
        \PartTwoAlto \\
        \PartTwoBass \\
        { }
      >>
    }
    \midi {}
  }
  \bookOutputName "In.Christ.Alone-M"
} %}

% \book { \score { { \meta \ready \PartOneSA \PartTwoSoprano } \midi {} } \bookOutputName "In.Christ.Alone-S" }
\book { \score { { \meta \ready \PartOneSA \PartTwoAlto    } \midi {} } \bookOutputName "In.Christ.Alone-A" }
% \book { \score { { \meta \ready \PartOneBass  \PartTwoBass } \midi {} } \bookOutputName "In.Christ.Alone-B" }

