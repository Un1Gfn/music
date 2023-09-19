\version "2.24.2"

global = {
  \time 3/4
  \tempo 4 = 80
  \key e \major
   \partial 4.
}

rhhvve = { fis16 e | cis8 gis' fis4. e8 | e4 r8 }

kcsiqr = {
  cis8 e | e4.
  b8 cis e | fis4. r8
  gis8 \rhhvve
}

xldoqm = {
  e8 gis8 b | cis4.
  cis8 b gis16(fis16) | fis4 r8
  e8 e' dis | cis4.
  cis8 b gis8 | fis4 r8
}

fdgwhm = {
  e8 e8 | 4.
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
  b8 cis e | dis4. r8
  e8 fis16 e | cis8 cis dis4. b8 | b4 r8
}

awiiwa = {
  b8 cis cis | b4.
  b8 cis cis | dis4. r8
  e8 b16 b | cis8 cis dis4. b8 | b4 r8
}

pvfpps = {
  b8 a a | gis4.
  gis8 a a | b4. r8
  b8 gis16 gis | a8 a b4. a8 | gis4 r8
}

cuezxl = { % JeisonCubillos
  cis8 8 8 | 4.
  cis8 8 8 | b4 r8
  cis8 8 8 | 4.
  cis8 8 8 | b4 r8
}

gdipvm = { % JeisonCubillos
  gis8 a a | gis4.
  gis8 a a | b4. r8
  gis'8 \rhhvve
}

ahfthc = {
  b'8 a a | gis4.
  gis8 a a | b4. r8
  b8 b16 b | a8 a b4. a8 | gis4 r8
}

ddioxx = {
  gis8 a a | gis4.
  gis8 a a | b4. r8
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
        \new Voice = "Soprano" \relative b { \voiceOne \global
          b8 \kcsiqr \break
          b8 \kcsiqr \break
          \xldoqm \break
          b,8 \kcsiqr
        }
        \new Voice = "Alto" \relative b { \voiceTwo \global
          \gbnefx \break % b8 \kcsiqr \break
          \awiiwa \break % b8 \kcsiqr \break
          <e b>8 \fdgwhm
          \awiiwa % \sabwgp
        }
      >>
      \new Staff = "TB" \with {
        \consists Merge_rests_engraver
      } <<
        \clef bass
        \new Voice = "Tenor" \relative b, { \voiceOne \global
          \ahfthc \break
          \ddioxx \break
          \xtkgvu \break
          \pvfpps \break
        }
        \new Voice = "Bass" \relative b, { \voiceTwo \global
          b8 \kcsiqr \break
          b8 \kcsiqr \break
          \cuezxl \break
          \gdipvm \break
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
