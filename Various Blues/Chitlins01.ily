\version "2.25.12"

#(set-global-staff-size 22)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"
\include "TabA.ily"

%\include "CominHome.ily"
%\include "Chitlins.ily"

\tabA
\paper {
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\header {
  title = \markup { \with-color "tomato" \underline "Chitlins con carne"}
  composer = \markup { \with-color "tomato" "Kenney Burrell"}
  piece = \markup { \with-color "tomato" "Straight Eighths"}
  instrument = \markup { \with-color "tomato" "Tenor Sax"}
  tagline = ##f
}


theNotesChit = \relative c'' {
  \jazzTweaks
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2

  \key c \major

  R1*7_"Bass and drums" r4 c,8 c ees c f c

  \repeat volta 2 {
    %\mark \default
    g'4 c,8 ees~ ees4 r4 | r4 c8 c ees c f c~ | c4 r4 r2 | r4 c8 c ees c f c
    g'4 c,8 ees~ ees4 r4 | r4 c8 c ees c f c~ | c4 r4 r2 | r4 c8 c ees c f c %\coda
    g'8 bes4.~ bes4 ges8 f~ | f4. c8 ees c f c~ | c4 r4 r2
    \alternative {
      \volta 1 {
        r4 c8 c ees c f c_\markup { \with-color "tomato" { "To " \coda " on last time"}}
      }
      %{\volta 2 %\volta #'()
    {
      R1
    } %_"After solos D.S al Coda"}
      %}
      \volta 2 {R1}

    }
  }

  \break
  \section
  \sectionLabel "Coda"
  \repeat volta 2 {
    g'8 bes4.~ bes4 ges8 f~ | f4. c8 ees c f c~ | c4 r4 r2 | r4 c8 c ees c f c
  }
}

theChordsChit = \chordmode {
  R1*8
  %\repeat volta 2 {
  c1*4:7.9+
  f1*2:7 c1*2:7.9+
  g1:7 | f1:7 | c1:7.9+
  % \alternative {
  %  {
  c1:7.9+
  % }
  %  {
  c1:7.9+
  % }
  %{ c1:7.9+ }%}
  %}
  %}
  \repeat volta 2 {
    g1:7 | f1:7 | c1*2:7.9+
  }
}

bassIntro = \relative c {
  \clef bass
  \key c \major

  \repeat volta 2 {
    \section
    \sectionLabel "Suggested bass intro"
    c4 g8 c~ c4 ees | r8 c4 g8 c4 ees | c4 g8 c~ c4 ees | r8 c4 g8 c4 ees
  }
}

\score {

  <<
    \new ChordNames \transpose bes c \theChordsChit
    \new Voice = soloist \transpose bes c' \theNotesChit
  >>

}