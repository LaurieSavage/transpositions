\version "2.24.4"
\include "LilyJAZZ.ily"
\include "AccordsJazzDefs.ily"

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

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
}

\header {
  title = \markup \underline "Beautiful Love "
  composer ="Victor Young"
  piece = "Swing"
  tagline = \markup { "L. S., " \today }
}

global = {
  \time 4/4
  \key d \minor
  %\tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  %\override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
s1
e1:m7.5-
a1:7.5+
d1*2:m
g1:m7
c1:7
f1:maj7
e2:m7.5- a2:7.5+
d1:m
g1:m7
bes1:7.11+
a1:7

%%% 1st ending %%%
d1:m
g1:7.11+
e1:m7.5-
a1:7

%%% 2nd ending %%%
d2:m b2:7.9+
bes2:7 a2:7
d1*2:m
}

melody = \relative c' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4*4 r8 d4. e4 f4
  \repeat volta 2 {
    a2. g4
    f4. e8 d4 e8 f8~
    f1
    r8 f4. g4 a4 \break
    c2. bes4
    a4. g8 f4 g8 a8~
    a1
    r8 a4. b4 cis \break
    e4. d8~d4 a4
    c4. bes8~ bes4 d,4
    e1
    r8 e4. f4 g4 \break
  }
  \alternative{
    {
      a2. d,4
     cis2. d4
     e1
     r8 d4. e4 f4 \break
    }
    {
      a2 cis,4 d4
      f2 e2
      d1
      R1 \bar "|."
    }
  }
}


\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = \markup \with-color #red "Concert" } { \melody }
    >>
    \layout {
    indent = 15 \mm
    }
    %\midi { }
  }
  \markup{ \box
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
       "Real Book, 6th Edition"
  }
}

\book {
  \bookOutputSuffix "EFlat"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = \markup \with-color #red \concat {"E" \flat " Horn" }}\transpose ees c' { \melody }
    >>
    \layout {
      indent = 15 \mm
    }
  }
  \markup{ \box
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
       "Real Book, 6th Edition"}
}

\book {
  \bookOutputSuffix "BFlat"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = \markup \with-color #red \concat {"B" \flat " Horn"}} \transpose bes c' { \melody }
    >>
    \layout {
      indent = 15 \mm
    }
  }
  \markup{ \rounded-box
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
       "Real Book, 6th Edition"}
}
