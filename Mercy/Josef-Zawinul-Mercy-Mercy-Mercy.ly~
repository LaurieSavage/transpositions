\version "2.24.3"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = "Mercy, Mercy, Mercy"
  composer = "Josef Zawinul"
  piece = "Gospel/Funk"
  tagline = ""
  copyright = \markup {"L.S." \today}
}

global = {
  \time 4/4
  \key g \minor
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  bes1:7
  ees:7
  bes:7
  ees:7
  bes1:7
  ees:7
  bes:7
  ees:7

  bes2:7 ees2:7/bes
  bes2:7 ees2:7/bes
  bes2:7 ees2:7/bes
  bes2:7 ees2:7/bes

  bes2:7 ees2:7
  f4:7 ees2.:7
  bes2.:7 ees4:7
  f1:7

  c:m7
  d:m7
  g4:m f g:m f
  g1:m7
}

melody = \relative c'' {
  \global
  r4 g8 f~ f4 d8 bes
  c8 bes bes g bes bes c bes
  r4 g'8 f~ f4 d8 bes
  c8 bes bes g bes bes c bes
  r4 g'8 f~ f4 d8 bes
  c8 bes bes g bes bes c bes
  r4 g'8 f~ f4 d8 bes
  c8 bes bes g bes bes c bes \bar"||"
  f'4 f g8 g4 aes8~
  aes4 aes4 g8 g4 f8~
  f4 f4 g8 g4 aes8~
  aes4 aes4 g8 g4 f8~
  f4 bes,8 bes d d ees ees
  f8-^ r8 ees4 ees8 ees ees d~
  d8 r8 bes8 bes d d ees ees
  f8-^ r8 r4 r8 f,8 g bes
  c4. c8~ c4 bes8 c
  d4. d8 d8~ d c d f
  g4. f8 g4. f8
  g16 f g8 r r2 \bar"|."
}


\bookpart {
  \header {
    piece = "Concert Instruments"
  }
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>


  \layout { }
  %\midi { }
}
}

\bookpart {
  \header {
    piece = "B flat Instruments"
  }
\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff  \transpose bes c'' \melody
  >>


  \layout { }
  %\midi { }
}
}

\bookpart {
  \header {
    piece = "E flat Instruments"
  }
\score {
  <<
    \new ChordNames \transpose ees c \chordNames
    \new Staff \transpose ees c' \melody
  >>


  \layout { }
%  \midi { }
}
}
\book {
  \bookOutputSuffix "Fl"
  \header {
    instrument = "Flute"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff  \transpose c c' \melody
    >>
  }
}


