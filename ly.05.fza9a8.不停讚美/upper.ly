% upper.ly
% melody (main theme)

upper = \transpose c d \relative c' {

  % \set Staff.midiInstrument = "glockenspiel"
  \set Staff.midiInstrument = "marimba"

  \meta
  \clef "treble"
  \key d \major

  | r1 | r1 |

  | c4 c8 d4 e4.~ | 2. r4 | g4 g8 f4 a,4.~ | 2. r4 | b4 b8 c4 d4.~ | 2 r4 a' |

  | a g8 8~2~ | 2. r4 | e4 e8 f4 g4.~ | 2. r8 g | a4 b8 c4 f,4.~ | 2. r4 |

  | d4 d8 e4 f r8 | f4. e d4 | c1~ | 2. r8 c | a'4 a a g8 e |

  | e8 d4 d4. r8 c | a'4 a a g8 e | e d4 d4. r8 c | a'4 a a g8 e | e8 d4 d r8 e4 |

  | d4. c e4~ | 2. r8 e | f4 e f g | e4 d8 d4. r8 e | f4 f g f |

  | e4 d8 d4. r8 c | c'4 b a g | e d r e | d4. c4. c4~ | 1 \bar "|."

}
