\version "2.24.3"

%\include "AccordsJazzDefs.ily"
%\include "LilyJAZZ.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "lilyjazz.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  %  #(define fonts
  %      (set-global-fonts
  %       #:roman "LilyJAZZ Text"
  %       #:sans "Nimbus Sans, Nimbus Sans L"
  %       #:typewriter "DejaVu Sans Mono"
  %       ; unnecessary if the staff size is default
  %       #:factor (/ staff-height pt 20)
  %       ))
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
  title = "Dearly Beloved"
  subtitle = "Male Key"
  composer = "Jerome Kern"
  poet = "Johnny Mercer"
  piece = "Med. swing"
  %tagline = \markup{\small \italic {"Edited by L.S. " \today}}
  copyright = "1942"
}

global = {
  \time 4/4
  \key c \major
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  % \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

\include "lyrics.ly"
\include "tune.ly"
\include "chords.ly"

fKeyNotes = \transpose c g \melody
fKeyChords = \transpose c g \chordNames

\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "C insts." } { \melody }
      \addlyrics \verses
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Tenor Sax/Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' \melody
      \addlyrics \verses
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "BflatFem"
  \header {
    subtitle = "Female Voice"
    instrument = "Tenor Sax/Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \fKeyChords
      \new Staff \transpose bes c' \fKeyNotes
      \addlyrics \verses
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Baritone/Alto Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = \markup{ "E"\flat " Sax" }} \transpose ees c' \melody
      \addlyrics \verses
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Fl"
  \header {
    instrument = "Flute"
  }
  \paper {
    #(set-paper-size "a4landscape")
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Flute" } \transpose c c' \melody
    >>
    \layout {
      #(layout-set-staff-size 14)
    }
  }
}
