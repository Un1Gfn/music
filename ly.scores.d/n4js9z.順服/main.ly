\version "2.24.0"

\include "../../ly.preamble.ly"

\include "var.ly"

speed = { \tempo \markup \italic "audio in A, sheet in C" 4 = 113 }
% speed = { \tempo \markup \italic "audio in A, sheet in C" 4 = 72 }

% https://lilypond.org/doc/v2.24/Documentation/notation/techniques-specific-to-lyrics#lyrics-and-repeats
% http://www.christianstudy.com/data/hymns/text/c3382.html
% lrc = \lyricmode {
%   \override Lyrics.LyricText.font-name = \clgtqs
%   \override Lyrics.LyricText.font-size = \tthzwk
%   你 是 我
%   <<
%     { 喜 樂 泉 源 你 使 我 歡 欣 跳 躍 你 使 我 自 由 飛 翔 不 再 被 罪 惡 捆 綁 }
%     \new Lyrics {
%       % \set associatedVoice = "melody"
%       \override Lyrics.LyricText.font-name = \clgtqs
%       \override Lyrics.LyricText.font-size = \tthzwk
%       永 生 盼 望 你 愛 有 無 比 力 量 從 今 時 直 到 永 遠 你 應 許 不 會 改 變
%     }
%   >>
%   你 是 我 \skip 2
%   你 的 寶 血 有 能 力 能 醫 治 一 切 的 傷 口
%   你 的 復 活 能 改 變 一 切 的 咒 詛 成 為 祝 福
%   我 們 要 高 舉

%   <<
%     { 你 聖 名 你 配 得 所 有 最 大 的 讚 美 我 們 要 用 全 心 }
%     \new Lyrics {
%       \override Lyrics.LyricText.font-name = \clgtqs
%       \override Lyrics.LyricText.font-size = \tthzwk
%       你 來 臨 願 你 來 設 立 寶 座 在 這 裡 我 們 要 張 開 口
%     }
%   >>

%   和 全 意 來 敬 拜 你 我 們 要 歡 迎

%   不 停 讚 美 你
% }

\score {

  \new Staff \relative c' {

    \speed
    \clef "treble"
    \key c \major

    \numericTimeSignature \time 4/4
    \all

    % <<
      % \new Voice = "melody" \main
      % \new Lyrics \lyricsto "melody" \lrc
    % >>

  }

  \layout { }

}

\score {
  \new Staff {
    \speed
    \transpose c a \relative {
      % e:7
      \transpose c c, \chordmode { | c2 f g:7 | \invertChords 1 c | }
      \all
    }
  }
  \midi { }
}
