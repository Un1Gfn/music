% meta.ly

meta = {
  % https://en.wikipedia.org/wiki/Tempo
  \tempo "Vivace" 4 = 170
  \key c \major
  \time 4/4
  % https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers
  \override Score.BarNumber.break-visibility = ##(#t #t #t)
}
