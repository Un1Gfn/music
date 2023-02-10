\version "2.24.0"
#(use-modules (guile-user))
#(set-global-staff-size 26)

upper = {
  
  \tempo 4 = 110
  \time 4/4
  \clef "treble"
  \key c \major

  \ottava #1 | r2 r8 c'8 e f | g4 8 c b g f g~ | 2 r8 c, e f | g4 f8 e d b f' e~ | 2 r8 \ottava #0 e, a b \break

  c4. c8 c b a g | a4. a8 g f e g | f4 e d c | d1 | g,8 g c d e g c g' | d1 | \break

  \repeat volta 2 {

    e,4 e e g | g e d r | c b c a' | g e g r | a g f f | \break

    g e c r | \alternative { \volta 1 { | f e d c | a e' d r | } \volta 2 { | f e d c | d2 e4 d | } }

  } | \break

  c1~ | 2 r8 \section \sectionLabel "[Chorus]" \repeat unfold 2 { g8 c d | \volta 2 { \break } | e4 g8 g g4 e | \alternative { \volta 1 { d4 g g d } \volta 2 {d4 g8 g d4 d} } | c c8 b c4 a' |  \volta 1 { \break }

  g e g r | \volta 2 { \break } | a4 a8 g a4 a | g e8 d c4 r | f e d c | \volta 1 { | a e' d8 } }

  | d2 e4 d | c1 \fine

}

\header {
  % title = \markup { \override #'((font-name . "Noto Sans CJK TC") (font-size . 3)) \qihocu }
}

\score {
  \relative c' \upper
  \layout { }
}

\score {
  \transpose c e' \relative \unfoldRepeats \upper
  \midi { }
}
