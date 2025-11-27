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
  title = ""
  composer = ""
  piece = ""
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
}

melody = \relative c'' {
  \global

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
}
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument =  "B flat Instruments"
  }
\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff  \transpose bes c'' \melody
  >>
  \layout { }
}
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "E flat Instruments"
  }
\score {
  <<
    \new ChordNames \transpose ees c \chordNames
    \new Staff \transpose ees c' \melody
  >>
  \layout { }
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