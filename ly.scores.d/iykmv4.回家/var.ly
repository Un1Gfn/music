%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      orig      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% http://www.christianstudy.com/data/hymns/text/c4298.html
% 親 愛 耶 穌 我 感 謝 你 來 到 這 世 界
% 給 我 昐 望 給 我 一 個 永 恆 的 家
% 親 愛 天 父 輕 聲 喚 我 回 到 祂 面 前
% 不 再 流 浪 我 看 到 家 的 光 
% 回 家 回 家 回 到 永 恆 愛 的 家 
% 喜 樂 充 滿 我 的 心 我 不 住 讚 美
% 回 家 回 家 回 到 永 恆 愛 的 家 
% 天 父 張 開 愛 的 雙 臂 我 一 生 屬 於 祂

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% xxxxxx private %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vfsugw = { f8 | e8. e e8 d e16 f8. e8 | d8(c) c b16 c~4 r8 c8 | a8 b16 c8. g8 f' }

bbjjdk = { e8(f) | g4 e8(f) g4 e8 d | c b c d e4. c8 | a' g16 f8. a8 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   xxxx public  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% srcn = {
%   \textMark "[Prelude]"
%   | e2 d c | e2 2 |
%   | e2 d c | e2 d8 g, c d |
%   | e2 d c | e2 d4. a8 | f'2. e8 d | c2.
% }

oqjy  = { \textMark "[Verse]" g'8 \vfsugw e16 d8. c8 | c4 e8(d) d4 g8 \vfsugw e8 d c16 c~ | c2. }
oqjyL = \lyricmode {
  親 愛 耶 穌 我 感 謝 你 來 到 這 世 界
  給 我 昐 望 給 我 一 個 永 恆 的 家
  親 愛 天 父 輕 聲 喚 我 回 到 祂 面 前
  不 再 流 浪 我 看 到 家 的 光
} 

ovxz = { \bbjjdk g8(e) c c | e d c d4. \bbjjdk g8 e c c | e4 d c b8 c~ | c2. }
ovxzL = \lyricmode {
  回 家 回 家 回 到 永 恆 愛 的 家 
  喜 樂 充 滿 我 的 心 我 不 住 讚 美
  回 家 回 家 回 到 永 恆 愛 的 家 
  天 父 張 開 愛 的 雙 臂 我 一 生 屬 於 祂
}

allLayout = \relative c'' {

  % Plan A0
  % \srcn

  % Plan A1
  \skip 2.
  \textMark \markup { "C" "->" \with-color \colorKeyOne "D" "[a cappella]" }
  \ovxz

  \oqjy \textMark "[Chorus]" \ovxz
  \oqjy \textMark "[Chorus]" \ovxz

  \textMark \markup { \with-color \colorKeyOne "D" "->" \with-color \colorKeyTwo "F" "[Chorus]" }

                             \ovxz
        \textMark "[Chorus]" \ovxz
  \oqjy

}

allLrc = \lyricmode {

         \ovxzL
  \oqjyL \ovxzL
  \oqjyL \ovxzL
         \ovxzL
         \ovxzL
  \oqjyL

}

allMIDI = {
  \transpose c d \relative c'' {
    g4 f4 e8e                  \ovxz
    \oqjy \textMark "[Chorus]" \ovxz
    \oqjy \textMark "[Chorus]" \ovxz
  }
  \transpose c f \relative c' {
                               \ovxz
          \textMark "[Chorus]" \ovxz
    \oqjy
  }
}
