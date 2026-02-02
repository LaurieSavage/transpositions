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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Olhos de Gato "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Carla Bley "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Medium slow bossa"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  %\key
  % \tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  s2
  a1*2:m
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 2
  r8 a, c e
  \repeat volta 2 {
    f4 e8 e~ e e4.
    r2 r8 a, c e
    f4 e8 d~ d2
    r2 r8 a8 c e
    f4 e8 d~ d d4.
    r2 r8 bes d f
    ges8 g4 f8 f2
    r2 r8  bes,8 des f
    ges4 f8 e~ e2
    r2 r8 bes8 des f
    ges4 f8 ees~ ees2
    r2 r8 a,8 c e
    f4 e8 ees~ ees ees4.
    r2 r8 a,8 c e
    f4 e8 d~ d2
  }\alternative{
    {
      R1
    }{
      d1~
      d2~ \tuplet 3/2 {d4 e d}
      c1~
      c1~
      c4\fermata r4 r2
    }
  }
}

bassLine = {
  \jazzOn
 \clef bass
 s2
 \repeat volta 2 {
  <<
  {
    \repeat percent 2 {r4 r8 <fis b c'>8~ <fis b c'>2}
    \repeat percent 2 {r4 r8 <f g c'>8~ <f g c'>2}
    \repeat percent 2 {r4 r8 <f bes c'>8~ <f bes c'>2}
    r4 r8 <f b cis'>8~ <f b cis'>2
    r4 r8 <f b d'>8~ <f b d'>2
    \repeat percent 2 {r4 r8 <g b d'>8~ <g b d'>2}

  }
  \\
  {
    \repeat percent 2 {a,1}
    \repeat percent 2 {a,1}
    \repeat percent 2 {a,1}
    a,1
    a,1
    \repeat percent 2 {bes,1}

  }
  >>
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
      \new Staff { \melody }
      \new Staff {\bassLine}
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
      \new Staff \transpose bes c'' { \melody }
    >>

  }
}
