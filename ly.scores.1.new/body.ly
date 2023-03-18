
karuvdAlpha = { | e1 | d4 e2 d4 | }

karuvdVerse = {

  | e4 e e e | d d r e8 d | c4 c c a | g r2. | e'4 e e e |

  | g4 c, d8 e4. | d1 | g4 f e d | g g g4. a8 | e8 d c4 r4. c8 |

  | d4 c c a | g r2. | e'1 | d4 e2 d4 | c\breve |

}

karuvdChorus = {

  \repeat unfold 2 {

    | e4 g g4. g8 | a4 g8 g \alternative { \volta 1 { r8 e4 d8 } \volta 2 { r4 e8 d } } | c4 c c4. c8 | d4 c8 c8~2 |

    \alternative {

      \volta 1 { | e1 | e4 g2 e4 | d1 | g4 f e d | }

      \volta 2 { | \karuvdAlpha | c1 | }

    }

  }

}

karuvd = \transpose c f \relative {

  \time 4/4
  \tempo 4=145
  % \tempo 4=180 % test

  \karuvdVerse \karuvdChorus

  % \karuvdVerse \karuvdChorus
  % \karuvdVerse \karuvdChorus
  % \karuvdChorus
  % \karuvdChorus
  % \karuvdAlpha | c1 |

}


sxxbzsPrelude = { c8 | a'4. c8 b c16 b8 a8. | g8. e8 g8. c4. c,8 | e8. f g2 c,8 | e8. f d8~2 | }

sxxbzsVerse = {

  | e8 e16 e8. f8 g f16 e8 d8. | d c8 d16 c8 e2 | f8 f16 f8. f8 g e d c |

  | e8 d16 d8 c8. d2 | e8 e16 e8. f8 g f16 e8 d8. | d8 c16 c8 a'8. g4. g8 |

  | a8. c c,8 g' e c8. c16 | e8 d4 c8 c4 d8 c | c2. r8 c | c'4. c8 b c16 b8 g8. |

  | a8 g16 g8 f8. e4. c8 | c'4. c8 b c16 b8 g8. | \partial 2 { a8 a16 a8 c8. } | b2.

}

sxxbzsAlpha = {

  c8 |

  | a'4. c8 b c16 b8 a16 g8 | g4 e8 g c4. c,8 | e8. f4~4.. c8 | e8. f16~4 e8. c a8 | c1 |

}

sxxbzsChorus = {

  g8 f |

  | e2 g8 f16 e8 d8. | d8 c c d16 c e4. c8 | a' g g f g4. c,8 | e d d c d2 |

  | e2 g8 f16 e8 d8. | d8 c c a'16 g g4. g8 | a c c c16 a8 g16~4 g8 | a g g e d4. \sxxbzsAlpha

}


sxxbzs = \transpose c d' \relative {

  \time 4/4
  \tempo 4=70
  % \tempo 4=120 % test

  r4 r r r8 \sxxbzsPrelude \sxxbzsVerse \sxxbzsChorus

  % \sxxbzsPrelude \sxxbzsVerse \sxxbzsChorus
  % \sxxbzsPrelude \sxxbzsVerse \sxxbzsChorus
  % \sxxbzsChorus
  % \sxxbzsAlpha

}


qrhrwfVerse = {

  | e4 d8 c8~2~ | c4 r8 g  e' e e e | d d4 d8 d d e f~ | f2. r4 |
  | f4 e8 d8~2~ | d4 r8 g, f' f f f | e e4 e8 e e f g~ | g2. r4 |

  | e4 f8 g e2~ | e4. c8 c' c c c | c2 r8 f, a4 | g2. d8 e |

  | f4 d8 e f2~ | f4 r8 g, f' f e d | c1~ | c2. r8

}

qrhrwfAlpha = {

  b8 a |

  | g4 r8 g c4 e,8 d | c4 r8 g d' d c b | c\breve |

}

qrhrwfChorus = {

  c8 |

  | g'8 g g g4. e8 f | g2.. c,8 | a' a4 a8 a4 b | a2.. a,8 |

  | f'8 f f f4 f8 f e | d4. d8 d d e f | g1~ | g2. r8 c,8 |

  | g'8 g g g4. e8 f | g2.. c,8 | a' a4 a8 a4 b | | c2. \qrhrwfAlpha

}

qrhrwf = \transpose c d' \relative {

  \time 4/4
  \tempo 4=70
  % \tempo 4=160 % test

  \qrhrwfVerse \qrhrwfChorus

  % \qrhrwfVerse \qrhrwfChorus
  % \qrhrwfVerse \qrhrwfChorus
  % \qrhrwfChorus
  % \qrhrwfAlpha
  % \qrhrwfAlpha

}


