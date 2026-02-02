\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

today = \markup { %\fontsize #2 \override #'(font-name . "lilyjazz Text")
#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = %\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")
  "Yesterdays"%}
  composer =%\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") 
  "Jerome Kern"%}
  piece = %\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") 
  "Swing"%}
  tagline = %\markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") 
  "Edited L S" 
}

rm={\mark \default}

global = {
  \time 4/4
  \key d \minor

}

chordNames = \chordmode {
  %\override ChordNames.ChordName.font-name = #"lilyjazz Text"
  %
  \global
  d1:m
  e2:m7.5- a2:7.9-
  d1:m
  e2:m7.5- a2:7.9-
  d2:m
  d2:m/cis
  d1:m/c
  b1:m7.5-
  e1:7
  a1:aug7
  d1:7
  g1:7
  c1:7
  c2:m7 f2:7
  bes2:maj7 es2:maj7
  e1:m7
  es1:7
  %es1:7
  d1:m
  d2.:m
  es4:7

}

melody = \relative c'' {
  %
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \repeat volta 2 {
    a2. f4
    g1
    a2. f4
    g1 \break
    d4 e f g
    gis a b c
    f2. b,4
    e1 \break
    f2. a,4
    e'1
    e2. g,4
    d'1 \break
    d2. a4
    c4 bes f g
    a1
    a2 a2 }\break

  a1~^"Ending"
  a2. r4 \bar "|."

}


\book {
  \bookOutputSuffix "C"
  \header {instrument =%\markup {
    %\fontsize #2 \override #'(font-name . "lilyjazz Text")
    "Concert"}%}
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    % \layout { }
    %\midi { }
  }
 %{ \markup \override #'(box-padding . 1.5) {\box{\column {
    \bold {"Changed from the Real Book"}
    "The Real Book has an extra 2 bars marked as the second repeat instead of the song's ending."
    "Sources: Benny Golson's and Stan Getz's recordings"
  }}}
 %}
}

\book {
  \bookOutputSuffix "Eb"
  \header {instrument =\markup {
    %\fontsize #2 \override #'(font-name . "lilyjazz Text")
    "E" \flat " instrument"}}
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
   %{ \markup \override #'(box-padding . 1.5) {\box{\column {
    \bold {"Changed from the Real Book"}
    "The Real Book has an extra 2 bars marked as the second repeat instead of the song's ending."
    "Sources: Benny Golson's and Stan Getz's recordings"
  }}}
 %}
}

\book{
  \bookOutputSuffix "Bb"
  \header {instrument =\markup {
    %\fontsize #2 \override #'(font-name . "lilyjazz Text")
    "B" \flat " instrument"}}
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
   %{ \markup \override #'(box-padding . 1.5) {\box{\column {
    \bold {"Changed from the Real Book"}
    "The Real Book has an extra 2 bars marked as the second repeat instead of the song's ending."
    "Sources: Benny Golson's and Stan Getz's recordings"
  }}}
 %}
}