% meta.ly

meta = {

  % https://en.wikipedia.org/wiki/Tempo#Basic_tempo_markings
  \tempo "Larghetto" 4 = 64
  % \tempo "Larghetto" 4 = 92

  % \numericTimeSignature
  \time 4/4

  % https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers
  \override Score.BarNumber.break-visibility = ##(#t #t #t)

}
