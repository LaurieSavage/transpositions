\version "2.25.28"

\header {
  title = "Song for Bilbao"
  composer = "Pat Metheny"
  meter = "Med. Latin Rock"
  piece = "Repeat whole song AABA x 2"
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
  \new StaffGroup
  <<
    \new ChordNames  \chordNames
    \new Staff {
      \set Staff.instrumentName="Concert"
      \melody
    }
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c' \melody
    }
    \new ChordNames \transpose ees c \chordNames
    \new Staff {
      \set Staff.instrumentName="E flat"
      \transpose ees c' \melody
    }
  >>
  \layout { }
}
