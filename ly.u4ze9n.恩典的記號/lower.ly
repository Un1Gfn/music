% lower.ly
% accompaniment
% https://en.wikipedia.org/wiki/accompaniment

lower = \fixed c' {

  % https://lilypond.org/doc/v2.24/Documentation/notation/controlling-midi-dynamics#setting-midi-volume
  \set Staff.midiMaximumVolume = #0.7

  % https://lilypond.org/doc/v2.24/Documentation/notation/using-midi-instruments
  % \set Staff.midiInstrument = "acoustic guitar (nylon)" 
  % \set Staff.midiInstrument = "acoustic guitar (steel)"
  % \set Staff.midiInstrument = "electric guitar (clean)"
  % \set Staff.midiInstrument = "electric guitar (jazz)"
  % \set Staff.midiInstrument = "electric guitar (muted)"
  % \set Staff.midiInstrument = "guitar harmonics"
  

  \meta
  \clef bass

  % \repeat unfold _

  % \partial 8 r8
  \M g

  % slash test
  % \M d \sce d \M d \scg d
  % \M d \sce d \M d \scg d
  % \M d \sce d \M d \scg d

  \unfoldRepeats \repeat volta 2 {

    \M d \M g
    
    \M d | \sfA a \sfB a \MC a

    \sceD d |

    \alternative {

      \volta 1 {

        \M g

        \MA d \sceB a \mC b,

        \mD b, | \mA e \mB e \MC e \MD e | \sfA a \sfB a \viiC a

        \viiD a |

      }

      \volta 2 {

        \M g

        \MA d \sceB a \mC b,

        \mD b, | \mA e \mB e \sfC a \MD a | \sfA d \sfB d \viiC d

        \viiD d |

      }

    }

  }

  \unfoldRepeats \repeat volta 2 {


    \MA g \MB g

    \MC g \MD a | \M d

    \M g

    \scgA d \scgB d \MC a

    \sceD d | \M g |

    \MA d \sceB a \mC b,

    \mD fis, |

    \alternative {

      \volta 1 {
        % \A \B \C \D
        \sfA e \sfB e \sceC e \sceD e | \sfA a \sfB a
        \MC a \sceD d |
      }

      \volta 2 {
        % \A \B \C \D
        \mA e \mB e \viiC a \viiD a | \end d
      }

    }

  }


}
