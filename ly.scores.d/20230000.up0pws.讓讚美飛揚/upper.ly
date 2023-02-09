upper = \transpose c g \relative c' {

  \meta
  \clef "treble"

  | r2.

  e8 f | g4 g8 f e f4 g8~ | 2. e8 f | g4 c d c8 f,~ | 2.

  d8 e | f4 f8 e d e4 f8~ | 2. d8 e | f4 g a g8 e~ | 2.

  e8 f | g4 g8 f e8 f4 g8~ | g2. e8 f | g4 c8 c d c4 a8~ | 2.

  a8 b | c4 c8 b a b4 c8~ | 2. a8 b | c2 b4. b8 | c4 b c d8

  \relative c'' \repeat unfold 2 {

    g8 | f'4 e8 e4. d4 | d4 e8 e2 g,8 | f'4 e8 e4. d4 | d e8 c2 % 讓...飛舞

    b8 | a4 b8 b c4 d | % 讓...心向

    \alternative {

      \volta 1 {
        % 神敞開
        | e2 e4 f | d1~ | 2. r8
      }

      \volta 2 {
        % 神敞開
        | a2 b | c \fine
      }

    }

  }

}
