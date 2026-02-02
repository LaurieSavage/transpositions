\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "TabA.ily"


\header {
  title = \markup { \with-color #"tomato" "Blues March" }
  composer = "Benny Golson"
  meter = "Street March"
  piece = "Art Blakey and the Jazz Messengers - Moanin' BLP 4003"
  tagline = "Edited L.S. 13/03/2024"
}

global = {
  \time 4/4
  \key bes \major
  \tempo 4=118
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  s1*6
  bes1:7 | ees1:7 | \repeat percent 2 { bes1:7 } %| bes1:7
  ees2:7 aes2:7 | des2:7 ges2:7 | g2:dim7 aes2:7 | a2:7 bes2:7.9-
  c1:dim7 | f1:7 | bes2:7 des2:7 | ges2.:7 b4:7

  ges2:7 b2:7 | bes2:7 des2:7
}

melody = \relative c'' {
  \global
  \mark "Drum Intro"
  %\sectionName "Drum Intro"
  R1*5 r2 r4 r8. f,16
  \repeat segno 2 {
    bes2 d16 bes r8 r8. bes16 | des2 ees16 d r8 r8. f,16
    bes2. d8. d16 | bes2 aes8 r8 r8 f8
    bes8. bes16 des8. des16 \tuplet 3/2 { ees8 e ees } \tuplet 3/2 { des8 bes des } |
    bes8. bes16 aes8. aes16 \tuplet 3/2 { ges8 ees ges } des8 ees |
    f2 r8 f8 \tuplet 3/2 { aes8 f aes } | ges2 r8 g bes8. cis16 |
    bes4~ \tuplet 3/2 { bes8 aes ges } bes4~ \tuplet 3/2 { bes8 aes ges } |
    a4 f'8. f16 \tuplet 3/2 { ees8 c a } f8 ees | d8 bes'~ bes2.~
    \alternative {
      \volta 1  {
        bes2. r8. f16
      }
      \volta 2 {
        \break
        \section
        \sectionLabel "Coda - repeat and fade"
      }
    }
  }
  \repeat volta 2 {
    r4 f'8. f16 \tuplet 3/2 { ees8 c a } f8 ees | d8 bes'~ bes2.
  }
}

words = \lyricmode {


}

\score {
  <<
    \new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff { \melody }
    %\addlyrics { \words }
  >>
  \layout { }
  \midi { }
}

\book {
  \bookOutputName "BluesMarch_BflatHorns"
  \header {
    instrument = "Bflat Horns"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      %\new FretBoards \chordNames
      \new Staff \transpose bes c' { \melody }
      %\addlyrics { \words }
    >>
    \layout { }
    %  \midi { }
  }
}

\book {
%  \tabA
  \bookOutputName "BluesMarch_Tablet"
  \paper {
    ragged-bottom = ##t
  }
  \header {
    instrument = \markup { \with-color #"tomato" "Tenor Sax" }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      %\new FretBoards \chordNames
      \new Staff \transpose bes c' { \melody }
      %\addlyrics { \words }
    >>
    \layout {
      \override Score.CodaMark.color = "tomato"
      \override Score.SegnoMark.color = "tomato"
      \override Score.SectionLabel.color = "tomato"
      \override Score.RehearsalMark.color = "tomato"
      \override Score.JumpScript.color = "tomato"
    }
    % \midi { }
  }
}

