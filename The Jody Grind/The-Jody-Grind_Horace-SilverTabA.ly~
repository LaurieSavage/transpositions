\version "2.24.3"
%#(set-global-staff-size 22)
\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "TabA.ily"


\header {
  title = \markup { \with-color "tomato" "The Jody Grind" }
  composer = \markup { \with-color "tomato" "Horace Silver" }
  meter = \markup { \with-color "tomato" "(Funky Blues)" }
  tagline = "LS"
}

global = {
  \time 4/4
  \key bes \dorian
  \tempo 4 = 120
  \accidentalStyle modern-cautionary
}

chordNames = \chordmode {
  % \override ChordNames . ChordName #'font-name = #"LilyJazz Text"
  %\jazzOn
  \global
  s4
  \repeat volta 2 {
    bes1*4:min
    ees1*2:7
    bes1*2:min
    a1:sus4.7
    b1:sus4.7
    bes1*2:min
  }
}

melody = \relative c'' {
  %\jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4
  s8 \acciaccatura fis,8
  g8~
  \repeat volta 2 {
    g8 bes~ bes g bes4 des
    r2 r4 r8 bes8
    des8 bes c g bes4 r4
    r2 r4 r8 bes8 %\break
    ees8 des ees f des bes r4
    r2 r4 r8 bes8
    \tuplet 3/2 {des8 bes f} ees8 des8~ des4 r4
    R1 %\break
    r8 fis'8 b, cis g b fis e
    a8 aes' ees des~ des4 r4
    r4 \acciaccatura f8 bes2 r8 bes,8 %\break
  }
  \alternative{
    {e16 ees des8 bes aes bes-^ r8 r8 \acciaccatura fis g8}
    {e'16 ees des8 bes aes bes-^ r8 r4 \bar "|."}
  }
}


\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
    \midi { }
  }
  \markup { \fontsize #2 "Real Book, 5th Edition"}
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
  \markup { \fontsize #2 "Real Book, 5th Edition"}
}

\book {
  \tabA
  \bookOutputSuffix "Bflat"
  \header {
    instrument = \markup { \with-color "tomato" "Trumpet/Tenor Sax" }
  }
  \score {
    <<
      \new ChordNames \unfoldRepeats \transpose bes c \chordNames
      \new Staff \unfoldRepeats \transpose bes c' { \melody }
    >>

  }

}

%{
convert-ly (GNU LilyPond) 2.25.11  convert-ly: Processing `'...
Applying conversion: 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4,
2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.25.12
%}
