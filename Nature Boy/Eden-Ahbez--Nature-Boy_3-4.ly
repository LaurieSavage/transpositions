\version "2.24.4"
\include "jazzchords.ily"
\include "lilyjazz.ily"

today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 20 \mm
}

\header {
  title = "Nature Boy"
  composer ="eden ahbez"
    piece = "Slow"
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 3/4
  \key e \minor
}

chordNames = \chordmode {
  \global
  s8
e2.:m
e4:m a2:m7
e2.:m
e4:m a2:m7
e2.*3:m
a2.*3:m7
e2.*2:m
fis2.*2:7.9-
b2.*2:7.9-

e2.:m
e4:m a2:m7
e2.:m
e4:m a2:m7
e2.*3:m
a2.*3:m7
e2.*2:m
fis2.:7.9-
b2.:7.9-
e2.*2:m
}

melody = \relative c'' {
  
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 8 b,8 \bar "||"
  \mark \default
  b'8. g16 e2~
  e8 b fis' g a c
  b8. g16 e2~
  e8 b fis' g a c \break
  b8 e dis2
  b8 d cis2
  a8 c b4~ b8 e,
  fis2. \break
  b8 a fis2~
  fis2 r8 b,
  a'8 g e2~
  e2 r8 ais,8 \break
  g'8 fis cis2~
  cis2 d4
  dis2.~
  dis2 r8 b8 \bar "||" \break

  \mark \default
  b'8. g16 e2~
  e8 b fis' g a c
  b8. g16 e2~
  e8 b fis' g a c \break
  b8 e dis2
  b8 d cis2
  a8 c b4~ b8 e,
  fis2. \break
  b8 a fis2~
  fis2 r8 b,
  a'8 g e2~
  e2 r8 ais,8 \break
  g'8 fis cis4~ cis8 c
  e8 dis4. c8. b16
  e2.~
  e2 r4 \bar "|."


}


\bookpart {
  \header {instrument =\markup {
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "Concert"}}
  \score {
    <<
      \new ChordNames \transpose c' bes \chordNames
      \new Staff \with {instrumentName ="Melody"} \transpose c' bes { \melody }
    >>
    \layoutScore
  }
}

\bookpart {
  \header {instrument =\markup {
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "E flat instrument"}}
  \score {
    <<
      \new ChordNames \transpose ees bes \chordNames
      \new Staff \with {instrumentName = "Eb Horns"} \transpose ees bes { \melody }
    >>
    \layoutScore
  }
}

\bookpart {
  \header {instrument =\markup {
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "B flat instrument"}}
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with {instrumentName = "Bb Horns"}%\transpose bes c'
      { \melody }
    >>
    \layoutScore
  }
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
