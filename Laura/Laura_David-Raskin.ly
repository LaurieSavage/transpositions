\version "2.24.3"

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

\paper {
  #(set-paper-size a4)
  left-margin = 20
  right-margin = 20
}

\header {
  title = "Laura"
  subtitle = "Standard Key"
  composer = "David Raskin"
  poet = "Johnny Mercer"
  copyright = "1945"
  tagline = "Paradiso Connection"
}

global = {
  \time 4/4
  \key b\minor
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle modern-cautionary
}

chordNames = %\transpose c bes
\chordmode {
  \global
  %% A
  b1:m9
  e1:7.9-
  a2:6.9 e2:sus9
  a1:6.9
  a1:min9
  d1:7.9-
  g2:maj d2:sus7
  g1:maj7
  g1:min7
  c2:sus7 c2:7.9-
  f1:maj7
  d1:min7
  b2:min7.5- e2*2:7.5-.9-
  e2:7
  a1:maj7
  fis1:7.5+

  %% B
  b1:m9
  e1:7.9-
  a2:6.9
  e2:sus9
  a1:6.9
  a1:min9
  d1:7.9-
  g2:maj d2:sus7
  g1:maj7
  g2:m7 g2:m7/f
  e2:m7.5- a2:7.9-
  d2:maj9 b2:min11
  e1:7
  e1:7.9-.13
  a1:9
  d1:6.9
  cis2:m7.5- fis2:7.9-
}

melody = %\transpose c' bes
\relative c'' {
  \global
  \mark 1
  cis2 cis~
  cis4 bis8 cis \tuplet 3/2 {bis4 gis a}
  b4. b8 fis2~
  fis2 r2 \break
  b2 b~
  b4 ais8 b \tuplet 3/2 {a4 fis g}
  a1~
  a2 r2 \break
  r4 f4 g2~
  g4 f \tuplet 3/2 { a4 fis g }
  a4. a8 e2~
  e4 f a c \break
  f4. f8 bes,2~
  bes2 b2
  e1
  r4 fis d e \bar "||" \break
  \mark 2
  cis2 cis2~
  cis4 bis8 cis \tuplet 3/2 {bis4 gis a}
  b4. b8 fis2~
  fis2 r2 \break
  b2 b~
  b4 ais8 b \tuplet 3/2 {a4 fis g}
  a1~
  a2 r2 \break
  r4 g a2~
  a4 fis \tuplet 3/2 { g4 bes cis}
  e4. d8 e2~
  e2 cis4 d \break
  f2 f2~
  f4 fis8 f \tuplet 3/2 {e4 b cis}
  d1
  R1 \bar "|."



}


% \book{
%   \bookOutputSuffix "_C"
%   \header {
%     instrument = \markup \with-color # red "Concert Instruments"
%   }
\score {
  <<
    \new ChordNames \chordNames
    \new Staff \with { instrumentName = "Tenor Sax " }  { \melody }
  >>
  \layout {
  }
}
%}
%
% \book {
%   \bookOutputSuffix "_Bb"
%   \header {
%     instrument = \markup \with-color # red {"B" \flat " Instruments"}
%   }
% \score {
%   <<
%     \new ChordNames \transpose bes c \chordNames
%     \new Staff  \transpose bes c' \melody
%   >>
%  }
% }
%
% \book {
%   \bookOutputSuffix "_Eb"
%   \header {
%     instrument = \markup \with-color # red {"E" \flat " Instruments"}
%   }
% \score {
%   <<
%     \new ChordNames \transpose ees c \chordNames
%     \new Staff \transpose ees c' \melody
%   >>
%   }
% }


