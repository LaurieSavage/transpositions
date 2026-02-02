\version "2.25.28"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
%\include "functions.ly"

\paper {
  % left-margin = 20
  %   right-margin = 20
}

\header {
  title = "Poinciana (Eb)"
  subtitle = "The song of the tree"
  composer = "Buddy Bernier/Nat Simon"
  piece = "Cuban"
  copyright = "1936"
  tagline = \markup{"L.S. " }
}

global = {
  \time 4/4
  \key g \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Included input files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\include "chords.ly"
\include "PMelody.ly"
\include "PMelodySax.ly"
\include "PLyrics.ly"
\include "PLyricMelody.ly"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Scores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\bookpart {
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
  }
}

\book {
  \bookOutputSuffix "Tpt"
  \header {
    instrument = \markup {"Trumpet"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c \melody
    >>
    \layout { }
  }
}

\book {
  \bookOutputSuffix "Vcl"
  \header {
    instrument = \markup{ \with-color #red "Vocal"}
    piece = ""
  }
  \score {
    <<
      \new Voice = "Intro" { \interludeIn}
      % \new Lyrics \lyricsto "song" {
      \addlyrics {\interludeOne}
      \addlyrics {\interludeTwo}
    >>
    \layout {
      #( layout-set-staff-size 16)
    }
  }
  \score{
    <<
      \new Voice = "Verse" {\verse}
      \addlyrics {\verseOneOne}
      \addlyrics {\verseOneTwo}
    >>
    \layout {
      indent = 0
      #( layout-set-staff-size 16)
    }
  }
  \score {
    <<
      \new Voice = "Outro" {\InterludeOut}
      \addlyrics {\interludeTwoA}
      \addlyrics {\interludeTwoB}
    >>
    \layout {
      indent = 0
      #( layout-set-staff-size 16)
    }
  }
}

\book {
  \bookOutputSuffix "TSax"
  \header {
    instrument = \markup {"Tenor Sax"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' \melodySax
    >>
    \layout { }
  }
}

%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}


%{
convert-ly (GNU LilyPond) 2.25.16  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
