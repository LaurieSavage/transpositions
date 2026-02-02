\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "TabA.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
               'length (ly:music-length note)))

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

% \paper {
%   #(set-paper-size "a4")
%   indent = 0\mm
%   top-margin = 15\mm
%   left-margin = 20\mm
%   right-margin = 20\mm
%   bottom-margin = 10\mm
%   bottom-margin = 10\mm
%
%   between-system-space = 2.5\cm
%   between-system-padding = #0
%   %%set to ##t if your score is less than one page:
%   ragged-last-bottom = ##t
%   ragged-bottom = ##t
%   markup-system-spacing = #'((basic-distance . 28)
%                              (minimum-distance . 8)
%                              (padding . 1))
% }

\header {
  title = "The Jody Grind"
  composer = "Horace Silver"
  meter = " (Funky Blues)"
  tagline = ##f
}
% realBookTitle = \markup {
%   \score {
%     {
%       \override TextScript.extra-offset = #'(0 . -4.5)
%       s4
%       s^\markup {
%         \fill-line {
%           \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
%           \fontsize #8
%           \override #'(offset . 7)
%           \override #'(thickness . 6)
%           \underline \larger \larger #title
%           \fontsize #1 \lower #1 \concat { #composer " " }
%         }
%       }
%       s
%     }
%     \layout {
%       \omit Staff.Clef
%       \omit Staff.TimeSignature
%       \omit Staff.KeySignature
%       ragged-right = ##f
%     }
%   }
% }
%
% \header {
%   title = \realBookTitle


global = {
  \time 4/4
  \key bes \dorian
  % \tempo
  \accidentalStyle modern-cautionary
}

chordNames = \chordmode {
  % \override ChordNames . ChordName #'font-name = #"LilyJazz Text"
  %\jazzOn
  \global
  s4
  bes1*4:min
  ees1*2:7
  bes1*2:min
  a1:sus4.7
  b1:sus4.7
  bes1*2:min
}

melody = \relative c'' {
  %\jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4
  s8 \acciaccatura fis,8
  g8~
  \repeat volta 2 {
    g8 bes~ bes g bes4 des
    r2 r4 r8 bes8
    des8 bes c g bes4 r4
    r2 r4 r8 bes8 \break
    ees8 des ees f des bes r4
    r2 r4 r8 bes8
    \tuplet 3/2 {des8 bes f} ees8 des8~ des4 r4
    R1 \break
    r8 fis'8 b, cis g b fis e
    a8 aes' ees des~ des4 r4
    r4 \acciaccatura f8 bes2 r8 bes,8 \break
  }
  \alternative{
    {e16 ees des8 bes aes bes-^ r8 r8 \acciaccatura fis g8}
    {e'16 ees des8 bes aes bes-^ r8 r4 \bar "|."}
  }
}


\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
    \midi { }
  }
  \markup { \fontsize #2 "Real Book, 5th Edition"}
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
  \markup { \fontsize #2 "Real Book, 5th Edition"}
}

\book {
  \bookOutputSuffix "Bflat"
  \tabA
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
  \markup { \fontsize #2 "Real Book, 5th Edition"}
}

%{
convert-ly (GNU LilyPond) 2.25.11  convert-ly: Processing `'...
Applying conversion: 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4,
2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.25.12
%}
