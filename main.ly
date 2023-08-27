\version "2.24.2"

% https://lilypond.org/doc/v2.21/Documentation/notation/writing-pitches#relative-octave-entry
% ... middle C with c' ...

meta = {
	\time 4/4
	\tempo 4 = 100
}

ready = {
	\repeat unfold 3 { | <f a c'>4 f f f | }
}

Soprano = \relative c'' {
	| c4. c8 d c a f | f2 d2 | c4. f8 a f c' a | g1 |
	| c4. c8 d c a f | f2 d2 | c4. f8 a g f e | f1 |
	| g4. fis8 g a bes g | a2 c | d4. d8 c a bes a | g1 |
	| c4. c8 d c a f | f2 d | c4. f8 a g f e | f1 |
}

Alto = \relative f' {
	| f4. 8 8 8 8 c | d2 bes | c4. 8 8 8 f8 f | e1 |
	| f4. f8 f f f c8 | d2 bes | a4. c8 f c c c | c1 |
	| e4. dis8 e f! g e | f2 f | f4. f8 f f g f | e1 |
	| f4. f8 f f f c | d2 bes | a4. c8 f c c c | c1 |
}

Tenor = \relative a {
	| a4. a8 bes a c a | bes2 f | a4. 8 8 8 8 c8 | c1 |
	| c4. c8 bes c c a | bes2 f | f4. a8 c bes a g | a1 |
	| c4. c8 c c c c | c2 a | bes4. bes8 c c c c | c1 |
	| c4. c8 bes a c a | bes2 f | f4. a8 c bes a g | a1 |
}

Bass = \relative f {
  | f4. 8 8 8 8 8 | bes,2 2 | f'4. 8 8 8 8 8 | c1 |
	| a'4. a8 bes a f f | bes,2 bes | c4. c8 c c c c | f1 |
	| c4. c8 c c c c | f2 f | bes4. bes8 a f e f | c1 | 
	| a'4. f8 f f f f | bes,2 bes | c4. c8 c c c c | f1 |
}

\book {
	\score {
		{
			\meta
			\ready
			<<
				\Soprano \\
				\Alto \\
				\Tenor \\
				\Bass \\
				{ }
			>>
		}
		\midi {}
	}
	\bookOutputName "What.a.Friend.We.Have.in.Jesus-SATB"
}

\book { \score { { \meta \ready \repeat unfold 4 \Soprano } \midi {} } \bookOutputName "What.a.Friend.We.Have.in.Jesus-Soprano" }
\book { \score { { \meta \ready \repeat unfold 4 \Alto    } \midi {} } \bookOutputName "What.a.Friend.We.Have.in.Jesus-Alto" }
\book { \score { { \meta \ready \repeat unfold 4 \Tenor   } \midi {} } \bookOutputName "What.a.Friend.We.Have.in.Jesus-Tenor" }
\book { \score { { \meta \ready \repeat unfold 4 \Bass    } \midi {} } \bookOutputName "What.a.Friend.We.Have.in.Jesus-Bass" }
