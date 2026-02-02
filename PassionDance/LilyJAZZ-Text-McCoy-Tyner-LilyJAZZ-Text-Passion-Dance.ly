\version "2.25.28"
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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Passion Dance "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "McCoy Tyner"}
  instrument = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Extended Solo over F7sus4"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  %\tempo 180

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  f1*9:sus4.7
  bes1*16
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

  \repeat volta 2 {
    \mark \default
    r4 f8 c a f bes ees
    c1
    r4  f8 c a f bes ees
    c4. g'8~g2
    r4  f8 c a f bes ees
    c1
    r4  f8 c a f bes ees
  }\alternative{{c4. g'8~g2}{c,4. g'8~g4 ees,4 \bar"||"}}

  ges4. aes8^"pedal"~aes2~
  aes2 r4 ees4
  ges4 bes8 aes~ aes2~
  aes2 r4 ees4

  ges4. aes8~aes2~
  aes2 r4 ees4
  ges4 bes8 aes~ aes2~
  aes2 r4 ges4

  aes4. bes8~ bes2
  bes 2 r4 ges4
  aes4 des8 bes8~ bes2
  bes2 r4 ges4

  aes4. bes8~ bes2
  bes 2 r4 ges4
  aes4 r4 bes2~
  bes1 \bar "|."

}


\score {

  %{
     \header {
    piece = \markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "Concert"
      }}%}

  <<
    \new ChordNames \chordNames
    \new Staff
    \set Staff.instrumentName = "Concert"
    { \melody }
  >>
}



\score {

  <<
    \new ChordNames \transpose ees c \chordNames
    \new Staff
    \set Staff.instrumentName = "E flat"
    \transpose ees c { \melody }
  >>

}


\score {

  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff
    \set Staff.instrumentName = "B flat"
    \transpose bes c'  { \melody }
  >>

}

\layout {
  indent = 1.5\cm
}
\midi { }
