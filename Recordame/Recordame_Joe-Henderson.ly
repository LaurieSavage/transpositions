\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

% \paper {
%   top-margin = 15\mm
%   left-margin = 20\mm
%   right-margin = 20\mm
%   bottom-margin = 10\mm
%   #(define fonts
%      (set-global-fonts
%       #:roman "LilyJAZZ Text"
%       #:sans "Nimbus Sans, Nimbus Sans L"
%       #:typewriter "DejaVu Sans Mono"
%       ; unnecessary if the staff size is default
%       #:factor (/ staff-height pt 20)
%       ))
% }
%
%  \header {
%    title ="Recordame"
%    composer ="Joe Henderson"
%    piece = "Bossa"
%    tagline = \markup { "Edited Laurie Savage," \today }
%  }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 10\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 28)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Recordame"
composer = #"- Joe Henderson"
meter = #" (Bossa)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  tagline = ##f
}




global = {
  \time 4/4
  \key c \major
  \tempo 4 = 140

}

chordNames = \chordmode {

  \global
s1
a1*4:m
c1*3:m c2:m7 f:7
bes1:maj7 bes2:m7 ees2:7
aes1:maj7
aes2:m7 des:7 ges1:maj7
g2:m7 c:7 f2.:maj7 e4:7.9+
e1:7.9+
e1:7.9+

}

melody = \relative c'' {

  \global
    r4 r8 e, b' c e, c
  \repeat volta 2{  \bar "[|:"  fis2 r8 g a b
    b4 a8 b~ b c e, c
    fis g4 a8~ a8 b4 b8
    \break

    r8 a b a d ees g, ees
    a2 r8 bes c d
    d4 c8 d~ d ees g, ees
    a8 bes4 c8~ c8 d4 d8 \break

    r4 r8 c d4 c8 f,~ \bar "||"
    f1
    r8 e f c' (c4) bes8 ees,~
    ees2~ ees8 d ees bes'~ \break
    bes2 aes4 f8 des~ des1

    r4 a'4~ a4 g4
    c,4. c8~ c c g'4~

  }\alternative{{g4. e8 b' c e, c \bar ":|]" }{ g'1\repeatTie \bar "|."}}
}

chordsFem = \transpose c g { \chordNames }
melodyFem = \transpose c g { \melody }

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert instrument"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
  }
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
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
}

\book {
  \bookOutputSuffix "FVcl"
  \header {
    subtitle = "Female Vocal Key"
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordsFem
      \new Staff { \melodyFem }
    >>
    \layout {}
  }
}

\book {
  \bookOutputSuffix "FVcl_Bflat"
  \header {
    subtitle = "Female Vocal Key"
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordsFem
      \new Staff \transpose bes c'  { \melodyFem }
    >>
    \layout {}
  }
}

\book {
  \bookOutputSuffix "FVcl_Eflat"
  \header {
    subtitle = "Female Vocal Key"
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordsFem
      \new Staff \transpose ees c  { \melodyFem }
    >>
    \layout {}
  }
}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
