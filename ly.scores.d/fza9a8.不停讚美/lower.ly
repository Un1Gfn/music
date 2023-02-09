% lower.ly
% accompaniment
% https://en.wikipedia.org/wiki/accompaniment

lower = \fixed c' {

  \set Staff.midiMaximumVolume = #0.6

  \meta
  \clef "bass"
  \key d \major

  \fixed c, \chordmode {

    | r1 | d4 d4 d4 d4 |

    d\breve g\breve a,\breve

    d\breve d\breve g\breve

    e1:m a, d\breve g1

    a,1 g a, g a,

    d\breve e1:m a, e:m

    a, e:m a, d\breve \bar "|."

  }

}
