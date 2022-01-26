\version "2.22.1"

meta = {
  % https://en.wikipedia.org/wiki/Tempo
  \tempo "Vivace" 4 = 170
  \key c \major
  \time 4/4
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

upper = \relative c'' {

  \meta
  \clef "treble"

  \repeat unfold 4 { r1 | }

  _"main 1/2"
  % _"main 1/2"
  \upperMain
  \resetRelativeOctave c''
  fis32 g16. r8 d8 c4. r4 |
  fis32 g16. r8 d8 c4 g'16 a8. <b, dis>8~ |
  8 r8 <g' ais>8^\markup{\small "24"}  r8 <g ais>8^\markup{\small "24"} r8 <ees aes>8^\markup{\small "24"} <d-1 g-3>8~ |
  2 r2 |

  _"main 2/2"
  \upperMain
  % 00:45
  g8         r8 e8   c4. r4 |
  fis32 g16. r8 e8   b4 <b e>4 c8~1 |

}

lower = \fixed c {
  \meta
  \clef "bass"

  % https://music.stackexchange.com/a/94788
  << { \new ChordNames \chordmode { \set midiMaximumVolume = #0 c\longa:maj7 } } {
    \repeat unfold 4 { \accompanimentStaccato g,8 c8 <e g b>8 }
  } >>

  % _"main 1/2" % label at the subscript of upper
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

  % _"main 2/2" % label at the subscript of upper
  \lowerMain
  % 00:45
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 d:m } {
    d8  r8 <f a>8 r8 d8  r8 <f a>8 r8 |
  } >>
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 g } {
    g,8 r8 <g b>8 r8 g,8 r8 <g b>8 r8 |
  } >>
  << \new ChordNames \chordmode { \set midiMaximumVolume = #0 c\longa } {
    c8  r8 <e g>8 r8 c8  r8 <e g>8 <c g>8~ | c8 r2.. |
  } >>

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
