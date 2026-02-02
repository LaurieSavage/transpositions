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
  title = "Gypsy in my soul"
  composer = "Moe Jaffe & Clay Boland"
}

global = {
  \time 4/4
  \key bes \major
  % 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  bes2:maj/f g2:m7
  c2:m7 f2:7
  bes2:maj g2:m7
  f4:7 r2.

  \repeat volta 2 {
    bes2:maj7 g2:m7
    s4. f2:7 s8
    bes2:maj g2:m7
    c2:m7 f2:7
    bes2:maj g2:m7
    c2:m7 f2:7
  }
  \alternative {
    {
      bes2:6 g2:m7
      c2:m7 f2:7
    }{
      bes1:6
      e2:min7.5- a2:7
    }
  }

%% Bridge
d2:m7/a g2:7
d2:m7 g2:7
d2:m7 g2:7
d2:m7 g2:7

c2:m7/g f2:7
c2:m7 f2:7
c2:m7 f2:7
c2:m7 f2:7

%% Reprise
bes2:maj g2:m7
c2:m7 f2:7
bes2:maj g2:m7
c2:m f2:7
bes2:maj g2:m7
c2:m7 f2:7
bes1:6
s4. g2:dim s8

c2:m7 f2:7
c4.:m7 f2:7.9- s8
bes1:6
s4. g2:dim s8
c2:m7 f2:7
c4.:m7 f2:7.9- s8
bes2:6 g2:m7
c2:m7 f2:7

bes2:7.9- g2:m7
c2:m7 f2:7
bes2:maj g2:m7
c2:m7 f2:7
bes2:maj g2:m7
c2:m7 f2:7
bes2:6 g2:m7
c2:m7 f2:7



}

melody = \relative c' {
  \global
  \comp 12
  R1 \break
  \repeat volta 2 {
    \mark \default
    r4 f bes c
    d f8 ees~ ees2
    r4 f, bes c
    d4. c8~ c2 \break
    r4 f, bes c
    d f8 ees~ ees4 d
  }
  \alternative {
    {
      bes1~
      bes2. r4
    }{
      bes1~
      bes2. r4 \bar "||"
    }
  }\break

%% Bridge
\mark \default
d4. a'8~ a g g4
d4. a'8~ a g f4
d4. d8~ d2
d2. r4 \break

c4. g'8~ g f ees4
c4. g'8~ g f ees4
c1~
c2. r4 \bar "||" \break

% Last section
\mark \default
r4 f, bes c
d f8 ees~ ees2
r4 f, bes c
d4. c8~ c2 \break
r4 f, bes c
d f8 ees~ ees4 d
bes1~
bes4 r8 bes'8~ bes4. g8~ \bar "||" \break

\mark \default
g1
r4 r8 a8~ a4. f8~
f1~
f4 r8 bes8~ bes4. g8~ \break
g1
r4 r8 a8~ a4. f8~
f1~
f2. r4 \bar "||" \break

\mark \default
r4 f, bes c
d f8 ees~ ees2
r4 f, bes c
d4. c8~ c2 \break
r4 f, bes c
d f8 ees~ ees4 d
bes1~
bes2. r4 \bar "|."

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
      \new Staff \transpose ees c \melody
    >>


    \layout { }
    %  \midi { }
  }
}


