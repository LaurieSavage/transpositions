\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Neverland"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "MArk Coffey"}
    piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Medium swing"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

rm={\mark \default}

global = {
  \time 4/4
  \key c \major

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global

}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  r2 e,4 e c a r e'8 c \bar "||"
  \rm
  d1
  r1
  r2 c4 d
  c b r4 c8 c
  b4 a a2
  r1
  r1
  r2 e4 c
  d2 e4 c
  d2 r2
  r2 g4 g
  b c d b
  c1
  r1
  r4 e4 e e \bar "||"
  
  \rm
}


\bookpart {
  \header {instrument =\markup { 
    \fontsize #2 \override #'(font-name . "LilyJAZZ Text") 
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
    \fontsize #2 \override #'(font-name . "LilyJAZZ Text") 
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
    \fontsize #2 \override #'(font-name . "LilyJAZZ Text") 
    "B flat instrument"}}
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c'' { \melody }
    >>
   
  }
}