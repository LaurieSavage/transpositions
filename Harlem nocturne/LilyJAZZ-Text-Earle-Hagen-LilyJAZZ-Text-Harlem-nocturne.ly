\version "2.24.4"
\include "lilyjazz.ily"

today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"Harlem nocturne"}
  composer =\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Earle Hagen"}
    piece = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Slowly"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") \today }
}

rm={\mark \default}

global = {
  \time 4/4
  \key bes \major

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  
  \global
  s8 bes2:7 f:m7

}

melody = \relative c'' {
  
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \mark "Piano intro"
  \partial 8 c8
  bes f g aes~aes4. bes8
}


\bookpart {
  \header {instrument =\markup {
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "Concert"}}
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
  \header {instrument =\markup {
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "E flat instrument"}}
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
}

\bookpart {
  \header {instrument =\markup {
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "B flat instrument"}}
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c'' { \melody }
    >>

  }
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
