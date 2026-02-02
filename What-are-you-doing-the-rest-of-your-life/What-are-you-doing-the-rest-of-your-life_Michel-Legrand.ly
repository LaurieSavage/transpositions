%\version "2.24.4"
\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

%\markuplist \table-of-contents
%\pageBreak

\include "RealBook.ly"
%\include "global.ly"

\include "theChords.ly"
\include "theNotes.ly"

\book {
  \bookOutputSuffix "C"
  \tocItem \markup "Concert Instruments"
  \header {
    instrument = "Concert"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \melody
    >>
  }
}

\book {
  \bookOutputSuffix "Bb"
  \tocItem \markup "Bflat Instruments"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose  bes c' \melody
    >>
  }
}

\book {
  \bookOutputSuffix "Eb"
  \tocItem \markup "Eflat Instruments"
  \header {
    instrument = "Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>
  }
}