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
lilypond ... -e '(define-public qihocu "$(ID).$(TITLE)")' ...
\header {
  pdftitle = \qihocu
  title = \markup { \override #'((font-name . "Noto Sans CJK TC") (font-size . 6)) \qihocu }
  tagline = ##f
}

% https://music.stackexchange.com/questions/120916/how-do-i-change-the-lilypond-title-font
% https://lilypond.org/doc/v2.22/Documentation/snippets/text#text-formatting-lyrics-syllables
\markup attention = \markup \with-color #red \etc
\markup \attention how \markup \attention are \markup \attention you

% https://lilypond.org/doc/v2.24/Documentation/notation/input-modes
\chordmode \chords % \new ChordNames
\drummode
\figuremode
\lyricmode
\markup
\notemode

\lyricmode {
  \override Lyrics.LyricText.font-name = "Noto Sans CJK TC"
  \override Lyrics.LyricText.font-size = #-2
  ...
}

% https://lilypond.org/doc/v2.24/Documentation/internals/all-layout-objects
% https://lilypond.org/doc/v2.24/Documentation/learning/visibility-and-color-of-objects
% https://lilypond.org/doc/v2.24/Documentation/notation/inside-the-staff#coloring-objects
% https://lilypond.org/doc/v2.24/Documentation/notation/list-of-colors
% https://lilypond.org/doc/v2.24/Documentation/notation/the-override-command#index-_005crevert-1
\override NoteHead.color = "brown"
\override Stem.color = "brown"
\override Beam.color = "brown"
\revert NoteHead.color
\revert Stem.color
\revert Beam.color

% https://lilypond.org/doc/v2.24/Documentation/snippets/text#text-adding-a-qr-code
...

demo = \drummode {
  r4.
  % short
  r hh hhp
  r ss ssh ssl
  r sne sna sn
  r tomh toml
  r bd
  % long
  % r hho hhho
  % r cymr cymc
}

% sublime text add spaces
% find    % ([^ ])([^ ])
% replace % \1 \2

% https://lilypond.org/doc/v2.24/Documentation/notation/skipping-corrected-music
showLastLength = R1*5
showFirstLength = R1*5

% https://lilypond.org/doc/v2.24/Documentation/notation/special-rhythmic-concerns#aligning-to-cadenzas
% https://lilypond.org/doc/v2.24/Documentation/notation/techniques-specific-to-lyrics#lyrics-and-repeats
% http://www.christianstudy.com/data/hymns/text/c3382.html
lrc = \lyricmode {
  \skip #(mmrest-of-length prelude)
  beginning
  <<
    { stanza1 }
    \new Lyrics {
      \set associatedVoice = "..."
      stanza2
    }
  >>
  ending
}

% https://lilypond.org/doc/v2.23/Documentation/notation/chord-mode#extended-and-altered-chords
% https://lilypond.org/doc/v2.23/Documentation/notation/chord-mode#chord-inversions-and-specific-voicings
% <<a,,:5 a,>>
% \invertchords
% \set minimumFret
% \set maximumFretStretch
% \unset maximumFretStretch

