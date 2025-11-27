\version "2.24.3"

#(set-global-staff-size 22)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

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

title = #"Blue Trane"
composer = #"- John Coltrane"
meter = #" (Med. Swing)"

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
  tagline = \markup{ \small{ "Paradiso Connection - edited L.S., " \today }}
}



global = {
  \time 4/4
  \key c \minor
}

chordNames = \chordmode {
  \global
  s8 f4:m7 bes4:7

  c1:m
  f2:m7 bes:7
  c1:m
  bes2:m7 ees:7
  f1:m
  f2:m7 bes:7
  c1:m
  a2:m7 d:7
  g1:m
  f2:m7 bes:7
  c1:m
  f2:m7 bes:7
  c1:m7.5-
  c1:m
}

melody = \relative c'' {

  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 8*5 g8 bes d bes c~
  \repeat volta 2 {
    \bar "[|:"
    c1~
    c4-^ r8 g8 bes d bes c~
    c1~
    c4-^ r8 c8 ees g ees f~ \break
    f1~
    f4-^ r8 g,8 bes d bes c~
    c1~
    c4-^ r8 g c d c bes~ \break
    bes1~
    bes4-^ r8 g bes d bes c~
  } \alternative{
    {
      c1~
      c4-^ r8 g bes d bes c~ \bar ":|]"
    }{c1~ c4-^ r4 r2 \bar "|."}
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
      \new Staff \transpose ees c { \melody }
    >>
    \layout {
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
      \new Staff \transpose bes c' { \melody }
    >>
    \layout {
      indent = 10\mm
    }
  }
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.25.4  convert-ly: Processing `'...
Applying conversion: 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4
%}
