% lower.ly
% accompaniment
% https://en.wikipedia.org/wiki/accompaniment

% four = \fixed c { \accOne f \accOne bes \accOne c' \accOne f }
four = { \fixed c, { \accOne f \accOne bes \accOne c' \accOne f } }

% lower = \fixed c {
lower = {

  \meta
  \clef bass

  \four
  \repeat unfold 8 {
    \four
  }

}
