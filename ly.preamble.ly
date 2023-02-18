% access variables from ly.script.lilypond.sh
#(use-modules (guile-user))

% https://lilypond.org/doc/v2.24/Documentation/notation/paper-size-and-automatic-scaling
% #(set-default-paper-size "a5")
% #(set-default-paper-size "a5landscape")
% #(set-default-paper-size "a3landscape")
#(set-default-paper-size "a4portrait")
#(set-global-staff-size 23)

colorFade = "gray"
colorAttentionOne = "brown"
colorAttentionTwo = "darkmagenta"
% colorAttentionTwo = "purple"

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

noteAttentionOne = {
  \override NoteHead.color = \colorAttentionOne
  \override Stem.color = \colorAttentionOne
  \override Beam.color = \colorAttentionOne
}

noteAttentionTwo = {
  \override NoteHead.color = \colorAttentionTwo
  \override Stem.color = \colorAttentionTwo
  \override Beam.color = \colorAttentionTwo
}

noteAttentionRevert = {
  \revert NoteHead.color
  \revert Stem.color
  \revert Beam.color
}

\header {
  % title = \markup { \override #'((font-name . "Noto Sans CJK TC") (font-size . 3)) \qihocu }
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
