\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 25\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 25)
                             (minimum-distance . 6)
                             (padding . 1))
}

\header {
  title = "Softly as in a morning sunrise"
  composer = "Hammerstein & Romberg"
  piece = ""
  tagline = \markup { "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key c \minor
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \set Score.startRepeatBarType = #"[|:"
  \set Score.endRepeatBarType = #":|]"
}

chordNames = \chordmode {
  %\override ChordNames.ChordName.font-name = #"lilyjazz Text"
  %
  \global
  c1:m7
  d2:m7.5- g2:7
  c1:m7
  f1:m7
  c1:m7
  d2:m7.5- g2:7.9-
  c1:m7
  % 1st time
  d2:m7.5- g2:7
  % 2nd time
  f2:m7 bes:7
  % Bridge
  ees1:maj7
  s2 f2:m7
  c1*2:7.9-
  f1*3:m7
  g1:7.9-
  % Head out
  c1:m7
  d2:m7.5- g2:7
  c1:m7
  f1:m7
  c1:m7
  d2:7.5- g2:7.9-
  c1*2:m7
}

melody = \relative c'' {
  %
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \mark \default
  \repeat volta 2{
    c2 g2
    r8 f8 g8 f8 g4 f4
    c'2 ees,2
    r8 d8 ees8 d8 ees4 d4 \break
    g2 c,2
    r8 g'8 aes8 g8 ees4 d4
    c1~
  }
  \alternative{
    {
      c4 r4 r2
    }
    {
      \tuplet 3/2 {c4\repeatTie d ees} \tuplet 3/2 {f4 g aes} \bar "||"\break
    }
  }

  \mark \default
  bes2 ees,
  r8 bes'8 c bes c4 bes
  bes2 e,2
  \tuplet 3/2 {ees4 e f} \tuplet 3/2{g aes bes} \break
  c2 f,2
  r8 c'8 d c d4 c
  d1
  r1 \bar "||" \break

  \mark #1
  c2 g2
  r8 f8 g8 f8 g4 f4
  c'2 ees,2
  r8 d8 ees8 d8 ees4 d4 \break
  g2 c,2
  r8 g'8 aes8 g8 ees4 d4
  c1~
  c1 \fine
}


\bookpart {
  \header {
    instrument = "Concert"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
    \midi { }
  }
}

\bookpart {
  \header {
    instrument = "E flat instrument"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
}

\bookpart {
  \header {
    instrument = "B flat instrument"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
}

%{
convert-ly (GNU LilyPond) 2.25.4  convert-ly: Processing `'...
Applying conversion: 2.25.0, 2.25.1, 2.25.3, 2.25.4
%}
