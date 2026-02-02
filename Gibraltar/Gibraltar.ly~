\version "2.24.3"

\include "lilyjazz.ily"
\include "jazzchords.ily.ily"
\include "jazzextras.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
}

layoutScore = \layout {
  indent = 15\mm
}

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
               'length (ly:music-length note)))

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
  title = \markup { \underline "Gibraltar" }
  composer ="Freddie Hubbard"
  poet = \markup { \small "Stanley Turrentine - Salt Songs, 1972"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Hubtones, 1972"}
  copyright =  \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key f \major
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
  \tweak X-offset #-8 \mark \jazzTempoMarkup #"Latin" c4 #"185"
}

chordNames = \chordmode {
  \global
  \repeat percent 3 {g1:m c1:7}
  g1:m
  c1:7
  % A
  g1:m c1:7
  g1:m c1:7
  g1:m c1:7
  g1:m
  c1:7
  c4:7 bes2.:7.9+
  % B
  ees1:maj
  a1:7.9+
  aes1:maj
  d1:7.9+
  g1:m c1:7
  g1:m c1:7

  %C
  g1:m7
  c1:7
  g1:m7
  c1:7
  g1:m7
  c1:7
  g1:m7
  c1:7
  c1:7

  % Interlude
  d1*4:m
  f1*4:m
  aes1*4:m
  b1*2:m
  b1:m
  g4:m s2.

  % A
  g1:m c1:7
  g1:m c1:7
  g1:m c1:7
  g1:m
  c1:7
  c4:7 bes2.:7.9+
  % B
  ees1:maj
  a1:7.9+
  aes1:maj
  d1:7.9+
  g1:m c1:7
  g1:m c1:7


}



melody = \relative c'' {
  \jazzOn
  \global
  \repeat percent 3 { s1   \mark  \markup {\box{"Intro"}} s1 }
  s1
  r4 g4-^ bes8 (d4-.) c8->~ \break
  % A
  \repeat volta 2 {
    \repeat volta 2 {
      \mark \default
      c1_"Latin"~
      c1~
      c1~
      c4 g8 (a bes c d bes \break
      c8 a f d~ d2)~
      d1~
      d1~
    }
    \alternative {
      {
        d4 g4-^ bes8 (d4-.) c8-> \laissezVibrer
      }
      {
        d,4\repeatTie f8 (g bes c d f) \break
      }
    }

    % B
    \mark \default
    g4._"Swing" f8 ees8 d4 cis8~
    cis2. c8 (bes)
    f'4. f8 ees8 (f4-.) c8~
    c4. bes8 \tuplet 3/2 {c16 (des c } bes8 g f) \break
    g1~
    g2  \tuplet 3/2 {c16 (des c } bes8 g f)
    g8 (bes8) r4 r2
  }
  \alternative {{  r4 g4-^ bes8 (d4-.) c8->\laissezVibrer }{R1}}
  \break
  %{% A
  \repeat volta 2 {
    \mark \default
    c1_"Latin"~
    c1~
    c1~
    c4 g8 (a bes c d bes \break
    c8 a f d~ d2)~
    d1~
    d1~
  }
  \alternative {
    {
      d4 g4 bes8 (d4-.) c8-> \laissezVibrer
    }
    {
      d,4\repeatTie r4 r2 \bar "||" \break
    }
  }
  %}
  d,2._"[Freely in time]" \mark \markup {\box "Interlude"} d4
  (f2 g2)
  g4. (d8~ d2~
  d1) \break
  f2. f4
  (aes2 bes)
  bes4. (f8~ f2~
  f2.) f4 \break
  aes2.  aes4
  (b2 des2)
  des4. (aes8~ aes2~
  aes2.) aes4-^ \break
  b2. b4
  (d2 e2)
  e2 b4. c8-^
  r4 \breathe g4-^ bes8 (d4-.) c8->~ \break
  % A
  \repeat volta 2 {
    \mark 1
    c1_"Latin"~
    c1~
    c1~
    c4 g8 (a bes c d bes \break
    c8 a f d~ d2)~
    d1~
    d1~
  }
  \alternative {
    {
      d4 g4-^ bes8 (d4-.) c8-> \laissezVibrer
    }
    {
      d,4\repeatTie f8 (g bes c d f) \break
    }
  }

  % B
  \mark 2
  g4._"Swing" f8 ees8 d4 cis8~
  cis2. c8 (bes)
  f'4. f8 ees8 (f4-.) c8~
  c4. bes8 \tuplet 3/2 {c16 (des c } bes8 g f) \break
  g1~
  g2  \tuplet 3/2 {c16 (des c } bes8 g f)
  g8 (bes8) r4 r2
  R1 \mark "To solos" \break
}

SoloChords = \chordmode {
  \global
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  g1:m c1:7
  g1:m c1:7 \break
  g1:m c1:7
  g1:m c1:7

  c2:7 bes2:7.9+

  ees1:maj
  a1:7.9+
  aes1:maj
  d1:7.9+ \break

  g1:m c1:7
  g1:m c1:7
}

SoloStructure = {
  \global
  \jazzOn
  \repeat volta 2 {
    s4 \mark \default s2.
    s1 s1 s1 %\break
    s1 s1 s1
  }
  \alternative {{s1 }{s1 \bar"||" }}\break
  \mark \default
  s1_"Swing"
  s1 s1
  \jazzOff
  \improvisationOn b'4-^_"Break" \improvisationOff
  \jazzOn
  r4 r2 \bar "||" %\break
  \mark \default
  s1_"Latin"
  s1 s1 s1 \bar"|."
}


\book {
  \bookOutputSuffix "Concert"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Concert" } { \melody }
    >>
    \layoutScore
  }
  \score {
    \header {
      piece  = \markup {
        \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
        "Solos (16 bars Latin, 4 bars swing, 4 bars Latin)"
      }
    }
    <<
      \new ChordNames \SoloChords
      \new Staff \with { instrumentName = "Concert" } \SoloStructure
    >>
    \layoutScore
  }
}

% \bookpart {
%   \header {
%     instrument =\markup {
%       \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
%       "E flat instrument"
%     }
%   }
%   \score {
%     <<
%       \new ChordNames \transpose ees c \chordNames
%       \new Staff \transpose ees c' { \melody }
%     >>
%
%   }
% }

\book {
  \bookOutputSuffix "Bb"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = "Bb Horns" } \transpose bes c' { \melody }
    >>
    \layoutScore
  }
  \score {
    \header {
      piece  = \markup {
        \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
        "Solos (16 bars Latin, 4 bars swing, 4 bars Latin)"
      }
    }
    <<
      \new ChordNames \transpose bes c {\SoloChords}
      \new Staff \with { instrumentName = "Bb Horns" } \transpose bes c {\SoloStructure}
    >>
    \layoutScore
  }
}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.25.11  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4,
2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11
%}
