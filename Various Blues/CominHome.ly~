\version "2.24.3"

#(set-global-staff-size 22)

\include "jazzchords.ly"
\include "lilyjazz.ly"
\include "jazzextras.ly"
\include "includes/TabA.ly"

\tabA

\header {
  title = %\markup { \with-color "tomato" \underline
  "Comin' Home Baby"
%}
  composer = %\markup { \with-color "tomato"
  "Earle Hagan"
%}
  instrument = \markup { \with-color "tomato" "Tenor Sax" }
  piece = \markup { \with-color "tomato" "Straight 8ths" }
}

theNotes = \relative c'' {
  \jazzTweaks
  \key g \minor
  \partial 2
  r8 g bes d
  \repeat volta 2 {
    \showStartRepeatBar \bar "[|:-|"
    R1 | r8 g, bes d c bes g f | g4-^ r4 r2 | \break
    r2 r8 g bes c-^ | R1 | r8 g bes d c bes g f | g4-^ r4 r2 | \break
    r2 r8 g bes4-^ | d1 | cis2 c |
    \alternative {
      \volta 1 {
        bes8 g-^ r4 r2 | r2 r8 g bes d-^
      }
      \volta 2 {
        bes4-^ r4 r2 | R1 \fine
      }
    }
  }
}

theChords = \chordmode {
  s2
  \repeat volta 2 {
    g1:m | g1:m | g1:m | g1:m
    c1:m | c1:m | g1:m | g1:m
    bes1:7 | a2:7 aes2:7
    \alternative {
      \volta 1 {
        g1:m | g1:m
      }
      \volta 2 {
        g1:m g1:m
      }
    }
  }
}

\score {

  <<
    \new ChordNames \transpose bes c \theChords
    \new Voice = soloist \transpose bes c' \theNotes
  >>
}