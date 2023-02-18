%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% xxxxxx private %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


euznwh = {
  
  e8 e d16 g16~2 | d8 c c d16 e16~2 |

  | a8 g a g e f16 g16~4 |

}

qmhzaz = { a16 b | c8 c16 }

weeiwh = { d4 r8 d16 c | b8. g b8 c4.. e,16 | g8 }

cpysfw = { f8 e f4. d'4 | }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   xxxx public  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tjui = {
  \textMark "[Verse]" \euznwh |           f8. e g8   d2 |
  e8                  \euznwh | \time 2/4 f8. e g8   | \time 4/4 g2.
}

jrwz = {

  r8 \textMark "[Chorus]" \qmhzaz c8. a8 \weeiwh f16 f8. e8

  f a g d | f8 e e f16 g4.. \qmhzaz c8 e8. \weeiwh

  \cpysfw |

}

yner = { \textMark "[Coda]" \qmhzaz c8 e8. \weeiwh \cpysfw | c1 | }

all = {

  | e8  \tjui \jrwz | c1  | \section |

  | e,8 \tjui \jrwz | c1~ | \section |  2.

  \jrwz         | c1  | \section | r2.. \yner \bar "|."

}
