\version "2.25.13"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = "Poinciana"
  subtitle = "The song of the tree"
  composer = "Buddy Bernier/Nat Simon"
  piece = "Latin"

}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  c1

}

melody = \relative c'' {
  \global
  c4 d e f

}


\bookpart {
  \header {
    instrument = "Concert Instruments"
  }
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>

  \layout { }
  \midi { }
}
}

\bookpart {
  \header {
    instrument = \markup {"B" \flat " Instruments"}
  }
\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff  \transpose bes c' \melody
  >>


  \layout { }
  %\midi { }
}
}

\bookpart {
  \header {
    instrument = \markup {"E" \flat " Instruments"}
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


