\version "2.24.3"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = "Gibraltar"
  %subtitle = "(Short version)"
  composer = "Freddy Hubbard"
  %arranger = "Laurie Savage"
  piece = "16 bars Latin, 4 bars swing, 4 bars Latin."
  tagline = \today
}

global = {
  \time 4/4
  \key c \mixolydian
  \tempo 4=185
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  \repeat percent 3 {g1:m c1:7}
  g1:m c1:7
  g1:m c1:7
  g1:m c1:7
  g1:m c1:7
  g1:m c1:7
  c2:7 bes2:7.9+

  ees1:maj
  a1:7.9+
  aes1:maj
  d1:7.9+

  g1:m c1:7
  g1:m c1:7
  c1:7
  %
  %   g1:m c1:7
  %   g1:m c1:7
  %   g1:m c1:7
  %   g1:m c1:7
  %   c1:7

  % Solos
}

melody = \relative c'' {
  \global
  \mark  \markup {\box{"Intro"}}
  \repeat percent 3 { s1_"Latin" s1 } \break
  s1
  r4 g4-^ bes8 (d4-.) c8~
  \repeat volta 2 {
    \repeat volta 2 {
      \mark \default
      c1~
      c1~
      c1~
      c4 g8 (a bes c d bes
      c a f d~ )d2~ \break
      d1~
      d1~
    }
    \alternative{
      { d4 g4-^ bes8 (d4-.) c8   }
      { d,4\repeatTie f8 (g bes c d f) \bar "||"}
    }\break

    \mark \default
    g4._"Swing" f8 ees8 d4 cis8~
    cis2. c8 (bes)
    f'4. f8 ees8 (f4-.) c8~
    c4. bes8 \tuplet 3/2 {c16 (des c } bes8 g f) \break
    \mark \default
    g1~_"Latin"
    g2  \tuplet 3/2 {c16 (des c } bes8 g f)
    g8 (bes8) r4 r2
  }
  \alternative {
    {r4 g4-^\mark \markup {\text \italic{back to \box{A}}} bes8 (d4-.) c8 \laissezVibrer}
    {R1_"Fade out on intro vamp" \bar "|."}
  }
}

BassChordNames  = \chordmode {
  \repeat percent 4 { g1:min c1:7 }
  g1:min c1:7
  g1:min c1:7
  g1:min c1:7
  g1:m c1:7
  c2:7 bes2:7.9+

  ees1:maj
  a1:7.9+
  aes1:maj
  d1:7.9+

  g1:min
  c1:7
  g1:min
  c1:7
}

BassDrumsSheet = {
  \global
  \improvisationOn
  \mark  \markup {\box{"Intro"}}
  \repeat percent 4 {s1_"Latin" s1} \break
  \repeat volta 2 {
    \mark \default
    s1_"Latin"
    s1*5
    s1
  }
  \alternative {
    { s1}
    { s1 \bar "||"}
  }\break

  \mark \default
  s1_"Swing"
  s1*3
  \mark \default
  s1_"Latin"
  s1*3 \bar "||"
  \improvisationOff
}

SoloChords = \chordmode {
  g1:m c1:7
  g1:m c1:7
  g1:m c1:7
  g1:m c1:7

  c2:7 bes2:7.9+

  ees1:maj
  a1:7.9+
  aes1:maj
  d1:7.9+

  g1:m c1:7
  g1:m c1:7
}

SoloStructure = {
  \global
  \mark \default
  \repeat volta 2 {
    s1_"Latin"
    s1 s1 s1 %\break
    s1 s1 s1
  }
  \alternative {{s1 }{s1 \bar"||" }}\break
  \mark \default
  s1_"Swing"
  s1 s1
  \improvisationOn b'4-^_"Break" \improvisationOff r4 r2 \bar "||" %\break
  \mark \default
  s1_"Latin"
  s1 s1 s1 \bar"|."
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
  \score {
    \header {piece = "Solos (16 bars Latin, 4 bars swing, 4 bars Latin)"}
    <<
      \new ChordNames \SoloChords
      \new Staff \SoloStructure
    >>
  }
}

\bookpart {
  \header {
    instrument =  "B flat Instruments"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
    >>


    \layout { }
    %\midi { }
  }
  \score {
    \header {piece = "Solos (16 bars Latin, 4 bars swing, 4 bars Latin)"}
    <<
      \new ChordNames \transpose bes c \SoloChords
      \new Staff \SoloStructure
    >>
  }
}

\bookpart {
  \header {
    instrument  = "E flat Instruments"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>


    \layout { }
    %  \midi { }
  }
  \score {
    \header {piece = "Solos (16 bars Latin, 4 bars swing, 4 bars Latin)"}
    <<
      \new ChordNames \transpose ees c \SoloChords
      \new Staff \SoloStructure
    >>
  }
}

\bookpart {
  \header {
    instrument = "Bass & Drums"
  }
  \score {
    <<
      \new ChordNames \BassChordNames
      \new Staff { \BassDrumsSheet }
    >>
    \layout { }
    \midi { }
  }
  \score {
    \header {piece = "Solos (16 bars Latin, 4 bars swing, 4 bars Latin)"}
    <<
      \new ChordNames \SoloChords
      \new Staff \SoloStructure
    >>
  }
}

%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
