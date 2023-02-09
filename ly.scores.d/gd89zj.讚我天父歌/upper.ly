% upper.ly

upper = \fixed c' {

  \meta
  \clef "treble"

  % https://lilypond.org/doc/v2.24/Documentation/notation/inside-the-staff#fingering-instructions
  % <g' ais>8^\markup{\small "24"}
  % <g ais>8^\markup{\small "24"}
  % <ees aes>8^\markup{\small "24"}
  % <d-1 g-3>8

  % \repeat unfold 5 { g,16 r8. }
  | r2. | r2

  % \textMark "A"
  <b,-1 d-2>4 | <b,-1 d-2 g-5>4 4 4 | 2 <d-1 g-3>8 <d-1 a-4> | <d-1 b-5>4 4 4 | 2

  % \textMark "B"
  <d-1 g-2>8 <d-1 b-3> | <g-2 d'-5>4 4 <g-1 d'-4>4 | <g-1 e'-5> <g-1 d'-4> <d-1 b-3> | <g-1 b-3> <fis?-2 a-4>4 4 | 2

  \repeat unfold 2 {
    
    % \textMark "C"
    <g-1 d'-4>8. <g-1 d'-4>16 | <e' g>4 <d' g> <g-2 b-4>8. <d-1 a-3>16 | <d-1 g-2>4 4
    
    \volta 1 {
      % \textMark "D"
      <g-1 d'-4>8. 16 | <g-1 e'-5>4 <g-1 d'-4> <g-1 b-3> <fis?-2 a-4>2
    }
    
    \volta 2 {
      % \textMark "E"
      <d-1 b-4>4 | <e-2 c'-5> <d-1 b-4> <d-1 a-3> | \partial 2 { <b,-1 d-2 g-5>2 } | \bar "|." <c-1 e-3 g-5>2. | <b,-1 d-2 g-5>2. | \fine
    }

  }

}
