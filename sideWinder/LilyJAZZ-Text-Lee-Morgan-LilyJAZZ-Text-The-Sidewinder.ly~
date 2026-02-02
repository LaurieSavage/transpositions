\version "2.24.3"
\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"The Sidewinder"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Lee Morgan"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
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
  s1
  f1:7 f:7 f:7 f:7
  f1:7 f:7 f:7 f:7
  bes:7 bes:7 bes:7 bes:7
  f1:7 f:7 f:7 f:7
  g:m7 g:m7 g:m7 c:7
  f1:7 f:7 f:7 f:7
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

  r1
  \repeat volta 2{
    % 2 to 5
    r4 gis' r8 a r4
    r4 gis r8 a r4
    r8 d,8 ees4 f g
    d8 ees d c~ c2
    \break % 6 to 9
    r4 gis' r8 a r4
    r4 gis r8 a r4
    r8 d,8 ees4 f g
    gis8 a f ees r8 b4.--
    \break % 10 - 13
    bes4-^ cis r8 d r4
    r4 cis r8 d r4
    r8 g aes bes c bes a g
    bes f g aes~ aes-\tweak #'style #'zigzag \glissando c, bes c
    \break % 14 - 17
    f,4-^ gis r8 a r4
    r4 gis r8 a r4
    r8 c d ees f g4.
    r8 a, bes b c d4.
    \break % 18 - 21
    r4 bes r8 c r4
    r4 bes r8 c r4
    r8 g' a4 bes b
    b8 c bes fis r8 fis c fis
    \break % 22 - 24
    f4 gis r8 a r4
    r4 gis r8 a r4
    r4 r8 c,16 (ees f8 f f16 c ees8
    f4)_"Fine" r8 ees8~ ees c bes c
  }
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
      \new ChordNames \transpose c bes\chordNames
      \new Staff \transpose c' bes { \melody }
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
      \new ChordNames \transpose ees bes \chordNames
      \new Staff \transpose ees' bes { \melody }
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
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>

  }
}