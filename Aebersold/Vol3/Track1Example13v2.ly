\version "2.25.13"

\paper{
  #(set-paper-size "a4")
  indent = 0
  top-margin = 1.5\cm
  bottom-margin = 1.5\cm
  left-margin = 2.5\cm
  right-margin = 2.5\cm
  %fontSize = #-2
}

\header{
  title = "II/V7/I All Major Keys"
  composer = "Aebersold"
  instrument = "Tenor Sax"
  tagline = "Edited by LS"
  piece = "Example 13"
}

Frag = {
  \relative c' 
  { \time 4/4
    \repeat volta 2{
      r8 cis \tuplet 3/2 {d8 f a} c e d c 
      b c d e f d b a g1~ g
    }\break
  }
}

FragBes = {\transpose c' bes \Frag}
FragAes = {\transpose c aes \Frag}
FragGes = {\transpose c ges \Frag}
FragE = {\transpose c e \Frag}
FragD = {\transpose c d \Frag}
FragDes = {\transpose c des \Frag}
FragB = {\transpose c' b \Frag}
FragA = {\transpose c' a \Frag}
FragG = {\transpose c g \Frag}
FragF = {\transpose c f \Frag}
FragEes = {\transpose c ees \Frag}


jazzChords =  \chordmode {
  d1:m g:7 c:maj c:maj
}

ChordsBes = {\transpose c bes \jazzChords}
ChordsAes = {\transpose c aes \jazzChords}
ChordsGes = {\transpose c ges \jazzChords}
ChordsE = {\transpose c e \jazzChords}
ChordsD = {\transpose c d \jazzChords}
ChordsDes = {\transpose c des \jazzChords}
ChordsB = {\transpose c b \jazzChords}
ChordsA = {\transpose c a \jazzChords}
ChordsG = {\transpose c g \jazzChords}
ChordsF = {\transpose c f \jazzChords}
ChordsEes = {\transpose c ees \jazzChords}

saxLine = {\Frag \FragBes \FragAes \FragGes \FragE \FragD \FragDes \FragB \FragA \FragG \FragF \FragEes }
newChords = { \jazzChords \ChordsBes \ChordsAes \ChordsGes \ChordsE \ChordsD \ChordsDes \ChordsB
	    \ChordsA \ChordsG \ChordsF \ChordsEes}

{
  
  <<
    \transpose bes c'
    \new ChordNames {
      \set chordChanges = ##t
      \newChords
      }
    \transpose bes c' 
    \saxLine
  >>
 
}