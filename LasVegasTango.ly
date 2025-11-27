\version "2.25.13"

%%%\paper{
%%%  #(set-paper-size "a4")
%%%  indent = 0
%%%  top-margin = 2.5\cm
%%%  bottom-margin = 2.5\cm
%%%  left-margin = 3.5\cm
%%%  right-margin = 3.5\cm
%%%  %fontSize = #-2
%%%}

\header{
  title = "Las Vegas Tango"
  composer = "Gil Evans"
  instrument = ""
  tagline = "Edited by LS"
  piece = "even eights"
}

Sax = {
  \relative c' 
  {
    \key fis \minor 
    \time 4/4
    r4 a'8 a b cis4 cis16 b
    \repeat Volta 2 {
      cis1~ cis4 a8 a b cis4 cis16 b
      cis1~ cis4 cis8 cis e fis4 fis16 e
      fis1~ fis4 a,8 a b cis4 cis16 b
      cis1~ cis4 cis8 cis e fis4 fis16 e fis1~ fis4 a,8 a b cis4 cis16 b
      cis1~
    }
    \alternative{
      {cis4 a8 a b cis4 cis16 b}{cis1 \repeatTie \bar "|."}
    }
  }
}

jazzChords =  \chordmode {
  s1 
  fis1*4:m7
  b1*2:m7
  fis1*2:m7
  b1*2:m7
  fis1*2:m7
}

{
  <<

%%%    \transpose c bes 
%%%    \new ChordNames {
%%%      \set chordChanges = ##t
%%%      \jazzChords
%%%    }
%%%    
%%%   \new Staff{ 
%%%     \set Staff.instrumentName = #"Concert"
%%%     %\set Staff.shortInstrumentName = #"C"
%%%     \transpose c' bes 
%%%     \Sax}

%%%    \transpose c' bes 
%%%    \new ChordNames {
%%%      \set chordChanges = ##t
%%%      \jazzChords
%%%    }
%%%    \new Staff {
%%%      \set Staff.instrumentName = #"Concert"
%%%      \set Staff.shortInstrumentName = #"C"
%%%      \transpose c' bes \Sax}

    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
    }
    \new Staff {
      \set Staff.instrumentName = #"B flat" 
      \set Staff.shortInstrumentName = #"B flat"
      \Sax
    }

  >>
}
