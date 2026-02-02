\version "2.25.28"

\header {
  title = "Song for Bilbao"
  subtitle = "B flat instruments"
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

\paper{
  myStaffSize = #20
  property-defaults.fonts.serif = "Comic Sans MS"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
}

\include "chordsAndTune.ly"

\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      %\set Staff.instrumentName="B flat"
      \transpose bes c' \melody
    }
   
  >>
  \layout { }
}
