\version "2.24.4"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }


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
  title =  " Salaam"
  composer =  "Bernie McGann "
  subtitle  ="(Up tempo bebop blues)"
  tagline = "Salaam"
}


global = {
  \time 2/2
  %\key a \minor
  % \tempo = 180

}


chordNames = \chordmode {
  % \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  % \jazzOn
  %\global
  s1
  c1*4:m
  f1*4:m
  aes1:7
  d2:m7.5- g2:7.9-
  c1*2:m
  % c2:m a2:7
  % d2:m7 g2:7
  % c1:m
  % g2:m7 c2/e
  % f:m f:m/ees
  % d:m7.5- g:7
  % c:m c:m/bes
  % a1:7
  % d:m
  % g:7.5-
  % c:m
  % g:7
  % g:7
}

% This is the transposed tenor part written for Bb sax
besmelody = \relative c'' {
  % \jazzOn
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \global
  % R1*7 ^"Drums and walking bass intro"
  r4 a4_. c e8 (d)~
  \repeat volta 2
  {
    d4 a8 c~ c e d4
    r2 a8 c e c
    d4. a8 c4_. e8 d
    r4 r8 d8 f4 a8 g~ \break
    g1~
    g4 r4 a,8 c e c
    d4. a8 c4_. e8 d
    r2 d8 f a f \break
    aes4 r4 r2
    r8 e8 g bes a e aes e
    g f d2.

  }
  \alternative{{r4 a4 c e8 d }{r1^"fine" \bar"|." }}
}

comping = \relative c'' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
 % \mark \markup {\text \italic {\box "1 bar Pickup"}}
  \set Score.currentBarNumber = #0
  \partial 1
  \new CueVoice {\stemUp{r4^"Horn" g4_. bes d8 (c)~ }}
  \repeat volta 2 {
    \new CueVoice {\stemUp {c4\repeatTie }}  s2.
    s1*3 \break
    s1*4 \break
    s1*4 \break
  }
}


%\bookpart {
%{ \header {
    piece =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "Concert"
%}

\bookpart {
  % \header {
%     instrument = "Bop Blues"
%   }
  \score {
    <<
      \new ChordNames  \chordNames
    \new Staff  \comping
    >>
  }
}

\score {
  \header {
    piece = \markup {\text{ \box "Concert instrument"}}
  }
  <<
    \new ChordNames  \chordNames
    \new Staff \transpose  c bes, { \besmelody }
  >>
  \layout { }
  \midi { }
}
%}

%\bookpart {

\score {
  \header {
    piece = \markup {\text{ \box "E flat instrument"}}
  }

  <<
    \new ChordNames \transpose ees c \chordNames
    \new Staff \transpose ees bes, { \besmelody }
  >>

}
%}

%\bookpart {

\score {
  \header {
    piece = \markup {\text{ \box "B flat instrument"}}
  }

  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff { \besmelody }
  >>

}
%}
