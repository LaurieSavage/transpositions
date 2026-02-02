\version "2.24.4"

#(set-global-staff-size 22)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"
%\include "TabA.ily"

\include "CominHome.ily"
\include "Chitlins.ily"


%\book {
		%\bookOutputSuffix "C"
 
  \book{
    \bookOutputSuffix "C"
    \header {
    title = "Two Blues"
    subtitle = "Concert Instruments"
    tagline = ##f
  }
    \score {
      \header {
      piece = "Comin' Home Baby (Earl Hagan)"
      instrument = "Concert Instruments"
      composer = "Earl Hagan"
    }
    <<
      \new ChordNames \theChords
      \new Voice = soloist \theNotes
    >>
  }
  \score {
    \header {
      piece = "Chitlins Con Carne (Kenny Burrell)"
      instrument = "Concert Instruments"
      composer = "Kenny Burrell"
    }
    <<
      \new ChordNames \theChordsChit
      \new Voice = soloist \theNotesChit
    >>
  }
  \score {
    <<
      \new Staff \bassIntro
    >>
  }
}
 
\book{
  \bookOutputSuffix "Bb"
  %\tabA
  %\bookOutputSuffix "Bb"
     \header {
      piece = "Comin' Home Baby (Earl Hagan)"
      instrument = "Bb Instruments"
      composer = "Earl Hagan"
    }
  \score {

    <<
      \new ChordNames \transpose bes c \theChords
      \new Voice = soloist \transpose bes c' \theNotes
    >>
  }
   \score {
     \header {
      piece = "Chitlins Con Carne (Kenny Burrell)"
      instrument = "Bb Instruments"
      composer = "Kenny Burrell"
    }
    <<
      \new ChordNames \transpose bes c \theChordsChit
      \new Voice = soloist \transpose bes c' \theNotesChit
    >>
  }
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    title = "Two Blues"
    subtitle = "E flat Instruments"
    tagline = ##f
  }
  \score {
     \header {
      piece = "Comin' Home Baby (Earl Hagan)"
      instrument = "Eb Instruments"
      composer = "Earl Hagan"
    }
    <<
      \new ChordNames \transpose ees c' \theChords
      \new Voice = soloist \transpose ees c \theNotes
    >>
  }
  \score {
     \header {
      piece = "Comin' Home Baby (Earl Hagan)"
      instrument = "Eb Instruments"
      composer = "Earl Hagan"
    }
    <<
      \new ChordNames \transpose ees c \theChordsChit
      \new Voice = soloist \transpose ees c' \theNotesChit
    >>
  }
}
  %}

%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12
%}
