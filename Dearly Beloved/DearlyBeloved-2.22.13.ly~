\version "2.24.3"

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 5))
}


today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

title = #"Dearly Beloved"
composer = #"-Jerome Kern & Johhny Mercer"
meter = #" (Up Swing)"

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
  subtitle = "Male Key"
  %tagline = \markup{\small \italic {"Edited by L.S. " \today}}
  copyright = "1942"
}

\include "lyrics.ly"
\include "tune.ly"
\include "chords.ly"

\book {
 % \bookOutputSuffix "C"
  \header {
    instrument = "C instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff {
        \melody
      }
      \addlyrics \verses
    >>
    \layout{}
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
    \layout{}
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
      %\addlyrics \verses
    >>
    \layout{}
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


%{
convert-ly (GNU LilyPond) 2.23.13  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.23.1, 2.23.2, 2.23.3, 2.23.4,
2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12,
2.23.13
%}
