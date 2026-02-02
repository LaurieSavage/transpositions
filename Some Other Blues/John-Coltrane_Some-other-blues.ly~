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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Some other blues "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "John Coltrane "}
  %piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 2/2
  \key f \major
  %  \tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  %\global
  s8
  f1:7
  bes:7
  f:7
  f2:7 b:7
  bes1:7
  ees:7
  aes:7
  des:7
  c:7
  bes:7
  f:7
  c:7.9+.13-
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

  \partial 8
  c8
  \repeat volta 2{
    f8 f g ees f f g c,
    ees ees f des ees ees f c~
    c2~ c8 a f ees~
    ees2 r2
    cis'8 d bes a aes bes d f
    fis8 g ees d des bes ees c~
    c2~ c8 bes fis ees~
    ees2 r2
    c'4 c8 e g g e g
    f4 d8 bes aes4 f
    f1
  }
  \alternative{{r2 r4 r8 c'8 }{R1 \bar "|." }}
}


%\bookpart {

\score {
  \header {
    piece =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "Concert"
    }
  }
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
%}

%\bookpart {

\score {
  \header {
    piece =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "E flat instrument"
    }
  }
  <<
    \new ChordNames \transpose ees c \chordNames
    \new Staff \transpose ees c { \melody }
  >>

}
%}

%\bookpart {

\score {
  \header {
    piece =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "B flat instrument"
    }
  }
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff \transpose bes c' { \melody }
  >>

}

