\version "2.25.28"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "TabA.ily"
\include "swing.ly"

\header {
  title = "Love For Sale"
  composer = "Cole Porter"
  piece = "Samba"
  instrument = \markup { \with-color "tomato" { "Tenor Sax" }}
  tagline = ##f
}

global = {
  \time 4/4
  \key g \major
  \tempo 4=200
}

chordNames = \chordmode {

  s1*12

  c1*2:9 g1*2:m7
  c1*2:9 g1*2:m7
  c1:m7 f1:7 bes1:maj7 bes2:m7 ees2:7
  a1:m7 d1:7 g1*2:m7

  c1:m7 f1:7.9- bes2:maj7 c2:m7 d2:m7 cis2:7.5-
  c1:m7 f1:7.9- bes2:maj7 c2:m7 d2:m7 ees2:maj7
  g1:7 aes2:7 g2:7 c1:m6 c1:m7
  e2:m7.5- a2:7 e2:m7.5- a2:7 dis2:m7 gis2:7 d2:dim g2:7

  c1*2:9 g1*2:m7
  c1*2:9 g1*2:m7
  c1:m7 f1:7 bes1:maj7 ees1:7
  a1:m7 d1:7 g1*2:m7

  a1:m7 d1:7 g1*2:m7
  a1:m7 R1 g1*3:m7
}

melody = \relative c'' {
  \global
  \jazzTweaks
  \sectionLabel "Intro - drums"
  \inlineMMR R1*12 \break
  \section \mark \markup {\box "A"}
  \repeat segno 2 {
    \repeat volta 2 {
      g'1~ | g2. e4 | d1~ | d1 | \break
      d4 g8 g g4 g4 | g4 g~ g e | d1~ | d2. r4 | \break
      r4 g8 g g4 g4 | g a a2 | r4 f8 f f4 f | f ees ees2 | \break
      d1~ | d2. bes4 | g1~ | g2. r4
    } \break

    \section \mark \markup {\box "B"}
    r4 g8 a bes4 c | d c c2~ | c4 a8 bes c4 d | f1 | \break
    r4 g,8 a bes4 c | d c c2~ | c4 a8 bes c4 d | g1 | \break
    r4 g,8 a b4 d | ees d d2~ | d4 bes c8 d ees4 | a4 g g2 | \break
    bes2 a2 | bes2 a2~ | a4 gis8 gis gis4 gis | gis2 g2 | \break

    \section \mark \markup {\box "A"}
    g1~ | g2. e4 | d1~ | d1 | \break
    d4 g8 g g4 g4 | g4 g~ g e | d1~ | d2. r4 | \break
    r4 g8 g g4 g4 | g a a2 | r4 f8 f f4 f | f ees e2 | \break

    \alternative {
      \volta 1 {
        d1~ | d2 bes2 | g1~ | g2. r4 | \break
      }
      \volta 2 \volta #'() {
        \section
        \sectionLabel "Coda"
      }
    }
  }
  \break
  \repeat volta 2 {
    d'1~ | d2 bes2 | g1~ | g2. r4
  }  \break
  d''1~ \fermata | d2. \caesura bes4 \fermata |
  g1~ g~ g~ g4 r4 \xNote { g } r4 \bar "|."
}


words = \lyricmode {


}

\book {
  \tabA
  \paper {
    ragged-last-bottom = ##f
    ragged-bottom = ##f
    ragged-right = ##f
  }
  \score {
    <<
      \new ChordNames {
        \set Staff.midiInstrument = "drawbar organ"
        \set Staff.midiMaximumVolume = 0.75
        \chordNames
        s1*12

      }
      %\new FretBoards \chordNames
      \new Staff \applySwing 16 #'(3 2 2 3) %\unfoldRepeats
      {
        \set Staff.midiInstrument = "flute"
        \melody
      }
      \addlyrics { \words }
    >>
    \layout { }
    \midi { }
  }
}