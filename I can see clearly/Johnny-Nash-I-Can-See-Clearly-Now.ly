\version "2.25.28"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

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
  title = "I Can See Clearly Now"
  composer = "Johnny Nash"
  piece = "Reggae"
  tagline = ""
  copyright = \markup{ "Edited L.S. " \today }
}

global = {
  \time 4/4
  \key g \minor
  \revert Score.BarNumber.stencil
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

chordNames = \transpose c d \chordmode {
  \repeat volta 2 {
    bes1 ees1 bes1*2
    bes1 ees1 bes1*2
    bes1 ees1 bes1*2
  }
  \alternative {
    {
      \repeat volta 2 {
        aes1 ees1 bes1*2
      }
    }
    {
      aes1 ees1 bes1*2
    }
  }

  des1*2  aes1*2
  des1*2 f1*2
}

melody = \relative c'' {
  \global
  \mark \default
  \repeat volta 2 {
    \repeat unfold 4 {s1} \break
    \repeat unfold 4 {s1} \break
    \repeat unfold 4 {s1} \break
  }
  \alternative {
    { \repeat volta 2 { \repeat unfold 4 { s1 }} \break }
    { \repeat unfold 3 { s1 } s2. s4^"Fine"  \bar "|." \break }
  }

  \mark \default
  \repeat unfold 4 {s1} \break
  \repeat unfold 4 {s1} \mark \markup { "D.C al Fine" } \bar "||" \break
}

\book {
  \header {
    instrument = "Concert Instruments"
  }
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layoutScore
  }
  \markup
  {
    \column
    {
      \large
      {
        \line
        {
          "Sax solo over A after singers have sung the form"
        }
        \line
        {
          "Play second time ending after D.C."
        }
      }
    }
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c %\unfoldRepeats
      {
        \chordNames
      }
      \new Staff \transpose bes c'' %\unfoldRepeats
      {
        \melody
      }
    >>
    \layoutScore
  }
  \markup
  {
    \column
    {
      \large
      {
        \line
        {
          "Sax solo over A after singers have sung the form"
        }
        \line
        {
          "Play second time ending after D.C."
        }
      }
    }
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>
    \layoutScore
  }
}
\book {
  \bookOutputSuffix "Fl"
  \header {
    instrument = "Flute"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \transpose c c' \melody
    >>
    \layoutScore
  }
}
