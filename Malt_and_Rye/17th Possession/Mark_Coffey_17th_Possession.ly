\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"17th Possession"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Mark Coffey"}
    piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Carribean feel"}
      meter = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Drums-Ax2-B-A-Cx3-Tagx2"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 2/4
  \key g \minor

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  s8
  % A
  g2:m g2:m g2:m g2:m 
  c2:m g:m c:m g:m
  ees d:7 g:m g:m
  %B
  g:m g:m g:m g:m
  c:m c:m g:m g:m
  %C
  g2:m g2:m g2:m g2:m 
  c2:m g:m c:m g:m
  ees d:7 g:m g:m

}

% Rehearsal Mark \rm
rm = {\mark \default}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 8 d,8 \bar "||" \rm
  bes'8. a16 g16 f8.
  d16 c8. bes8 c8
  d8. g16 \tuplet 3/2 {g8-- f-- g--}
   r2  \break
   r2^"Ad lib simile" r2  r2 r2 \break
   r2 r2 r2 r2 \bar "||" \break
   \rm
    r2 r2 r2 r2 \break
    r2 r2 r2 r2 \break
   \rm
    r2^"Solos" r2 r2 r2 \break
    r2 r2 r2 r2 \break
    r2 r2 r2 r2 \bar "||" \break
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