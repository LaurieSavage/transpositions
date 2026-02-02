\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

%{
\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}
%}

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

%{
\header {
  title = "Nature Boy"
  composer = "Eden Ahbez"
  %piece = "Rubato con moto"
  tagline = ""
  copyright = \markup{\override #'(font-name . "lilyjazz Text"){"Edited L.S. " \today}}
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
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 28)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Nature Boy"
composer = #"- Eden Ahbez"
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
  tagline = \markup { "Paradiso Connection - edited by L.S. " \today }
}

global = {
  \time 4/4
  \key d \minor
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Rubato con moto" c4 #""
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {

  s1*8
  d1:m
  e2:m7.5- a2:7
  d1:m
  e2:m7.5- a2:7
  d2:m d2:m7+
  d2:m7 d2:m6
  g2:m6 d2:m
  e1:m7.5-

  a1*2:7
  d1*2:m
  e1*2:7.9-
  a1*2:7

d1:m
  e2:m7.5- a2:7
  d1:m
  e2:m7.5- a2:7
  d2:m d2:m7+
  d2:m7 d2:m6
  g2:m6 d2:m
  e1:m7.5-

  a1*2:7
  d1:m
  b1:m7.5-
  e1:7.9-
  a1:7.5+
  d1:m
  e2:m7.5- a2:7
  d1*2:m

  }


melody = \relative c''{
  \global
  \revert Score.BarNumber.stencil
   R1*7^\markup{"Rhythm intro"}  r2 r4 r8 a,8 \break
  \repeat volta 2{
 \mark \default
  \bar "[|:-|" a'8 f d2.
  r4 r8 a8 e' f g bes
  a8 f d2.
  r4 r8 a8 e' f g bes \break
  a4. d8 cis2
  a4. c8 b2
  g4. bes8 a4. d,8
  e2. r8 a,8 \break
  a'2. g4
  e2. a,4
  g'2. f4
  d2. a4 \break
  f'2. e4
  b2. c4
  cis1
  r2 r4 r8 a8 \bar "||" \break
  \mark \default
  a'8 f d2.
  r4 r8 a8 e' f g bes
  a8 f d2.
  r4 r8 a8 e' f g bes \break
  a4. d8 cis2
  a4. c8 b2
  g4. bes8 a4. d,8
  e2. r8 a,8 \break
  a'2. g4
  e2. a,4
  g'2. f4
  d2. a4 \break
  f'4. e8 b4. a8
  g'4 f2 a,8 e'
}
\alternative{{d1 r2 r4 r8 a8 \bar ":|]"}{d1 R1 \bar "|."}}
}

vocalChords = %\transpose d b 
\chordNames
vocalMelody = %\transpose d b {
\melody 
%}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Pitch"
  }
  \score {
    <<
      \new ChordNames \vocalChords %\chordNames
      \new Staff {\vocalMelody} %\melody
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \vocalChords %\chordNames
      \new Staff \transpose bes c' \vocalMelody %\melody
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \vocalChords %\chordNames
      \new Staff \transpose ees c \vocalMelody %\melody
    >>
    \layoutScore
  }
}
\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \vocalChords %\chordNames
      \new Staff \with { instrumentName = "Flute" } \vocalMelody %\melody
    >>
    \layoutScore
  }
}