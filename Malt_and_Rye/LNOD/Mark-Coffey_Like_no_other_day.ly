\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Like no other day"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Mark Coffey"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Ballad"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

rm={\mark \default}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  %A
  c1:maj bes:maj a:m7 g:7
  f:maj ees:maj d:m7 g:7
  c:maj bes:maj a:m7 a:m/g
  f:maj ees:maj d:m7 g:7
  g:m7 c:7 g:m7 c:7
  f:maj aes:7 c:maj c2:maj aes2:7
  %B
  des1 b bes:m aes:7
  fis:maj e:maj ees:m7 aes:7
  des:maj b:maj bes:m7 aes:7
  fis:maj e:maj ees:m7 aes:7
  %des:maj b:maj bes:m7 aes:7
  aes:m7 des:7 aes:m7 des:7
  %Tag
  fis a:7 cis:maj b
  a:7 aes:7 des ees f:m ges des
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

  \rm
  r1 r1 r1 r1 %\break
  r1 r1 r1 r1 \break
  r1 r1 r1 r1 %\break
  r1 r1 r1 r1 \break
  r1 r1 r1 r1 %\break
  r1 r1 r1 r1 \bar "||"
  \break
  \rm
  r1 r1 r1 r1 %\break
  r1 r1 r1 r1 \break
  r1 r1 r1 r1 %\break
  r1 r1 r1 r1 \break
  r1 r1 r1 r1 %\break
  r1 r1 r1 r1 \break
  r1 r1 r1 r1 %\break
  r1 r1 r1 \bar "|." \break
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
      \new Staff \transpose ees c' { \melody }
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
      \new Staff \transpose bes c'' { \melody }
    >>

  }
}