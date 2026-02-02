\version "2.24.4"
\include "LilyJAZZ.ily"
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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Agua de Beber"}
  subtitle = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Bflat chart"}
  composer = \markup {\override #'(font-name . "LilyJAZZ Text")"Jobim / Gimbel / de Moraes"}
  meter = \markup{\override #'(font-name . "LilyJAZZ Text")"Medium Bossa"}
  tagline = \markup{\override #'(font-name . "LilyJAZZ Text")"Paradiso Connection"}
  copyright = \markup {\override #'(font-name . "LilyJAZZ Text"){"Edited by LS, " \today}}
}

global = {
  \jazzOn
  \time 4/4
  \key b \minor
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle modern-cautionary
}

chordNames = \chordmode {
  \global
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  %Intro
  b1:m7
  cis2:7.9+ fis2:7.5+
  b1:m7
  cis2:7.9+ fis2:7.5+
  b1:m7
  g1:maj
  b1:m7
  fis1:m7.5-
  b1:m7
  %A


}

melody = \relative c'' {
  \global
  %Intro
  \repeat volta 2{
    d8^\markup \box {"Intro"} b a b r4 r8 d
    eis16 (fis eis8) e8 f e4 d
    d8 b a b r4 r8 d
    eis16 (fis eis8) e8 f e4 d
    d8 b a b r2
    b8 a b2.
    b8 a b2.
  }
  \alternative{
    {b8 a b2.}
    {r4 b8 d~ d fis4 eis8~ \bar "||" \break}
  }
  eis4.\mark 1 fis8~ fis4. d8~
  d2~ d8 b4 d8~
  d8 b4. b2
  r4 b8 d~ d fis4 a8~
  a2~ a8 b4 fis8~
  fis2 fis8 e4 fis8~
  fis1


}


% \book{
%   \bookOutputSuffix "_C"
%   \header {
%     instrument = \markup \with-color # red "Concert Instruments"
%   }
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {
    #(layout-set-staff-size 22)
  }
 }
% }
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




%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}


%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
