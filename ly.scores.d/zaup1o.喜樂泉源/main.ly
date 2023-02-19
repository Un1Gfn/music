\version "2.24.0"

\include "../../ly.preamble.ly"

speed = { \tempo \markup \italic "audio in G, sheet in C" 4 = 140 }

prelude = {
  \repeat percent 3 { | c4. b8~2 | a4. b8~2 | } | c4. b2 g8~ | \break | g4 
}

main = {
  c c b |
  \repeat volta 2 {
    \repeat unfold 2 { | d4 c8 b4 c4. | r4 c c \volta 1 b4 } d \break
    | e4 f8 e4 a,4. | r4 c c d | e f8 e4 d4. |
    \alternative {
      \volta 1 { | r4 c c b | \break }
      \volta 2 { | d4 r c8 c b c~ | }
    }
  }
  \PreChorus c2 
  \repeat unfold 2 {
    c4 b8 c~ | c4 g c d | e d
    \volta 1 { c8 a4 g8~ | g2 c8 c b c~ | \break | c2 }
  }
  d8 c a d~ | d1~ | d4 r8 e f e d c | \break
  \repeat volta 2 {
    | a4 d8 8~2 | r4. e8 f e d c | g4 e8 g4 d' c8~ | c4 r8 c c4 b | a b8 c8~2 | \break
    \alternative {
      \volta 1 { | g4 b8 c4 d4. | e4 f8 d8~2 | r4. e8 f e d c | }
      \volta 2 { | e4 f a,8 b4 c8~ | c1 | \fine }
    }
  }
}

% https://lilypond.org/doc/v2.24/Documentation/notation/techniques-specific-to-lyrics#lyrics-and-repeats
% http://www.christianstudy.com/data/hymns/text/c3382.html
lrc = \lyricmode {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
  你 是 我
  <<
    { 喜 樂 泉 源 你 使 我 歡 欣 跳 躍 你 使 我 自 由 飛 翔 不 再 被 罪 惡 捆 綁 }
    \new Lyrics {
      % \set associatedVoice = "melody"
      \override Lyrics.LyricText.font-name = \clgtqs
      \override Lyrics.LyricText.font-size = \tthzwk
      永 生 盼 望 你 愛 有 無 比 力 量 從 今 時 直 到 永 遠 你 應 許 不 會 改 變
    }
  >>
  你 是 我 \skip 2
  你 的 寶 血 有 能 力 能 醫 治 一 切 的 傷 口
  你 的 復 活 能 改 變 一 切 的 咒 詛 成 為 祝 福
  我 們 要 高 舉

  <<
    { 你 聖 名 你 配 得 所 有 最 大 的 讚 美 我 們 要 用 全 心 }
    \new Lyrics {
      \override Lyrics.LyricText.font-name = \clgtqs
      \override Lyrics.LyricText.font-size = \tthzwk
      你 來 臨 願 你 來 設 立 寶 座 在 這 裡 我 們 要 張 開 口
    }
  >>

  和 全 意 來 敬 拜 你 我 們 要 歡 迎

  不 停 讚 美 你
}

\score {

  \new Staff \relative c'' {

    \speed
    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4

    % \ottava #1
    \prelude
    % \ottava #0

    <<
      \new Voice = "melody" \main
      \new Lyrics \lyricsto "melody" \lrc
    >>

  }

  \layout { }

}

% \score {
%   \transpose c g'' \relative \unfoldRepeats { \speed \prelude \main }
%   \midi { }
% }
