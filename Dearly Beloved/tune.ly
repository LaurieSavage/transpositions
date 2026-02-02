melody = \relative c'' {
  %\global
  %
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \time 4/4
  \key c \major
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"

%  \revert Score.BarNumber.stencil
  \mark \default
  g2 d4. e8
  f4 g2 a4
  g2 d4. g8
  f1 \break
  g2 d4. e8
  f4 g a c
  b2 g4. b8
  a1 \break
  g4 a4 c2~
  c1
  c,2 g'2~
  g1 \break
  g4 b4 d2~
  d4 des c b
  bes2 aes2~
  aes1 \bar "||" \break
  \mark \default
  g2 d4. e8
  f4 g2 a4
  g2 d4. g8
  f1 \break
  g2 d4. e8
  f4 g a c
  b2 g4. b8
  a1 \break
  g4 a4 c2~
  c1
  d2 b~
  b1 \break
  g2 d4. e8
  f4 g2 e4
  c1  \bar "|."
  R1_\markup{\small "Pickup during solos" }
}