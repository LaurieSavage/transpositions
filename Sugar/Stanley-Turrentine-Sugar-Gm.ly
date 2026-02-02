\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "TabA.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))
aTrip = { \times 2/3 {a16 bes a} g8 }
gTrip = { \times 2/3 {g16 a g} f8 }
cTrip = { \times 2/3 {c16 d c} a8 }
fTripHigh = { \times 2/3 {f16 g f} d8 }
dTrip = { \times 2/3 {d16 e d} c8 }
fTrip = { \times 2/3 {f16 g f} d8 }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 10\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 28)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Sugar"
composer = #"Stanley Turrentine"
meter = #" (Funky)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  tagline = \markup { "Paradiso Connection - Edited by L.S. " \today }
}

global = {
  \time 4/4
  \key d \minor

}

performanceNote = \markup {
  \column {
    \line { \bold \underline Notes }
    \line { Bass vamp before horns }
    \line { Horns play head once }
    \line { Vocals for two verses }
    \line { Solos: Guitar, Trumpet, Bass, Sax }
    \line { Vocals out - tag 3 times }
  }
}

chordNames = \chordmode {
  %
  \global
  \partial 4*4  s4*4
  %ees2:min7/aes aes:7
  \repeat volta 2 {
    d1:min7 e2:m7.5- a:7.5+ d1:m7
    a:aug7 d1*2:m7 e1:dim7
    a:aug7 d:m7 aes:7 g:m7
    f:7 e:m7.5- a:7.5+
  }
  \alternative {
    { bes1:7 a:aug7} { d1:m7 ees:maj7}
  }
}

melody =\relative c' {
  %
  \global
  \mark \markup { Bass intro untile horns come in }
  \partial 4*4 r4 r8 d8 f8 g4 a8~
  \repeat volta 2 {
    a4. g8 \aTrip f8 g~ g4. f8 \gTrip d8 f~ f1~ f4. d8 f8 g4 a8~ a4. g8 \aTrip f8 g~
    g4. a8 \cTrip g8 a~ a1~
    a4. a8 c d4 f8~f4. d8 \fTripHigh c8 d~ d4. c8 \dTrip a8 c~ c4. a8 \cTrip g8 a~ a4. g8 \aTrip f8 g~ g4. f8 \gTrip d8 f~ f4. d8 \fTrip c8 d~
  }
  \alternative{
    {d1~ d4. d8 f g4 a8}
    {d,1~ \repeatTie d \bar "|."}
  }
}

theChords = \transpose c f { \chordNames }
theTune = \transpose c f {   \jazzTweaks \melody }

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Pitch"
  }
  \score {
    <<
      \new ChordNames { \theChords }
      \new Staff { \theTune }
    >>
    \layout { }
  }
  \performanceNote
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c { \theChords }
      \new Staff \transpose ees c { \theTune }
    >>
  }
  \performanceNote
}

\book {
  \tabA
  \bookOutputSuffix "Tenor"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c { \theChords }
      \new Staff \transpose bes c' { \theTune }
    >>
  }

  \performanceNote
}

\book {
  \tabA
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c { \theChords }
      \new Staff \transpose bes c' { \theTune }
    >>
  }

  %\performanceNote
}

%{
convert-ly (GNU LilyPond) 2.25.16  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
