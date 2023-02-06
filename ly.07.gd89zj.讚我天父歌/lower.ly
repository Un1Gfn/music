% lower.ly

lower = \fixed c {

  \meta
  \clef "bass"

  | r2. | r2

  g4-1 | g4-1 d-2 b,-3 | g,2-5 b8-2 <c'-1 a-3> | <b-2 g-4>4 <g-1 d-3> <g-1 b,-4> | <g-1 g,-5>2

  <b-1 g-3>8 8 | 4 4 4 | <c'-1 g-3> <b-1 g-3> g-3 | <d'-1 d-5>4 4 4 | 2

  \repeat unfold 2 {

    <b-1 g,-5>8.\tweak font-size -3 _"(g)" 16 | <c'-1 c-5>4 <b-2 g-4> <d'-1 g-4>8. <c'-1 g-4>16 | <b-2 g-4>4

    \alternative {

      \volta 1 { <b-2 g-4>4 <b-2 g-4>8. 16 | <c'-1 c-5>4 <b-2 g-4> <d'-1 g-4> | <d'-1 d-5>2 }

      \volta 2 { <b-1 g-2>4 g4-2 | <g-2 c-5>4 <g-2 d-4> <c'-1 d-4> | \partial 2 { <g-1 g,-5>2 } | \bar "|." | <c'-1 c-5>2. | <b-1 g-2>2. | \fine }

    }

  }

}
