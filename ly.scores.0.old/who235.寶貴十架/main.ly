\version "2.24.0"

\include "../../ly.preamble.ly"

speed = { \tempo \markup \italic "audio in A, sheet in C" 4 = 72 }

prelude = {

  \ottava #1 f8 e d c b4 e | d8 c b a e2 | a8 g f e c a a'4 | g2. \ottava #0 \break

}

main = {

  g,8 f | e2~8 f e d | c2~8 8 d c | a'2~8 g d f | e2 r8 c d c | \break

  | a'4 4. b8 c d | g,4 d'8(c) c2 | r8 a g f e d c d~ | 2 r4 g8 f | \break

  | e2~8 f e d | c2~8 c d c | a'2~8 g d f | e2 r8 c d c | \break

  | a'4 4. b8 c d | g,4 d'8(c) c2 | r8 a b c c a e'(d) | d2 r8 g, c d | \break

  | e4 8. f16 e4 d8 c | b8(a) a4 r4 d8 e | f4. e8 a, b c16 e8(d16) | d2 r8 g, c d | \break

  | e4 8. f16 e4 d8 c | b8. a b8 c4. a8 | g e'4 e16 e f8. e d8 | c1 \fine \break

}

lrc = \lyricmode {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
  \set stanza = "zh_TW"
  主 耶 穌 我 感 謝 你 你 的 身 體 為 我 而 捨
  帶 我 出 黑 暗 進 入 光 明 國 度
    \markup \with-color \colorAttentionOne 使
    \markup \with-color \colorAttentionOne 我
    \markup \with-color \colorAttentionOne 再
    \markup \with-color \colorAttentionTwo 次
    \markup \with-color \colorAttentionTwo 能
    \markup \with-color \colorAttentionTwo 看
    \markup \with-color \colorAttentionTwo 見
  主 耶 穌 我 感 謝 你 你 的 寶 血 為 我 而 流
  寶 貴 十 架 上 醫 治 恩 典 \markup \with-color \colorAttentionOne 湧 流 使 我 完 全 得 自 由
  寶 貴 十 架 的 大 能 賜 我 生 命 主 耶 穌 我 俯 伏 敬 拜 你
  寶 貴 十 架 的 救 恩 是 你 所 立 的 約 你 的 愛 永 遠 不 會 改 變
}

lrckor = \lyricmode {
  % https://www.youtube.com/watch?v=ZKoR2r_ezy8
  % [Description] - [Show more]
  % \override Lyrics.LyricText.font-name = "Source Han Serif KR"
  \override Lyrics.LyricText.font-name = "Noto Sans CJK KR"
  \override Lyrics.LyricText.font-size = \tthzwk
  \set stanza = "ko_KR"
  예 수 님 감 사 해 요
  날 위 해 십 자 가 지 사
  어 둠 가 운 데 방 황 하 던 삶 에
  빛 으 로 비 추 심 을
  예 수 님 감 사 해 요
  날 위 해 보 혈 흘 리 사
  치 유 의 강 물 내 게 흘 러 넘 쳐
  내 게 참 자 유 주 심을
  찬 양 하 리 놀 라 운 주 의 십 자가
  내 게 새 생 명 을 주 셨 네
  변 치 않 는 주 의 사 랑 의 언 약 되 사
  나 에 게 구 원 주 셨 도 다
  찬 양 하 리 놀 라 운 주 의 십 자 가
  내 게 새 생 명 을 주 셨 네
  변 치 않 는 주 의 사 랑 의 언 약 되 사
  나 에 게 구 원 주 셨 도 다
}

\score {
  \relative c''' {
    \speed
    \clef "treble"
    \key c \major
    \numericTimeSignature \time 4/4
    \prelude
    <<
      \main
      \addlyrics \lrc
      \addlyrics \lrckor
    >>
  }
  \layout { }
}

\score {
  \transpose c a'' \relative { \speed \prelude \main }
  \midi { }
}
