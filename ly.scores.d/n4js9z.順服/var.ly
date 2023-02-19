%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      orig      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% http://www.christianstudy.com/data/hymns/text/c4748.html
% 當 我 不 明 白 事 情 的 由 來 信 心 不 足 的 時 候 求 主 幫 助
% 生 命 在 於 你 萬 事 皆 屬 你 信 心 動 搖 的 時 候 我 要 信 靠
% 我 相 信 你 的 意 念 高 過 我 的 意 念 萬 事 互 相 效 力 叫 愛 神 的 人 得 益 處
% 我 相 信 你 的 道 路 高 過 我 的 道 路 我 甘 願 謙 卑 順 服
% 我 相 信 你 的 應 許 倚 靠 你 的 恩 典 我 甘 願 謙 卑 順 服

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% xxxxxx private %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

euznwh = {

  e8 e d16 g16~2 | d8 c c d16 e16~2 |

  | a8 g a g e f16 g16~4 |

}

qmhzaz = { a16 b | c8 c16 }

weeiwh = { d4 r8 d16 c | b8. g b8 c4.. e,16 | g8 }

cpysfw = { f8 e f4. d'4 | }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   xxxx public  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tjui = {
     \euznwh |           f8. e g8   d2 |
  e8 \euznwh | \time 2/4 f8. e g8   | \time 4/4 g2.
}

tjuiL = \lyricmode {
  我 不 明 白 事 情 的 由 來 信 心 不 足 的 時 候 求 主 幫 助
  生 命 在 於 你 萬 事 皆 屬 你 信 心 動 搖 的 時 候 我 要 信 靠
}

jrwz = {
  r8 \textMark "[Chorus]" \qmhzaz c8. a8 \weeiwh f16 f8. e8
  f a g d | f8 e e f16 g4.. \qmhzaz c8 e8. \weeiwh
  \cpysfw |
}

jrwzL = \lyricmode {
  我 相 信 你 的 意 念 高 過 我 的 意 念 萬 事 互 相 效 力 叫 愛 神 的 人 得 益 處
  我 相 信 你 的 道 路 高 過 我 的 道 路 我 甘 願 謙 卑 順
}

yner = { \textMark "[Coda]" \qmhzaz c8 e8. \weeiwh \cpysfw | c1 | }

ynerL = \lyricmode { 我 相 信 你 的 應 許 倚 靠 你 的 恩 典 我 甘 願 謙 卑 順 服 }

all = {

  \textMark \markup { "C" "->" \with-color \colorKeyOne "A" "[Verse]" }

                        | e8  \tjui \jrwz |                   c1  | \section |
  | \textMark "[Verse]" | e,8 \tjui \jrwz | \noteAttentionOne c1~ | \section |  2. \noteAttentionRevert

  \jrwz         | \noteAttentionOne c1 | \section | r2.. \noteAttentionRevert \yner \bar "|."

}

allL = \lyricmode {

  | 當 \tjuiL \jrwzL | 服 |
  | 當 \tjuiL \jrwzL | 服

  \jrwzL | 服 \ynerL |

}
