% percussion.ly

m = #(define-music-function (x) (ly:duration?) #{ \drummode {  hh      $x } #})
n = #(define-music-function (x) (ly:duration?) #{ \drummode { <hh bd> $x } #})

A =  \drummode { | \m 4     \n 8 \m 8    r 8 \m 8 \n 8 \m 8 | }
B =  \drummode { | \m 8 \m8 \n 8 \m 8    r 8 \m 8 \n 8 \m 8 | }

percussion = \drummode {

  \meta

  \set Staff.midiMaximumVolume = #1.7


  % https://lilypond.org/doc/v2.24/Documentation/notation/percussion-notes
  % https://lilypond.org/doc/v2.24/Documentation/notation/common-notation-for-percussion
  % hh4 bd4
  % sn4

  % | <hh bd>16 r bd bd hh r hh r bd8 hh bd hh |

  % | <hh bd>8 r bd r hh r bd r |

  % \m 8 \m r4 \m

  % hh8 m8 r4 hh4

  % | \m 8 r8 \n 8 \n 8    \n 8 \m 8 \n 8 \n 8 |

  \repeat unfold 13 { \A \B }

  | \m 4 \m 4 \m 4 \m 4 |

  \repeat unfold 8 { \A \B }

  | \n 16 16 2.. |

}
