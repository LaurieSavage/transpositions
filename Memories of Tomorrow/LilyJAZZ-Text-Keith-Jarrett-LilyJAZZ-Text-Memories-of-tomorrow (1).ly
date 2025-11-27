\version "2.24.3"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
     'length (ly:music-length note)))

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Memories of tomorrow "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Keith Jarrett "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key a \minor
  %\tempo
  \accidentalStyle modern-cautionary
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  a1:m
  a1:m7+
  a1:m7
  e1:m7

  f2 fis2:dim
  c1/g
  g1:7sus4
  c1

  d1/fis
  f1:maj7
  c1/e
  ees2 a2:7

  aes1
  f1:m7
  bes1:7sus4
  c1:maj7

  b2:m7 bes2:7
  a2:m f2:m/aes
  g2 d:7/fis
  f1:maj7

  c1:maj7/g
  g1:7sus4
  c1
  b2:m7 bes2:7

  %Coda
  %c1 s1

}

melody = \relative c'' {
  % \accidentalStyle modern-cautionary
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  c4 b8 a~ a g4 e8~
  e8 c8~ c2.
  c'4 b8 a~ a g4 g8~
  g2 e4 g \break

  c4 b8 a~ a4 g
  e8 c4. a4 c4
  f4 e8 d~ d4 c8 e~
  e2 a4 c \break

  d4 d8 d~ d4 a
  d4 c r8 b4 a8
  c4 b a g8 g~
  g2 g4 g4 \break

  g4 g4 f c8 f~
  f8 g4. c,4 ees
  f4 g8 f~ f c4 e8~
  e2 e4 e4 \break

  e4 b'8 e~ e e4 d8~
  d4 a8 c~ c4. c8
  b4 a8 d~ d c4 a8~
  a8 c4. c,4 f \break

  e2 e4 c
  f4 e d c
  e1~
  e2. %\markup{"d.c. al coda"}
  r4 \bar "||" \break
}

guideTones = \relative c'' {
  \global
  \jazzOn

  a1^"Dorian"
  gis^"Melodic minor"
  g~^"Dorian"
  g^"Dorian"
  a2^"Major" a2^"Locrian"
  g1~^"Ionian"
  g1~^"Mixolydian"
  g1^"Ionian"
  fis^"Ionian"
  f^"Lydian"
  e^"Ionian"
  ees2^"Ionian"
  e2^"Dorian"
  ees1^"Ionian"
  f^"Dorian"
  ees^"Mixo"
  e^"Ionian"
  fis2^"Dorian" f2^"Lydian"
  e2^"Dorian" ees2^"Lydian"
  d1^"Ionian     Mixo"
  e~^"ionian"
  e^"Ionian"
  d^"Mixo"
  e^"Ionian"
  fis2^"Phryg."
  f^"Mixo"
}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "Concert"
    }
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
     % \new Staff {\guideTones}
    >>
    \layout { }
    \midi { }
  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
      %\new Staff \transpose ees c' {\guideTones}
    >>

  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
      %\new Staff \transpose bes c' {\guideTones }
    >>

  }
}
