<<
  \context Staff = head \relative c'' {
    \clef treble
    \mark "Intro"
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >2 r4 r8 ees' \bar "||" \break
    \mark \default
    g8 g ees g~ g2~
    g2~ g8 aes ees f~
    f1~
    f2. r8 g,8
    f'8 f g,e'~ e2~
    e2 g8 f e d~
    d1~
    d2. r8 c8
    d8 ees e g,~g8 g4 e'8~
    e2. r8 g,8
    d'8 ees e g,~ g g4 e'8~
    e4. d8 \tuplet 3/2 {c4 b a'~}
    a2~ a8 g4 bes,8~
    bes2 b8 c b b~
    b8 g r g fis g b d
    g4 ges f e \break
    \mark \default
    ees r8 ees 8 g g ees g~
    g2~ g8 aes ees f~
    f1~
    f2. r8 g,8
    f'8 f g, e'~ e2~
    e2 g8 f e d~
    d4. c8 b c4 b'8~
    b2 r8 c4.
    g8 g g,g'~ g g,4 g'8~
    g2. r8 g,8
    g'8 g g, g'~ g g,4 g'8~
    g2~  g8 ges f e~
    e8 e g, e'~ e g,4 e'8~
    e4. g8 f8 e4 d8~
    d4. c8 b c4 d8~
    d4 ees2 g,8 c \break
    <<
      \context Staff = head \relative c'' {
        \repeat volta 2   {
          \mark \default
          <<
            {c1^"horns don't play in vamp" \repeatTie R1}
            \\
            {
              <g, d' ees>4_"Vamp between solos" r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
              <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~^"x4"
            }
          >>
        }
      }
      \new Staff = head \relative c {
        \clef bass
        c,8 g' c ees,~ees8 e4 f8~
        f8 c' ees e, f fis g c,~
      }
    >>
  }

  \new Staff = head \relative c {

    \clef bass
    % \mark "Intro"
    c,8 g' c ees,~ees8 e4 f8~
    f8 c' ees e, f fis g c,~
    c8 g' c ees,~ees8 e4 f8~
    f8 c' ees e, f fis g c,~
    c8 g' c ees,~ees8 e4 f8~
    f8 c' ees e, f fis g c,~
    c8 g' c ees,~ees8 e4 f8~
    f2 r2^"Similar"
  }
>>
