\version "2.25.28"
\include "LilyJAZZ.ily"
\version "2.25.28"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }
aTrip = { \times 2/3 {a16 bes a} g8 }
gTrip = { \times 2/3 {g16 a g} f8 }
cTrip = { \times 2/3 {c16 d c} a8 }
fTripHigh = { \times 2/3 {f16 g f} d8 }
dTrip = { \times 2/3 {d16 e d} c8 }
fTrip = { \times 2/3 {f16 g f} d8 }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Sugar"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Stanley Turrentine"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key d \minor

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  \partial 4*4  s4*4
  %ees2:min7/aes aes:7
  \repeat volta 2 {
    d1:min7 e2:m7.5- a:7.5+ d1:m7
    a:aug7 d1*2:m7 e1:dim7
    a:aug7 d:m7 aes:7 g:m7
    f:7 e:m7.5- a:7.5+
  }
  \alternative {
    { bes1:7 a:aug7} { d1:m7 ees:maj7}
  }
}

melody =\relative c' {
  \jazzOn
  \global
  \partial 4*4 r4 r8 d8 f8 g4 a8~
  \repeat volta 2 {
    a4. g8 \aTrip f8 g~ g4. f8 \gTrip d8 f~ f1~ f4. d8 f8 g4 a8~ a4. g8 \aTrip f8 g~
    g4. a8 \cTrip g8 a~ a1~
    a4. a8 c d4 f8~f4. d8 \fTripHigh c8 d~ d4. c8 \dTrip a8 c~ c4. a8 \cTrip g8 a~ a4. g8 \aTrip f8 g~ g4. f8 \gTrip d8 f~ f4. d8 \fTrip c8 d~
  }
  \alternative{
    {d1~ d4. d8 f g4 a8}
    {d,1~ \repeatTie d \bar "|."}
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
      \new ChordNames \transpose b a \chordNames
      \new Staff \transpose b a { \melody }
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
      \new Staff \transpose ees bes { \melody }
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

%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
