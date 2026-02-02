\version "2.24.4"
\include "lilyjazz.ily"
\include "jazzchords.ily"


\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")""}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, << date >>" }
}

global = {
  \time 4/4
  \key d \minor

}

chordNames = \chordmode {
  % \override ChordNames.ChordName.font-name = #"LilyJazz Text"
%   \jazzOn
  \global

}

melody = \relative c'' {
  \jazzOn
  \global

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
      \new Staff \transpose bes c'' { \melody }
    >>

  }
}