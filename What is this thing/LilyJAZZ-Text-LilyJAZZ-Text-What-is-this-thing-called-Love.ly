\version "2.24.4"
\include "lilyjazz.ily"
today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

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
  title = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"What is this thing called Love? "}
  composer =\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") " "}
  piece = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key c \major
  %\tempo

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  
  \global
s4
g1:m7.5-
  c:7.9-
  f:m
  f:m \break
  d:m7.5-
  g:7
  c
  c
  c

  c:m7
  f:7.9-
  bes
  bes
  aes:7
  aes:7
  g:7
  g:7

  g1:m7.5-
  c:7.9-
  f:m
  f:m \break
  d:m7.5-
  g:7
  c
  c

}

melody = \relative c'' {
  
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
\partial 4
bes4

\repeat volta 2{ \mark \default
   % \comp #32
  bes4 g g2~
  g2 bes2
  aes1
  r2 r4 aes4
  aes8 g4 g8~g2~
  g2 dis2
  e1
}
 \alternative{{ r2 r4 bes'4}{r2 r4 ees4}
  }\break

  \mark \default
  %\comp #32
  ees4 c c2~
  c4 ees \tuplet 3/2 {ees4 f ees}
  d1
  r2 r4 d4 \break
  c4 aes aes2~
  aes4 c \tuplet 3/2 {c4 bes aes}
  g1
  r4 bes4 bes bes
  \bar "||" \break

  \mark \default
  %\comp #32
  bes4 g g2~
  g4 bes bes8 c4 bes8
  aes1
  r2 r4 aes
  aes g g2~
  g2 ees'2
  c1~
  c2. r4
  \bar"|."
}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
