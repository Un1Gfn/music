% m = hh
% n = bd

% m = #(define-music-function (x) (ly:music?) #{ hh 8 #})
% n = #(define-music-function (x) (ly:music?) #{ bd 8 #})

m = #(define-music-function (x) (ly:duration?) #{ \drummode { hh $x } #})
n = #(define-music-function (x) (ly:duration?) #{ \drummode { bd $x } #})

percussion = \drummode {

  \meta

  \repeat unfold 40 {
    % https://lilypond.org/doc/v2.24/Documentation/notation/percussion-notes
    % https://lilypond.org/doc/v2.24/Documentation/notation/common-notation-for-percussion
    % hh4 bd4
    % sn4

    % | <hh bd>16 r bd bd hh r hh r bd8 hh bd hh |

    % | <hh bd>8 r bd r hh r bd r |

    | \m 8 r8 \n 8 \n 8    \n 8 \m 8 \n 8 \n 8 |

  }

}
