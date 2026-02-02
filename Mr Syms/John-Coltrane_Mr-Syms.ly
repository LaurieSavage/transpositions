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
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

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
  markup-system-spacing = #'((basic-distance . 28)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Mr. Sym"
composer = #"- John Coltrane"
meter = #" (Med. Slow Blues)"

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
  tagline = \markup { "Paradiso Connection - edited  by L.S. " \today }
}

global = {
  \time 4/4
  \key c \minor
  %\tempo "Lento"
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  %\override ChordNames . ChordName #'font-name = #"lilyjazz Text"
 %
  \global
  s8
  c2.:6 c4:7.9-.10-.11+.13-%c4:aug
  b4.:maj7 bes8:m6 s2
  s2 c4:m des4:maj
  bes1:min6
  f2:7 s8 bes8 s8 f8:7
  s2.. c8:6
  s2. c4:7.9-.10-.11+.13-
  b4.:maj7 bes8:m6 s2
  g2 des2:maj7/g
  aes1:7/g
  e2:maj7/g g4.:7 c8:6
  s4 f8:7 c8:7 s2
}

melody = \relative c'' {
  %
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 8
  r8 \bar ".|-|"
  r2 c8 r8 ees8 r8
  bes'4. g8 r2
  r4 r8 c,8 c'8 r8 c8 r8
  bes4. g8 r2 \break
  r4 r8 g8 c,8 d8 r8 ees8~
  ees4 d16 ees d bes c8 c8 r8 c8~
  c4 r4 c8 r8 ees8 c8
  bes'4. g8~ g4 r4 \break
  b2 c2
  aes1
  ees2 d4. c8~
  c8 r8 bes8 c r2 \bar "|."
}

bassLine = \relative c {
  %
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 8
  g8 \bar ".|-|"
  c,1~ ^"Walking bass on solos"
  c2.~ c8 g'
  c,1~
  c2.~ c8 c'
  f,1~
  f2.~ f8 g
  c,1~
  c1
  g'4. g8 g4. g8
  g4. g8 g4. g8
  g4. g8 g4. g8
  c,4 f8 c r2 \bar "|."
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Guitar/Bass"
    }
  \score {
    \new StaffGroup
    <<
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
      \new Staff {\clef bass \bassLine }
    >>
    >>
    \layout { }
  }
  \markup { \fontsize #2 "Solos over (Concert) C minor blues"}
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
    }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Melody" } \transpose ees c { \melody }
      \new Staff \with { instrumentName = "Opt. Baritone" } \transpose ees c''' { \clef treble \bassLine }
    >>
    \layout {
      indent = 15\mm
    }

  }
  \markup { \fontsize #2 "Solos over (Concert) C minor blues"}
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet/Tenor Sax"
    }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
  \markup { \fontsize #2 "Solos over (Concert) C minor blues"}
}
