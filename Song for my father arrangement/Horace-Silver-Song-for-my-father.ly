\version "2.25.28"

%\include "AccordsJazzDefs.ily"
%\include "LilyJAZZ.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

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
  title = "Song for my father"
  composer = "Horace Silver"
  piece = "Form: AAB"
  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key g \minor
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Bossa nova" c4 #"126"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %\compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {
  s1*4
  \repeat volta 2 {
    g1*2:m7
    f1*2:7
    ees1:7
    d1:7
    g1:m7
  }
  \alternative {
    { g1:m7 }
    { g1:m7 }
  }

  f1*2:7
  g1*2:m7
  f2:7
  ees2:7
  d1:7
  g1*2:m7
}

melodyTpt = \relative c'' {
  \global
  %\jazzOn
  \revert Score.BarNumber.stencil
  R1*3 \mark \markup { \box "Rhythm vamp until ready"}
  r2 r8 d,8-. g-.  bes-. \break
  \repeat volta 2 {
    \mark \default
    d8 (\tuplet 3/2 { ees16 d c } bes8 c~ c \tuplet 3/2 { d16 c bes } g8 bes~
    bes8 \tuplet 3/2 { c16 bes g } f8 g~ g \tuplet 3/2 { a16 g f } d8 f~
    f1~)
    f2.
    a,8 ( aes \break
    g8 ees'8 ~ ees2.)
    r2 g4. a8~
    a1~
  }
  \alternative {
    { a2 r8 d,8-. g-. bes-. }
    { a2\repeatTie r8 f8-. f-. f-. \bar "||" }
  } \break
  \mark \default
  f8 (ees) r8 g8~ g2~
  g2 r8 g8-. g-. g-.
  g8 (f) r8 a8~ a2~
  a2 r8 f8-. f-. f-. \break
  f8 (ees) r8 g8~ g2~
  g8 r8 r4 bes4. (c8~
  c1~)
  c2 r2 \bar "|."
}

melodySax = \relative c'' {
  \global
  %\jazzOn
  \revert Score.BarNumber.stencil
  R1*3 \mark \markup { \box "Rhythm vamp until ready"}
  R1
   \break
  \repeat volta 2 {
    R1 \mark \default
    r2 r4 r8 ees8~
    ees1~
    ees2. a,8 aes \break
    g8 des'8~ des2.
    r2 e4. f8~
    f1~
  }
  \alternative {
    { f2 r2 }
    { f2\repeatTie r8 d8-. d-. d-. \bar "||"}
  } \break
  \mark \default
  d8 (c) r8 ees8~ ees2~
  ees2 r8 ees8-. ees-. ees-.
  ees8 ( d) r8 f8~ f2~
  f2 r8 d8-. d-. d-. \break
  d8 (c) r8 ees8~ ees2~
  ees8 r8 r4 fis4. (a8~
  a1~)
  a2 r2 \bar "|."
}

\book {
  \bookOutputSuffix "Horns"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with {
        instrumentName = "Trumpet"
        shortInstrumentName = "Tpt.'"
      } { \melodyTpt }
      \new ChordNames \transpose bes f \chordNames
      \new Staff \with {
        instrumentName = "Alto Saxophone"
        shortInstrumentName = "A.Sax."
      } \transpose bes f { \melodySax }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Tpt"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with {
        instrumentName = "Trumpet"
        %shortInstrumentName = "Tpt.'"
      } { \melodyTpt }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Sax"
  \score {
    <<
      \new Staff \with {
        instrumentName = "Tenor Saxophone"
        %shortInstrumentName = "T.Sax."
      } { \melodySax }
    >>
    \layoutScore
  }
}