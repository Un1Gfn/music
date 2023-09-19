\version "2.24.2"

global = {
  \time 3/4
  \tempo 4 = 80
  \key e \major
   \partial 4.
}

rhhvve = { fis16 e | cis8 gis' fis4. e8 | e4 r8 }

kcsiqr = {
  b8 cis e | e4.
  b8 cis e | fis4 r4
  gis8 \rhhvve
}

xldoqm = {
  e8 gis8 b | cis4.
  cis8 b gis16(fis16) | fis4 r8
  e8 e' dis | cis4.
  cis8 b gis8 | fis4 r8
}

fdgwhm = {
  b8 e e8 | 4.
  e8 8 8 | dis4 r8
  e8 8 8 | 4.
  e8 8 8 | dis4 r8
}

xtkgvu = {
  % <e gis>8 <e b'> gis | a4.
  <gis e>8 <b e,> gis | a4.
  a8 a a | b4 r8
  a8 gis gis | a4.
  a8 a cis | b4 r8
}

gbnefx = {
  b8 cis cis | b4.
  b8 cis e | dis4 r4
  e8 fis16 e | cis8 cis dis4. b8 | b4 r8
}

awiiwa = {
  b8 cis cis | b4.
  b8 cis cis | dis4 r4
  e8 b16 b | cis8 cis dis4. b8 | b4 r8
}

pvfpps = {
  b8 a a | gis4.
  gis8 a a | b4 r4
  % b8 gis16 gis | a8 a b4. a8 | gis4 r8
  b8 gis16 gis | a8 a b4. gis8 | e'
}

cuezxl = { % Jeison
  cis8 8 8 | 4.
  cis8 8 8 | b4 r8
  cis8 8 8 | 4.
  cis8 8 8 | b4 r8
}

gdipvm = { % Jeison
  gis8 a a | gis4.
  gis8 a a | b4 r4
  r4 | r2. | r4 r8
}

ahfthc = {
  b8 a a | gis4.
  gis8 a a | b4 r4
  b8 b16 b | a8 a b4. a8 | gis4 r8
}

ddioxx = {
  gis8 a a | gis4.
  gis8 a a | b4 r4
  b8 gis16 gis | a8 a b4. a8 | gis4 r8
}

\book {

  \score {

    % https://lilypond.org/doc/v2.24/Documentation/learning/satb-vocal-score
    \new ChoirStaff <<

      % \override Score.BarNumber.break-visibility = ##(#t #t #t)

      \new Staff = "SA" \with {
        \consists Merge_rests_engraver
      } <<
        \clef treble
        \new Voice = "Soprano" { \voiceOne \global
          \relative b'  \kcsiqr \break
          \relative b'  \kcsiqr \break
          \relative e'' \xldoqm \break
          \relative b'  \kcsiqr
        }
        \new Voice = "Alto" { \voiceTwo \global
          \relative b \gbnefx \break
          \relative b \awiiwa \break
          \relative b \fdgwhm \break
          \relative b \awiiwa
        }
      >>
      \new Staff = "TB" \with {
        \consists Merge_rests_engraver
      } <<
        \clef bass
        \new Voice = "Tenor" { \voiceOne \global
          r\breve. \break
          r\breve. \break
          \relative cis' \cuezxl \break
          \relative gis  \gdipvm
        }
        \new Voice = "Bass" { \voiceTwo \global
          \relative b,   \ahfthc \break
          \relative gis, \ddioxx \break
          \relative gis, \xtkgvu \break
          \relative b,   \pvfpps
        }
      >>
    >>

    \midi { }

    \layout {
      indent = 0\pt
    }

  }

  % \bookOutputName "In.Christ-M"

}
