\version "2.25.28"

%#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 10\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

title = #"All Blues"
composer = #"-Miles Davis"
meter = #" (Med. Blues)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6)
            \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  tagline = "Paradiso Connection" %##f
}


global = {
  \time 6/8
  \key a \major
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %\compressEmptyMeasures
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
  \showStartRepeatBar \bar "[|:-|"
  \tempo 8 = 120
  \global

  \repeat volta 2 {
    \mark \markup \box "Intro"
    r2.
    r2. \bar ":|][|:"
  }\break

  \repeat volta 2 {
    \mark \markup \box "Vamp"
    <cis e>4_"Play between solos" <d fis>8 <e g>4 <d fis>8
    <cis e>4 <d fis>8 <e g>4 <d fis>8 \bar ":|]"
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
      \new Voice = Sax { \melody }
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
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
      \new ChordNames \transpose c g { \chordNames }
      \new Voice = Miles \transpose c g { \melody }
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
  }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Pitch"
  }
  \score {
    <<
      \new ChordNames \transpose c bes { \chordNames }
      \new Voice = Miles \transpose c bes, { \melody }
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
  }
}