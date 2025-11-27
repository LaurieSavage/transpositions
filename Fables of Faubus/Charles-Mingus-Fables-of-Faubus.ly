\version "2.24.3"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
     'length (ly:music-length note)))

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

rm = \mark \default

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Fables of Faubus "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Charles Mingus "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key ees \major
  % \tempo

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global

}

melody = \relative c' {
  \jazzOn
  \global
  \set Staff.instrumentName = "Trombone"
    \set Staff.shortInstrumentName = "Trom."
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
% Introduction
\repeat volta 2 { \bar ".|:-|"  \mark "Intro"
  f2 \glissando aes2
  r8 f8 aes bes \tuplet 3/2 {b16 c b } bes16 aes f4
  g2 \glissando bes2
  r8 g bes c \tuplet 3/2 {des16 d des} c16 bes g4
  \break

  % A section
}
}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "Concert"
    }
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff<< { \melody }>>
      \new Staff <<\transpose c c,{\clef bass \melody}>>
    >>
    \layout {
    indent = 3.0\cm
  short-indent = 1.5\cm
    }
    \midi { }
  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
}
