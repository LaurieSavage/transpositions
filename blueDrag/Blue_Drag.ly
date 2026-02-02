\version "2.25.28"

\header {
  title = "Blue Drag"
  composer = "Grapelli"
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
  \key d \minor
%  \tempo 4=100
}

chordNames = \chordmode {
  %\time 4/4
  %\partial 8*3 c8*3:m7
  % e.g c1*4:m7.5+
  d2:min c b bes
  d2:min c b bes
  d1:min e:dim bes2:7 a:7 d:min a:7
  
  d2:min c b bes
  d2:min c b bes
  d1:min e:dim bes2:7 a:7 d1:min
  
  g1*2:min d1*2:min
  g1*2:min d2:min c bes a:7
  
  d2:min c b bes
  d2:min c b bes
  d1:min e:dim bes2:7 a:7 d:min a:7
}

rmA = {\mark \markup {\box "A"}}
rmAa = {\mark \markup {\box "A2"}}
rmB = {\mark \markup {\box "B"}}
rmC = {\mark \markup {\box "C"}}

melody = \relative c' {
  \global
  \rmA
  f8 a r f a4 a f2 d4 r4 f8 a r f a4 a f2 r2
  f8 a r f a4 a g2 r4 d8 d a' aes~ aes4 g8 f d d~ d1 \bar "||" \break
  \rmAa
  f8 a r f a4 a f2 d4 r4 f8 a r f a4 a f2 r2
  f8 a r f a4 a g2 r4 d8 d a' aes~ aes4 g8 f d d~ d2 r4 bes'8 a \bar "||"\break

  \rmB
  g8 g4 a8 f8 f4 g8 e8 e4 f8 d e f g a4. f8 a2~ a bes4. a8
  g8 g4 a8 f8 f4 g8 e8 e4 f8 d e f g a4. f8 a2 r1 \bar "||" \break

  \rmA
  f8 a r f a4 a f2 d4 r4 f8 a r f a4 a f2 r2
  f8 a r f a4 a g2 r4 d8 d a' aes~ aes4 g8 f d d~ d2 r2 \bar "|."
}

\score {
  \new StaffGroup
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c'' \melody
    }
    \new ChordNames \transpose ees c \chordNames
    \new Staff {
      \set Staff.instrumentName="E flat"
      \transpose ees c' \melody
    }
  >>
  \layout { }
  \midi { }
}
