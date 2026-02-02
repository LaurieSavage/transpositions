\version "2.24.4"
\include "lilyjazz.ily"
\version "2.24.4"
\include "lilyjazz.ily"
today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"Boogie Stop Shuffle"}
  %subtitle = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"C Section"}
  composer =\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Charle Mingus"}
  piece = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Fast, minor blues"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key bes \minor
\tempo 4 = 220
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  
  \global
  bes4:m
}

melody = \relative c'' {
  
  \global
\set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
% Section A
  bes,8^"Blues" bes des des ees4 r4
  bes8 bes des des e4 r4
  bes8 bes des des ees ees e e
  ees ees des des bes4 r

  ees8 ees ges ges aes4 r
  ees8 ees ges ges a4 r
  bes,8 bes des des ees ees e e
  ees ees des des bes4 r
  f'8 f ges ges f f e e
  ees ees e e ees ees des des
  bes bes des des ees ees des des
  bes bes aes aes bes4 r \bar "||"\break
  % Section A
  \mark \default
  r2_"boogie line continues" <e ges bes des>4 r4
  r2 <cis e ges bes>4 r
  r1
  r1
  r2 <ges' bes ees>4 r
  r2 <g b e>4 r4
  r1
  r1
  <fis ees'>2^"(dim. harmony)" <ges e'>2
  <fis ees'>2 <e des'>2
  <ees c'>2 <e des'>2
  <ees c'>4. <des bes'>8 r2 \bar "||"
  \break
  % Section B
  \mark \default
  <ges bes des>8 <e ges bes> r <e ges bes>~ <e ges bes>2
  r1
  des'8 bes r bes~ bes2
  r1
  <aes e'>8 <g ees'> r <g ees'>8~ <g ees'>2
  r1
  <ges bes des>8 <e ges bes> r <e ges bes>~ <e ges bes>2
  r1
  <fis ees'>2^"(dim. harmony)" <ges e'>2
  <fis ees'>2 <e des'>2
  <ees c'>2 <e des'>2
  <ees c'>4. <des bes'>8 r4 r8  e8 \bar "||"
  \break
  % Section c
  \mark \default
  f8 bes f ees des a bes ees
  r2 r4 r8 e8 f bes f ees des a bes ees
  des8 ges, r4 r2\break

  r8 e' f bes ges f ees c'
  bes ges f des c bes a gis
  g1~
  g1\break

  r8 a bes ees c des ges d
  ees bes' f ges des' a bes e~
  e1~
  e1 \bar "|."


}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
      "Concert"
    }
  }
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
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
      "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
}