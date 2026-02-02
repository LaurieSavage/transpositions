\version "2.25.28"

\include "AccordsJazzDefs.ily"
\include "LilyJAZZ.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 15\mm
}

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = "Pure Imagination"
  subtitle = "from 'Willy Wonka and the Chocolate Factory'"
  composer = "Anthony Newley, Leslie Bricusse"
  %piece = "Ballad"
  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key d \major
  \accidentalStyle modern-cautionary
  \mark \jazzTempoMarkup #"Slow ballad" c4 #"80"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

chordNamesE = \chordmode {
  s2
  \repeat volta 2 {
    e1:m7
    a1:7
    d2:maj7 e2:m7
    fis2:m7 b2:7.9+
    e1:m7
    a1:7
  }
  \alternative {
    {
      %dis2:dim7 d2:maj7
      %fis2:m7 b2:7
      d2:maj7 fis2:m7
      b1:7
    }
    {
      fis1*2:maj7
    }
  }

  g1:maj7
  fis2:m7 b2:7.9+
  e2:m7 a2:7
  d1:maj7

  gis2:m7.5- cis2:aug7
  fis1:m7
  b2:7 e2:7
  e1:m7
  a1:7

  e1:m7
  a1:7
  d2:maj7 e2:m7
  fis2:m7 b2:7.9+

  e1:m7
  a1:7
  fis1:maj7
  c2: cis2:7
  d1:6
  fis2:m7 b2:7.9-

}

melodyE = \relative c'' {
  \global
  \jazzOn
  \revert Score.BarNumber.stencil
  \partial 2
  b,4 d
  \repeat volta 2 {
    \mark \default
    a'2 b,4 d
    a'2 b,4 d
    cis'4~ cis8 d8 cis d cis d
    cis4 a4 b, d
    fis2 g4 a
    fis2 e4 d4
  }
  \alternative {
    {
      cis8 d cis d cis4 a~
      a2 b4 d
    }
    {
      cis2 cis'2~
      cis1 \bar "||"
    }
  }
  \break
  \mark \default
  d8 e d e d2
  cis4 a fis2
  fis8 g fis g fis4 d
  fis4 a4~ a2
  \break

  cis8 d cis d cis4 cis,4
  b'4 cis4 cis2
  b8 cis b cis b4 b,4
  cis4 d dis e~
  \break
  e2 b4 d4 \bar "||"


  \mark \default
  a'2 b,4 d
  a'2 b,4 d
  cis'4~ cis8 d cis d cis d
  cis4 a4 b,4 d4
  \break

  fis2 g4 a4
  fis2 e4 d4
  cis2 cis'2
  c,2 cis2
  d1~
  d2 r2 \bar "|."


}

verseOne = \lyricmode {
  \repeat volta 2 {
  Come with
  me and you'll be
  In a world of pure im -- ag -- in -- a -- tion
  
  Take a
  look and you'll see
  In -- to
  }
  \alternative{
    { 
      your im -- ag -- in -- a -- tion.
      We'll be
    }
    {
      na -- tion.
    }
  }

  %{We'll begin with a spin
  Traveling in the world of my creation
  What we'll see will defy
  Explanation
  If you want to view paradise
  Simply look around and view it
  Anything you want to, do it
  Want to change the world?
  There's nothing to it
  There is no life I know
  To compare with pure imagination
  Living there, you'll be free
  If you truly wish to be
  If you want to view paradise
  Simply look around and view it
  Anything you want to, do it
  Want to change the world?
  There's nothing to it
  There is no life I know
  To compare with pure imagination
  Living there, you'll be free
  If you truly wish to be
  %}
}

chordNames = \transpose e c { \chordNamesE }
melody = \transpose e c' { \melodyE }

\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "C insts." } { \melody }
      %\addlyrics { \verseOne }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = "Bb Horns" } \transpose bes c' \melody
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Eb Sax" } \transpose ees c \melody
    >>
    \layoutScore
  }
}
\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Flute" } \melody
    >>
    \layoutScore
  }
}