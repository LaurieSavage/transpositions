\version "2.25.28"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

\header {
  title = "The Approaching Storm"
  composer = "James Pankow"
  meter = "*"
  piece = "Rock"

}

global = {
  \time 4/4
  \key c \major
%  \tempo 4=100
}

bassA = {
 \new CueVoice {e,16 e e e e8}
}
chordNames = \chordmode {
  %\time 4/4
  %\partial 8*3 c8*3:m7
  % e.g c1*4:m7.5+
}

rm = {\mark \default}

melody = \relative c' {
  \global
  e8-^ e8\rest r4 \bassA r8 r8 e'8
}

gtr = \relative c' {
  \global

}

bassGtr = \relative c {
  \global
  \clef bass
  r2 e,16 e e e e8 r8
}

%words = \lyricmode {


%}

\score {
\new StaffGroup
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c'' \melody
    }
    \new ChordNames \transpose ees c \chordNames
    \new Staff {
      \set Staff.instrumentName="E flat"
      \transpose ees c' \melody
    }
    \new Staff \with { instrumentName = "Guitar" } \gtr
    \new Staff \with { instrumentName = "Elec. Bass" } \bassGtr
  >>
  \layout { }
}
