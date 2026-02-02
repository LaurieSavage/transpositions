%%%%%%%%%
\version "2.24.4"

preludeMelody = \transpose g ees' {
  \relative c'' {
    \global
    \mark 1
    % Introduction
    \repeat volta 2 {

      d1~
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
    }
    \alternative {
      {
        g1~ g
      }
      {
        g1~ g4 r4 d'4. b8 \break
      }
    }
  }
}

mainMelody = \transpose g ees'{
  \relative c''{
    % Melody
    \repeat volta 2{
      \mark 2
      a2 a2~
      a8 g a b d b a g
      f1~
      f1 \break
      ees2 ees~
      ees8 ees f g bes g f ees
    }
    \alternative{
      {
        d1~
        d2 d'4. b8
      }
      {
        d,1~
        d2. r8 d8 \bar "||"
      }
    } \break
    \mark 3
    ees8 f g a bes4. a8
    c4. bes8 a (g) f g
    a4 a2.~
    a2. r8 d,8 \break
    ees8 f g (a) bes4. a8
    c4. bes8 a g f g
    d'1~
    d2 d4. b8 \bar "||" \break
    \mark 4
    a2 a2~
    a8 g a b d b a g
    f1~
    f1 \break
    ees2 ees~
    ees8 ees f g bes g f ees
    d1~
    d2. r4 \bar "||" \break
  }
}

interlude = \transpose g ees' {
  \relative c'' {
    \global
  \bar ".|:-|"
    \repeat volta 2 {
      \mark 5
      d1~
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
      g1~ g1
    }
  }
}
