\version "2.24.4"
\include "lilyjazz.ily"

\header {
  title = "Bye Bye Blackbird"
  composer = "Ray Henderson"
  instrument = "B flat instruments"
  poet = "Mort Dixon"
  piece = "Moderately"
  copyright = "Warner Bros, 1926"
  tagline = "Engraved by LS"
}

global = {
  \time 4/4
}

chordNames = \chordmode {
  \global
  % Chords follow here.
  f1 | f2 d2:7 | g2:m7 c2:9 | f1 |
  f1:/a | aes1:dim7 | g2:m7 c2:7 c1:7
}

melody = \relative c'' {
  \global
    \key f\major
  % Music follows here.
  \repeat volta 2 {
    a4 a a a | b a a2 | a4 g g2 | g4 f f2 |\break
  f1 | g1 | f2 e2~ | e1 |\break
  bes'4 bes bes bes | c bes bes2 | bes4 a a2 | a4 g g2 |\break
  g1 | a1 | g2 f2~ | f1 |\break
  
  f4 c' c c | c bes a g | g1 | fis1 |\break
  d'4 bes bes bes | bes a g f | f1 | e1 |\break
  a4 a a a | bes a a2 | a4 g g2 | g4 fis fis2 |\break
  g2 bes2~ | bes2 e,2 }
  \alternative{{f2 r2 | r1}{ f1~ f1}}
}

accRight = \relative c' {
  \global
  % Music follows here.
  
}

accLeft = \relative c {
  \global
  % Music follows here.
  
}

verse = \lyricmode {
  % Lyrics follow here.
  Pack up all my care and woe,
  here I go sing -- ing low,
  Bye Bye Black -- bird.__
  Where some -- bod -- y waits for me,
  su  -- gar's sweet, so is she,
  Bye Bye Black -- bird. __
  No one here can love and un -- der -- stand me,
  oh what hard luck sto -- ries they all hand me.
  Make my bed and light the light,
  I'll arr -- ive late to -- night,
  black -- bird __ bye bye
}

\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new ChoirStaff <<
      \new Staff <<
        \new Voice { \voiceOne \transpose bes c' \melody }
        \addlyrics { \verse }
        \new Voice { \voiceTwo \accRight }
      >>
      %\new Staff { \clef bass \accLeft }
    >>
  >>
  \layout { }
  \midi {
    \tempo 4 = 100
  }
}
