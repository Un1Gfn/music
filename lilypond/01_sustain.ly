\version "2.22.1"

\score {
  \relative {
    c''4\sustainOn d e g
    <c, f a>1\sustainOff
    c4\sostenutoOn e g c,
    <bes d f>1\sostenutoOff
    c4\unaCorda d e g
    <d fis a>1\treCorde
  }
  \layout {}
  \midi {}
}
