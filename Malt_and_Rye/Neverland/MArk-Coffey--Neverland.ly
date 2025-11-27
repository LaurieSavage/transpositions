\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Neverland"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Mark Coffey"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Medium swing"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

rm={\mark \default}

global = {
  \time 2/2
  \key c \major

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  s1 s1
  d1*2:m g:7
  c:maj a:m
  d:m g:7
  bes1 b c
  %B
  b1*2:m7.5- e1*3:7
  a1*4:m
  d1*2 d1*2
  g1:7 aes:7 g1*2:7
  d1*2:m g1*2:7
  c1*2:maj a1*2:m
  d1*2:m
  g1*2:7
  c1*2

}

melody = \relative c''' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \repeat volta 2 {
    \rm
    r2 e,4 e c a r e'8 c
    d1_"go..."
    r1
    r2 c4 d
    c b r4 c8 c \break
    b4 a a2
    r1
    r1
    r2 e'4 c
    d2 e4 c
    d2 r2 \break
    r2 g,4 g
    b c d b
    c1
    r1
  }
  \break
  \rm
  r4\fermata e4_"all"-- e_"the"-- e_"things"--
  r4 e2 e4
  e2 e4 e4
  e2_"kept" e4 e4
  a\mark \markup{\box "Vox solo"} e d e~
  e2 e4 e4
  a4 e e c
  f c c a
  a2 r2
  e'4 e2 c4
  d2 d4 c
  d2 d4 c
  d2 d4 c
  d2 d4 d
  d4 d2 d4
  d4 d d d
  d r4 e e
  c a r e'8 c \bar "||"
  \break

  \mark #1
  d1
  r1
  r2 c4 d
  c b r c8 c
  b4 a a2
  r1
  r1

  r2 e'4 c
  d2 e4 c
  d2 e4 c
  d2 r4 g,4
  b c d b
  c1
  r1 \bar "|."
}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
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
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c { \melody }
    >>

  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
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