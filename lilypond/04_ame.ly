\version "2.22.1"

meta = {
  % https://en.wikipedia.org/wiki/Tempo
  \tempo "Vivace" 4 = 170
  \key c \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#t #t #t)
}

accompanimentStaccato =
#(define-music-function
    (x         y         z        )
    (ly:music? ly:music? ly:music?)
  #{
    $y r8
    $z r8
    $x r8
    $z r8
  #})

upperMain = \relative c'' {

  \resetRelativeOctave c''
  b8^1 r8 e8^4 d4. c8 r8 |
  b8^1 r8 c8^2 b4.^1 a8_3 r8 |
  g8 r8 a8 g4. e8 r8 |
  e2 r2 |

  \resetRelativeOctave c''
  e8^3 r8 f8 e4. d8 r8  |
  c8^1 r8 d8^2 c4.^1 b8^3 r8  |
  a8 r8 b8 a4. b8 a8~ | a4 r2. |

  % https://lilypond.org/doc/v2.22/Documentation/learning/adding-text
  \resetRelativeOctave c''
  e8   r8 f8 e4. d4 | c4 d8 c4. r4 |
  b8-3 r8 c8 b4. b4 | d2    c2     |

}

lowerMain = \fixed c {

  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 c\longa:maj7 } {
    \repeat unfold 4 { \accompanimentStaccato g,8 c8 <e g b>8 }
  } >>

  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 d\longa:m11 } {
                     { \accompanimentStaccato g,8_"(g)" d8 <f a c'>8 }
    \repeat unfold 3 { \accompanimentStaccato g,8       d8 <f a c'>8 }
  } >>

  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 f\breve:m } {
    f8-5 r8   <aes c' f'>8^\markup{\small "321"} r8   c8-5 r8   <aes c' f'>8 r8   |
    f8 r8   <aes c' f'>8 r8   f8 r8   <aes c' f'>8 r8   |
  } >>

  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 e1:m ees1:aug } {
      e8-5 r8   <g b>8^\markup{\small "31"} r8     e8 r8   <g b>8 r8   |
    dis8-4 r8   <g b>8^\markup{\small "21"} r8   dis8 r8   <g b>8 r8   |
  } >>

}

upperSub = {
  \fixed c' {
    _"#42"
    \repeat unfold 2 { <c g >8 r8 <c g >8 r8 <c   fis>8 r8 <c   fis>8 r8 | <  c c'>4 <  c c'>8. <b, b>4 r4 r16 | }
                       <c c'>8 r8 <c c'>8 r8 <c   c' >8 r8 <c   c' >8 r8 | <  c c'>4 <  c c'>8. <b, b>4 r4 r16 |
                       <g c'>8 r8 <g c'>8 r8 <fis c' >8 r8 <fis c' >8 r8 | <f a c'>4 <f a c'>8. <f  b>4 r4 r16 |
  }
  \relative c'' {
    _"#50"
    r4 <g' c,>4 <e c>8. dis16 <d b>8. <c a>16 |
    <b g>8. <a f>4 <g e>4 <g e>4 fis16 |
    f8. e16 f8. g16 f8. c4 gis'16 |
    <a f>2 r2 |
  }
  \fixed c' {
    _"#54"
    r8. fis'16 <g'>4 <f'>8. <e'>16 <d'>8. <c'>16 |
    b8. a4 a4 a16 b4 |
    r8. a16 b8. c'16 d'8. b16 a8. b16 |
    a8. g4 e16~2 |
  }
  \fixed c' {
    _"#58"
    r4 g'4 e'8. dis'16 d'8. c'16 |
    b8. a4 g4 e16 g4 |
    r4 e16 f8 fis16 g8. e16 g8. e16 |
    g4 e8. f2 r16 |
  }
  \fixed c' {
    _"#62"
    r4 d16 e8 f16 a8. a4 gis16 |
    g4 g8. g4 bes4 a16 |
    g4 f8. f4 r4 f16 |
    g4 g8. g4 fis16~4 |
  }
  % #66~#69 #70
  \fixed c' {
    _"#66"
    r4 d16 e8 f16 g8. g4 g16 |
    r4 g8. g4 bes8. a4 a4 a8 a4 r8 c8~1 |
  }

}

