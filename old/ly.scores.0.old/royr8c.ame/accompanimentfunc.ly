% accompanimentfunc.ly

accompanimentStaccato =
#(define-music-function
    (x         y         z        )
    (ly:music? ly:music? ly:music?)
  #{
    $y r8
    $z r8
    $x r8
    $z r8
  #})
