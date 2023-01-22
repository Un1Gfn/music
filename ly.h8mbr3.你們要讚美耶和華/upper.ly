% upper.ly
% melody (main theme)

upper = \relative c'' {

  \meta
  \clef "treble"

  % \relative
  % \fixed

  % http://lilypond.org/doc/v2.24/Documentation/notation/changing-multiple-pitches#transpose
  \transpose c f \relative f' {

    c8 c4 c8 e4 c | a4 c8 c4. r8 c | d d d d c d4 e8~ | e2. r4 |

    c8 c4 c8 e4 c | a4 c8 c4. r8 c | d d d d c b4 c8~ | c2 r8 g c d |

    e4 e e e | f8 e4 a, a8 b c | d4 d d d | c8 d4 e4 g,8 c d |

    e4 e e e | f8 e4 a, d8 e f | g g g g f (e) d c~ | c1 ||

  }

}
