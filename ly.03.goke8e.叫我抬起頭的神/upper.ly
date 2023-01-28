% upper.ly
% melody (main theme)

upper = \transpose c e \relative e'' {

  % \set Staff.midiInstrument = "glockenspiel"
  % \set Staff.midiInstrument = "marimba"

  \meta
  \clef "treble"

  % | r1 |

  | r \breve |
  % | r1 | r1 |


  | g8 d e g4 d8 e g~ | g d e g e e e d | g d e g4 d8 e g~ | g d e g e e e d |

  | g8 d e g4 d8 e g~ | g d e g e d c d | d d d c~2 | b8 b r c r d r4 |

  | e,4 g8 g4 e4. | d4 b8 g'~2 | c,4 b8 c4 d4 e8~ | 2. g,4 | a c8 c4 d4. |

  | c4. g8~2 | f'4 e d8 c4 d8~ | 2. r4 | e4 g8 g4 e4. | d4 b8 g'8~2 |

  | c,4 b8 c4 d e8~ | 2. g,4 | a c8 c4 c a'8 | g4. c,8~2 | f4 e8 d c b4 c8~ | 2. r4 |

  %%%

  | r4 r r c8 d | e4 d8 e4 d4. | d4 g8 g4 d4. | c4 b8 c4 d4. | e2 c4 b |

  | c4 a'8 a4 a4. | g2 f2 | e1~ | 2 e4 d | c4 b8 c4 b c8~ | 2 a'4 b |

  | g4 g8 g4 e g8~ | 2 4 4 | f4 e8 c4 a4. | e'4. c a4 | c1 |

  | r1 |

  % \relative
  % \fixed

  % \repeat unfold _ r1

  % https://lilypond.org/doc/v2.24/Documentation/notation/long-repeats#written_002dout-repeats
  % https://lilypond.org/doc/v2.24/Documentation/notation/using-repeats-with-midi
  % \unfoldRepeats
  % \repeat volta 2 \relative d'' {
  %   \alternative {
  %     \volta 1 \relative d'' {
  %     }
  %   }
  % }

  % \resetRelativeOctave d''

  % https://lilypond.org/doc/v2.23/Documentation/notation/long-repeats#other-variation-in-repeated-sections

  % AlternativeBlock.Within conflict
  % AlternativeBlock.Ending ok
  % \repeat volta 2 \relative d'' {}

  % AlternativeBlock.Within ok
  % AlternativeBlock.Ending ok
  % \repeat unfold 2 \relative d''' {}

}
