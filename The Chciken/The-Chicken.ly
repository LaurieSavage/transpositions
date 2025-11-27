\version "2.24.3"

\include "AccordsJazzDefs.ily"
\include "LilyJAZZ.ily"
\include "articulate.ly"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  #(define fonts
     (set-global-fonts
      #:roman "LilyJAZZ Text"
      #:sans "Nimbus Sans, Nimbus Sans L"
      #:typewriter "DejaVu Sans Mono"
      ; unnecessary if the staff size is default
      #:factor (/ staff-height pt 20)
      ))
}

layoutScore = \layout {
  indent = 15\mm
}

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = "The Chicken"
  composer = "Pee Wee Ellis"
  piece = ""
  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key bes \major
  \tempo 4 = 96
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Funk" c4 #"96"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %\compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {
  bes2:7 ees2:7
  bes2:7 ees2:7
  bes2:7 ees2:7
  bes2:7 ees2:7
  bes1:7
  bes1:7
  bes1:7
  bes1:7
  es1:7
  es1:7
  d1:7
  g1:7
  c1:7
  c1:7
  c1:7
  r1

  bes2:7 ees2:7
  bes2:7 ees2:7
  bes2:7 ees2:7
  bes2:7 ees2:7
}

melody = \relative c'' {
  \global
  \jazzOn
  \revert Score.BarNumber.stencil

  R1*3^"Rhythm Intro"
  r2 r4
  g16-^ bes8.-- \break
  \repeat volta 2 {
    \mark \default
    d4-> r4 r2
    r4 f,16 g bes des~-> des8 bes16 g16 bes8-- ees8-.
    d4-^ r4 r2
    r4 d4-^ g8 f des c~-> \break
    c4 bes16 g bes8~ bes2
    r2 r4 bes8-^ r8
    r4 a8-- a-. r4 bes'16 g f g~->
    g2 r8. fis16 g bes d bes~-> \break
    bes2~ bes8. fis16 g bes d bes~->
    bes2~ bes8. fis16 g bes d bes~->
    bes2 r2
    bes16 aes8 f16~-> f16 ees8 des16~-> des16 bes16 aes8 r8 <d, aes' d>8-> \bar "||"
    % }
    % {
    \mark \default
    R1^"Rhythm fill between solos"
    R1
    R1
    r2 r4 g16 bes8.
  }
}

optHorns = \relative {
  <bes d f aes>4.\mark \markup {
    "Optional horns over vamp"
  } <ees g bes des>8~ <ees g bes des>2 |
  <bes d f aes>4. <ees g bes des>8~ <ees g bes des>2 |
  <bes d f aes>4. <ees g bes des>8~ <ees g bes des>2 |
  <bes d f aes>4. <ees g bes des>8~ <ees g bes des>4 g16 bes8. |
}

optHornsChords = \chordmode {
  bes2:7 ees2:7
  bes2:7 ees2:7
  bes2:7 ees2:7
  bes2:7 ees2:7
}

\score {
  <<
    \new ChordNames {
      \set Staff.midiInstrument = "rock organ"
      \set Staff.midiMaximumVolume = #0.6
      \chordNames
    }

    \new Staff {
      \set Staff.midiInstrument = "electric guitar (jazz)"
      \set Staff.midiMaximumVolume = #0.9
      \melody
    }

    \new Staff {
      \set Staff.midiInstrument = "tenor sax"
      \set Staff.midiMaximumVolume = #0.9
      \melody
    }
  >>
  \midi {}
}

\book {
  \bookOutputSuffix "C"
    \markup {
    \large \box
    "Solos on A"
  }
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames { \chordNames }
      \new Staff { \melody }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "TSax"
  \header {
    instrument = "Tenor Sax"
  }
  \markup {
    \large \box
    "Solos on A"
  }
  \score {
    <<
      \new ChordNames
      \transpose bes c {
        \chordNames
        \optHornsChords
      }
      \new Staff
      \transpose bes c'{
        \melody
        \break
        \optHorns
      }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Tpt"
  \header {
    instrument = "Trumpet"
  }
  \markup {
    \large \box
    "Solos on A"
  }
  \score {
    <<
      \new ChordNames
      \transpose bes c {
        \chordNames
        \optHornsChords
      }
      \new Staff {
        \transpose bes c {
          \melody
        }
        \break
        \transpose bes c' {
          \optHorns
        }
      }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Eb Sax" } \transpose ees c \melody
    >>
    \layoutScore
  }
}
\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Flute" } \transpose c c' \melody
    >>
    \layoutScore
  }
}