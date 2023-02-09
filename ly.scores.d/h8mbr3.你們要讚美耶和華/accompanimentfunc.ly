% accompanimentfunc.ly

accOne =
#(define-music-function
    (x        )
    (ly:pitch?)
  #{
    $x 8 $x 8
  #})

accOne =
#(define-music-function
    (x        )
    (ly:pitch?)
  #{

                      $x 8                       r 8
    < \transpose c e  $x   \transpose c g $x > 8 r 8
      \transpose c g, $x 8                       r 8
    < \transpose c e  $x   \transpose c g $x > 8 r 8
  #})
