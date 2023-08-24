% access variables from ly.script.lilypond.sh
#(use-modules (guile-user))

% https://lilypond.org/doc/v2.24/Documentation/notation/paper-size-and-automatic-scaling
#(set-default-paper-size "a3landscape")
#(set-global-staff-size 28)

% https://lilypond.org/doc/v2.24/Documentation/notation/list-of-colors
colorFade = "gray"
colorAttentionOne = "brown"
colorAttentionTwo = "darkmagenta"
colorKeyOne = "darkgoldenrod"
colorKeyTwo = "blue"

% \markup markupAttentionOne = \markup \with-color \colorAttentionOne \etc
% \markup markupAttentionTwo = \markup \with-color \colorAttentionTwo \etc

fbFade = {
  % \override ChordName.color = \colorFade
  \override FretBoard.color = \colorFade
}

fbRevert = {
  % \revert ChordName.color
  \revert FretBoard.color
}

lrcfont = {
  \override Lyrics.LyricText.font-name = \clgtqs
  \override Lyrics.LyricText.font-size = \tthzwk
}

noteAttentionOne = {
  \override Rest.color      = \colorAttentionOne % grob-interface
  \override NoteHead.color = \colorAttentionOne
  \override Stem.color     = \colorAttentionOne
  \override Beam.color     = \colorAttentionOne
  \override Tie.color      = \colorAttentionOne % grob-interface
  % \override Slur.color = \colorAttentionOne % grob-interface
  % \override PhrasingSlur.color = \colorAttentionOne % grob-interface
}

noteAttentionTwo = {
  \override Rest.color     = \colorAttentionTwo % grob-interface
  \override NoteHead.color = \colorAttentionTwo
  \override Stem.color     = \colorAttentionTwo
  \override Beam.color     = \colorAttentionTwo
  \override Tie.color      = \colorAttentionTwo
}

noteAttentionRevert = {
  \revert Rest.color
  \revert NoteHead.color
  \revert Stem.color
  \revert Beam.color
  \revert Tie.color
}

\header {
  title = \markup { \override #'((font-name . "Noto Sans CJK TC") (font-size . 3)) \qihocu }
  tagline = ##f
}

% \markup vcb = \markup \with-font-size #-5 \etc

% % http://lilypond.org/doc/v2.24/Documentation/extending/new-markup-command-definition
% % https://lilypond.org/doc/v2.24/Documentation/notation/predefined-type-predicates
% % #(define-markup-command (vcb layout props x) (markup?)
% #(define-markup-command (vcb layout props x) (string?)
%   (interpret-markup layout props
%     #{\markup \override #'(font-size . -5) #x #}))

Verse = {
  \section \sectionLabel \markup { \fontsize #-5 "[Verse]" }
}

PreChorus = {
  \section \sectionLabel \markup { \fontsize #-5 "[Pre-Chorus]" }
}

Chorus = {
  \section \sectionLabel \markup { \fontsize #-5 "[Chorus]" }
}

Bridge = {
  \section \sectionLabel \markup { \fontsize #-5 "[Bridge]" }
}