lowerSub = \fixed c {
  % 00:51
  \repeat unfold 3 { e8 r8 <e g>8 r8 <dis fis>8 r8 <dis fis>8 r8 | <d f>4 <d f>8. <g, d f>4 g,16 g4 | }
  % 00:59
                     e8 r8 <e g>8 r8 <dis fis>8 r8 <dis fis>8 r8 | <d f a>4 <d f a>8. <g, d g>4 g16 f4 |
  % 01:02
  \repeat unfold 2 { c8 r8 <g c'>8 r8 g,8 r8 <g c'>8 r8 | }
  \repeat unfold 5 { d8 r8 <f a >8 r8 g,8 r8 <f a >8 r8 | }
  \repeat unfold 4 { c8 r8 <e g >8 r8 g,8 r8 <e g >8 r8 | }
                     d8 r8 <f a >8 r8 a,8 r8 <f a >8 r8 |

  d8 r8 <f a>8 r8 d8  r8 <dis a>8 r8 |
  d8 r8 <f a>8 r8 a,8 r8 <g ais>8 r8 |
  d8 r8 <f a>8 r8 g,8 r8 <f a>4 | % 64

}

upper = \relative c'' {

  \meta
  \clef "treble"

  \repeat percent 5 { r1 }

  \repeat unfold 4 { r1 | }

  % Main
  _"main 1/2"
  \upperMain
  \resetRelativeOctave c''
  fis32 g16. r8 d8 c4. r4 |
  fis32 g16. r8 d8 c4 g'16 a8. <b, dis>8~ |
  8 r8 <g' ais>8^\markup{\small "24"}  r8 <g ais>8^\markup{\small "24"} r8 <ees aes>8^\markup{\small "24"} <d-1 g-3>8~ |
  2 r2 |

  % Main
  _"main 2/2"
  \upperMain
  % #38
  g8         r8 e8   c4. r4 |
  fis32 g16. r8 e8   b4 <b e>4 c8~1 |

  % Intro
  \fixed c' { r4 e16 f16 fis8   g8. e16 c8. g,16 | }

  % Sub
  _"sub"
  \upperSub

}

lower = \fixed c {
  \meta
  \clef "bass"

  \repeat percent 5 { r1 }

  % Intro
  % https://music.stackexchange.com/a/94788
  << { \new ChordNames \chordmode { \set midiMaximumVolume = #0 c\longa:maj7 } } {
    \repeat unfold 4 { \accompanimentStaccato g,8 c8 <e g b>8 }
  } >>

  % Main
  \lowerMain
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 d\breve:m } {
    \accompanimentStaccato a,8 d8 <f a>8 |
    \accompanimentStaccato a,8 d8 <f a>8 |
  } >>
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 g1:7 } {
    g,4 <f g b>4
    g,4 <f g b>4 |
  } >>
  g,4 c16 d8. g8 r8 g,8 r8 |

  % Main
  \lowerMain
  % #38
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 d1:m } {
    d8  r8 <f a>8 r8 d8  r8 <f a>8 r8 |
  } >>
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 g1 } {
    g,8 r8 <g b>8 r8 g,8 r8 <g b>8 r8 |
  } >>
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 c1 } {
    c8  r8 <e g>8 r8 c8  r8 <e g>8 <c g>8~ |
    % intro.main2sub.lower
    c8 r2.. |
  } >>

  % Sub
  \lowerSub

}

\score {
  % https://lilypond.org/doc/v2.22/Documentation/learning/solo-piano
  \new PianoStaff \with { instrumentName = "Piano" } <<
    { \new Staff = "upper" \upper }
    { \new Staff = "lower" \lower }
  >>
  \layout {}
  \midi {}
}
