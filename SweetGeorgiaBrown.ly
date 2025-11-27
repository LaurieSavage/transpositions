\version "2.25.13"
\paper{
  #(set-paper-size "a4")
  indent = 0
  top-margin = 2.5\cm
  bottom-margin = 2.5\cm
  left-margin = 3.5\cm
  right-margin = 3.5\cm
  %fontSize = #-2
}

\header{
  title = "Sweet Georgia Brown"
  composer = "M. Pinkard & K. Casey"
  instrument = "B flat"
  tagline = "Edited by LS"
}

Sax = {
  \relative c' 
  {
    \key f \major 
    \time 4/4
    \set Score.skipBars = ##t
    \override MultiMeasureRest.expand-limit = 1
   
    \mark \default 
    d4 e fis d a' fis b a d2 a4 fis d1 \break
    d4 e f d a' f b a d2 b4 a g1 \break
    c,4 d e c g' e a g c2 g4 e c c8 d~ d c d4 \break
    a'1 r4 c,8 d~ d c d4 a'2. a4 g e a2 \bar "||" \break
    
    \mark \default
    d,4 e fis d a' fis b a d2 a4 fis d1 \break
    d4 e f d a' f b a d2 b4 a g1 \break
    a4. a8~a4 r g8 e4 a8~a4 r a a a a g8 e4 a8~a4 r \break
    c,4 d f a c cis d a g2 c4 a f1 \bar "|."
  }
}

jazzChords =  \chordmode {
  d1*4:7
  g1*4:7
  c1*4:7
  f1 c1:7 f a:7

  d1*4:7
  g1*4:7
  d1:min a:7 d:min a:7
  f d:7 g2:7 c:7 f1
}

\score{
  <<
    \transpose ees c 
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
    }
      \transpose bes c' \Sax
  >>

  \layout { 
%%%    #(layout-set-staff-size 18) 
    \context{ 
      \Score \override SpacingSpanner.base-shortest-duration = \musicLength 1 
    }
  }
}
