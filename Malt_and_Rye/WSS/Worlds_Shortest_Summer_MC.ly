\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"World's shortest summer"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Mark Coffey"}
    piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Once through, sax over AA, vox B, sax fills"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

rm={\mark \default}

global = {
  \time 3/4
  \key g \minor

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  s2. bes2.*2:maj f2.
  f2. g2.*4:6
  c2.*2:m
  d2.*2:m7
  g2.*3:m7
  
  c2.*4:m
  g2.*4:m
  c2.*4:m
  g2.*4:m
  s2.
  c2.*4:m
  g2.*4:m
  c2.*3:m
  d2.*2:m7
  d2.*2:7
  
  s2.
  bes2.*2:maj
  f
  g2.*4:6
  c2.*2:m
  d2.:m7
  s2.
  g2.:m

}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \rm
  \repeat volta 2{
  bes4 a g
  f2.
  r2.
  r2.
  bes4 a g
  f d2
  r2.
  r2.
  d4 g d
  c2.~
  c4 c c
  d8 d d4 d
  r4 d bes'
  g2.
  r2.
  r2.}\break
  
  \rm
  r2.
  r2 c,8 bes
  c2 bes4 
  c4 d2
  r2.
  bes2 g4
  g2 f4
  g2. \break
  r2.
  r2 c8 bes
  c2 bes4
  c4 d2
  r4 d d
  bes'2 g4
  g2 f4
  g2. \break
  r2.
  r2 c,8 bes
  c2 bes4
  c4 d2
  r2 g,4
  bes2 g4
  g2 f4
  g2. \break
  r2.
  r2 c8 bes
  c2 bes4
  c4 c2
  r4 c4 c4
  d4 d2~
  d4 d d
  d r d \bar "||" \break
  
  \rm
  bes'4 a g
  f2.
  r2.
  r2 f4
  bes4 a g
  f d2
  r2.
  r2 d4
  \repeat volta 3 {
  d g d
  c2.
  r4 c c
  }
  \alternative{
%    {d4 d2}
    {d4 d2}{
      r4\mark "Rit." d-- bes'--
      g2.
      r2.
      r2. \bar "|."
  }}
  
  
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