\version "2.24.3"
%#(set-global-staff-size 25)
%#(set-default-paper-size "A4")

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"
\include "swing.ly"
\include "TabA.ily"

title = #"Whatever Lola Wants"
composer = #"- Adler/Ross "
meter = #" (Tango)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #6
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline #title
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
  title = \realBookTitle %"Whatever Lola Wants"
  %composer = "Adler/Ross"
  piece = "Intro: 1st 8 bars"
  instrument = "B flat horns"
  tagline = ##f
}


global = {
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Rubato con moto" c4 #""
  \set Score.markFormatter = #format-mark-box-alphabet
  %\compressFullBarRests
  \override MultiMeasureRest.expand-limit = #3
}

theNotes = \relative c'' {
  %\global
  %\set Staff.midiInstrument = "flute"
  \key c \major
  %\showStartRepeatBar \bar "[|:-|"
  \partial 4.
  e,8 a c
  \section
  \mark \markup { \large \larger \box A }
  e4. f8 e2~ | e2. r4 | dis4. e8 dis2~ | dis2 r8 dis8 e dis \break
  d2. e8 d | c4 d r c | b2. r4 | r2 r8 e, a c \break
  e4. f8 e2~ | e2. r4 | dis4. e8 dis2~ | dis2 r4 dis \break
  d4. c8 b4 a | c4. b8 a4 gis | a1~ | a2 r8 a8 a8 a8 | \break

  \section
  \mark \markup { \large \larger \box B }
  bes4 r4 r2 | r2 r4 d8 f | e2 a,2~ | a2 r4 a8 a | \break
  bes4 bes4 bes2 | r4 d e bes | a2 a~ | a2 r8 e8 a c | \break

  \section
  \mark \markup { \large \larger \box A'}
  e4. f8 e2~ | e2. r4 | dis4. e8 dis2~ | dis2 r8 dis8 e dis \break
  d2. e8 d | c4 d r c | b2. r4 | r2 r8 b c b \break

  \section
  \mark \markup { \large \larger \box C }
  a4 a a a | a2 r8 b c b | a4 a a a | bes2. bes4 | \break
  a8 r8 r4 r2 | R1 \bar "|."
}

theChords = \chordmode {
  \partial 4.
  s4.
  %% A
  a1*2:m b1*2:7
  d1:m7 | f1:7 | e1*2:7
  a1*2:m b1*2:7
  d1:m7 | f1:7 | a1*2:m

  %% B
  bes1*2:7 | a1*2:7
  bes1*2:7 | a1*2:7

  %% C
  a1*2:m b1*2:7
  d1:m7 | f1:7 | e1*2:7

  %% D
  a1:m | b1:7 | a1:m | bes1:7 | a1*2:m |
}

theWords = \lyricmode {

}

\book {
  \bookOutputSuffix "A4"
  \paper {
    #(set-paper-size "a4")
    print-all-headers = ##f
    %paper-height = 11\in
    %paper-width = 8.5\in
    indent = 0\mm
    %between-system-space = 2.5\cm

    between-system-padding = #0
    %set to ##t if your score is less than one page:
    ragged-last-bottom = ##t
    ragged-bottom = ##f
    markup-system-spacing = #'((basic-distance . 10)
                               (minimum-distance . 8)
                               (padding . 1))
  }

  \score {
    <<
      \new ChordNames  \tripletFeel 16
      {
        \set Staff.midiInstrument = "drawbar organ"
        \set Staff.midiMaximumVolume = 0.75
        \transpose bes c \theChords
      }
      \new Voice = soloist \tripletFeel 16
      {
        \set Staff.midiInstrument = "flute"
        \transpose bes c' \theNotes
      }
      \new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
    \midi {
      \tempo 4 = 120
    }
  }
}

\book {
  \bookOutputSuffix "TabA"
  \tabA
  \score {
    <<
      \new ChordNames
      {
        \transpose bes c \theChords
      }
      \new Voice = soloist
      {
        \transpose bes c' \theNotes
      }
      \new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
  }
}
%{
                     convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
                     Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
                     2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
                     2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
                     2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
                     2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


%{
                     convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
                     Applying conversion: 2.25.12
%}
