\version "2.24.3"

\header {
  title = "Funky Sea, Funky Dew"
  composer = "Michael Brecker"
  instrument = "Tenor Sax"
  %meter = "84"
  piece = "Funk Ballad"
  tagline = \markup {\smaller
    Engraved by Laurie Savage at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }}
  }  

\paper{
  myStaffSize = #20
  property-defaults.fonts.serif = "Comic Sans MS"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
}


global = {
  \time 4/4
  \key c \major
 \tempo 4=84
}

chordNames = \chordmode {
  %\time 4/4
  %\partial 8*3 c8*3:m7
  % e.g c1*4:m7.5+
  fis2:m11 g:/f c4:9 e:maj ees2:maj/f a:min7 bes:maj
}

rm = {\mark \default}

melody = \relative c'' {
  \global
  \mark \markup "Intro"
  b'4 a8 b~ b4 d8 c g8 r8 c, g'~ g f c d 
  e d16 c a8 a'~ a4~ a8 c16 a~ a2. r4
  d,4 c16 a a'8~ a2~ a2.r4 \bar "||" \break
  
  \rm
  \appoggiatura{g8} a4 g~ g8 a g c~ c2 r8 \appoggiatura{a8} b8~ \tuplet 3/2 { b8 c16 } b8
  a4 e8 g \appoggiatura{g8} \tuplet 3/2 { a8 bes16 } a8 g ees~ ees a, c4~ c4. r8
  \appoggiatura{g'8} a4 g e8 g a c~ c2. r4
  r4 r8 \tuplet 3/2 { a16 c a } \appoggiatura{d8} ees8 d c d~ d16 a8. c2 r8 g
  bes4 c8 bes \appoggiatura{f8} fis8 ees c c'~ c2.. r8 \bar "||"

  b8 r8 b c r8 c r d~ d bes4 g8~ g \appoggiatura{d8} e4 \appoggiatura{d8} e8~ e2 r8 \tuplet 3/2 { d16 e32 d32 c16 } b16 c16 c'8~ c2. r4 \bar "||"
  b8 r8 b c r8 c r d~ d bes4 g8~ g \appoggiatura{d8} e4 c8~ c2 r8 \appoggiatura{g8} a8 c f~ f16 ees8. c2 r4
  \break
  \repeat volta 1 { \rm s1*8 } \break
  
  \rm
  \repeat volta 1 {s1*2}  \break
  
  \mark \markup "D  Solos"
  \repeat volta 1 { s1*20 }
  
  
}

%words = \lyricmode {


%}

\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c' \melody
    }
    %\new ChordNames \transpose ees c \chordNames
    %\new Staff {
     % \set Staff.instrumentName="E flat"
     % \transpose ees c' \melody
    %}
  >>
  \layout { }
  \midi { }
}
