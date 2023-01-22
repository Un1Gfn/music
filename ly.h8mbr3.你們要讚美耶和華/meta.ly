% meta.ly

meta = {
  % https://en.wikipedia.org/wiki/Tempo
  \tempo "Allegro" 4 = 140
  \key f \major

  % \numericTimeSignature \time 4/4
  \time 4/4

  % https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers
  \override Score.BarNumber.break-visibility = ##(#t #t #t)

}
