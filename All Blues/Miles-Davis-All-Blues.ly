\version "2.24.4"

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 10\mm
  #(define fonts
     (set-global-fonts
      #:roman "lilyjazz Text"
      #:sans "Nimbus Sans, Nimbus Sans L"
      #:typewriter "DejaVu Sans Mono"
      ; unnecessary if the staff size is default
      #:factor (/ staff-height pt 20)
      ))
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
  title = "All Blues"
  composer = "Miles Davis"
  piece = "Medium Blues"
  tagline = ""
  copyright = \markup{\override #'(font-name . "lilyjazz Text"){"Edited L.S. " \today}}
}

global = {
  \time 6/8
  \key a \major
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {
  \repeat volta 2 {
    a2.*2:7
  }
  \repeat volta 2 {
    a2.*2:7
  }
  a2.*4:7
  d2.*2:7
  a2.*2:7
  e2.:7
  f4.:7 e4.:7
  a2.*2:7
}

melody = \relative c'' {
  \global
  
  \revert Score.BarNumber.stencil
  \showStartRepeatBar \bar "[|:-|"
  \repeat volta 2 {
    \mark \markup \box "Intro"
    r2.
    r2. \bar ":|][|:"
  }\break

  \repeat volta 2 {
    \mark \markup \box "Vamp"
    <cis e>4 <d fis>8 <e g>4 <d fis>8
    <cis e>4 <d fis>8 <e g>4 <d fis>8
  }\break

  \mark \markup \box "Head"
  cis4.~ cis4~ cis16 e,
  cis'8 d16 cis16~ cis8~ cis4~ cis16 e,16
  cis'16 d cis4~ cis4~ cis16 e,16
  cis'4. r4. \break
  b4 c8 d4 e8
  d4 c8 b4~ b16 e,16
  cis'2.~
  cis4. r4 r16 ais16 \break
  b2.
  c2.
  b4. cis4.
  b4. a4. \bar "|."
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Tenor Sax/Trumpet"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff %\with { instrumentName = "Tpt./T. Sax" }
      {
        \melody
      }
    >>
    \layoutScore
  }
  \markup {\box \override #'(font-name . "lilyjazz Text") "Play the 4 bar vamp between solos"}
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames
      \transpose c g
      {
        \chordNames
      }
      \new Staff %\with { instrumentName = "Tpt./T. Sax" }
      \transpose c g
      {
        \melody
      }
    >>
    \layoutScore
  }
  \markup {\box \override #'(font-name . "lilyjazz Text") "Play the 4 bar vamp between solos"}
}