\version "2.24.4"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Nardis"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Miles Davis"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Med. Fast"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") \today }
}

rm={\mark \default}

global = {
  \time 4/4
  \key e \minor
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  s2
  e1:m
  f2:maj7 e:maj7
  b1:7
  c1:maj7
  a1:m7
  f1:maj7
  e1:maj7
  e1:m7
  e1:m7

  a2.:m7
  f4:maj7
  f1:maj7
  a2.:m7
  f4:maj7
  f1:maj7
  d1:m7
  g1:7
  c2.:maj7
  f4:maj7
  f1:maj7

  e1:m
  f2:maj7 e2:maj7
  b1:7
  c1:maj7
  a1:m7
  f1:maj7
  e2.:maj7
  e4:m
  e1:m
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 2 b2
  \repeat volta 2 {
    \rm
    e1
    r8 dis,8 e e' dis4. c8
    <<
      \new Voice{
        b1~
        b1
      }
      \new Voice {
        \tuplet 3/2 {gis4 fisis gis} \tuplet 3/2 {g fis g}
        \tuplet 3/2 {fis e fis} \tuplet 3/2 {e d d8 e8}
      }
    >>
    r8 b'4. a4 g
    e4. a8~a2
    \tuplet 3/2 {gis8 a gis} f2 e4->~
  }
  \alternative{
    {
      e2 b'2
    }
    {
      e,2\repeatTie e2 \bar "||"
    }
  } \break

  \rm
  b'2. b4~
  b2 b,8c d g
  b2. b4~
  b2. r4
  r8 e4. d4 c
  e2 d2
  b2. b4~
  b2 b2 \bar "||" \break
  \mark #1
  e1
  r8 dis,8 e e' dis4. c8
  b1~
  b1
  r8 b4. a4 g4
  e4. a8~ a2
  \tuplet 3/2 {gis8 a gis} f2 e4~
  e1 \bar "|."
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
      \new Staff \transpose bes c' { \melody }
    >>

  }
}