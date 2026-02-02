\version "2.25.28"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Transposed to A minor for singer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \include "AccordsJazzDefs.ily"
% \include "LilyJAZZ.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 10\mm
  #(layout-set-staff-size 20)
}

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
  title = "A Night in Tunisia"
  subsubtitle = \markup \center-column {
    \with-color #blue "Solo over AABA (Latin-Latin-Swing-Latin)."
    "Play the interlude between solos"
  }
  composer = "Dizzy Gillespie and Frank Paparelli"
  piece = ""
  tagline = ""
  copyright = \markup \small \italic {"Edited L.S. " \today}
}

global = {
  \time 4/4
  \tempo 4 = 138
  \key e \minor
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"Latin/Swing" c4 #"138"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %\compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
  %\compressMMRests
}

% Chords from Bflat Aebersold chart
chordNamesOrig = \chordmode {
  % Introduction
  s8
  \repeat percent 3 {
    f1:7
    e1:m6
  }

  % Latin - A section
  s8
  \repeat volta 2 {
    f1:7
    e1:m6
    f1:7
    e1:m6
    f1:7
    e1:m6
    fis2:dim b2:7.9+
  }
  \alternative {
    {e1:m}
    {e1:m}
  }

  % Swing - B Section
  b1:dim
  e1:7.9+
  a1*2:m
  a1:dim
  d1:7.9+
  g1:maj
  fis2:dim b2:7.9+

  % Latin - C Section
  f1:7
  e1:m6
  f1:7
  e1:m6
  f1:7
  e1:m6
  fis2:dim b2:7.9+
  e1:m

  % Interlude
  fis1*2:m
  f1*2:7.4+
  e1*2:m
  a1*2:7.4+
  d1:7.4+
  a1:m/d
  aes1*2:7.9+
  g1*4



}

%% from B flat sheet music
melodyOrig = \relative c' {
  \global
 % \jazzOn
  \override Score.BarNumber.color = #red
  \revert Score.BarNumber.stencil
  \clef bass
     \mark \markup{ \small \italic  \with-color #red "Bass Intro"}
    \partial 8
  c,8
  \repeat percent 3 {
    f,8 c' ees f~ f e4 b8
    e,8 g b cis~ cis b4 c8
  } \bar "||" \break
  \clef treble
 \mark \markup{ \small \italic  \with-color #red "Latin"}
  \partial 8 b'8
  \repeat volta2 {
    \tuplet 3/2 { c8 (es g } d'2) c8 (g
    ais b~ b4) r4 r8 b,
    ( \tuplet 3/2 { c8 ees g } d'8 d~ d4 ) c8 (g
    b2.) r8 b,8
    \tuplet 3/2 { c8 es g } d'2 c8 (g
    bes b~ b4) r2
    b8 ( c b8 a8 f4) ees8 e~
  }
  \alternative {
    { e4 r4 r4 r8 b8 }
    { e4\repeatTie r4 r4 r8 b'8 \bar "||" }
  }\break
\mark \markup {\small \italic  \with-color #red "Swing"}
  d4.\repeatTie b8~ b4. a8
  (aes4) f'8 (dis e d4) b8
  c8 a4 gis8~ gis4 b8 (gis
  a8 b fis4) r4 r8 \appoggiatura{b} c8~ \break
  c8 \appoggiatura{b} c4 r8 r4 a8 ( g8
  fis4) ees'8 (cis8 d8 c4) bes8
  b4. g8 (a8 g8 a8 g8)
  fis2. r8 b,8 \bar "||" \break
  \mark \markup {\small \italic  \with-color #red "Latin"}
  \tuplet 3/2 { c8 es g } d'2 c8 (g
  ais b~ b4) r4 r8 b,
  ( \tuplet 3/2 { c8 ees g } d'8 d~ d4 ) c8 (g
  b2.) r8 b,8
  \tuplet 3/2 { c8 es g } d'2 c8 (g
  bes b~ b4) r2
  b8 ( c b8 a8 f4) ees8 e~
  e4 r4 r8 b'4-> b8->~ \bar"||" \break
  \mark \markup {\small \italic  \with-color #red "Interlude"}
  b4 (a8 fis) b4 (a 8 fis)
  b8 (a fis b) r4 r8 b8->~
  (b4 a8 f) b4 (a8 f) b8 ( a f b) r4 r8 b8->~ \break
  b4 (g8 e8) b'4 (g8 e8)
  b'8 (g e b') r4 r8 b8->~
  (b4 g8 ees8) b'4 (g8 ees8)
  b'8 (g8 ees8 b') r4 r8 b8->~
  b4 (gis8 e) b'4 (gis8 e8)
  b'8 (g e b') r4 r8 b8->~
  b4 (fis8 ees8) b'4 (fis8 ees8)
  b'8 ( fis ees b') r4 b8-- (d8-._\markup"Fine") \bar"|."
  \compressMMRests{
    R1*4^\markup{\small \italic \with-color #red "Solo Break"}
  }
  \bar"||"
}

melody = \transpose c g { \melodyOrig }
chordNames = \transpose c g { \chordNamesOrig }

\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \transpose c bes \chordNames
      \new Staff \with { instrumentName = "C insts." } \transpose c' bes \melody
    >>
    \layoutScore
  }
}

% \book {
%   \bookOutputSuffix "Bass"
%   \score {
%     << \new ChordNames \chordNames
%        \new Staff \with { instrumentName = "Bass" } { \clef bass \transpose c bes, { \melody }}
%     >>
%     \layoutScore
%   }
% }

\book {
  \bookOutputSuffix "Bflat"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = \markup {\concat{ "B" \flat " Horns" }}} \melody
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \score {
    <<
      \new ChordNames \transpose b fis \chordNames
      \new Staff \with {
        instrumentName = \markup { \concat{ "E" \flat " Sax" }}
      } \transpose b fis \melody
    >>
    \layoutScore
  }
}

% \book {
%   \bookOutputSuffix "Fl"
%   \score {
%     <<
%       \new ChordNames \chordNames
%       \new Staff \with { instrumentName = "Flute" } \transpose c c' \melody
%     >>
%     \layoutScore
%   }
% }

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0
%}


%{
convert-ly (GNU LilyPond) 2.22.2  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}


%{
convert-ly (GNU LilyPond) 2.23.6  convert-ly: Processing `'...
Applying conversion: 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5, 2.23.6
%}


%{
convert-ly (GNU LilyPond) 2.23.8  convert-ly: Processing `'...
Applying conversion: 2.23.7, 2.23.8
%}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
