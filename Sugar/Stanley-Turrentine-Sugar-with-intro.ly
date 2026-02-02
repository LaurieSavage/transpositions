\version "2.25.28"
\include "lilyjazz.ily"
today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }
aTrip = { \times 2/3 {a16 bes a} g8 }
gTrip = { \times 2/3 {g16 a g} f8 }
cTrip = { \times 2/3 {c16 d c} a8 }
fTripHigh = { \times 2/3 {f16 g f} d8 }
dTrip = { \times 2/3 {d16 e d} c8 }
fTrip = { \times 2/3 {f16 g f} d8 }
comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"Sugar"}
  composer =\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Stanley Turrentine"}
  piece = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Anticipate the chord changes at 4+"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") "Edited Laurie Savage, " \today }
}

global = {
  \time 4/4
  \key d \minor

}

chordNames = \chordmode {
  %\override ChordNames.ChordName.font-name = #"LilyJazz Text"
  %\jazzOn
  \global
  \repeat percent 3{ d2..:m a8:7.9+ | s1}

  d2..:m a8:7.9+
  s1
  %\partial 4*4  s4*4
  %ees2:min7/aes aes:7
  \repeat volta 2 {
    d2..:min7 e2:m7.5- s8 a4.:7.5+ d8:m7 | s1
    a:aug7 d1*2:m7 e1:dim7
    a:aug7 d:m7 aes:7 g2..:m7f8:7
    s2.. e8:m7.5- s1 a:7.5+
  }
  \alternative {
    { bes1:7 a:aug7} { d1:m7 ees:maj7}
  }
}

melody =\relative c' {

  \global

  \repeat percent 3 {\improvisationOn
   c'4 c4 c4 c8 c8~ | c1
  \improvisationOff}

  %c4 c4 c4 c8 c8~ c4 c4 c4 c4
  %c4 c4 c4 c8 c8~ c4 c4 c4 c4
  \improvisationOn
  c4 c4 c4 c8 c8~
  \improvisationOff
 % \jazzOn
  %\partial 4*4
  r4 r8 d8 f8 g4 a8~
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
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
