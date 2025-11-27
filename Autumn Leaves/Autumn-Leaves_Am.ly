\version "2.24.3"
today =   #(strftime "%d-%m-%Y" (localtime (current-time)))


\header {
  title =  "Autumn Leaves"
  composer = "Composer: Joseph Kosma"
   poet = "English lyrics: J. Mercer"
  piece = ""
  tagline = \markup{ "Edited Laurie Savage "  \today}
}

global = {
  \time 4/4
  \key e \minor
  \tempo 4 = 120
}

chordNames =  \transpose e a {
  \chordmode
  {
        \global
    s2.
    a1:m7
    d1:7
    g1:maj7
    c1:maj7
    fis1:m7.5-
    b1:7
    e1*2:m

    b1:7
    e1*2:m

    fis1:m7.5-
    b1:7.9-
    e1*2:m
    a1:m7
    d1:7
    g1*2:maj7
    fis1:m7.5-
    b1:7.9-
    e2:m7 ees2:7
    d2:m7 des2:7
    c1:maj7
    b1:7.9-
    e1:m
    e1:m
  }
}

melody =
\transpose e a {
  \relative c
  {
        \global
    \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

    \partial 2. e'4 fis g
    \repeat volta 2{
      \mark \default
      c1~
      c4 d, e fis
      b2 b2~
      b4 c, d e \break
      a1~
    }
    \alternative{
      {
        a4 b, cis dis
        g1
        r4 e4 fis g
      }
      {
        a4\repeatTie fis a g
        e1~
        e4 r4 dis e \bar "||" \break
      }
    }
    \mark \default
    fis4 b, fis'2
    fis4 fis e fis
    g1~
    g4 g fis g \break
    a1~
    a4 d d c
    b1~
    b4 r4 bes4 b \bar "||" \break

    c4 c a a
    fis2. c'4
    b2 b2~
    b2. e,4 \break
    a2. g4
    fis2 g4 b,
    e1_"fine" \bar "||"
    r4 e4 fis g  \bar "|."

  }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument =%\markup {
      %\fontsize #2 \override #(font-name . "LilyJAZZ Text")
      "Concert"
    %}
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
    %\midi { }
  }
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument =%\markup {
      %\fontsize #2 \override #(font-name . "LilyJAZZ Text")
      "E flat instrument"
    %}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c { \melody }
    >>
    \layout {}
  }
}

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = %\markup {
      %\fontsize #2 \override #(font-name . "LilyJAZZ Text")
      "B flat instrument"
    %}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>
    \layout {}
    \midi { }
  }
}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `...
Applying conversion: 2.19.2 2.19.7 2.19.11 2.19.16 2.19.22
2.19.24 2.19.28 2.19.29 2.19.32 2.19.40 2.19.46 2.19.49
2.19.80 2.20.0
%}
