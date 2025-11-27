\version "2.25.13"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Stella makes tea"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Mark Coffey"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Swing"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key c \major

}

rm={\mark \default}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  c1*4
  c1 a:m d:m g
  d g c1*2:m c1*2:7
  f1 g e:m a:m
  d:m g/d c1*2:maj
  f1 b:m7
  e:7 a:m d1*2:m
  bes1*2 d1:m g:7 e1*2:7


}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \mark \markup {\box "Bass Intro"}
  \repeat volta 2 {
    r1 r1 r1 r1 \bar "||" \break
    \rm
    r1 r1 r1 r1 \break
    r1 r1
  }\alternative{{ r1 r1 }{ r1 r1 \bar"||"}} \break
  \rm
  r1 r1 r1 r1 \break
  r1 r1 r1 r1 \break
  r1 r1 r1 r1 \break
  \mark \markup{\box "Latin"} r1 r1 r1 r1 \break
  r1 r1 r1 r1 \bar "|."\mark \markup {\box "Outro"}
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
  \markup {
    \column{
      \wordwrap{
        \override #'(font-name . "LilyJAZZ Text")
        "Form: Vocal - AAB, Piano AAB, Sax AAB, Vocal AAB Out"
      }
    }
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
  \markup {
    \column{
      \wordwrap{
        \override #'(font-name . "LilyJAZZ Text")
        "Form: Vocal - AAB, Piano AAB, Sax AAB, Vocal AAB Out"
      }
    }
  }
}