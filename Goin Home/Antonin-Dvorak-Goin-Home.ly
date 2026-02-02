\version "2.24.4"

\include "jazzchords.ily"
\include "lilyjazz.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 15\mm
}

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
  title = "Goin' Home"
  composer = "Antonin Dvorak"
  %piece = "Andante sostenuto"
  tagline = ""
  copyright = \markup{\override #'(font-name . "lilyjazz Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key d \major
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {

}

melody = \relative c'' {
  \global
  
  \revert Score.BarNumber.stencil
  d2^"Andante sostenuto" (ees2)
  d2 (ees2)
  d2 (e2)
  fis1\fermata \bar"||" \break

  \mark \default
  fis4.^"Moderato" (a8) a2
  fis4. (e8 d2)
  e4. (fis8) a4. (fis8)
  e1 \break
  fis4. (a8) a2
  fis4. (e8 d2)
  e4 (fis e4. d8)
  d1 \bar "||" \break

  \mark \default
  b'4. (d8) d2
  cis4 (a4) b2
  b4 (d cis a)
  b1 \break
  b4. (d8 ) d2
  cis4 (a) b2
  b4 (d cis a)
  b1 \bar "||" \break

  \mark \default
  fis4. (a8) a2
  fis4. (e8 d2)
  e4. (fis8) a4. (fis8)
  e4 (a2.) \break
  fis4. (a8) a2
  d4. ( e8 fis2)
  e4. (d8 e4 b4)
  d1 \bar "||" \break

  \mark \default
  R1*8 \break
  d,2^"Andante sostenuto" (ees2)
  d2 (ees2)
  d2 (e2)
  fis1\fermata \bar"|."


}

\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "C insts." } { \melody }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = "Bb Horns" } \transpose bes c \melody
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Eb Sax" } \transpose ees c \melody
    >>
    \layoutScore
  }
}