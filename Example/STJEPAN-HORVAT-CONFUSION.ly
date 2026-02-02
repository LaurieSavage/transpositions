\version "2.24.4"

\include "jazzchords.ily"
\include "deutsch.ly"
\include "swing.ly"

\header {
  title = "CONFUSION"
  subtitle = "(ZBUNJENOST)"
  composer = "STJEPAN HORVAT"
}

chordes = \chordmode {
  \set chordChanges = ##t
  f1:maj7.3- | s1 | b:7 | s1 |
  es:maj7 | s1 | es:maj7.3- | s2 s8 e4.:m7.5- |
  f1:maj7.3- | s1 | b:7 | s1 |
  es1:maj7 | s1 | c:7 | s1 |
}

scores = \relative c'' {
  \accidentalStyle modern-cautionary
  \tempo 4 = 160
  g2. f8 as ~ |
  as2.. f8 |
  g8 g g4 g8 f4 as8 ~ |
  as4. es8 f fes es4 | \break
  f2 ~ f8 es4\staccato g8 ~ |
  g2.. es8 |
  f8 f f4 f8 es4 ges8 ~ |
  ges2 ~ ges8 g r4 | \break

  g2. f8 as ~ |
  as2.. f8 |
  g8 g g4 g8 f4 as8 ~ |
  as4. es8 f fes es4 |
  f2 ~ f8 es4\staccato g8 ~ |
  g2. cis,4 |
  c4 e g b8 as ~ |
  as8 g4 g8 e f g4 |
}

scoresOne = {
  e''2. d''8 f'' ~  |
  f''2.. d''8 |
  e'' e'' e''4 e''8 d''4 f''8 ~  |
  f''4. c''8 d'' des'' c''4 |
  d''2 ~  d''8 c''4-.  es''8 ~  |
  es''2.. c''8 |
  d'' d'' d''4 d''8 c''4 es''8 ~  |
  es''2 ~  es''8 e'' r4 |
  e''2. d''8 f'' ~  |
  f''2.. d''8 |
  e'' e'' e''4 e''8 d''4 f''8 ~  |
  f''4. c''8 d'' des'' c''4 |
  d''2 ~  d''8 c''4-.  es''8 ~  |
  es''2. ais'4 |
  as' c'' e'' g''8 f'' ~  |
  f'' e''4 e''8 c'' d'' e''4 |
}

scoresTwo = {
  d''2. c''8 es'' ~  |
  es''2.. c''8 |
  d'' d'' d''4 d''8 c''4 es''8 ~  |
  es''4. b'8 c'' ces'' b'4 |
  c''2 ~  c''8 b'4-.  d''8 ~  |
  d''2.. b'8 |
  c'' c'' c''4 c''8 b'4 des''8 ~  |
  des''2 ~  des''8 d'' r4 |
  d''2. c''8 es'' ~  |
  es''2.. c''8 |
  d'' d'' d''4 d''8 c''4 es''8 ~  |
  es''4. b'8 c'' ces'' b'4 |
  c''2 ~  c''8 b'4-.  d''8 ~  |
  d''2. gis'4 |
  g'_"2x rit." b' d'' f''8 e'' ~  |
  e'' d''4 d''8 b' c'' d''4 |
}

\paper {
  print-page-number = ##f
}
\bookpart {
  \score {
    <<
      \new ChordNames {
        \chordes
        \chordes
        \chordes
      }
      \new Staff {
        \scores
        \break
        \mark \markup { \bold "SOLOS" }
        \bar ":..:"
        \repeat unfold 16 {
          s1
        }
        \bar ":..:"
        \break
        <<
          \transpose c c \scores
          \transpose c c, \scoresOne
          \transpose c c, \scoresTwo
        >> \bar ":|."
      }
    >>
    \header { subsubtitle = "in C" }
    %\layout { \context { \Staff \accepts "ChordNames" } }
  }
}
\bookpart {
  \score {
    <<
      \new ChordNames { \transpose c d { \chordes \chordes \chordes } }
      \new Staff { \transpose c d { \scores \break \mark \markup { \bold "SOLOS" } \bar ":..:" \repeat unfold 16 { s1 } \bar ":..:" \break
                                    << \transpose c c \scores \transpose c c, \scoresOne \transpose c c, \scoresTwo >> \bar ":|." }
      }
    >>
  }
  \header { subsubtitle = "in Bb" }
}

\score {
  <<
    \new ChordNames { \chordes }
    \new Staff \with {midiInstrument = #"clarinet" instrumentName = "Part 1"} { %\swingIt #'8
      \tripletFeel 8
      << \transpose c c \scores >>
    }
    \new Staff \with {midiInstrument = #"flute" instrumentName = "Part 2"} {
      \tripletFeel 8
      << \transpose c c, \scoresOne >>
    }
    \new Staff \with {midiInstrument = #"trombone" instrumentName = "Part 3"} {
      \tripletFeel 8
      << \transpose c c, \scoresTwo >>
    }
  >>
  \midi {}
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.15.7, 2.15.9, 2.15.10, 2.15.16, 2.15.17,
2.15.18, 2.15.19, 2.15.20, 2.15.25, 2.15.32, 2.15.39, 2.15.40,
2.15.42, 2.15.43, 2.16.0, 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11,
2.17.14, 2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27,
2.17.29, 2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
