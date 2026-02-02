\version "2.24.4"
\include "LilyJAZZ.ily"


\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Chelsea Bridge"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Billy Strayhorn"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, 27/6/2016" }
}

global = {
  \time 4/4

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
s1
ees1:7 des:7 ees2:7 des:7 bes1:7
ees:m7 aes:7 des:6
s4 c4:7 b:7 bes:7 des4 s s b:7

fis2:m9 b:7 e:maj7 g:m7.5- 
fis:m7 f:7 b:m7 e:7
a4:maj7 s a:m7 d:7 g1:maj7
g:m7 des4:7 c:7 b:7 bes:7

ees1:7 des:7 ees2:7 des:7 bes1:7
ees:m7 aes:7 des:6

}

melody = \relative c'' {
  \jazzOn
  \global
\key des \major
% Unaccompanied Intro
r4 bes,8 c des ees \tuplet 3/2 { f g aes }
% A section
\repeat volta 2 {
 a2. bes4
 g2. aes4
 a bes g aes
 d,1
 f8 des (des2.)
 f8 aes (aes2.)
 f8 des (des2.
}
\alternative {{des4) bes8 c des ees \tuplet 3/2 { f g aes }}{des,2.) aes'8 a}}
\break

% B Section
\key e \major
b8 b b b~ b2
b8 dis, \tuplet 3/2 { e gis b} dis4 e8 cis
b gis' e cis c g'4 ees8 
d2. e,8 fis
gis4. a8 e'4 d8 c
b d~ d2 g,8 a
bes4 gis8 b d4 b8 d
g4 bes,,8 c des ees \tuplet 3/2 { f g aes } \bar "||"
\break

% Reprise
\key des \major
a2. bes4
 g2. aes4
 a bes g aes
 d,1 \break
 f8 des (des2.)
 f8 aes (aes2.)
 f8 des (des2.des2.) r4 \bar "|."


}

\bookpart {
  \header {piece =\markup { 
    \fontsize #2 \override #'(font-name . "LilyJAZZ Text") 
    "Concert instrument"}}
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
  \header {piece =\markup { 
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
  \header {piece =\markup { 
    \fontsize #2 \override #'(font-name . "LilyJAZZ Text") 
    "B flat instrument"}}
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>
   
  }
}