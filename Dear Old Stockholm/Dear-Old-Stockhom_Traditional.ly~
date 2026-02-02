\version "2.24.3"

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = "Dear Old Stockhom"
  composer = "Traditional"
  arranger = "Arr: Miles Davis"
  subtitle = "'Ack Värmeland, du sköna'"
  tagline = \markup {"L.S. " \today }
}

theNotes = \relative c' {
  \accidentalStyle modern-cautionary
  \set Staff.midiInstrument = "flute"
  % \set Score.startRepeatBarType = #"[|:"
  % \set Score.endRepeatBarType = #":|]"

  \key f \major
  \section
  \sectionLabel "Introduction"

  \repeat volta 2 {
    \repeat percent 2 {
      r4_"1. Piano + Rhythm 2. Add horns" r8 e8 e2
      r4 r8 e8 e4. e8
    }
  }
  \break

  \repeat segno 2 {
    %\repeat volta 2 {
    %\showStartRepeatBar \bar "[|:-|"
    d4-. r8 e8 f4-. g8 a~
    a2 r4 d8 e8~
    e4 d8 c8~ c4 bes8 a~
    a1~  \break
    a8 g fis g bes c16 bes a8 g %\coda
    
    \alternative {
      \volta 1 {
        f2~ f8 a f e~
        e1
        r2 r8 ees4. \break
        \repeat percent 2 {
          r4 r8 e8 e2
          r4 r8 e8 e4. e8
        } \break
        \section
        d4-. r8 e8 f4-. g8 a~
        a2 r4 d8 e8~
        e4 d8 c8~ c4 bes8 a~
        a1~ \break
        a8 g fis g bes c16 bes a8 g
        f2~ f8 a f e~
        e1
        r2 r8 ees4. \break
        \repeat percent 2 {
          r4 r8 e8 e2
          r4 r8 e8 e4. e8
        } \break
        r8 f4. f8 e f a~
        a8 a4 g8~ g2
        r8 f4. f8 e f c'~
        c8 bes4 g8  des8 c4. \break
      }

      \volta 2 \volta #'(){

      }
    }
  }
  \break
  \section
  \sectionLabel \markup { "Coda " \coda }
  f2~ f8 c' f, c
  %\section
  \repeat percent 2 {
    r8 f4. f4-^ g-^
    a4. a8 r2
  }
  \break
  r8 f4. f4 g
  a4. g8~ g4. f8~
  f2 g4. f8
  R1_"Pickup for solos"
  R1 \fine
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theChords = \chordmode {
  \repeat volta 2 {
    \repeat percent 2 {
      d1:m7
      d1:m6
    }
  }
  \repeat segno 2 {
    d1:m7 | e2:m7.5- a2:7.9- | d2:m a2:7.9+ |d1:m
    g1:m7
    \alternative {
      \volta 1 {
        d1:m | e1:m7.5- | a1:7.9- | d1:m7
        d1:m6 | d1:m7 | d1:6
        d1:m7 | e2:m7.5- a2:7.9- | d2:m a2:7.9+ |d1:m
        g1:m7
        d1:m | e1:m7.5- | a1:7.9- | d1:m7
        d1:m6 | d1:m7 | d1:6
        f1 | g2:m7 c2:7 | f1 | e2:m7.5- bes4:7 a4:7
      }
      \volta 2 \volta #'() {
      }
    }
  }
  d1:m | c1*4:7sus4 |
  c1:7sus4 | c2:7sus4 a2:7.5+.9- | g2:m7 a2:7.9- | d1*2:m
}

%% Output
\bookpart {
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames %\unfoldRepeats
      \theChords
      \new Voice = soloist \transpose bes c' %\unfoldRepeats
      \theNotes
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)
      \override Score.SystemStartBar.collapse-height = #1 
    }
  }
}

\bookpart {
  \header {
    instrument = "Concert"
  }
  \score {
    <<
      \new ChordNames \theChords
      \new Voice = soloist \theNotes
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
  }
}