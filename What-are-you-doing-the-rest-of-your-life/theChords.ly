chordNames = \chordmode {
  s1
  \repeat volta 2 {
    a2:m a2:m7+
    a2:m7 a2:m6
    f1:maj7
    f2:maj7 e2:m7
    d1:m7
    d2:m7 b2:m7.5-
  }
  \alternative {
    {
      b1:m7/e
      e1:7
    }
    {
      a1*2:maj7
    }
  }

  %% Bridge
  b2:m7.5- e2:9
  a1:maj7
  b2:m7.5- e2:9
  a1:maj7
  aes2:m9 des2:7.9-
  ges1:maj7
  g2:m7 c2:7.9-
  f1:maj7

  %% Coda
  b1:m7/e
  e:7
  f:6
  d2:m e2:7
  f1:maj7
  f:7.9-
  a:m/e
  b2:m7 e:7
  a1:m
  b2:m7.5- %\parenthesize
  e2:7.9- %\parenthesize
}