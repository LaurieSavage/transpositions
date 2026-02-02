\version "2.25.28"

\header {
  title = "Mr Syms"
  composer = "John Coltrane"
  piece = "Slow Blues"
}

\relative c'' {
  %\jazzOn
  %\global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 8
  r8 \bar ".|-|"
  r2 c8 r8 ees8 r8
  bes'4. g8 r2
  r4 r8 c,8 c'8 r8 c8 r8
  bes4. g8 r2 \break
  r4 r8 g8 c,8 d8 r8 ees8~
  ees4 d16 ees d bes c8 c8 r8 c8~
  c4 r4 c8 r8 ees8 c8
  bes'4. g8~ g4 r4 \break
  b2 c2
  aes1
  ees2 d4. c8~
  c8 r8 bes8 c r2 \bar "|."
}