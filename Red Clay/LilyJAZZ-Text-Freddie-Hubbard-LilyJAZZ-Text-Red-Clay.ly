\version "2.24.4"
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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Red Clay"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Freddie Hubbard "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key d \minor
  \tempo "Rock"
  \accidentalStyle modern-cautionary
  \compressEmptyMeasures
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global

}

intro = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

 \new StaffGroup  <<
  \new Staff {

   \repeat volta 2 {
     R1
     R1
     R1
   }
   \alternative{{R1 } {r2 r4 r8 d8~}}
  }
  \new Staff {
    \clef Bass R1*4
    \repeat volta 2{
      d8 a' d a d4. g,8
      c,8 g' c4 c4. bes8
      ees,8 bes' ees4 f,8 c' f4
    }
    \alternative{{g,8 d' g a, e a4 r8}{g8 d' g a, e' a4 r8}}
  }
>>
}

introHorns = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

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
      {\intro  \melody }
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
      \new Staff \transpose bes c' { \melody }
    >>

  }
}
