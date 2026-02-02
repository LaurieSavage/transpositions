\version "2.24.3"

#(set-global-staff-size 19)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $$count { r4 }
            \revert Rest #'stencil
          #}
          )

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 5\mm
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


title = #"Song for Bilbao"
composer = #"- Pat Metheny"
meter = #" (Rock feel)"

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
  tagline = \markup { "Paradiso Connection - edited by L.S. " \today }
}

global = {
  %\compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

lo = \layout {
  %#(layout-set-staff-size 19)
  ragged-right = ##f
  %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
  \override Score.Clef.break-visibility = #'#(#f #f #f)
  \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
  \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
}

rm = { \mark \default }

theNotes = \relative c' {
  \key c \major
  \tempo 4 = 168
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %% A section
  \time 4/4
  \partial 4.
  a'8 c a
  \repeat volta 2 {
    \bar "[|:-|"
    \mark \default
    d4. d8~ d2~
    d2 c4 d
    a4. \grace a8 (g8)~ g2~
    g2. f8 g
    d1~
    d1~
    d1~
  }
  \alternative {
    { d2 r8 a' c a \bar ":|]" }
    { d2 \repeatTie r8 a d c  }
  }

  %% 6/8 B Section
  \section
  \time 6/8 \rm \tempo \markup {(\smaller \note {8} #1 "=" \smaller \note {8} #1 )}
  b4 g8 c4 b8
  r8 a f bes4 a8
  r8 g f a4 f8
  b4 g8 cis4 a8

  %% 4/4 Reprise
  \section
  \time 4/4
  \mark 1
  d4. d8~ d2~
  d2 c4 d
  a4. \grace a8 (g8)~ g2~
  g2. f8 g
  d1~
  d1~
  d1~
  d2 r8 a' c a \bar "||"
}

Soloist = {
  \mark \markup {Open Solos}
  %\time 4/4
  \hide Clef
  \showStartRepeatBar \bar "[|:-|"
  \repeat volta 2 {
    \repeat unfold 8 {s1} \bar ":|]" \break
  }
  \section
  \time 6/8
  \repeat unfold 4 { s4. s4. } \break
  \section
  \time 4/4
  \repeat unfold 8 { s1 } \bar "||"
}

Out = \relative c' {
  \key c \major
  \tempo 4 = 168
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %% A section
  \time 4/4
  \repeat volta 2 {
    \bar "[|:-|"
    \mark \default
    d'4. d8~ d2~
    d2 c4 d
    a4. \grace a8 (g8)~ g2~
    g2. f8 g
    d1~
    d1~
    d1~
  }
  \alternative {
    { d2 r8 a' c a \bar ":|]" }
    { d2 \repeatTie r8 a d c  }
  }

  %% 6/8 B Section
  \section
  \time 6/8 \rm \tempo \markup {(\smaller \note {8} #1 "=" \smaller \note {8} #1 )}
  b4 g8 c4 b8
  r8 a f bes4 a8
  r8 g f a4 f8
  b4 g8 cis4 a8

  %% 4/4 Reprise
  \section
  \time 4/4
  \mark \default
  d4. d8~ d2~
  d2 c4 d
  a4. \grace a8 (g8)~ g2~
  g2. f8 g
  d1~
  d1~
  d1~
  d2 r8 a' c a \bar "||"
  d4. d8~ d2~
  d2 c4 d
  a4. \grace a8 (g8)~ g2~
  g2. f8 g
  d'2.:32_"Drummer conducts"\fermata  c4:32\fermata
  d1\fermata \bar "|."
}

chordsSolo = \chordmode {
  d1*4:m7
  ees1*2:maj
  d1:m7
  d1:m7
  d1:m7

  b4.:m7 c4.
  a4.:m7 bes4.
  g4.:m7 a4.:m7
  b4.:m7 cis4.:m7

  d1*4:m7
  ees1*2:maj
  d1*2:m7

}

theChords = \chordmode {
  s4.
  \chordsSolo

}

SoloistChords = \chordmode {
  d1*4:m7
  ees1*2:maj
  d1:m7
  d1:m7

  b4.:m7 c4.
  a4.:m7 bes4.
  g4.:m7 a4.:m7
  b4.:m7 cis4.:m7

  d1*4:m7
  ees1*2:maj
  d1*2:m7

}
chordsOut = \chordmode {
  \chordsSolo
  d1*4:m7
  ees1:maj
  d1:m7.11+
}

% theWords = \lyricmode {
%
%}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \theChords
      \new Voice = soloist \theNotes
      %\new Lyrics \lyricsto soloist \theWords
    >>
    \lo
  }
  \score {
    <<
      \new ChordNames \SoloistChords
      \new Voice \Soloist
    >>
    \lo
  }
  \score {
    <<
      \new ChordNames \chordsOut
      \new Voice \Out
    >>
    \lo
  }
  \markup { Rhythm play the head 2x, then horns X 2, all play 1x out }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Pitch"
  }
  \score {
    <<
      \new ChordNames \transpose c bes \theChords
      \new Voice = soloist \transpose c bes, \theNotes
      %\new Lyrics \lyricsto soloist \theWords
    >>
    %\lo
  }
  \score {
    <<
      \new ChordNames \transpose c bes \chordsSolo
      \new Voice \transpose c bes \Soloist
    >>
    \lo
  }
  \score {
    <<
      \new ChordNames \transpose c bes \chordsOut
      \new Voice \transpose c bes, \Out
    >>
    \lo
  }
  \markup { Rhythm play the head 2x, then horns X 2, all play 1x out }
}

\book {
  \bookOutputSuffix "Fl"
  \header {
    instrument = "Flute"
  }
  \score {
    <<
      \new ChordNames \transpose c bes \theChords
      \new Voice = soloist \transpose c bes \theNotes
      %\new Lyrics \lyricsto soloist \theWords
    >>
    \lo
  }
  \score {
    <<
      \new ChordNames \transpose c bes \chordsSolo
      \new Voice \Soloist
    >>
    \lo
  }
  \score {
    <<
      \new ChordNames \transpose c bes \chordsOut
      \new Voice \transpose c bes \Out
    >>
    \lo
  }
  \markup { Rhythm play the head 2x, then horns X 2, all play 1x out }
}