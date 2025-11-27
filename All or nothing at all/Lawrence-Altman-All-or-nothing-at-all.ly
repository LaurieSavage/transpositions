\version "2.24.3"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"All or Nothing At All"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Jack Lawrence / Arthur Altman"}
    piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Easy swing"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key d \major 
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
% A section
  b1:m
  b1:m7+
  b1:m7
  b1:m6
  b2:m b2:m7+
  b2:m7 b2:m6
  c2:7 c2:6
  c2:aug c2:7
  a1:m7
  a1:m6
  e1:m6.9
  f1:dim7
  e1:m9
  a1:aug7
  d1:6.9
  % 1st time
  cis2:m7 fis:7.9+
  % 2nd time
  f1:7
  
  % B section
  
  bes2 bes2:aug
  bes2:6 bes2:aug
  bes2 bes:aug
  bes2:6 f:7
  bes1:maj7
  b2/bes bes2:maj7
  c1:m7
  f1:7
  c1:m7
  f1:7
  c1:m7
  d1:aug7
  g1:m7
  ees1:7
  d1:7
  fis1:aug7
  
  % A section
  b1:m
  b1:m7+
  b1:m7
  b1:m6
  b2:m b2:m7+
  b2:m7 b2:m6
  c1*2:7 
  a1*2:m7
  e1:m6.9
  fis1:7.9+
  b1:m7
  c1:9
  d1*2:6.9
  
}

melody = \relative c' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \mark \default
  \repeat volta 2 {
   fis1~
   fis4 fis \tuplet 3/2 {fis4 g d }
   fis1~
   fis1  \break
   fis2 fis2
   fis2 \tuplet 3/2 {fis4 a d,}
   e4. e8 e2~
   e1  \break
   e2 e2
   e2 \tuplet 3/2 {fis4 dis e }
   b'4. b8 b2~
   b2 cis4 b \break
   a4 a2 a4
   a4 a2 a4
   a1~
  }
  \alternative{
    {
      a4 r4 r2
    }
    {
      a2.\repeatTie f4 \bar "||"
    }
  }
   \break
  \mark \default
  d'4 d d d
  d4. d8 \tuplet 3/2 {d4 ees bes}
  d1~
  d2. f,4  \break
  d'4. d8 d4. d8 ees2 \tuplet 3/2 { d4 c bes}
  a1~ 
  a2. f4 \break
  \tuplet 3/2 {c'4 c c} c4. c8  
  \tuplet 3/2 {c4 c c} \tuplet 3/2 {c4 d a}
  c1~
  c2 d4 c \break
  bes2 bes4 bes 
  bes4 bes2 bes4
  a1
  r4 e d cis \bar "||"  \break
  
  \mark #1
     fis1~
   fis4 fis \tuplet 3/2 {fis4 g d }
   fis1~
   fis1  
   fis2 fis2
   fis2 \tuplet 3/2 {fis4 a d,} \break
   e4. e8 e2~
   e1  
   e2 e2~
   e4. e8 \tuplet 3/2 {fis4 dis e}
   b'1
   cis1 \break
   d1~ 
   d4 d4 \tuplet 3/2 {d d d}
   d1~
   d1 \bar "|."
  
  
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
      \new Staff \transpose bes c' { \melody }
    >>
   
  }
}