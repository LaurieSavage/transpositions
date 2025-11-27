\version "2.24.3"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "lyrics.ly"

%{
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
%}

layoutScore = \layout {
  indent = 15\mm
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
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 28)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Dearly Beloved"
composer = #"- J. Kern & J. Mercer"
meter = #" (Female Vocal Key)"

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
  tagline = \markup { "Paradiso Connection - edited by L.S. " \today }
}


%{
\header {
  title = "Dearly Beloved"
  subtitle = "Female Vocal"
  composer = "Jerome Kern"
  poet = "Johnny Mercer"
  %piece = "Up swing"
  tagline = \markup
  {
    \override #'(font-name . "LilyJazz Text")
    {
      "Edited by L.S. " \today
    }
  }
  copyright = \markup
  {
    \override #'(font-name . "LilyJAZZ Text")
    {
      "1942"
    }
  }
}
%}

global = {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  %
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  % \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

notes = \markup {
  \column {
  \line {\bold \underline \large Notes }
  \line { \bold { \underline "A section" }}
  \line { \bold { \underline "B section" }}
  \line { \bold { \underline "Solos" }}
  }
  \column {
    \line { " " }
    \line { "Rubato, voice and guitar" }
    \line { "Fast, driving swing" }
    \line { "Solos played over the fast tempo, " }
    \line { "singer directs the tempo for the last B section" }
  }
}


chordNamesOrig = \chordmode {
  %bordeaux mix
  %% A
  d1:m7
  g1:7
  d1:m7
  g1:7
  d1:m7
  g1:7
  d1:m7
  g1:7
  c1*2:6
  d1:m7
  g1:7
  c1*2:maj7
  ees2:m7
  aes2:7
  ees2:m7
  aes2:7

  %% B
  d1:m
  g1:7
  d1:m
  g1:7
  d1:m
  g1:7
  d1:m
  g1:7
  c1*2:6
  d1*2:13
  d1:m7
  g1:7
  c1:6
  e2:m7
  a2:7
}

melodyOrig = \relative c'' {
  \global

  \revert Score.BarNumber.stencil
  %\tempo 4 = 80
  \mark \default
  g2\mark \markup {"Rubato Ballad"} d4. e8
  f4 g2 a4
  g2 d4. g8
  f1 \break
  g2 d4. e8
  f4 g a c
  b2 g4. b8
  a1 \break
  g4 a4 c2~
  c1
  c,2 g'2~
  g1 \break
  g4 b4 d2~
  d4 des c b
  bes2 aes2~
  aes1 \bar "||" \break

  \tempo 4 = 240
  \mark \default
  g2 \mark \markup {"Fast Swing"} d4. e8
  f4 g2 a4
  g2 d4. g8
  f1 \break
  g2 d4. e8
  f4 g a c
  b2 g4. b8
  a1 \break
  g4 a4 c2~
  c1
  d2 b~
  b1 \break
  g2 d4. e8
  f4 g2 e4
  c1 \bar "|."
  R1_\markup{\small "Pickup during solos" }
}

chordNames = \transpose c g { \chordNamesOrig }
melody = \transpose c g { \melodyOrig }

%{
\score {
  <<
    \new ChordNames \with {
      midiInstrument = "rock organ"
      midiMaximumVolume = 0.8
    } {
      \tripletFeel 8
      \chordNames
    }
    \new Staff \with {midiInstrument = #"clarinet"} {
      \tripletFeel 8
      << \transpose c c \melody >>
    }
    \new Staff \with {midiInstrument = #"flute"} {
      \tripletFeel 8
      << \transpose c c, \melody >>
    }
    \new Staff \with {midiInstrument = #"trombone"} {
      \tripletFeel 8
      << \transpose c c, \melody >>
    }
    >>
    \midi {}
    }
%}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Pitch"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
      \addlyrics \verses
    >>
    \layoutScore
  }
  \notes
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' \melody
      \addlyrics \verses
    >>
    \layoutScore
  }
  \notes
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Baritone/Alto Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c \melody
      \addlyrics \verses
    >>
    \layoutScore
  }
  \notes
}
\book {
  \bookOutputSuffix "Fl"
  \header {
    instrument = "Flute"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \transpose c c' \melody
    >>
    \layoutScore
  }
}
