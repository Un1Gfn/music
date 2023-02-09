% upper.ly

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

upperSub = {
  \fixed c' {
    _"%42"
    \repeat unfold 2 { <c g >8 r8 <c g >8 r8 <c   fis>8 r8 <c   fis>8 r8 | <  c c'>4 <  c c'>8. <b, b>4 r4 r16 | }
                       <c c'>8 r8 <c c'>8 r8 <c   c' >8 r8 <c   c' >8 r8 | <  c c'>4 <  c c'>8. <b, b>4 r4 r16 |
                       <g c'>8 r8 <g c'>8 r8 <fis c' >8 r8 <fis c' >8 r8 | <f a c'>4 <f a c'>8. <f  b>4 r4 r16 |
  }
  \fixed c' {
    r4 <g' c'>4 <e' c'>8. dis'16 <d' b>8. <c' a>16 | %50
    <b g>8. <a f>4 <g e>4 <g e>4 fis16 | %51
    f8. e16 f8. g16 f8. c4 gis16( | %52
    <a f>2) r2 | %53
  }
  \fixed c' {
    r8. fis'16( <g' b>4) <f' a>8. <e' g>16 <d' f>8. <c' e>16 | %54
    <b g>8. <a f>4 <a f>4 a16( <b f>4) | %55
    r8. a16 <b f>8. c'16 <d' b>8. b16 <a f>8. b16 | %56
    <a f>8. g4 <e c>16~2 | %57
  }
  \fixed c' {
    r4 <g' d'>4 <e' c'>8. dis'16 <d' b>8. <c' a>16 | %58
    <b g>8. <a f>4 <g e>4 e16 g4 | %59
    r4 <e g>16 f8 fis16 g8. e16 <cis g>8. e16 | %60
    g4 e8. <f d>2 r16 | %61
  }
  \fixed c' {
    r4 d16 e8 f16 <a d>8. <a d>4 <gis d>16 | %62
    <g e>4 <g e>8. <g e>4 <bes e>4 a16 | %63
    <g e>4 <f c>8. <f c>4 r4 f16 | %64
    g4 <g d>8. <g e>4 <ges ees>16~4 | %65
  }
  \fixed c' {
    r4 d16 e8 f16 <g d>8. <g d>4 <g d>16 | %66
    r4 <g d>8. <g d>4 <bes f d>8. <a f c>4 <a f c>4 <a f c>8 <a f>4 r8 c8~1 | %67 %68 %69
  }
  \fixed c' {
    {
      <g' d'>4 <g' d'> <fis' ais> <fis' ais> | <f' c' a>8. <f' c' a>4 <f' c' a>4 c16(   b,4) | %70 %71
    } \repeat unfold 2 {
      <g' b >4 <g' b > <fis' ais> <fis' ais> | <f' c' a>8. <f' c' a>4 <g' d' b>4 cis16( d4)  | %72 %73 %rep1 / %76 %77 %rep2
    } \alternative { {
      <g' d' b>4 <g' d'> <fis' ais> <fis' ais> | <f' c' a>8. <f' c' a>4 <f' c' a>4 c16(   b,4) | %74 %75 %alt1
    } {
      r2 g2 | fis'16 g'8. r2. | %78 %79 %alt2
    } }
  }
}

upper = \relative c'' {

  \meta
  \clef "treble"
  \numericTimeSignature \time 4/4

  % https://lilypond.org/doc/v2.22/Documentation/notation/short-repeats#percent-repeats
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

  % Main2
  % \upperMainComplex

}
