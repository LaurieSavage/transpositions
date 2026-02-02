\version "2.25.28"
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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Mahjong "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Wayne Shorter "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  copyright = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "Wayne Shorter, Ju-Ju, 1965" }
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key c \major
  %\tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global

  f1*4:m7
  f1*4:m7
  f1*4:m7
  des1*4:maj
  des1*4:maj
  d1:7.9+
  ees2:m7 aes2:7
  des1:maj
  des2:m7 ges2:9
  f1*4:m7
  f1*4:m7
}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \comp 16 \break
  \repeat volta 2{
    c'4 bes8 aes f ees c bes
    ees8 c g'4 f d
    d4. c8~c2
    R1 \break
    \comp 16 \break
    c'4 bes8 aes f ees c bes
    ees8 c g'4 f d
    ees4 bes8 c~c2
    R1  \break
    \comp 16 \break
    f,2 aes8 bes4 aes8
    c4 ees c aes
    bes4. ees16 des16 bes8 aes ees des
    ges4. ees8~ ees2
    c''4 bes8 aes f ees c bes
    ees8 c g'4 f d
    d4. c8~c2
    R1 \break
    \comp 16
  }
}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
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

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
}
