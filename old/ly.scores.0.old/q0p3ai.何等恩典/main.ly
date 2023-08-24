\version "2.24.0"

\include "../../ly.preamble.ly"

speed = { \tempo \markup \italic "audio in G, sheet in C" 4 = 70 }
% speed = { \tempo \markup \italic "audio in G, sheet in C" 4 = 132 }

percussion = \drummode {
  \speed
  \repeat unfold 2 { bd4 hh hh hh }
}

upper = {

  { c8 d } | e4. d8 c4 c8 b | c4 b8 a g2 | a4 b8 c g4. g8 | a4 e'8(d) d4 c8 d | \break

  | e4. d8 c4 c8 b | c4 b8 a g4. g8 | a4 f'8[e d c c b] | c2 r8 g e' d | \break

  \repeat segno 2 {

    | c4. c8 c d16 e8. c8 | a2 r8 a f' e | d4. c8 b c d16 e8. | d2 r8 g, g' f | \break

    | e4. c8 c d e g | g \noteAttentionOne f f \noteAttentionTwo e \noteAttentionRevert c4 c8 d | e4. e8 d c c(b) | c1 | \volta 2 \fine \break

    \volta 1 { | \Bridge | g8 16 8. 2 8 | a8 16 8. f8~2 | a8 16 8. 2 c8 | c8. b a8 g2 | \break

    | e'8 16 8. 2 8 | e8. d c8 c4 c8 d | e4. e8 d c c b | c2 r8 g e' d | } \break

  }

}

% https://mojim.com/twy219275x14x3.htm
lrc = \lyricmode {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
  % [Verse]
  以 真 誠 的 心 降 服 在 祢 面 前
  開 我 心 眼 使 我 看 見
  以 感 恩 的 心 領 受 生 命 活 水
  從 祢 而 來 的 溫 柔 謙 卑
  % [Chorus]
  何 等 恩 典 祢 竟 然 在 乎 我
  何 等 恩 典 祢 寶 血 為 我 流
  何 等 恩 典 祢 以 尊 貴 榮 耀
    \markup \with-color \colorAttentionOne 為
    \markup \with-color \colorAttentionOne 我
    \markup \with-color \colorAttentionTwo 冠
    冕
  我 的 嘴 必 充 滿 讚 美
  % [Bridge]
  祢 已 挪 去 我 所 有 枷 鎖
  祢 已 挪 去 我 所 有 重 擔
  祢 已 挪 去 我 所 有 傷 悲
  祢 的 名 配 得 所 有
    \markup \with-color \colorAttentionOne 頌
    讚
  何 等 恩
}

\score {
  \relative c'' {
    \speed
    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4
    <<
      { | \partial 4 \upper }
      \addlyrics \lrc
    >>
  }
  \layout { }
}

\score {
  \new Staff <<
    \new Staff \transpose c g' \relative \unfoldRepeats { \speed | r4 <e c g>2 \upper }
    \new DrumStaff { \speed \percussion }
  >>
  \midi { }
}
