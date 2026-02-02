\version "2.24.4"
\include "lilyjazz.ily"
today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"Voyage"}
  composer =\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Kenny Barron"}
    piece = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Bright swing"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key f \minor
  \tempo 4 = 232
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  
  \global
  % A section
  f1*2:min6.9
  fis1:min6.9
  f1:7.9-
  bes1:min7
  g2:min7.5- c:7.9-
  f1:m6.9
  g2:m7.5- c:7.9-

  % 2nd time ending
  f1*2:m6.9

  % B section
  des1:maj7
  e2:m7 a4.:7 d8:maj7
  d1:maj7
  f2:m7 bes4.:7 ees8:maj7
  ees1:maj7
  fis2:m7 b4.:7 e8:maj7
  e1:maj7
  g2:m7.5- c:7.9-

  % A''
  f1*2:min6.9
  fis1:min6.9
  f1:7.9-
  bes1:min7
  g2:min7.5- c:7.9-
  f1:m6.9
  g2:m7.5- c:7.9-
}

melody = \relative c'' {
  
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \mark \default
  \repeat volta 2 {
    c8 bes aes g~g2
    r4 r8 f g aes r4
    cis8 b a gis~ gis2
    r8 f ges aes a c f c
    ees4. des8 r8 f,8 aes c
    r8 c bes ees des c aes e
  }
  \alternative{
    {
      c'8 bes aes g~ g2
      r1
    }
    {
      c8 bes aes g~ g2
      r4 r8 f g aes r4 \bar "||"
    }
  }\break

  \mark \default
  aes4 \tuplet 3/2 {f8 ees des} c des f aes
  a2 a4. a8~
  a4 \tuplet 3/2 {fis8 e d} cis d fis a
  bes 2 bes4. bes8~ \break
  bes4 \tuplet 3/2 {g8 f ees} d ees g bes
  b2 b4. b8~
  b4 \tuplet 3/2 {gis8 fis e} dis e gis b
  c8 bes ees des c fis, r4 \bar "||"\break

  \mark #1
  c'8 bes aes g~g2
  r4 r8 f g aes r4
  cis8 b a gis~ gis2
  r8 f ges aes a c f c
  ees4. des8 r8 f,8 aes c
  r8 c bes ees des c aes e
  c'8 bes aes g~ g2
  r1 \bar "|."
}


\bookpart {
  \header {instrument =\markup {
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "B flat instrument"}}
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
}