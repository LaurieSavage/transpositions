%\version "2.24.4"
\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "TabA.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))



\header {
  title = \markup \with-color "tomato" { "Killer Joe" }
  composer = \markup \with-color "tomato" { "Benny Golson" }
  piece = ""
  tagline = \markup \with-color "tomato"  { "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key c \major
  \jazzTweaks
}

mdf = {\mark \default}

chordNames = \chordmode {
  \global
  c1:7 bes:7 c:7 bes:7
  c:7 bes:7 c:7 bes:7

  e:min7.5- a:7.5+.9+ ees:min7 e2:min7/aes aes:7.9-
  a1:7.13 ees2:min7/aes aes:7.9- e1:min7 a:7.13

  c1:7 bes:7 c:7 bes:7
  c:7 bes:7 c:7 bes:7
}

melody = \relative c'' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

  \repeat volta 2{
    \mdf r2_"bass walks" f4 e8 g~
    g1~
    g2 e4 c8 bes~
    bes1~\break
    bes2 f'4 e8 g~
    g2. e8 g~
    g1~
    g2 r2
  }\break

  \mdf g,1~\p\<^"no pulse"
  g2 a2
  bes1~
  bes2 c2\break
  cis1~
  cis2 ees2
  e1~
  e1\f \bar "||" \break

  \mark #1
  r2_"bass walks" f4 e8 g~
  g1~
  g2 e4 c8 bes~
  bes1~\break
  bes2 f'4 e8 g~
  g2. e8 g~
  g1~
  g2 r2
}


\book {
  \bookOutputSuffix "C"
  \tabA
  \header {
    instrument = \markup \with-color "tomato" { "Concert" }
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

\book {
  \tabA
  \bookOutputSuffix "Eb"
  \header {
    instrument = \markup \with-color "tomato" { "E flat instruments" }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c { \melody }
    >>
  }
}

\book {
  \tabA
  \bookOutputSuffix "Bb"
  \header {
    instrument = \markup \with-color #tomato { "B flat instruments" }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>
  }
}

%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4,
2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12
%}
