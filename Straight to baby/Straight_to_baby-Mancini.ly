\version "2.25.28"

\include "lilyjazz.ily"
\include "jazzchords.ly"
\include "jazzextras.ily"
\include "TabA.ily"


today = #(strftime "%d-%m-%Y" (localtime (current-time)))

global = {
  \time 4/4
  \key f \minor
  \tempo 4 = 100
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

\header {
  title = "Straight to baby"
  composer = "Henry Mancini"
  piece = "Med. Swing"
  tagline = \markup { "L.S. " \today }
}

theChords = \chordmode {
  \repeat volta 2 {
    f2:min c2:7.9- | f1:m | f2:min c2:7.9- | f1:min |
    f2:min c2:7.9- | f1:m | des2:9 c2:7.9-
    \alternative {
      { f2:min des4:9 c4:9 }
      { f1:min }
    }
  }

  bes2:m7 ees4:9.5- ees4:9 | des1:maj7 | aes1*2:6 |
  aes2:m7 des4:9.5- des4:9 | b1:maj7 | ges1 | g2:min9 c2:7.9-

  f2:min c2:7.9- | f1:m | f2:min c2:7.9- | f1:min |
  f2:min c2:7.9- | f1:m | des2:9 c2:7.9- | f1:min
}

theNotes = \relative c' {
  \global
  \jazzTweaks
  \repeat volta 2 {
    \mark \default
    f4 r8 f g bes4 aes8~ | aes1 | f4 r8 f g bes4 aes8 | r8 aes4.~ aes2 |
    f4 r8 f g4 bes4 | aes8 aes c f~ f4 g | aes8 aes f4 g8 e4 f8~ |
    \alternative {
      { f2. r4 }
      { f2. r4 }
    }
  }
  \break

  %% Bridge
  \section
  \mark \default
  ees8 ees4 ees8 ees4 ees4 | f8. f16 ees8 r8 d des4 c8~ | c1~ | c1 | \break
  d8 d4 d8 d4 d4 | ees8. ees16 d8 r8 c8 ces4 bes8~ | bes1 | c4 r aes r | \break

  %% Reprise
  \section
  \mark \default
  f4 r8 f g bes4 aes8~ | aes1 | f4 r8 f g bes4 aes8 | r8 aes4.~ aes2 | \break
  f4 r8 f g4 bes4 | aes8 aes c f~ f4 g | aes8 aes f4 g8 e4 f8~ | f1 \fine
}

\book {
  \bookOutputSuffix "Concert"
  \header {
    instrument = "Concert"
  }
  \score {
    <<
      \new ChordNames \theChords
      \new Voice = melody \theNotes
    >>
  }
}

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = "Bb Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c' \theChords
      \new Voice = melody \transpose bes c' \theNotes
    >>
  }
}

\book {
  \tabA
  \bookOutputSuffix "Tablet"
  \header {
    title = \markup \with-color "tomato" "Straight to baby"
    composer = \markup \with-color "tomato" "Henry Mancini"
    piece = \markup \with-color "tomato" "Med. Swing"
    instrument = \markup \with-color "tomato" "Tenor Sax"
    tagline = \markup \with-color "tomato" \today
  }
  \score {
    <<
      \new ChordNames \transpose bes c' \theChords
      \new Voice = melody \transpose bes c'  \theNotes
    >>
  }
}