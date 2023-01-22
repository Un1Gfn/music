% accompanimentfunc.ly
% https://extending-lilypond.readthedocs.io/en/latest/music.html#argument-type-checking
% http://lilypond.org/doc/v2.24/Documentation/notation/changing-multiple-pitches#transpose

% accRef =
% #(define-music-function
%     (x         y         z        )
%     (ly:music? ly:music? ly:music?)
%   #{
%     $y r8
%     $z r8
%     $x r8
%     $z r8
%   #})

accOne =
#(define-music-function
    (x        )
    (ly:pitch?)
  #{
    % ()
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
