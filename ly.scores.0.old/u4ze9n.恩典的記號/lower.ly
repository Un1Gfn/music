lower = \fixed c' {

  \set Staff.midiMaximumVolume = #0.7

  \meta
  \clef bass

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
