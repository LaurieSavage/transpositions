\version "2.25.13"
%\include "lilyjazz.ily"

\header{
  title = "Memphis Underground"
  composer = "Herbie Mann"
  instrument = "Tenor Sax"
  tagline = "Edited by LS"
  piece = "Rock feel"
}

melody = {
  \relative c' 
  {
    \key c \major 
    \time 4/4
    %\partial 8*3 r8 r4 
    r1 r1
    \repeat volta 2 {
      c'8 c r4 r4 c8 c r8 e,4 g8~ g a4 bes8
      r8 a4 g8~ g f4 dis8 (e) c~ c4 r2
    }
  }
}

jazzChords =  \chordmode {
  %\partial 8*3 
  %s8 s4 
  %ees2:min7/aes aes:7
  c1:7 c1:7
  c1:7 c1:7
  c1:7 c1:7
}

\score {
  
  <<
    \new ChordNames {\jazzChords}
    \new Staff \with { instrumentName = "Flute"} \transpose c c' {
      \melody
    }
    \transpose bes c 
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
    }
    \new Staff \with { instrumentName = "Tenor Sax"}\transpose bes c' \melody
  >>
  
}
