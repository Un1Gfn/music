drumPitchNames.o=#'bassdrum
drumPitchNames.x=#'hihat

% https://extending-lilypond.readthedocs.io/en/latest/music.html#argument-type-checking

n = #(define-music-function (x) (ly:duration?) #{ \drummode { hithat  $x } #})

% https://en.wikipedia.org/wiki/Chord_notation
% https://en.wikipedia.org/wiki/Chord_(music)#Symbols
% https://lilypond.org/doc/v2.24/Documentation/snippets/chords
% https://lilypond.org/doc/v2.24/Documentation/notation/displaying-chords
% https://lilypond.org/doc/v2.24/Documentation/notation/chord-notation
% https://lilypond.org/doc/v2.24/Documentation/notation/figured-bass
accOne =
#(define-music-function
    (x         y         z        )
    (ly:music? ly:music? ly:music?)
  #{
    $y r8
    $z r8
    $x r8
    $z r8
  #})

% https://lists.gnu.org/archive/html/lilypond-user/2023-01/msg00478.html
accTwo =
#(define-music-function (x) (ly:pitch?) #{ 
  \transpose c $x {
    c8 r <e g> r
    g, r <e g> r
  }
#})

% https://lilypond.org/doc/v2.24/Documentation/notation/setting-the-staff-size
#(set-global-staff-size 26)
\layout { #(layout-set-staff-size 26) }

% https://lilypond.org/doc/v2.24/Documentation/notation/paper-size-and-automatic-scaling
#(set-default-paper-size "a4" 'landscape)
#(set-default-paper-size "a4landscape" )

% https://lilypond.org/doc/v2.24/Documentation/notation/controlling-midi-dynamics#setting-midi-volume
\set Staff.midiMaximumVolume = #0.8

% https://lilypond.org/doc/v2.23/Documentation/notation/bars
% http://lilypond.org/doc/v2.24/Documentation/internals/tunable-context-properties
\set Timing.measureBarType = #""

% https://lilypond.org/doc/v2.24/Documentation/notation/using-midi-instruments
\set Staff.midiInstrument = "acoustic guitar (nylon)" 
\set Staff.midiInstrument = "acoustic guitar (steel)"
\set Staff.midiInstrument = "electric guitar (clean)"
\set Staff.midiInstrument = "electric guitar (jazz)"
\set Staff.midiInstrument = "electric guitar (muted)"
\set Staff.midiInstrument = "guitar harmonics"
\set Staff.midiInstrument = "glockenspiel"
\set Staff.midiInstrument = "marimba"

% http://lilypond.org/doc/v2.22/Documentation/notation/creating-titles-headers-and-footers
\header { tagline = ##f }

\numericTimeSignature
\time 4/4

% https://lists.gnu.org/archive/html/lilypond-user/2023-02/msg00169.html
startpitch = c''
score = {
  \relative \startpitch { d c }   % section 1
  \relative \startpitch { d'' e } % section 2
}

% https://lilypond.org/doc/v2.22/Documentation/learning/staff-groups
% https://lilypond.org/doc/v2.22/Documentation/learning/solo-piano
\new PianoStaff \with { instrumentName = "Piano" }
<<
  \new Staff = "lower" { ... }
  \new Staff = "upper" { ... }
>>

% https://lilypond.org/doc/v2.24/Documentation/notation/writing-rhythms#tuplets
\tuplet 3/2 { g8 g8 a8 }

<b-1 g,-5>8.\tweak font-size -3 _"(g)"

% https://lilypond.org/doc/v2.24/Documentation/notation/inside-the-staff#fingering-instructions
<g' ais>8^\markup{\small "24"}
<g ais>8^\markup{\small "24"}
<ees aes>8^\markup{\small "24"}
<d-1 g-3>8

% https://lilypond.org/doc/v2.23/Documentation/notation/bars#bar-numbers
\layout { \override Score.BarNumber.break-visibility = ##(#t #t #t) }

% https://lilypond.org/doc/v2.24/Documentation/notation/long-repeats#written_002dout-repeats
% https://lilypond.org/doc/v2.24/Documentation/notation/using-repeats-with-midi
\unfoldRepeats \repeat volta 2 { ... }

\resetRelativeOctave d''

% https://lilypond.org/doc/v2.23/Documentation/notation/long-repeats#other-variation-in-repeated-sections
% AlternativeBlock.Within conflict
% AlternativeBlock.Ending ok
\repeat volta 2 \relative d'' {}
% AlternativeBlock.Within ok
% AlternativeBlock.Ending ok
\repeat unfold 2 \relative d''' {}

% https://lilypond.org/doc/v2.24/Documentation/notation/writing-text
% https://lilypond.org/doc/v2.24/Documentation/learning/adding-text

% https://lilypond.org/doc/v2.24/Documentation/learning/advanced-rhythmic-commands#partial-measure
% https://lilypond.org/doc/v2.24/Documentation/music-glossary/anacrusis
| \partial 8 g16g |

% https://lilypond.org/doc/v2.24/Documentation/notation/displaying-pitches#ottava-brackets
% raise an octave / 8va
\ottava #1 ... \ottava #0
  
% https://lilypond.org/doc/v2.23/Documentation/notation/writing-rhythms#durations
r\maxima r\longa r\breve r1 r2 r4 r8 r16 r32 r64 r128

% https://lilypond.org/doc/v2.24/Documentation/notation/creating-titles-headers-and-footers
% https://lilypond.org/doc/v2.24/Documentation/extending/lilypond-variables
% https://lilypond.org/doc/v2.24/Documentation/usage/command_002dline-usage#basic-command-line-options-for-lilypond
% https://music.stackexchange.com/questions/120916/how-do-i-change-the-lilypond-title-font
lilypond ... -e '(define-public qihocu "$(ID).$(TITLE)")' ...
\header {
  pdftitle = \qihocu
  title = \markup { \override #'((font-name . "Noto Sans CJK TC") (font-size . 6)) \qihocu }
  tagline = ##f
}
