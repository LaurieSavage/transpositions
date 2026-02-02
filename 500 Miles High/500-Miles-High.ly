\version "2.24.4"
\include "lilyjazz.ily"
\include "jazzchords.ily"

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
  title = "500 Miles High"
  composer = "Chick Corea"
  tagline = \markup { "Laurie Savage, "} % \today }
}

global = {
  \time 4/4
  %\key
  %\tempo

}

chordNames = \chordmode {
  \global
  s4
  e1*2:m7
  g1*2:m7
  bes1*2:maj7
  b1:m7.5-
  e1:7.9+
  a1*2:m7
  fis1*2:m7.5-
  f1*2:m7
  c1*2:m7
  b1*2:7.9-.9+.11+.13-
  % b1*2:7^"Alt"
}

chordScales = \relative c'' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4
  r4
  \repeat percent 2 {e,8^"Aeolian" fis g a b c d e}
  \repeat percent 2 {g,8^"Dorian" a bes c d e f g}
  \repeat percent 2 {bes,8^"Lydian" c d e f g a bes}
  b,8^"Locrian" c d e f g a b
  e,,8^"Altered" f g gis ais c d e \break
  \repeat percent 2 {a,8^"Aeolian" b c d e f g a }
  \repeat percent 2 {fis,8^"Locrian" g a b c d e fis} \break
  \repeat percent 2 {f,8^"Dorian" g aes bes c d ees f}
  \repeat percent 2 {c8^"Aeolian" d ees f g aes bes c}
  \repeat percent 2 {b,8^"Altered" c d ees f g a b}
}

melody = \relative c'' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4 d'4
  \repeat volta 2 {
    b1~
    \tuplet 3/2 {b4 b, d} \tuplet 3/2 {a'4 fis d }
    e1~
    e4 c \tuplet 3/2 { a4 f d}
    g1 \break
    f2. f4
    f8 e4 g8~ g2
    g2~ \tuplet 3/2 {g4 f e}
    d'1 \break
    d2. c4
    c4 b8 d~ d2
    d2~ \tuplet 3/2 {d4 c b}
    bes4 aes8 c~ c2 \break
    <<
      {
        \stemUp c4-^ r8 g8 d' ees aes, d  c1~     c1
        d,4 r4 r2
        R1
      }
      \new CueVoice {\stemUp b4_"Drums" b4\rest b2\rest b4\rest b8\rest b8~b2}
    >>
  }
}



\bookpart {
  \header {
    instrument =\markup {
      "Concert"
    }
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
      % \new Staff {\chordScales}
    >>
    \layout { }
    \midi { }
  }
  \score {
    <<
      \new Staff \with {instrumentName = "Modes"} \chordScales
    >>
  }
}

\bookpart {
  \header {
    instrument =\markup {
      "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c { \melody }
      %\new Staff \transpose ees c {\chordScales}
    >>

  }
}

\bookpart {
  \header {
    instrument =\markup {
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
      %\new Staff \transpose bes c' {\chordScales}
    >>

  }
}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
