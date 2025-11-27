\version "2.25.13"

\header{
  title = "II/V7/I All Major Keys"
  composer = "Aebersold"
  instrument = "Tenor Sax"
  tagline = "Edited by LS"
  piece = "Example 13"
}

Fragment = {
  \relative c' 
  {
    %\key aes \major 
    \time 4/4
    
    \repeat volta 2{
      r8 cis \tuplet 3/2 {d8 f a} c e d c 
      b c d e f d b a g1~ g
      } \break
  }
}


jazzChords =  \chordmode {
  d1:m g:7 c:maj c:maj
}

myScore = {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \Fragment

  >>

  <<
    \transpose c bes
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c bes 
    \Fragment
  >>
  
  <<
    \transpose c aes
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c aes 
    \Fragment
  >>
  
  <<
    \transpose c ges
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c ges 
    \Fragment
  >>
  
  <<
    \transpose c e
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c e 
    \Fragment
  >>
  
  <<
    \transpose c d
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c d 
    \Fragment
  >>
  
  <<
    \transpose c des
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c des 
    \Fragment
  >>
  
  <<
    \transpose c b
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c b 
    \Fragment
  >>
  
  <<
    \transpose c a
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c a 
    \Fragment
  >>
  
  <<
    \transpose c g
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c g 
    \Fragment
  >>
  
  <<
    \transpose c f
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c f 
    \Fragment
  >>

  <<
    \transpose c ees
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
      }
    \transpose c ees
    \Fragment
  >>
  
}

%\new Score = {
  \transpose bes c' \myScore
%}
