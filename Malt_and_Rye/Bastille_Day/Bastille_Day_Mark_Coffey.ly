\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Bastille Day"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Mark Coffey"}
    piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Slow Bossa"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

rm = {\mark \default}

global = {
  \time 4/4
  \key c \major

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  %Interlude
  c1:maj bes:maj g:7 g:7
  % Section A
  d:m c:maj bes:maj a:m7
  g:7 g:7 d:m c:maj
  bes:maj a:m g:7 g:7
  %Section B
  ees:maj d:m7 d:dim c:maj
  f:maj g:7 f:maj g:7 a
  
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \repeat volta 2 {
    r1^"Intro/Interlude" r1 r1 r1
  }\break
  \rm r1_"We stand in ..." r1 r1 r1 \break
  r1 r1 r1_"We're of one blood..." r1 \break
  r1 r1 r1_"...Fall..." r1 \break
  
  \rm r1 r1 r1 r1 \break
  r1 r1_"...Mist..." r1 r1 \bar "||" r1^"Rhythm fill" \bar ":|." \break
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
      \override #'(font-name . "LilyJAZZ Text")
      "Form: Intro/Interlude x2 - A - B 
       Sax solos over Interlude, A, B, Interlude then vox.
     Repeat the last line x3 at the end"}}}
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
  \markup {
    \column{\wordwrap{
      \override #'(font-name . "LilyJAZZ Text")
      "Form: Intro/Interlude x2 - A - B 
       Sax solos over Interlude, A, B, Interlude then vox.
     Repeat the last line x3 at the end"}}}
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
      \markup {
    \column{\wordwrap{
      \override #'(font-name . "LilyJAZZ Text")
      "Form: Intro/Interlude x2 - A - B 
       Sax solos over Interlude, A, B, Interlude then vox.
     Repeat the last line x3 at the end"}}}
}