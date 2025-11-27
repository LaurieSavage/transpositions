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
  title = "Od Lo Ahavti Dai"
  composer = "Israel"
  instrument = "E flat"
  tagline = "Edited by LS"
  piece = "Free and fast, any number of repeats"
}

Sax = {
  \relative c'' 
  {
    \key a \minor 
    \time 4/4
    \partial 4*4 r2 r4 r8 \mark \default
    a'16 b 
    \repeat volta 4 {c8 c c c c c4 c8 b b c b a4. a16 b c8 c c c  c c4 c8
    d8 d g, g e'4. e8 e e e e f4 e d8 d g g e4. d8 c8 c c c d4 c4
    b8 b e e a,4 r4 \bar "||" \mark \default
    e'4. c8 d4. g,8 c c b a b4. b8 a a a a g4 c4
    d4 c8 d e2 e4. c8 d4. g,8 c8 c b a b4. b8 a8 a a a g4 c}

    \alternative {{b8 a b4 a4. a16 b}{b8 a b4 a2 \bar "|."}}
  }
}

jazzChords =  \chordmode {
  %\partial 8*3 
  %s8 s4 
  %ees2:min7/aes aes:7

}

{
  <<
%%%    \transpose bes c'' 
%%%    \new ChordNames {
%%%      \set chordChanges = ##t
%%%      \jazzChords
%%%    }
    \transpose ees c \Sax
  >>
}
