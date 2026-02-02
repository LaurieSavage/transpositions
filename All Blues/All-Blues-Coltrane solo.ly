\version "2.24.4"
\include "jazzchords.ily"
\include "lilyjazz.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
}

\header {
  title = "All Blues"
  composer = "Miles Davis"
  piece = \markup { \small "Kind of Blue: CBS 40579"}
  subtitle = \markup {\with-color #red "John Coltrane solo, first chorus"}
  subsubtitle = "Transposed for flute"
  copyright = \markup{\override #'(font-name . "lilyjazz Text"){ "John Coltrane Omnibook - Hal Leonard Publishing"}}
  tagline = ""
}

global = {
  \key a \mixolydian
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
  \mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
}

chordNames = \chordmode {
  s2.*8
  a2.*8:7
  s4 d2:7
  s2.*3
  a2.*4:7
  e2.*2:7.9+
  f2.:7.9+
  e2.:7.9+
  a2.*4:7
}

melody = \relative c' {
  \global
  

  \time 3/4
  R2.*7
  r4 r4 e'8 a \bar "||"
  \tuplet 3/2 {a4 a8~} a4-\bendAfter #-3 r4
  R2.
  r4 r8 e8 a4
  a8 [b] \appoggiatura{b8} a8 [\appoggiatura{a8} g8] e8 d8
  c8 a4. e8 g
  a8 b4 r8 r4
  R2.
  r4 r8 e8 a a
  d4  \acciaccatura {g,16 a b c} d2~
  d2.~
  d4~ \tuplet 3/2 {d8 e8 a,8} \tuplet 3/2 {d8 e d~}
  d4~ \tuplet 3/2 {d8 c a} \tuplet 3/2 {g8 e g}
  a8 a \tuplet 3/2 { b8 a g } e8 d
  c8 a16 b~ b4 r4
  R2.
  r8 b'4.~ b8 a
  \tuplet 3/2 { g8 ges f } g2~
  g4. r8 \tuplet 3/2 { r8 bes a }
  \tuplet 3/2 { aes4 bes8 } g2~
  \tuplet 3/2 { g4 ges8 } f16 g d8~ \tuplet 3/2 { d4 c8 }
  \acciaccatura dis8 e4 a,2
  r4 r4 \tuplet 3/2 { d8 cis d }
  \acciaccatura d8 cis8 a g2
  r4 \tuplet 5/4 { r8 r8 g16 } \tuplet 5/4 { a16 b c dis e } \bar "||" \break
  \tuplet 5/4 { f16 g a b cis } a4 r4

}

\score {
  <<
    \new ChordNames \transpose  c bes
    \chordNames
    \new Staff \with { instrumentName = "Flute" } \transpose c bes,
    \melody
  >>
  \layout {
    indent = 15\mm
  }
}