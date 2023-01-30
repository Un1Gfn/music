% meta.ly

meta = {

  % https://en.wikipedia.org/wiki/Tempo#Basic_tempo_markings
  % \tempo "?" 4 = 144
  \tempo "?" 4 = 180

  % \numericTimeSignature
  \time 4/4

  % https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers
  \override Score.BarNumber.break-visibility = ##(#t #t #t)

}
