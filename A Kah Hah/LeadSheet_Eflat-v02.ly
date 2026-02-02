\version "2.24.4"
\include "LilyJAZZ.ily"


\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"A-Kah-Hah"}
  composer = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Lloyd Swanton"}
  instrument = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"E flat"}
  tagline = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Standing Tall - 2015"}
}

% Function to print a specified number of slashes
comp = #(define-music-function (count) ( integer?)
  #{
    \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
    \override Rest.thickness = #0.48
    \override Rest.slope = #1.7
    \repeat unfold $count { r4 }
    \revert Rest.stencil
  #}
)

global = {
  \time 2/2
  \key c \major
  \tempo 4=168
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  %\global
 s1*8
 g1 a:m g f4 fis g2
 g1 a:m g f4 fis g2
 s1*12
 g1 a:m g f4 fis g2
 
  
}

melody = \relative c'' {
  \global
  
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  
  \repeat volta 4 {
    \bar ".|:-|"
    \clef bass
    R1^\markup { 
      \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Bass intro with stick"
    } 
    R1*3
  }
  \break
  
  \repeat volta 2 {
    \clef treble
    \mark \default
     b8^"Horns"  d r d e d dis e
     r4 r8 g a4 bes
     a8 g r g a c, cis d
     g, gis b bes gis b r4
     
     \break 
     \comp #4 \mark "Alternate horn solos"
     \comp #4
     \comp #4
     \comp #4
     
     \break
     \comp #4
     \comp #4
     \comp #4 \mark "Repeat till cue"
     \comp #4
  } \break
  
  \repeat volta 2 { \mark \default
    g'2.^"Horns unison"_"Rhythm section counterline last two times of 'B'" d8 (bes c4.) d8 c c g4
    g'2. d8 (bes c) c c4 g2^"6x"
  } \break
  
  \repeat volta 2 { \mark \default
   g4 ges f~f8 a~a ais4 b8~b4 g 
   ges f~f8 a4 ais8~ais b4. g4 ges
   f4. a8~a ais4 b8~b4 g ges f~f8 a4 ais b g8~ g4 g g r4
  } \break
  
  \mark \default
  \comp #4
  \comp #4
  \comp #4
  \comp #4
  \break
  
  b8^"Horns unison" 
    d r d e d dis e
     r4 r8 g a4 bes
     a8 g r g a c, cis d
     g, gis b bes gis-> b-> r4 \bar "|."
  
  
}

words = \lyricmode {
  \jazzOn 
  
  
}

\score {
  <<
    \new ChordNames \transpose ees c \chordNames
    %\new FretBoards \chordNames
    \new Staff \transpose ees c   {\jazzOn \melody }
    %\addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
