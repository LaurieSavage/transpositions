\version "2.24.4"

\include "jazzchords.ily"
\include "lilyjazz.ily"

%%%\paper {
%%%  top-margin = 15\mm
%%%  left-margin = 20\mm
%%%  right-margin = 20\mm
%%%  bottom-margin = 10\mm
%%%  #(define fonts
%%%     (set-global-fonts
%%%      #:roman "lilyjazz Text"
%%%      #:sans "Nimbus Sans, Nimbus Sans L"
%%%      #:typewriter "DejaVu Sans Mono"
%%%      ; unnecessary if the staff size is default
%%%      #:factor (/ staff-height pt 20)
%%%      ))
%%%}

%%%layoutScore = \layout {
%%%  indent = 15\mm
%%%}

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = "You don't know what love is"
  composer = "Don Raye/ Gene De Paul"
  piece = "Ballad"
  tagline = \markup {"Edited Laurie Savage, " \today }
  copyright = "Queens of the West"
}

global = {
  \time 4/4
  \key f \minor
  \tempo 4 = 80
}

chordNames = \chordmode {
  \global
  \partial 8
  s8
  %%% A section
  \repeat volta 2 {
    f1:m7
    des2:9 c2:7.9-
    f2:m c2:7.9-
    des1:7
    g2:m7.5- c2:7.9-
    f2:m6 aes2:7
  }
  \alternative {
    {
      des1:7
      g2:m7.5- c2:7.9-
    }
    {
      % Second time bar
      des2:7 c2:7.9-
      f1:m6
  }}

  %%% Bridge
  bes2:m7 ees2:7
  aes1:maj7
  bes2:m7 ees2:sus4.7
  aes1:maj7
  d2:m7 g2:7
  c1:maj7
  des1:9.11+
  c1:7.9-

  %%% Reprise
  f1:m7
  des2:9 c2:7.9-
  f2:m c2:7.9-
  des1:7
  g2:m7.5- c2:7.9-
  f2:m6 aes2:7
  des2:7 c2:7.9-
  f1:m6

}

melody = \relative c'' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %%% A section
  \partial 8
  \mark \default
  c,8
  \repeat volta 2 {
    g'4 g~ g4. g8
    aes4 aes~ aes4. g8
    f8 g aes bes c bes aes g
    f2~f4. f8 \break
    g8 aes bes c des c ees des
    c2~ c4. c8
  }
  \alternative {
    {
      bes4 bes~ bes4. aes8
      g4 g4~ g4. c,8 \break
    }
    {
      bes'4 bes4~ bes4 aes4
      f8 f~ f4~ f4 ees \bar "||"
    }
  }

  %%% Bridge
  \mark \default
  ees'4 ees~ ees des8 ees
  c8 c4 c8~c4. c8
  f,4. g8 aes8 bes4 c8~
  c8 ees4.~ ees4 ees8 ees \break
  e4. e8 e8 d4 g,8~
  g1
  g4. g8 g4 g4
  aes4 g4~ g4. c,8 \bar "||" \break

  %%% A section
  \mark 1
  g'4 g~ g4. g8
  aes4 aes~ aes4. g8
  f8 g aes bes c bes aes g
  f2~f4. f8 \break
  g8 aes bes c des c ees des
  c2. c4
  bes8 bes4.~ bes4 aes4
  f8 f4.~ f2 \bar "|."
}

verse = \lyricmode {
  %\set stanza = "1. "
  You don't know what love is
  Un -- til you've learned the mean -- ing of the blues
  Un -- til you've loved a love you had to loose
  You don't know what love is

  You don't know how lips hurt
  Un -- til you've kissed and had to pay the cost
  Un -- til you've flipped you're heart and you have lost
  You don't know what love is

  Do you know how a lost heart fears
  The thought of rem -- i -- nisc -- ing
  And how lips have taste of tears
  Loose the taste for kiss -- ing

  You don't know how hearts burn
  For love that can -- not live, yet nev -- er dies
  Un -- til you've faced each dawn with sleep -- less eyes
  You don't know what love is
}

%chordNames = \transpose f fis { \chordNamesF }
%melody = \transpose f fis { \melodyF }

\book {
  \bookOutputSuffix "Voice"
  \header {
    instrument = "Female Vocal"
  }
  \score {
    <<
      \new ChordNames \unfoldRepeats \chordNames
      \new Staff { \unfoldRepeats \melody }
      \addlyrics \verse
    >>
    %%\layoutScore
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
    %\layoutScore
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
   % %\layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = \markup{ "E"\flat " Sax" }} \transpose ees c' \melody
    >>
    %\layoutScore
  }
}

\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Flute" } \transpose c c' \melody
    >>
    %\layoutScore
  }
}

%{
\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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

\bookpart {
  \header {
    instrument = "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
%}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
