\version "2.24.0"

\include "../../ly.preamble.ly"

cautionOne = {
  d4
  \override NoteHead.color = \colorAttentionOne
  \override Stem.color = \colorAttentionOne
  \override Beam.color = \colorAttentionOne
  g8 g
  \override NoteHead.color = \colorAttentionTwo
  \override Stem.color = \colorAttentionTwo
  \override Beam.color = \colorAttentionTwo
  d4
  \revert NoteHead.color
  \revert Stem.color
  \revert Beam.color
  d
}

speed = { \tempo \markup \italic "audio in E, sheet in C" 4 = 110 }

prelude = {

  \ottava #1 | r2 r8 c'8 e f | g4 8 c b g f g~ | 2 r8 c, e f | g4 f8 e d b f' e~ | 2 r8 \ottava #0 e, a b \break

  c4. c8 c b a g | a4. a8 g f e g | f4 e d c | d1 | g,8 g c d e g c g' | d1 | \break

}

main = {

  \repeat volta 2 {

    e,4 e e g | g e d r | c b c a' | g e g r | a g f f | \break

    g e c r | \alternative { \volta 1 { | f e d c | a e' d r | } \volta 2 { | f e d c | d2 e4 d | } }

  } | \break

  c1~ | 2 r8 \repeat unfold 2 { g8 c d | \volta 1 { \section \sectionLabel \markup { \fontsize #-5 "[Chorus]" } } \volta 2 { \break } | e4 g8 g g4 e | \alternative { \volta 1 { d4 g g d } \volta 2 { \cautionOne } } | c c8 b c4 a' |  \volta 1 { \break }

  g e g r | \volta 2 { \break } | a4 a8 g a4 a | g \volta 1 { e8(d) } \volta 2 { e8 d } c4 r | f e d c | \volta 1 { | a e' d8 } }

  | d2 e4 d | c1 \fine

}

lrcOne = \lyricmode {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
  \set stanza = "1. "
  謝 謝 你 璨 爛 笑 容 照 亮 我 的 天 _ 空 謝 謝 你 分 
  享 心 情 把 我 放 在 你 心 中 我 的 生 命 從 此 美 
  麗 當 你 被 花 朵 包 圍 盡 情 歡 欣 我 帶 春 風 使 你
  舞 其 中 當 你 正 走 在 坎 坷 路 我 會 伴 你 在 左 右 一 起 向 
  藍 天 歡 呼 向 白
  \markup \with-color \colorAttentionOne 雲
  \markup \with-color \colorAttentionOne 招
  \markup \with-color \colorAttentionTwo 手
  我 們 要 一 起 笑 一 起 哭
  千 萬 人 中 有 個 人 懂 我 你 有 最 珍 貴 的 角 落 
}

lrcTwo = \lyricmode {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
  \set stanza = "2. "
  夜 裡 有 時 為 寒 冷 你 我 生 根 同 暖 土 友 情 是 最 
  亮 的 星
}

\score {

  \relative c' {

    \speed
    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4

    \prelude
    <<
      \main \addlyrics \lrcOne \addlyrics \lrcTwo
    >>

  }

  \layout { }

}

\score {
  \transpose c e'' \relative \unfoldRepeats { \speed \prelude \main }
  \midi { }
}
