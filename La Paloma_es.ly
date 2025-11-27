\version "2.25.13"
\paper{
  #(set-paper-size "a4")
  indent = 0
  top-margin = 2.5\cm
  bottom-margin = 2.5\cm
  left-margin = 3.5\cm
  right-margin = 3.5\cm
}

\header{
  title = "La Paloma"
  instrument = "E flat"
  tagline = "Edited by LS"
}

Sax = {
  \relative c' 
  {
    \key g \major 
    \time 4/4
    \set Score.skipBars = ##t
    \override MultiMeasureRest.expand-limit = 1
    
    R1*8 \break
    \repeat volta 2{
      d'1 \tuplet 3/2 {r4 b c} d e \noBreak \tuplet 3/2 {fis g e} fis d c1 ~c2 r4 d \break
      a'1 \tuplet 3/2 {r4 b g} a fis \tuplet 3/2 {g fis e} d4. c8 b1 ~b2 r4 d
    }\break

    \repeat volta 2{
      \tuplet 3/2 {g4  g g} g fis \tuplet 3/2 {a a g} fis e e d2. ~d1 \break
      \tuplet 3/2 {fis4 fis fis} fis e \tuplet 3/2 {e d d} d e d8 c b2. ~ b1
    }\break
    
    \tuplet 3/2 {b4 d d} \tuplet 3/2 {d e cis } d1 
    ~\tuplet 3/2 {d4 d d} \tuplet 3/2 {d d e} fis2 a
    ~\tuplet 3/2 {a4 b4. g8} \tuplet 3/2 {a4 fis g} \break \tuplet 3/2 {e fis g} b4. a8
    \tuplet 3/2 {a,4 b c } e4. d8 b1  ~\tuplet 3/2 {b4 d d} \tuplet 3/2 {d e cis} d1
    ~\tuplet 3/2 {d4 d d } \tuplet 3/2 {d d e} fis2 a2
    ~\tuplet 3/2 {a4 c4. b8} \tuplet 3/2 {a4 b g}
    \tuplet 3/2 {a fis4. g8} b4 a \tuplet 3/2 {a,4 b4 c} e d g1 \bar "|."
  }
}

jazzChords =  \chordmode {
  s1*8 
  \repeat volta 2 {g1*3 d1*5:7 g1*2}
  \repeat volta 2 {g1*2 d1*4:7 g1*2}
  g1*3 d1*4:7 g1*4 d1*4:7 g
}

\score{
  <<
    \transpose ees c 
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
    }
    \transpose ees c \Sax
  >>
\layout { 
%%%    #(layout-set-staff-size 18) 
    \context{ 
      \Score \override SpacingSpanner.base-shortest-duration = \musicLength 1 ragged-last = ##f 
    }
  }
}
