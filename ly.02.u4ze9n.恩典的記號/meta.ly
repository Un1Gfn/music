% meta.ly

meta = {

  % https://en.wikipedia.org/wiki/Tempo
  \tempo "Larghetto" 4 = 63
  % \tempo "Larghetto" 4 = 100
  \key d \major

  % \numericTimeSignature \time 4/4
  \time 4/4

  % https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers
  \override Score.BarNumber.break-visibility = ##(#t #t #t)

}
