\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
               'length (ly:music-length note)))

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
}

%{
\header {
  title = \markup \underline "Beautiful Love "
  composer ="Victor Young"
  piece = "Swing"
  tagline = \markup { "L. S., " \today }
}
%}

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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Beautiful Love"
composer = #"- Victor Young"
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
  tagline = \markup { "Paradiso Connection - edited L.S." \today }
}

global = {
  \time 4/4
  \key d \minor
  %\tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  %\override ChordNames . ChordName #'font-name = #"LilyJazz Text"
  \global
  s1
  e1:m7.5-
  a1:7.5+
  d1*2:m
  g1:m7
  c1:7
  f1:maj7
  e2:m7.5- a2:7.5+
  d1:m
  g1:m7
  bes1:7.11+
  a1:7

  %%% 1st ending %%%
  d1:m
  g1:7.11+
  e1:m7.5-
  a1:7

  %%% 2nd ending %%%
  d2:m b2:7.9+
  bes2:7 a2:7
  d1*2:m
}

melody = \relative c' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4*4 r8 d4. e4 f4
  \repeat volta 2 {
    \bar "[|:" a2. g4
    f4. e8 d4 e8 f8~
    f1
    r8 f4. g4 a4 \break
    c2. bes4
    a4. g8 f4 g8 a8~
    a1
    r8 a4. b4 cis \break
    e4. d8~d4 a4
    c4. bes8~ bes4 d,4
    e1
    r8 e4. f4 g4 \break
  }
  \alternative{
    {
      a2. d,4
      cis2. d4
      e1
      r8 d4. e4 f4 \bar ":|]" \break
    }
    {
      a2 cis,4 d4
      f2 e2
      d1
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
    \layout {
      indent = 15 \mm
    }
    %\midi { }
  }
  \markup{ \box
           \fontsize #2
           "Real Book, 6th Edition"
  }
}

\book {
  \bookOutputSuffix "EFlat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>
    \layout {
      indent = 15 \mm
    }
  }
  \markup{
    \box
    \fontsize #2
    "Real Book, 6th Edition"
  }
}

\book {
  \bookOutputSuffix "BFlat"
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>
    \layout {
      indent = 15 \mm
    }
  }
  \markup{
    \rounded-box
    \fontsize #2
    "Real Book, 6th Edition"
  }
}
