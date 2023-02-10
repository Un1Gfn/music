\version "2.24.0"

#(set-global-staff-size 26)

meta = {
  \tempo 4 = 152
  \time 4/4
  \key g \major
}

\include "upper.ly"

\score {
  \new ChoirStaff <<
    \new Staff {
      \new Voice = "melody" \upper
    }
    \addlyrics {
      \override Lyrics.LyricText.font-name = "Noto Sans CJK TC"
      \override Lyrics.LyricText.font-size = #-2
      门 复 关 _
    }
  >>
  \layout {
    \context {
      \Score
      % \override DynamicText.direction = #UP
      % \override DynamicLineSpanner.direction = #UP
    }
  }
  \midi { }
}
