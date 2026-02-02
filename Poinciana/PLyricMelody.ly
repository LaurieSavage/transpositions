\version "2.24.4"

interludeIn = \transpose g ees' {
  \relative c'' {
    \global
    % Introduction
    \repeat volta 2 {

      d1~  \mark \markup{ \italic \with-color #red \box"Interlude"}
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
        g1~ g4 r4 d'4. b8
      }
    }
  }
}

verse = \transpose g ees'{
  \relative c'' {
    \global
    % Melody
    \repeat volta 2{
      \mark \default
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
        d2. r4 \bar "||"
      }
    } \break
    \mark \default
    ees8 f g a bes4. a8
    c4. bes8 a g f g
    a1~
    a2. r4 \break
    ees8 f g a bes4. a8
    c4. bes8 a g f g
    d'1~
    d2 d4. b8 \bar "||" \break
    \mark \default
    a2 a2~
    a8 g a b d b a g
    f1~
    f1 \break
    ees2 ees~
    ees8 ees f g bes g f ees
    d1~
    d2. r4 \break
  }
}

InterludeOut = \transpose g ees'{
  \relative c''{
    \repeat volta 2 {
      d1~ \mark \markup{ \italic \with-color #red \box"Interlude"}
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
      g1~ g
    }
  }
}
