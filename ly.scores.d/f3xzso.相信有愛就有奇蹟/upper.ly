% upper.ly
% melody (main theme)

upper = \transpose c f \relative c'' {

  \meta
  \clef "treble"

  \key f \major

  % r1 | r1 |

  % ？
  r2 r8 e8 d c16 e~ | e2 g8 f16 e8 d c16~ | c2 g'8 f16 e8 d c32 d | ees8. f8. e8 d8. e8. f8 | g2.

  % 黑
  % https://lilypond.org/doc/v2.24/Documentation/notation/writing-rhythms#tuplets
  r8 e,,16 f | g8 a16 g8. e16 f \tuplet 3/2 { g8 g8 a8 } g e16 f | g8 c16 c4 c16 \tuplet 3/2 { e8 d c } d e,16 f |

  % % 漸
  g8 a16 g8. e16 f g8 a16 g8. e16 f | g8 c16 c4 c16 e8. f8. d16 c | d2 r4 r8 c16 b |

  % % 相
  c8. c16~4 c8 d e g | g8. d16~4 r4. c16 b | a8 a a b16 c4.. g16 g | e'8. f16~8 d16 c d2~ |

  % % 相
  d2 r8 e d c16 e~ | e2 g8 f16 e8. d8 | c2 r8. c16 \tuplet 3/2 { e8 d c } | c8 c16 c \tuplet 3/2 { e8 d c }

  % % 睛
  c8 g16 g c8 d16 d | e8. f8. e8 d e d c16 e~ | e2 g8 f16 e8. d8 | c2 r4 r8 c16 c |

  % % 逆
  a'8 g16 a4 c,16 \tuplet 3/2 { g'8 e d } c8. g16 | a4.. e'16 e8. d8. c8 | c2. r8 c16 b | d8 c16 16~4

  % % 相
  c8 d16 e8. g8 | g8 d16 16~4 r4 8 c16 b | a8 a a b16 c4.. g16 g | e'8. d16~2 c8 b16 c | d8. c16~2 r4 |

  % \bar "|."
  % \fine

}
