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

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Serenity"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Joe Henderson "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Played by Pepper Adams"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key ees \major
  \tempo "med. ballad"
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  %\global
  s4.
  d1:m7.5-
  g:aug7
  aes2:7+.5- ges2:7+.5-
  e:min a:7
  f:m7 bes:7
  ees:maj d4:m7.5- g:7
  c2:m7 c:m7/bes
  aes2:m7 des:7
  g2:aug7 ges:7
  f1:7
  e1:maj
  f2:min7 bes:aug7
  ees1:maj
  d2:m7.5- g:aug7


}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4.
  g8 aes g'~ \bar "||"
  g2~ g4~ g8 f8
  ees2. b8 d~
  d4 d8 c16 d c8 bes g d'~
  d8 g,4. \tuplet 3/2 {b4 a g~}
  \tuplet 3/2 {g4 aes f} g4 aes8 bes~
  bes2 c4 d8 ees~
  ees1~
  ees4. ces8 f ees des ces
  ces4 bes8 ees~ ees2~
  ees2 f8 ees des ces
  bes4 aes8 ees'~ ees4~ \tuplet 3/2 {ees8 des ces}
  bes2 ges'8 des aes d~
  d1
  aes4 g2. \bar "|."

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
      \new Staff { \melody }
    >>
    \layout { }
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
      \new Staff \transpose ees c { \melody }
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
