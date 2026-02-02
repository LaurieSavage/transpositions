\version "2.24.4"

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\paper {
  #(set-paper-size "a4")
%  paper-height = 11\in
%  paper-width = 8.5\in
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

\header {
  title = "Fly too high - sketch"
  poet = "Janis Ian"
}


xchords = \chordmode {
  \repeat volta 2 {
  % Intro
  \repeat unfold 4 {
    f1:m | g1:7
  }

  % Instrumental
  \repeat unfold 4 {
    f1:m | g1:7
  }

  % Vocals 1a
  \repeat unfold 4 {
    f1:m | g1:7
  }

  % Vocals 1b
  \repeat unfold 3 {
    f1:m | g1:7
  }
  f1:m | f1:m
  bes1:m | des1:m | f1:m | f1:m

  \alternative {
    { bes1:m | c1:7 }
    { bes1:m | des1 }
  }
}

}

notes = \relative c''{
  \key f \minor
  \sectionLabel "Intro"
  \repeat unfold 3 {
    s1 | s1 }
  s1 | r2 r4 \tuplet 3/2 { r8 aes g } \break

  \repeat volta 2 {
    \sectionLabel "Soloist"
    \tuplet 3/2 { f4_"Horn ad lib or play the line)"\segno f f } \tuplet 3/2 { f4 g aes }
    r2 r4 c,8. bes16~
    bes4 r4 r4 c'8. bes16~
    bes2 r4 \tuplet 3/2 { r8 c d } \break
    \tuplet 3/2 { ees8 d c } r4 r4 \tuplet 3/2 { r8 c d }
    \tuplet 3/2 { ees8 d c } r4 r4 \tuplet 3/2 { r8 c d }
    R1_"Horn fills"\coda R1
    \break

    \section
    \sectionLabel "Vocal"
    \repeat unfold 4 {
      s1 | s1 } \break
    \repeat unfold 4 {
      s1 | s1 } \break
    \repeat unfold 2 {
      s1 | s1 } \break
    \alternative {
      { s1 | s1 }
      { s1 | s1}
    }
  }


}

\bookpart {
  \header {
    subtitle = "Guitar"
  }
  \score {
    <<
      \new ChordNames \xchords
      \new Staff \notes
    >>
  }
}