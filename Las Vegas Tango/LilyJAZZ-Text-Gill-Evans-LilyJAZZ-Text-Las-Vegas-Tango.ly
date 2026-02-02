\version "2.24.4"
% \include "/home/laurie/.local/share/lilypond/includes/lilyjazz.ily"
today = #(strftime "%d-%m-%Y" (localtime (current-time)))

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
  title = "Las Vegas Tango"
  composer = "Gill Evans"
  piece =  "Even 8ths, leisurely"
  tagline = \markup{ "L. S., " \today }
}

global = {
  \time 4/4
  \key g \major
%  \tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \global
  s1
  e1*4:m7
  a1*2:m7
  e1*2:m7
  a1*2:m7
  e1*2:m7
  e1:m7

}

melody = \relative c'' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  r4 g8 g a b4 b16 a
  \repeat volta 2 {
    b1~
    b4 g8 g a b4 b16 a
    b1~
    b4 b8 b d e4 e16 d
    e1~
    e4 g,8 g a b4 b16 a
    b1~
    b4 b8 b d e4 e16 d
    e1~
    e4 g,8 g a b4 b16 a
    b1~
  }
  \alternative{
    {b4 g8 g a b4 b16 a}
    {b4 r4 r2 \bar"|."}
  }

}


\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert"
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

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument ="E flat instrument"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>
  }
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument = "B flat instrument"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>
  }
}
