\version "2.24.4"

\include "LilyJAZZ.ily"
\include "AccordsJazzDefs.ily"

today = %\markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
#(strftime "%d-%m-%Y" (localtime (current-time))) }

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  #(define fonts
     (set-global-fonts
      #:roman "LilyJAZZ Text"
      #:sans "Nimbus Sans, Nimbus Sans L"
      #:typewriter "DejaVu Sans Mono"
      ; unnecessary if the staff size is default
      #:factor (/ staff-height pt 20)
      ))
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
  title = " Salaam"
  piece = "Fast swing"
  composer = "Bernie McGann "
  tagline = \markup { "L. S., " \today }
}


global = {
  \time 4/4
  \key d \minor
  \tempo 4 = 180

}


chordNames = \chordmode {
  % \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  %\global
  s1
  % c1*4:m
  %   f1*4:m
  %   aes1:7
  %   d2:m7.5- g2:7.9-
  %   c1*2:m
  c2:m a2:7
  d2:m7 g2:7
  c1:m
  g2:m7 c2/e
  f:m f:m/ees
  d:m7.5- g:7
  c:m c:m/bes
  a1:7
  d:m
  g:7.5-
  c:m
  g:7
  g:7
}

melody = \relative c'' {
  \jazzOn
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \global
  % R1*7 ^"Drums and walking bass intro"
  r4 a4_. c e8 (d)~
  \repeat volta 2
  {
    d4 a8 c~ c e d4
    r2 a8 c e c
    d4. a8 c4_. e8 d \break
    r4 r8 d8 f4 a8 g~
    g1~
    g4 r4 a,8 c e c
    d4. a8 c4_. e8 d \break
    r2 d8 f a f
    aes4 r4 r2
    r8 e8 g bes a e aes e
    g f d2.

  }
  \alternative
  {
    {r4 a4 c e8 d }
    {r1^"fine" \bar"|." }
  }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "B flat part"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' \melody
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
