global = {

}

melody = \relative c' {

  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3

  r8 c d e f gis4 a8 \mark \default

  \repeat volta 2 {
    \bar "[|:" b4 \segno
    b8 a b2~ |

    b4 b8 a b c b a |
    g4 g8 f g2~ |
    g4 g8 f g a g f |
    e4 e8 d e2~ |
    e4 e8 d e f e d \coda
    \section
    %\bar "||"
  }

  \alternative {
    \volta 1 {
      b1 |
      r4 c8 d e f gis a \bar ":|]"
    }
    \volta 2
    {
      cis,1
      r4 e a e' \bar "||"
    }
  }

  %% Bridge
  \section
  \mark \default
  e8 dis e cis d cis d c |
  cis2. e,4 |
  e'8 dis e cis d cis d c |
  cis2 r8 cis cis cis |
  des8 c des bes ces bes ces a |
  bes4. des,8 c d ges bes |
  c8 b c a bes a bes aes |
  a8 r c, d e^"D.S. al Coda" f gis a %\bar "||"

  %% Coda
  \section
  \sectionLabel \markup { \musicglyph "scripts.coda" }
  <<
    { s4 %\coda
      s4 s2 }
    \\
    { b1~  | }
  >>
  b2 c |
  d4 d8 c d2~ |
  d4 d8 c d e d c |
  a4 a8 g a2~ |
  a4 a8 g a b a g |
  e4 e8 d e4. d8 |
  e4 e8 d e4. e8 |
  a1 |
  R1 \fine
}