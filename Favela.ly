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
  title = "Favela"
  composer = "A. C. Jobim"
  instrument = ""
  tagline = "Edited by LS"
  piece = "medium bossa"
}

rm = {
  \mark 
  \default
}

Sax = {
  \relative c' 
  {
    \key g \minor 
    \time 4/4
    \partial 4. d'4 g8~ \bar "||"
    
    \rm
    g2 g8 d4 f8~ f2~ f8 d4 g8~ g2~ g8 d4 f8~ f2~ f8 d4 g8~ g2~ g8 d4 f8~ f2~ f8 d4 bes8~ bes1 r2 r8 g4 c8~ 
    c2~ c8 bes4 d8~ d2~ d8 c4 d8~ d2~ d8 f4 g8 bes4 g8 f~ f d4 c8~ c bes4 d8~ d c4 bes8 g4 f8 d~ d f4 g8~ g1
    r1 \bar "||" 

    \rm
    c4. es8~ es4 c4 c8 bes4 bes8 bes4 g 
    c4. es8~ es4 c4 c8 bes4 bes8 bes4 r4
    c4. es8~ es4 c4 c8 bes4 bes8 bes4 g 
    ges'4. f8~ f4 ees~ ees8 c4 c8 c4 d \bar "||"

    \rm
    g2~ g8 d4 f8~ f2~ f8 d4 g8~ g2~ g8 d4 f8~ f2~ f8 d4 g8~
    g2~ g8 d4 f8~ f2~ f8 d4 bes8~ bes1 r2 r8 g4 c8~ c2~ c8 bes4 d8~
    d2~ d8 c4 d8~ d2~ d8 f4 g8
    bes4 g8 f8~ f d4 c8~
    c bes4 d8~ d c4 bes8 g4 f8 d~ d f4 g8~ g1 r1 \bar "|."
  }
}

jazzChords =  \chordmode {
  s4. 
  g1:m7 f1:/g
  g1:m7 f1:/g
  g1:m7 f1:/g
  g1*2:m7
  c1:m7 f:13 bes:maj7 bes:7
  e2:m7.5- ees:m6 g:m7 d:m7 g1*2:m7

  c1:m7 g:m7
  c1:m7 g:m7
  c1:m7 g:m7
  ees4.:7.9+ d:7.9+ c4:7.9+ c1:7.9+
  
  g1:m7 f1:/g
  g1:m7 f1:/g
  g1:m7 f1:/g
  g1*2:m7
  c1:m7 f:13 bes:maj7 bes:7
  e2:m7.5- ees:m6 g:m7 d:m7 g1*2:m7
  
}

{
  <<
    \transpose bes c
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
    }
    
   \new Staff{ 
     \set Staff.instrumentName = #"B flat"
     %\set Staff.shortInstrumentName = #"C"
     \transpose bes c' 
     \Sax}

%%%    \transpose c' bes 
%%%    \new ChordNames {
%%%      \set chordChanges = ##t
%%%      \jazzChords
%%%    }
%%%    \new Staff {
%%%      \set Staff.instrumentName = #"Concert"
%%%      \set Staff.shortInstrumentName = #"C"
%%%      \transpose c' bes \Sax}

%%%    \new ChordNames {
%%%      \set chordChanges = ##t
%%%      \jazzChords
%%%    }
%%%    \new Staff {
%%%      \set Staff.instrumentName = #"B flat" 
%%%      \set Staff.shortInstrumentName = #"B flat"
%%%      \Sax
%%%    }
  >>
}
