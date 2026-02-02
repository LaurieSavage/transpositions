\version "2.24.4"

\header {
  title = "Tom Collins"
  composer = "Tim Beresford"
  instrument = "Tenor Saxophone"
  tagline = "Played by Standing Tall"
}

global = {
  \time 4/4
  \key e \major
  \tempo 4=152
  \compressEmptyMeasures
}

\paper {
  #(set-paper-size "a4")
  myStaffSize = #20
  property-defaults.fonts.serif = "Buxton Sketch"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "Luxi Mono"
}

chordNames = \chordmode {
  \global
  s1 * 54
  e1:7+ e:7+ g:7+ d:7+
  \repeat volta 4 { e1*2:m7}
  \alternative{{c1:7.13 b:7.5+}{cis:m7.5+ c2:7.13 b:7.5+}}
  
}

melody = \relative c'' {
  \global
  % Intro
  \bar".."  R1*2^"Drums"  \bar".."  R1*8^"Guitar" \bar".." \break
  % Section A
  \mark \markup { \box A }
  gis'8 a b gis~gis2 | r8 fis16 g fis8 e fis e r4 | g2~g8 a g a | fis4 e8 d~d4 r \break
  gis8 a b gis~gis2 | r8 fis16 g fis8 e gis b r cis | d2~ d8 e d e | cis4 b8a~a4 r \break
  gis8 a b gis~gis2 | r8 fis16 g fis8 e fis8 e cis b | g'2~g8 a g a fis4 r8 d'~d4 r4 \break
  \tuplet 3/2 { gis,4 a b } e2 | r2 gis,16 a gis8 e b fis'16 g fis8 d b r e' r a,~ | a4 g8 a b r8 r4 \break
  
  % Section B
  \mark \markup { \box B }
  \repeat volta 2 { \key g \major e,8 fis g a r8 b8~b4~b2. r4 | 
                    a16 ais a8 g e r4 a16 ais a8 g dis r4 a'16 ais a8 g d \break }
  \alternative{{e8 fis g a r8 b8~b4~b2. r4 r1 r1}
               {e,8 fis g a r8 b8~b4~b2. r4 | g2. a8 g~g4 r8 a~a4. r8 \bar "||" \break}}
  
  % Section A
  \mark \markup { \box A }
  \key e \major
  gis8 a b gis~gis2 | r8 fis16 g fis8 e fis e r4 | g2~g8 a g a | fis4 e8 d~d4 r \break
  gis8 a b gis~gis2 | r8 fis16 g fis8 e gis b r cis | d2~ d8 e d e | cis4 b8a~a4 r \break
  gis8 a b gis~gis2 | r8 fis16 g fis8 e fis8 e cis b | g'2~g8 a g a fis4 r8 d'~d4 r4 \break
  \tuplet 3/2 { gis,4 a b } e2 | r2 gis,16 a gis8 e b fis'16 g fis8 d b r e' r a,~ | a4 g8 a b r8 r4 \bar ".."\pageBreak
  
  % Solos
  \mark \markup { Solos\box A }
  \repeat volta 2 {r1^"4x" r1 r1 r1 \break}
  
  \mark \markup {\box B }\key g \major
  \repeat volta 4 { r1 r1}
  \alternative {{r1 r1}{r1 r2 r2 \break}}
  
  % Reprise A-B
  % Section A
  \mark \markup { \box A }
  \key e \major gis8 a b gis~gis2 | r8 fis16 g fis8 e fis e r4 | g2~g8 a g a | fis4 e8 d~d4 r \break
  gis8 a b gis~gis2 | r8 fis16 g fis8 e gis b r cis | d2~ d8 e d e | cis4 b8a~a4 r \break
  gis8 a b gis~gis2 | r8 fis16 g fis8 e fis8 e cis b | g'2~g8 a g a fis4 r8 d'~d4 r4 \break
  \tuplet 3/2 { gis,4 a b } e2 | r2 gis,16 a gis8 e b fis'16 g fis8 d b r e' r a,~ | a4 g8 a b r8 r4 \break
  
  % Section B
  \mark \markup { \box B }
  \repeat volta 2 { \key g \major e,8 fis g a r8 b8~b4~b2. r4 | 
                    a16 ais a8 g e r4 a16 ais a8 g dis r4 a'16 ais a8 g d \break }
  \alternative{{e8 fis g a r8 b8~b4~b2. r4 r1 r1}
               {e,8 fis g a r8 b8~b4~b2. r4 | g2. a8 g~g4 r8 a~a4. r8 \bar "||" \break}}  
  
  % Outro
  \key e \major
  R1*16^"Guitar" \bar "||" R1*4^"Flute & Trumpet" \bar "||" gis,4^"Add Sax" r e'8 r fis e |
  r4 r r cis8 c | b4 r8 g8~g4 r8 fis | r8 d r d e e d4
  \repeat volta 2 {gis4 r e'8 r fis e |  <d b>8 < d b> <cis a> <d b> b2( g~<g b>4.) <d' fis>8}
  \alternative {{r8 d r d e e d4}{r8 d r4 r2 r1 \bar".."}}
  
  
  
}

%words = \lyricmode {
  
  
%}

\score {
  <<
    \new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff { \melody }
    %\addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
