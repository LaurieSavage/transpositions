\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"What it means (to be loved)"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Mark Coffey"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Rock Latin Feel"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  % \key a \major

}
rm = {\mark \default}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  a1 fis:m7 cis1*2:m
  a1 fis:m7 cis1*2:m
  a1 fis:m7 cis1*2:m
  d1*2 d1*2:m
  a1 fis1:m7 b1:m7 e1:7
  d1*2 dis1*2:dim
  a1*2 a1*2:7
  d1*2 dis1*2:7
  a1 fis1:m7 b1:m7
  e1:7
  g1
  c1 a1:m7 e:min g:7
  c a:min e:min g:7
  f1*2:m7+
  f1*2:m
  f1*2:m7
  f1*2:m
  c1:m7+
  a:m7
  aes:7
  g:7
  c1*3:maj

}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \key a \major
  \mark \markup{\box"Introduction"}\repeat volta 2 { 
    a4. e'8 e4. fis8
    fis,4. cis'8 cis4. fis,8
    cis4. gis'8 gis4. cis,8
    cis4. gis'8 gis4 r4
  }\break
  \repeat volta 2 {
    \rm
    r4 cis8 d e d cis cis~
    cis2 r8 cis8 e4
    gis4. e8 e4 r4
    r1
    r4 cis8 d e d cis cis~
    cis2 r8 cis8 e4
    gis4. e8 e4 cis8 e~
    e2 r2
    r4 fis8 gis a gis fis fis~
    fis2 r2
    r4 f8 g a g f f~
    f4 r8 a a g~g f
    e2 r2
    r4 r8 fis, \tuplet 3/2 {e'4 d cis}
    b2 r2
    r1
  }\break
  \rm 
  \repeat volta 2 { %\mark \markup {\box "Refrain"}
    r4 fis'8 gis a gis fis fis~
    fis2 r2
    r4 fis8 gis a gis fis fis~
    fis4. a8 a4 b
    cis4. e,8 e2
    r1
    r1
    r1
    r4 fis8 gis a gis fis fis~
    fis2 r2
    r4 fis8 gis a gis fis fis~ 
    fis2 r2
    r1
    r4 cis8 d e d cis b~
    b2 r2
  }\alternative{{r1}{r1}}\break
  \key c \major
  r4 e8 f g f e e~
  e4. e8 e e~e g
  b4. g8 g2
  r1
  r4 e8 f g f e e~
  e4. e8 e g~g4
  b4. g8 g e g4~
  g2 r2
  r4 a8 b c b a a~
  a2 r2
  r4 aes8 bes c bes aes aes~
  aes2 r2
  r4 a8 b c b a a~
  a2 r2
  r4 aes8 bes c bes aes aes~
  aes2 r2
  r1
  r4 r8 g,8 g' f e d~
  d1
  r1
  r1
  r1
  r1 \bar "|."
  
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
  \markup {
      \column{\wordwrap{
        \override #'(font-name . "LilyJAZZ Text")"Form: Intro, Vocal: AABA,
Sax: AA, Vocal: BAABC with sax fills"
              }
      }
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
  \markup {
      \column{\wordwrap{
        \override #'(font-name . "LilyJAZZ Text")"Form: Intro, Vocal: AABA,
Sax: AA, Vocal: BAABC with sax fills"
              }
      }
    }
}