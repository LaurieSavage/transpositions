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
  title = "Midnight Mood"
  composer = "Joe Zawinul"
  instrument = ""
  tagline = "Edited by LS"
  piece = "Slow"
}

Concert = {
  \relative c' 
  {
%%%    \key d \minor 
    \time 3/4
    \mark \default
    f2 r8 ees | ges2 aes4 | bes2 \tuplet 3/2 {aes8 ges f} | ees2 aes,4 | \break
    f'2 r8 ees | ges2 aes4 | bes2 \tuplet 3/2 {aes8 ges f} | des'2. \bar "||" \break
    
    \mark \default
    bes2. | ees4. d8 c bes | bes2 aes4 | des2. | \break
    aes2 ges4 | des'2. | ges,2 f4 | des'2. | \break
    bes2. | ees4. d8 c bes | bes2 aes4 | des2. | \break
    f,2 ges4 | bes2 c,4 | des2.~ | des \bar "|."

  }
}

jazzChords =  \chordmode {
  des2.:maj7 ees:m7.5- des:maj7 ees:m7.5- 
  des:maj7 ees:m7.5- des:maj7 des:m7.5-   
  ges:maj7 c:dim7 fes:m7 bes:m7
  ees:m7 a:maj7 ees:dim7 des:7
  ges:maj7 g:dim7 f:m7 bes:7.9+
  ees:m7 aes:7 des:maj7 ees:m7.5-
}

{
  <<
%%%    \transpose ees c 
%%%    \new ChordNames { \set chordChanges = ##t \jazzChords }
%%%    \new Staff{ \set Staff.instrumentName = #"E flat" \transpose ees c \Concert}
%%%
%%%    \transpose c' bes 
%%%    \new ChordNames { \set chordChanges = ##t \jazzChords }
%%%    \new Staff {\set Staff.instrumentName = #"Concert"  \Concert}

    \transpose bes c'\new ChordNames { \set chordChanges = ##t \jazzChords }
    \new Staff {\set Staff.instrumentName = #"B flat" \transpose bes c' \Concert}
  >>
}
