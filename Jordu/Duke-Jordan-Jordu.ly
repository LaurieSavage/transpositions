\version "2.24.3"
\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "TabA.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  %\markup \with-color "tomato" {
  title = \markup \with-color "tomato" { "Jordu" }
  composer = \markup \with-color "tomato" { "Duke Jordan" }
  piece = \markup \with-color "tomato" { "Med. up jazz, form AABA" }
  tagline = \markup \with-color "tomato" { "Edited Laurie Savage, " \today }
  %}
}

global = {
  \time 4/4
  \key ees \major
  \tempo 4 = 140

}

chordNames = \chordmode {
  \global
  s1

  d2:7 g2:7 c1:m
  f2:7 bes2:7 ees1:maj
  d2:7 g2:7 c1:m
  aes1:7
  g1:7

  aes1:7
  g1:7

  g2:7 c:7 f:7 bes:7 ees:7 aes:7 des1:7
  f2:7 bes:7 ees:7 aes:7 des:7 ges:7 g1:7

  aes2:7 g:7 c1:m

}

melody = \relative c'' {
  \jazzTweaks
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  % A section
  r8 g, c d ees f g ees
  \repeat volta 2 {
    \mark \default
    fis2-- f4.-- ees8-.
    r8 g, c d ees f g bes
    a2-- aes4.-- g8-.\break
    r8 g, c d ees f g ees
    fis2-- f4.-- ees8-.
    r2 \tuplet 3/2 { ees16 f ees } c8 ees c~ \coda
  }\alternative{
    {
      \break c2~ c4. c8-.
      r8 g c d ees f g ees
    }
    {
      c2\repeatTie~ c4. c8
      r2 r8 g''4-^ g8~ \bar "||" \break
      % Bridge
      \mark \default
      g4 \tuplet 3/2 {b,16 c b} a8 bes4 g'8 e
      f4 \tuplet 3/2 {a,16 bes a} g8 aes4 f'8 d
      ees4 \tuplet 3/2 {g,16 aes g} f8 ges4 e
      f2 r8 f'4-^ f8~
      f4 \tuplet 3/2 {a,16 bes a} g8 aes4 f'8 d
      ees4 \tuplet 3/2 {g,16 aes g} f8 ges4 ees'8 c
      des4 \tuplet 3/2 {f,16 ges f} ees8 e4. ees8-.
      r8 g c d ees f g ees\bar ":|."
    }
  }\break
  c2\repeatTie~_"d.c. al coda after solo" \coda  c4.c8-^ r1 ^"Fine"\bar "|."

}

\book {
  \header {
    instrument = \markup \with-color "tomato" { "Concert" }
  }
  \score {
    <<
      %\set Staff.midiInstrument = #"Flute"
      \new ChordNames \chordNames
      \new Staff { \melody }
      %\set midiInstrument = #"flute"
    >>
    \layout { }
    \midi { }
  }
}

\book {
  \tabA
  \bookOutputSuffix "Eb"
  \header {
    instrument = \markup \with-color "tomato" { "E flat instrument" }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
}

\book{
  \tabA
  \bookOutputSuffix "Bb"
  \header {
    instrument = \markup \with-color "tomato" { "B flat instrument" }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c'' { \melody }
    >>

  }
}

%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4,
2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12
%}
