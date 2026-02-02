\version "2.24.3"
\include "LilyJAZZ.ily"
\version "2.24.3"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Minority"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Gigi Gryce"}
    piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Up"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key f \minor
  %\tempo 4=200

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  f1:m9
  d1:m7.5-
  g1:m7.5-
  c1:7.9-
  f1:m9
  d1:m7.5-
  c1:m7
  f1:7
  bes1:m7
  ees:17
  aes1:m7
  des1:7
  ges1:m7
  ces1:7
  g1:m7
  c1:7.5+
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \repeat volta 2{
    g2~ g4. f8
    r2 d8 e f g
    a2 a4. g8
    a8 c4 a8~ a2 \break

    g2~ g4. f8
    r2 f8 g bes c
    d2~ d4 c
    d8 f4 d8~d2  \break

    c2~ c4 bes
    c8 ees4 c8~ c2
    r4 bes4 bes4. aes8
    bes8 des4 bes8~ bes2  \break

    aes4. aes8~ aes4. aes8
    r2 \tuplet 3/2 {f4 ges aes}
    a4. a8~ a4. a8
    r2 c8 aes e c
  }
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