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
  title = "Sugar"
  composer = "Stanley Turrentine"
  instrument = ""
  tagline = \markup {\smaller
    Engraved by Laurie Savage at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }}
  }

  \paper{
    myStaffSize = #20
   % property-defaults.fonts.serif = "Comic Sans MS"
   % property-defaults.fonts.sans = "Comic Sans MS"
   % property-defaults.fonts.typewriter = "DejaVu Sans Mono"
  }

aTrip = { \tuplet 3/2 {a16 bes a} g8 }
gTrip = { \tuplet 3/2 {g16 a g} f8 }
cTrip = { \tuplet 3/2 {c16 d c} a8 }
fTripHigh = { \tuplet 3/2 {f16 g f} d8 }
dTrip = { \tuplet 3/2 {d16 e d} c8 }
fTrip = { \tuplet 3/2 {f16 g f} d8 }


Sax = {
  \relative c' 
  {
    \key d \minor 
    \time 4/4
    \partial 4*4 r4 r8 d8 f8 g4 a8~ 
    \repeat volta 2 {
      a4. g8 \aTrip f8 g~ g4. f8 \gTrip d8 f~ f1~ f4. d8 f8 g4 a8~ a4. g8 \aTrip f8 g~ 
      g4. a8 \cTrip g8 a~ a1~
      a4. a8 c d4 f8~f4. d8 \fTripHigh c8 d~ d4. c8 \dTrip a8 c~ c4. a8 \cTrip g8 a~ a4. g8 \aTrip f8 g~ g4. f8 \gTrip d8 f~ f4. d8 \fTrip c8 d~ }
    \alternative{
      {d1~ d4. d8 f g4 a8}
      {d,1~ \repeatTie d \bar "|."}
    }
  }
}

jazzChords =  \chordmode {
  \partial 4*4  s4*4 
  %ees2:min7/aes aes:7
  \repeat volta 2 { d1:min7 e2:m7.5- a:7.5+ d1:m7
  a:aug7 d1*2:m7 e1:dim7
  a:aug7 d:m7 aes:7 g:m7
  f:7 e:m7.5- a:7.5+}
  \alternative {
    { bes1:7 a:aug7} { d1:m7 ees:maj7}
    }

}

{
  <<
    \new ChordNames {
    \transpose ees bes 
      \jazzChords
    }
    
   \new Staff{ 
    \set Staff.instrumentName = #"E flat"
     \transpose ees bes 
    \Sax
    }

    \transpose c' bes 
    \new ChordNames {
      \jazzChords
    }

    \new Staff {
      \set Staff.instrumentName = #"B flat"
      \Sax
    }

%%%    \new ChordNames {
%%%      \set chordChanges = ##t
%%%      \jazzChords
%%%    }
%%%    \new Staff {
%%%      \set Staff.instrumentName = #"B flat" 
%%%      \Sax
%%%    }
  >>
}
