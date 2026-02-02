\version "2.24.4"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = "Brazil"
  composer = "Barroso/Russell"
  piece = "Samba"
}

global = {
  \time 4/4
  \key aes \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \global
  \partial 2
  s2
  %% Verse
  aes1*4:6
  des1*4:7
  aes1*4:6
  ges1:7
  f1:7
  bes1:m7
  ees1:7
  bes1:m7
  ees1:7
  bes1:m7
  ees1:7
  bes1:m7
  ees1:7
  aes1*2
  bes1:m7
  ees1:7
  aes1*2
  bes1:m7
  ees1:7 \break

  %% A section
  aes1*4
  bes1*2:m7
  ees1*2:7
  bes1*2:m7
  ees1*2:7
  aes1*2
  bes1.:m
  ees2:7.9-
  aes2
  aes2:7
  g2:7
  ges2:7 \break

  %% B section
  f1:7
  ges1:7
  f1*2:7
  f1:7
  ges1:7
  f1*2:7
  f1:7
  ges1:7
  f1*2:7
  bes1*4:m

  %% C section
  des1*2:m7
  ges1*2:9
  aes1*3
  f1:m7
  bes1*2:m7
  ees1*2:9
  aes1*2
  bes1:m7
  ees1:7
  aes1*2
  bes1:m7
  ees1:7
  aes1*2

}

melody = \relative c' {
  \global
  \partial 2
  %% Verse
  ees2^"Verse" \bar "||"
  f1~
  f1~
  \tuplet 3/2 {f2 ees2 f2}
  \tuplet 3/2 {g2 f2 ees2}
  f1~
  f1~
  \tuplet 3/2 {f2 ees2 f2}
  \tuplet 3/2 {g2 f2 ees2} \break
  f1~
  f1~
  f2 ees4 f
  g4 aes bes c
  des1
  c4 r4 r2
  r8 ees4 c8 ees2
  c4. bes8~ bes g4 f8
  r8 ees'4 c8 ees2
  c4. bes8~ bes g4 f8
  r8 ees'4 c8 ees2
  c4. bes8~ bes g4 f8
  r8 ees'4 c8 ees2
  c4. bes8~ bes aes4 c8~
  c1~
  c2 g
  f1~
  f2 g
  c1~
  c2 g
  f1~
  f2
  ees2 %\bar "||"

  \mark \default
  \repeat volta 2 {
    %% A section
    c'1~
    c1~
    c4 ees ees c
    c4 bes bes8 aes4 bes8~
    bes1~
    bes1~
    bes4 ees ees c
    c4 bes4~ bes8 aes4 bes8~ \bar "||"
    bes1~
    bes1~
    bes4 ees ees c
    c4 bes bes8 aes4 c8~
    c1~
    c2 g
    f1~
    f2 g
    c2 c
    ces2 bes \bar "||"

    %% B section
    \mark \default
    ees1~
    ees1~
    ees4 ees ees d
    des4 c b8 c4 ees8~
    ees1~
    ees1~
    ees4 ees ees d
    des4 c b8 c4 ees8~
    ees1~
    ees1~
    ees4 ees ees d
    des4 c bes8 c4 des8~
    des1~
    des1~
    des1~
    des1 \bar "||" \break

    %% C section
    \mark \default
    des1~
    des1~
    des4 des des c
    c4 bes aes8 g4 bes8~
    bes1~
    bes1~
    bes4 aes bes c
    ees2 c8 aes4 aes8~
    aes1~
    aes1
    bes2 bes4 bes
    bes2 bes8 aes4 c8~
    c1~
    c2 g2
    f1~
    f2 g
    c1~
    c2 g
    f1~
    f2 g \bar "||"
    c1~
    c1~
    c1
    R1 R1 R1 R1 R1
  }
}


\bookpart {
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>

    \layout { }
    \midi { }
  }
}

\bookpart {
  \header {
    instrument = \markup {"B" \flat " Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
    >>


    \layout { }
    %\midi { }
  }
}

\bookpart {
  \header {
    instrument = \markup {"E" \flat " Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>


    \layout { }
    %  \midi { }
  }
}


