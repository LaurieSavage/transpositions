\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzextras.ily"

\header {
  title = "Song for Bilbao"
  subtitle = "Concert Key"
  composer = "Pat Metheny"
  meter = "Med. Latin Rock"
  piece = "Rhythm section intro AABA then repeat whole song AABA x 2"
  tagline = \markup {
    Engraved by Laurie Savage at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

\include "chordsAndTune.ly"

\score {
  <<
    \new ChordNames  \chordNames
    \new Staff {
      %\set Staff.instrumentName="Concert"
      \melody
    }
  >>
  \layout { }
}

\score{
  \unfoldRepeats
  <<
    \new Staff \with {midiInstrument = "flute"} \melody
  >>
  \midi{
    \tempo 4 = 160
  }
}
