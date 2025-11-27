global = {
  \time 4/4
  \tempo 4=168
  \key c \minor
  \set Score.markFormatter = #format-mark-box-letters
 
}

rm = {\mark \default}

chordNames = \chordmode {
  \partial 8*3 s4.
  \repeat volta 2{
    \repeat volta 2 {c1*4:m7 des1*2:maj7 }
    \alternative {{c1*2:m7}{c1*2:m7}}

    a4.:min7 bes4. g4.:min7 aes4. f4.:min7 g4.:min7 a4.:min7 b4.:min7

    c1*4:min7 des1*2:maj7 c1:m7
  }
  \alternative{{c1:m7}{c1:m7}}
  des1:maj7 c:min7.11+
}

melody = \relative c'' {
  \global
  \partial 8*3
  g8 bes g
  \repeat volta 2{
    \repeat volta 2
    {
      \rm
      c4. c8~ c2~ c2 bes4 c4 g4. \acciaccatura g8 f8~ f2~ f2. es8 f \coda
      c1~ c1~
    }
    \alternative
    {
      {c1~ c2 r8 g'8 bes g }
      {c,1~ c2 r8 g'8 c bes}
    }

    \break

    \time 6/8 \rm 
    a4 f8 bes4 a8 r8 g ees aes4 g8 r8 f8 ees g4 ees8 a4 f8 b4 g8
    \break
    \time 4/4 \mark \markup{\box"A"}
    c4. c8~ c2~ c2 bes4 c4 g4. \acciaccatura g8 f8~ f2~ f2. es8 f
    c1~ c1~ c1~
  }
  \alternative{
    {c2 r8 g'8 bes g}
    {
      c,2 \mark \markup{"d.c al coda"}
      r8 g'8 bes g  \bar "|."
    }
  }\break
  c2.--\coda bes4-^ c1-> \bar "|."

}

bassGtr = {
  \global
  \clef bass
  \partial 8*3 s8*3
  a4 b c d
}
