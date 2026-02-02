\version "2.24.3"

\header {
  title = "Joseph, Joseph"
  composer = "Orig: Casman/Steinberg, English: Cahn/Chaplin"
  meter = ""
  piece = "Swing"
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
  \key b \minor
%  \tempo 4=100
}

chordNames = \chordmode {
  %\time 4/4
  %\partial 8*3 c8*3:m7
  % e.g c1*4:m7.5+
  \partial 4*3 s4*3 b1*6:min e1*2:min 
  fis1*6:7 b1*6:min 
  b1*2:7 e1*4:min 
  b1*2:min 
  cis1:7 fis1:7 b1:min e1:7
}

rm = {\mark \default}

melody = \relative c' {
  \global
   % g8 bes g
  \partial 4*3 fis,4 b d
  \rm
  fis2 g fis4 fis e d g fis2.~ fis4 fis, b d \break
  fis2 g2 fis4 e g fis e1~ e4 fis,4 ais cis \break
  e2 fis e4 e d cis e e2.~ e4 fis, ais cis \break
  e2 fis e4 d fis e d1~ d4 fis, b d \bar "||" \break
  
  \rm
  fis2 g fis4 fis e d g fis2.~ fis4 fis, b d \break
  fis2 b2 a4 fis b a g1~ g2. g4 \break
  b4 b b b b2 a4 g fis fis fis fis fis2 e4 d \break
  fis2 d e4 e d cis b1 r1 \bar "|."
  
}

%words = \lyricmode {


%}

\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c'' \melody
    }
    \new ChordNames \transpose ees, c' \chordNames
    \new Staff {
      \set Staff.instrumentName="E flat"
      \transpose ees c' \melody
    }
  >>
  \layout { }
  \midi { }
}
