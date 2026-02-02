\version "2.25.28"

Harmonies = \chordmode {
  a1:maj
  <<
    { \voiceTwo \parenthesize{ b2:m7 e2:7 } }{ \voiceOne a1:maj }
  >>
  \oneVoice
  a1:maj
}

\score {
  <<
    \new ChordNames \Harmonies
    \new Staff {
      R1
      <<
        {\voiceOne R1}{\voiceTwo R1}
      >>
      \oneVoice R1
    }
  >>
}

