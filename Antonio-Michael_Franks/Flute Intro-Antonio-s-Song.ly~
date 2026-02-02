\version "2.24.3"

\include "AccordsJazzDefs.ily"
\include "LilyJAZZ.ily"
today = #(strftime "%d-%m-%Y" (localtime (current-time)))
\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 15\mm
}

\header {
  title = "Antonio's Song"
  composer = "Michael Franks"

  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"" c4 #""
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \transpose a g {
  \chordmode {
    %% Intro
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
  }
}

melody = \transpose a g {
  \relative c''{
    \global
    \jazzOn
    r4 e8 e'~e2
    d4 des c gis
    b2~ b8 a4 e8
    d4~ d8 e16 f e4 d \break
    e4. e8~e e e'4
    d4 des c gis
    b2~ b8 a4 e8
    d4~ d8 e16 f e4 d
  }
}

\score {
\header {
piece = "Flute Intro"
}
  <<
    \new ChordNames \chordNames
    \new Staff \with { instrumentName = "Flute" } { \melody }
  >>
  \layoutScore
}

\score {
\header {
piece = "Sax Intro"
}
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff \with { instrumentName = "Tenor sax" } \transpose bes c { \melody }
  >>
  \layoutScore
}