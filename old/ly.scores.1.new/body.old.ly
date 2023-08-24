
ulbeknPrelude = {

  | e8 c e c e c e c | e b e b e b e b | e a, e' a, e' a, e' a, | f' f f e r d4. |
  | e8 c e c e c e c | e b e b e b e b | e a, e' a, e' a, e' a, | f' f f e r d4. |

}

ulbeknVerse = {

  g4 e | f e8 e4. d8 c | d4 d8 d4. e4 | f1 | d4 d8 d4. e4 |

  | f4. d d8 c | e4. f g4 | e1 | a4. a g4 | g4. c,8~2 |

  | d4. e d4 | c1 | d4 d d e8 f~ | f4 f f a | g1 |

}

ulbeknChorus = {

  g4 a | c4. c8 r2 | d4. d8 r2 | d4. e d4 | c1 | a4. c c4 |

  | d4 g,8 g4. g4 | a a8 a4. e'4 | d2 c4 d | e4 g,8 g r2 | e'4 d8 d8 r2 |

  | d4 c c8 d4. | a1 | g4 c8 c4. d4 | e4. d c4 | c1 |

}

ulbekn = \transpose c a'' \relative {
  \time 4/4
  \tempo 4=158
  \ulbeknPrelude
  r4 g, \ulbeknVerse
  r2 \ulbeknChorus
}

ubfeoyPartOnePrelude = {
  % https://lilypond.org/doc/v2.24/Documentation/notation/single-voice#simultaneous-expressions
  | r1 |
  | <c g>2 <d g,>2 |
  <<
    { |  c8 c c d d d d d | c c c d d d d d | c c c d d d d d | c c c d d d d d | }
    { | g,8 g g g g g g g | f f f g g g g g | f f f f f f f f | g g g g g g g g | }
  >>
}

ubfeoyPartOneVerse = {

  | g8 g g d'2 b8 | c b a g8~2 | a8 a a f'2 f8 | e c e d8~2 |

  | g,8 g g d'8~2 | c8 b a g4. d'8 e | f4 e \tuplet 3/2 { d c b } | c2 r8

}

ubfeoyPartOneChorus = {

  g8 d' b8 |

  | c4. g8 e g d' e | c2~8 a d cis | d4. a8 a a b c | d2. e8 f |

  | g8 g f g e4 d8 e | f f e f d4 c8 d | e4. f8 g c, c b | c2. r4 |

}

ubfeoyPartOneFreeWorship = {

  e8 f16 g~ | g4 e8 f16 g4.. a8~ | a8 g8~2. |

  | r4 g,8 c d4 e | r g,8 c d4 c | r e8 e \tuplet 3/2 { f4 e d } | c2

}

ubfeoyPartTwoVerse = {

  | g4 c d b | c b8 a g2 | a4 c g c8 c | a4 e'8 d d2 |

  | g,4 c d b | c b8 a g4. g8 | f'4 e d4. c8 | c2.

}

ubfeoyPartTwoChorus = {

  c16 d8. |

  | e4. d8 d2 | d4. c8 c2 | c4 b a8 a4 g8 | f'4. e16 d e4 c16 d8. |

  | e4. d8 d2 | d4. c8 c2 | f4 e d4. c8 | c2 r4 c16 d8. |

  | e4. d8 d2 | d4. c8 c4 d8 e | f4 e d4. c8 | d4. c8 c2~ | c2. r8

}

ubfeoyPartTwoBridge = {

  g8 |

  | a8. a16~4 b8. b16~4 | b8. b d8 d8. c16~4 | f4 e d4. c8 | e2. r8 g, |

  | a8. a16~4 b8. b16~4 | b8. b d8 d8. c16~4 | f4 e d4. c8 | c2.

}

ubfeoy = \transpose c g' \relative {
  \time 4/4
  \tempo 4=72
  % \ubfeoyPartOnePrelude
  % \ubfeoyPartOneVerse
  % \ubfeoyPartOneChorus
  % r2. \ubfeoyPartOneFreeWorship
  \ubfeoyPartTwoVerse
  \ubfeoyPartTwoChorus
  \ubfeoyPartTwoBridge
}

bkrsysPrelude = {
  % | g8 a g f \tuplet 3/2 { dis e c } b a | g4. g'8~2 |
  | g8 a g f dis32 e16. c8 b8 a | g16 r16 g'8~2. |
}

bkrsysVerse = {

  | e4 e d8 g4 c,8 | c4 b a2 | g8 a4 c8 d4 e | d2. r4 |

  | e4 e d8 g4 c,8 | c4 c f g8 f | e8 c4 e8 d8 c4 b8 |

  | c2 r8

}

bkrsysChorus = {
  
  e8 f g | a8. g16 a8. g16 a8 f4 a8 | g8. a16 g8 f e2 |

  | f8 e d c b4 a' | g2 r8 e f g | a8. g16 a8. g16 a8 f4 a8 |

  | g8. a16 g8 f e2 | f8 e d c b4 d | c1 |

}

bkrsys = \transpose c d' \relative {
  \time 4/4
  \tempo 4=127
  \bkrsysPrelude
  \bkrsysVerse
  \bkrsysChorus
}

wfdrryVerse = {

  g8 e' f | e2 r8 g, e' f | g g g g e g4 c,16 c |

  | a'8 a a a a g g f | f4 e8 d4 g,8 e' f | e2 r8 g, e' f |

  | g8 g g g e g4 c,16 c | a'8 a a a a g4 f8 | g2 r8

}

wfdrryChorus = {

  a8 b c |

  | g2 r8 g a b | g2 r8 a b c | a2 r8 a g f | f4. e8 d4. c8 |

  | a'8 a a a2 c,8 | g' g g g2 a,8 | f' f f f f e4 d8 | c2 r8

}

wfdrry = \transpose c d' \relative {
  \time 4/4
  \tempo 4=76
  | r4 e8 f g g, f' d | c2 r8 \wfdrryVerse
  \wfdrryChorus
}
