\version "2.25.28"

%#(set-global-staff-size 18)


\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
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
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"In The Mood"
composer = #"- Joe Garland"
meter = #" (Swing)"

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
  copyright = "1939 Glenn Miller"
  tagline = \markup { "Edited by L.S. " \today }
}

global = {
  \time 4/4
  \key aes \major
  \revert Score.BarNumber.stencil
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
  \set Score.markFormatter = #format-mark-box-alphabet
  %\compressFullBarRests
  %\override MultiMeasureRest.expand-limit = #3
}

theNotes = \relative c' {
  \global
  \section
  \sectionLabel "Introduction"
  aes'8 c ees aes~ aes aes4 aes8
  aes8 aes4 aes8 g aes ees c
  ees8 d des c ces bes4 aes8
  aes8 c ees aes~ aes ees c aes

  bes8 c bes aes f4 bes8 c
  bes8 aes f f~ f c'4.
  bes8 c bes aes f4 bes8 c
  bes8 aes f f~ f f4 r8
  \break

  \repeat volta 2 {
    \mark \default
    c8 ees aes c, ees aes c, ees
    aes c, ees aes~ aes r8 r4
    c,8 ees aes c, ees aes c, ees
    aes8 c, ees aes~ aes r8 r4
    des,8 f aes des, f aes des, f
    aes8 des, f aes~ aes r8 r4
    c,8 ees aes c, ees aes c, ees
    aes8 c, ees aes~ aes r8 r4
    ees8 g bes ees, g bes ees, g
    bes8 ees, g bes bes aes4 aes8~
    aes8 aes aes aes aes aes aes aes
    aes8 aes4 aes8~ aes4 r4
  }
  \break

  \repeat volta 2 {
    \mark \default
    aes8 f4 aes8~ aes4 r4
    r8 des, f aes c c4.
    aes8 f4 aes8~ aes4 r4
    r8 des, f aes c c4.
    aes8 f4 aes8~ aes4 r4^"To Coda"
    r8 des, f aes c ees4 c8
    ees8 ees8 ees8 ees8 ees8 ees8 ees8 ees8
    es4 b8 bes bes aes r4
  }
  \break

  \sectionLabel "Interlude"
  aes8 bes c des ees aes4 ees8 |
  fes4 des8 [ees]~ ees4 r4 |
  r8 fes8 ees4 des8 ces4 e8 |
  ees4 ces8 aes~ aes r8 r4 |
  \break

  \sectionLabel "Coda"
  r8 ees' d ees e f ges g
  aes4 r8 aes,,8~ aes2~
  aes1 \fine
}

theChords = \chordmode {
  r1*4
  bes1*2:7
  bes1:m7
  ees1:sus4.7

  aes1*4
  des1*2
  aes1*2
  bes1*2
  aes2 des2
  ees1:sus4.7

  aes2 aes2/c
  bes2:m7 ees2:7
  aes2 aes2/c
  bes2:m7 ees2:7
  aes2 aes2/c
  bes2:m7 ees2:7
  ees2 ees2:dim
  ees2:7 aes2

  r1*4

}

theWords = \lyricmode {

}

\score {
  <<
    \new ChordNames \theChords
    \new Voice = soloist \theNotes
    \new Lyrics \lyricsto soloist \theWords
  >>
  \layout {
    %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    \override Score.Clef.break-visibility = #'#(#f #f #f)
    \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
  }
  %  \midi {
  %   \tempo 4 = 88
  %  }
}

\book {
  \bookOutputSuffix "Tenor"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c\theChords
      \new Voice = soloist \transpose bes c' \theNotes
      \new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
    %  \midi {
    %   \tempo 4 = 88
    %  }
  }
}