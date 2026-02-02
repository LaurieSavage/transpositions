\version "2.24.4"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Sack of woe"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Julian Adderley"}
    piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Blues"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key c \major


}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
s1*8
f1*4:7
bes1*2:7
f1*2:7
c1:7
bes1:7
f1*2:7

f1*4:7
bes1*2:7
f1*2:7
c1:7
bes1:7
c1*2:7
f1*4:7
}

melody = \relative c'' {
  %\jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  r1*8^"x8"
  \bar ".|:-|"
  r2\segno  c8 (ees~ees4)
  \tuplet 3/2 {b8 (bes aes} f4) aes8 (bes4) f8~
  f1~
  f1
  r2 c'8 (ees~ees4)
  \tuplet 3/2 {b8 (bes aes} f4) aes8 (bes4) f8~
  f1~
  f1
  r2 c'8 (ees~ees4)
  \tuplet 3/2 {b8 (bes aes} f4) aes8 (bes4) f8~
  f1~
  f1 \bar "||"\break
  
  e'8. (f16 e8. f16~ f4)\glissando b,
  c4-^ gis-^ a-^ r4
  r4 c8. b16 bes8. aes16 f16 (ees f8~ f1)
  e'8. (f16 e8. f16~ f4)\glissando b,
  c4-^ g-^ aes-^ r4
  r4 c8. b16 bes8. aes16 f16 (ees f8~ f1)
  e'8. (f16 e8. f16~ f4)\glissando b,
  c4-^ gis-^ a-^ r4
  r2 c8 (ees8~ ees4)
  \tuplet 3/2 {b8 (bes aes} f4) aes8 (bes4) f8~ \bar "||"
  f1^"D.S 2nd ending solos"~f1~f1~f1 \bar ":|."
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
      \new Staff \transpose ees c { \melody }
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
      \new Staff \transpose bes c' { \melody }
    >>
   
  }
}