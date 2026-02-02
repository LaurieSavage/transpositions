\version "2.25.28"

\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Caravan "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Tizol/Ellington "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Form AABA"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "LS, " \today }
}

global = {
  \time 4/4
  \key aes \major

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  % A section
  c1*12:7
  f1*4:min6
  f1:min6
  %B section
  f1*4:9
  bes1*4:9
  ees1*4:7
  aes1*2:6
  g1:7
  des1:7.5-
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \repeat volta 2 {
    \mark \default
    c1~^"Bright Latin"
    c1~
    c4 des c g
    bes c e g, \break
    bes1~
    bes1~
    bes4 c des c
    des c b g \break
    bes1~
    bes1~
    bes4 c b bes
    a4 aes g ges
    f1~
    f1~
    f1
  }
  \alternative{{r1^"Fine" }{ r1 \bar "||"}} \break
  \mark \default
  f'1^"Swing"
  d2  c4. g8~
  g1~
  g4. f8 e4-. f4-. \break
  c'1
  g2 f4. c8~
  c1
  r2 bes'8 c des d
  es1
  c2 bes4. f8~
  f1~
  f2 g4-. ees-.
  c'4. aes8~ aes2~
  aes2 bes4-. aes-.
  g2 g4. g8~
  g2 r2^"D.C. al fine" \bar "||"
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
