\version "2.24.3"

\include "jazzchords.ily"
\include "lilyjazz.ily"

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
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 28)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Birks Works"
composer = #"- Dizzy Gillespie"
meter = #" (Med. Up Swing)"

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
  title = "Birk's Works"
  composer = "Dizzy Gillespie"
  %piece = ""
  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}
%}

global = {
  \time 4/4
  \key f \minor
  \tempo 4 = 158
  %\mark \jazzTempoMarkup #"" c4 #"158"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {
  s4.

  f1:m
  g2:m7.5- c:7
  f1:m
  c2:m7.5- f2:7

  bes1*2:m7
  f1*2:m

  aes2:m7 des2:9
  g2:m7.5- c2:7
  f1*2:m
}

melody = \relative c' {
  \global
  %\jazzOn
  \partial 4.
  f8 aes bes
  \repeat volta 2 {\bar "[|:"
    b8 c b bes aes f aes bes
    bes4 aes8 c r8 f,8 aes bes
    b c b bes aes f aes bes
    r2 r8 f aes bes \break
    b c b bes aes f aes bes
    bes4 aes8 b r8 f aes bes
    b c b bes aes f aes bes
    r2 r8 f8 aes bes~ \break
    bes bes4. r8 f8 aes bes~
    bes bes4. \tuplet 3/2 { aes16 bes aes } f8 ees f~
  }
  \alternative {
    {
      f4 r4 r2
      r2 r8 f8 aes bes \bar ":|]"
    }
    {
      f4 \repeatTie r4 r2
      R1 \bar "|."
    }
  }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Pitch"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout{
      indent = 10\mm
    }
  }
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
    >>
    \layout {
      indent = 10\mm
    }
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>
    \layout{
      indent = 10\mm
    }
  }
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
    \layout{
      indent = 10\mm
    }
  }
}