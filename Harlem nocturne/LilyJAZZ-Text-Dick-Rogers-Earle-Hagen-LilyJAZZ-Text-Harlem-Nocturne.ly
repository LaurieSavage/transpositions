\version "2.25.28"
%\include "LilyJAZZ.ily"
today = %\markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
#(strftime "%d-%m-%Y" (localtime (current-time)))
%}

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
     'length (ly:music-length note)))

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
  title = %\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")
  "Harlem Nocturne"
  %}
  subtitle = "(Transposed to D minor)"
  composer = %\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")
  "Dick Rogers & Earle Hagen "
  %}
  piece = %\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")
  ""
  %}
  tagline = %\markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
  "L. S., " %\markup { \today }
}

global = {
  \time 4/4
  \key bes \major
  \tempo "Ballad"
  %\accidentalStyle modern-cautionary

}

chordNames = \transpose g d {
  \chordmode {
   % \override ChordNames.ChordName.font-name = #"LilyJazz Text"
    % \jazzOn
    \global
    s2..
    g1*2:m7+
    c1*2:m6
    c1:m7+
    ees2:7 a4:7 d4:7
    g1:m6
    g1:m6
    g1:m6
    g1:m6
    g1:m6
    s2 f2:7

    bes2:7 f2:m7
    bes2:7 f2:m7
    bes2:7 f2:m7
    bes1:7
    ees2:7 bes2:7
    ees2:7 bes2:7
    s1
    s2 f2:7

    bes2:7 f2:m7
    bes2:7 f2:m7
    bes2:7 f2:m7
    bes1:7
    ees2:7 bes2:7
    ees2:7 bes2:7
    s1
    s1
    g1*2:m6

    g1*2:m7+
    c1*2:m7
    c1:m7+
    ees2:7 a4:7 d4:7
    g1*2:m6
  }
}

melody = \transpose g d' {
  \relative c'' {
    %\jazzOn
    \global
    \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
    \partial 2..
    g,8 d' g a4 bes8 fis~
    \repeat volta 2 {
      \mark \default
      fis1~
      fis8 g d bes g4 bes8  d~
      d c c2.~
      c8 c g' c d4 e8 b~
      b1~
      b8 c  \tuplet 3/2 {bes8 g ees} cis4 a'8 g~
    }
    \alternative{
      {
        g1\repeatTie
        ~g8 g,8 d' g a4 bes8 fis
      }
      {
        g1\repeatTie ~
        g1~
        g1~
        g4 r r r8 c8 \bar "||" \break
      }
    }
    \mark \default
    bes8 f g aes~ aes4. c8
    bes8 f g aes~ aes4. c8
    bes8 f g aes~ aes4 g8 f
    d8 f~ f2 r8 f' \break

    ees8 bes c des~ des4. f8
    ees8 bes c des~ des4. ees8
    f8^"No Chord" bes, ees aes, des ges, b e,
    a d, g c, f16 e ees des d f a c

    bes8 f g aes~ aes4. c8
    bes8 f g aes~ aes4. c8
    bes8 f g aes~ aes4 g8 f
    d8 f~ f2 r8 f' \break

    ees8 bes c des~ des4. f8
    ees8 bes c des~ des4. ees8
    f8^"No Chord" bes, ees aes, des ges, b e,
    a d, g c, f bes, ees aes,
    g1
    r8 g8 d' g a4 bes8 fis~ \bar "||"
    \mark \default
    fis1~
    fis8 g d bes g4 bes8  d~
    d c c2.~
    c8 c g' c d4 e8 b~
    b1~
    b8 c  \tuplet 3/2 {bes8 g ees} cis8 bes' a g~
    g1~
    g1 \bar "|."
  }
}

\bookpart {
  \header {
    instrument =\markup {
      "Concert"
    }
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

% \bookpart {
%   \header {
%     instrument =\markup {
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

\bookpart {
  \header {
    instrument =  "B flat instrument"
  }
  \score {

    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>
  }
}
