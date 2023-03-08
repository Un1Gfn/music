\version "2.24.0"

\include "../../ly.preamble.ly"

speedOne = { \tempo \markup \italic "audio in E, sheet in C" 4 = 90 }
% speedTwo = { \tempo \markup \italic "audio in E, sheet in C" 4 = 116 }

prelude = {
  
  \repeat unfold 2 {
    | r8 g c d e4 g, |
    \volta 1 { | a1 | }
  }
  | a2.

}

main = {
  
  \repeat unfold 2 {
    e8 f | g4 e8(d) c4
    \volta 1 { b8(c) | }
    \volta 2 { b8 c | }
    | \break | c4 a g g8 8 | c4 e g
    \volta 1 { e8(d) | }
    \volta 2 { e8 d | }
    \volta 1 { | c4 e d }
  }

  | c8 d e d d c b d | c2. e8 f |

  \repeat segno 2 {
    {
      \repeat unfold 2 {
        | g4 e8 d c4 b8 c | a8 c f a g2 | a,8 c f a
        \volta 1 { g4 e8 d | \break | c4 d8(e) d4 e8 f | }
      }
      g8 e c4 | \break | c4 d8 8 e4 d | c2. r4 |
    }
    \volta 2 \fine
    \volta 1 {
      % \repeat unfold 4 {
      %   | r4 g(c2) |
      %   \volta 1,3 { | r8 c4(d8 e d c a) | }
      %   \volta 2,4 { | r8 c4(d8 e d c d) | }
      % }
      \repeat unfold 4 {
        | r4 g(c2) | \volta 2 \break | r8 c4(d8 e d c 
        \volta 1,3 { a) | }
        \volta 2 { d) | }
        \volta 4 { d | }
      }
      | c2.) e8 f |
    }
  }

}

lrc = \lyricmode {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
  主 你 使 卑 微 轉 為 尊 貴
  使 傷 心 流 淚 轉 為 笑 顏
  患 難 生 忍 耐 忍 耐 生 老 練
  老 練 生 盼 望 盼 望 不 至 羞 愧
  就 沒 有 失 望
  心 中 充 滿 盼 望 盼 望 使 眼 睛 明 亮
  道 路 雖 崎 嶇 你 與 我 同 行
  心 中 充 滿 盼 望 盼 望 使 信 心 剛 強
  信 靠 每 一 句 應 許 生 命 充 滿 亮 光
  \repeat unfold 8 { Woah. }
  心 中
}

\score {

  \relative c''' {

    \speedOne
    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4

    \ottava #1
    \prelude
    \ottava #0
    <<
      \main \addlyrics \lrc
    >>

  }

  \layout {
    % \set Timing.measureBarType = #""
  }

}

% \score {
%   \transpose c e'' \relative \unfoldRepeats { \speedOne \prelude \main }
%   \midi { }
% }
