\version "2.24.3"



\include "lilyjazz.ily"
\include "jazzchords.ly"
\include "jazzextras.ily"
\include "TabA.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = \markup \with-color "tomato" "You don't know me"
  composer = \markup \with-color "tomato" "Eddy Arnold"
  poet = \markup \with-color "tomato" "Cindy Walker"
  piece = \markup \with-color "tomato" "Moderately slow"
  instrument = \markup \with-color "tomato" "Tenor Sax"
  tagline = \markup \with-color "tomato" { "QOTW - LS " \today }
}

global = {
  \time 4/4
  \key c \major
  %\tempo 4 = 100
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

theChords = \transpose c e {
  \chordmode {
    \partial 4.
    g4.:aug7
    \repeat volta 2 {
      c1
      c2. c4:7
      f1
      f2. fis4:dim7

      c2 a2:7
      d2:min g2:7
      c1
      d2:7 g2:7

      c1
      c2. c4:7
      f1
      f2 fis:dim7

      c2 a2:7
      d2:m g2:7
      c2 f2
      c2 c2:7

      f1
      c2 cis2:dim7
      d2:m g2:7
      c1

      a1:m
      e1:m
      d1:7
      g4:7 d4:7 g2:7

      c1
      c2. c4:7
      f1
      f2. fis4:dim7

      c2 a2:7
      d2:m g2:7
      c2 f2
      \alternative {
        { c2 g4:7 g4:aug7 }
        { c 1}
      }
    }
  }
}

theMelody = \transpose c e {
  \relative c'' {
    \jazzTweaks
    \global
    \partial 4.
    g8 g8. a16
    \repeat volta 2 {
      a8. g16 g4~ g8. g,16 c8. e16
      a8. g16 g4~ g8. c16 c8. d16
      d8. c16 c4~ c8. c,16 f8. a16
      d8. c16 c4~ c8. c16 b8. a16

      a8. g16 g4~g8. e16 a8. g16
      g8. f16 f4~ f8. b,16 d8. f16
      f8 e4.~ e2~
      e2 r8 g8 g8. a16

      a8. g16 g4~ g8. g,16 c8. e16
      a8. g16 g4~ g8. c16 c8. d16
      d8. c16 c4~ c8. c,16 f8. a16
      d8. c16 c4~ c8. c16 b8. a16

      a8. g16 g4~ g8. e16 a8. g16
      g8. f16 f4~ f8. b,16 b8. d16
      d8 c4.~ c2~
      c2 r4 r8 c8

      a'4~ \tuplet 3/2 { a8 a b } c4. c8
      b8 b4 a16 g16 g4 a8. g16
      \tuplet 3/2 { f4 e f } a4. f8
      e8 g4.~ g4. e8

      c'4. c8 c4. c8
      b8. b16 b8. b16 b4. g8
      a4. a8 a8. g16 fis8. a16
      g2 r8 g8 g8. a16

      a8. g16 g4~ g8. g,16 c8. e16
      a8. g16 g4~ g8. c16 c8. d16
      d8. c16 c4~ c8. c,16 f8. a16
      d8. c16 c4~ c8. c16 b8. a16

      a8. g16 g4~ g8. e16 a8. g16
      g8. f16 f4~ f8. b,16 b8. d16
      d8 c4.~ c2~
      \alternative {
        { c4 r4 r8 g'8 g8. a16 }
        { c,1 \repeatTie \fine }
      }
    }
  }
}

\book {
  \tabA
  % \paper {
  %     ragged-bottom = ##t
  %   }
  \score {
    <<
      \new ChordNames \transpose bes c
      { \theChords }
      \new Staff \transpose bes c'
      { \theMelody }
    >>
    % \layout {
    %       #(layout-set-staff-size 14)
    %     }
  }
}