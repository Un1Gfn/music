Chords = \chordmode {
  
  % https://lilypond.org/doc/v2.24/Documentation/notation/common-notation-for-fretted-strings#fret-diagram-markups
  % https://lilypond.org/doc/v2.23/Documentation/notation/common-notation-for-fretted-strings#predefined-fret-diagrams
  % https://gakufu.gakki.me/m/data/DT2336.html

  \override FretBoard.fret-diagram-details.orientation = #'landscape

  \skip 4.
  % \skip 1*1
  % r1

  d2:maj7
  \fbFade cis4.:m7 \fbRevert
  fis8:m~1
  b2:m7
  \fbFade b4.:m7/e \fbRevert
  a8~1

  d2:maj7
  \fbFade cis4.:7 \fbRevert
  fis8:m~1
  b2:m7

  \fbFade b2:m7/e \fbRevert
  fis1:m7

}
