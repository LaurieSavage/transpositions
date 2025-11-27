\version "2.24.3"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "TabA.ily"
\include "swing.ly"

\header {
  title = "What a difference a day made"
  composer = "María Grever"
  poet = "Eng. Lyr.: Stanley Adams"
  instrument = "Tenor Sax"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1

}

melody = \relative c'' {
  \global
  c4 d e f

}

words = \lyricmode {


}

\score {
  <<
    \new ChordNames \chordNames
    \new FretBoards \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
