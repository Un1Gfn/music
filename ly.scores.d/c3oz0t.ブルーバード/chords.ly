Chords = \fixed c, \chordmode {
  
  % https://lilypond.org/doc/v2.24/Documentation/notation/common-notation-for-fretted-strings#fret-diagram-markups
  % https://lilypond.org/doc/v2.23/Documentation/notation/common-notation-for-fretted-strings#predefined-fret-diagrams
  % https://gakufu.gakki.me/m/data/DT2336.html

  \override FretBoard.fret-diagram-details.orientation = #'landscape
  \autoBeamOff
  \predefinedFretboardsOn

  % <e a d' g' b' e''>

  \skip 4.
  % \skip 1*1
  % r1

  \repeat unfold 2 {

    d2:maj7

    \volta 1 { \fbFade cis8.:m7( \fbRevert \omit ChordName <fis b fis' a' d'' fis''>8. ) \undo \omit ChordName }

    \volta 2 { \fbFade cis8.:7(  \fbRevert \omit ChordName <b fis' a' dis'' fis''>8. ) \undo \omit ChordName }
    % \volta 2 { \fbFade cis4.:7 }
    % \volta 2 { <b fis' a' dis'' fis''>4. }

    fis8:m ~ \omit FretBoard \omit ChordName 1 \undo \omit FretBoard \undo \omit ChordName
    b2:m7

    \volta 1 {
      \fbFade b8.:m7/e( \fbRevert \omit ChordName <e a d' a' b' fis''>8.) \undo \omit ChordName
      a8 ~ \omit FretBoard \omit ChordName 1 \undo \omit FretBoard \undo \omit ChordName
    }

    \volta 2 {
      \fbFade b4:m7/e( \fbRevert \omit ChordName <e a d' a' b' fis''>4) \undo \omit ChordName
      fis1:m7
    }

  }

  % \break
  % \invertChords 0 cis,,:7
  % \invertChords 1 cis,,:7
  % \invertChords 2 cis,,:7
  % \invertChords 3 cis,,:7

  % \break
  % \invertChords 0 cis,:7
  % \invertChords 1 cis,:7
  % \invertChords 2 cis,:7
  % \invertChords 3 cis,:7

  % \break
  % \invertChords 0 cis:7
  % \invertChords 1 cis:7
  % \invertChords 2 cis:7
  % \invertChords 3 cis:7

}
