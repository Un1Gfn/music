% lower.ly

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

lowerSub = \fixed c {
  % Hammer
  \repeat unfold 3 { e8 r8 <e g>8 r8 <dis fis>8 r8 <dis fis>8 r8 | <d f>4   <d f>8.   <g, d f>4 g,16(g4) | } %42 %43 %44 %45 %46 %47 
                   { e8 r8 <e g>8 r8 <dis fis>8 r8 <dis fis>8 r8 | <d f a>4 <d f a>8. <g, d g>4 g16(f4)  | } %48 %49
  % Melody
  \repeat unfold 2 { c8 r8 <g c'  >8 r8 g,8 r8 <g c'  >8 r8 | } %50 %51
  \repeat unfold 5 { d8 r8 <f a   >8 r8 g,8 r8 <f a   >8 r8 | } %52 %53 %54 %55 %56
                   { c8 r8 <e g   >8 r8 g,8 r8 <e g   >8 r8  | } %57
  \repeat unfold 2 { c8 r8 <e g c'>8 r8 g,8 r8 <e g c'>8 r8  | } %58 %59
                   { c8 r8 <e g c'>8 r8 g,8 r8 <e g   >8 r8 | } %60
                   { d8 r8 <f a   >8 r8 a,8 r8 <f a   >8 r8 | } %61
                   { d8 r8 <f a   >8 r8 d8  r8 <dis a >8 r8 | } %62
                   { d8 r8 <f a   >8 r8 a,8 r8 <g ais >8 r8 | } %63
                   { d8 r8 <f a   >8 r8 g,8 r8 <f a   >4 | } %64
}

lower = \fixed c {
  \meta
  \clef "bass"
  \numericTimeSignature \time 4/4

  % https://lilypond.org/doc/v2.22/Documentation/notation/short-repeats#percent-repeats
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

  % Main2
  % \lowerMainComplex

}
