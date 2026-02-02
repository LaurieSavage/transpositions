\version "2.24.4"

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"



\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  %top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  %bottom-margin = 10\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  ragged-right = ##f
}

lo = \layout {
  %\override Score.Clef.break-visibility = #'#(#f #f #f)
  %\override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
  %\override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
}

title = #"Jersey Bounce"
composer = #"-Benny Goodman Orchestra"
meter = #" (Med. Bounce)"

soloists = \markup {
  \column {
    \line {  \bold \underline Soloists}
    \line { Trumpet - 1 chorus }
    \line { Sax - 1 chorus }
    \line { Guitar - 2 choruses }
  }
}


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

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = \realBookTitle
  tagline = \markup{ "Paradiso Connection - edited by L.S. " \today }
}

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

global = {
  \time 4/4
  \key f \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  s8
  f1*2:6
  g1*2:7
  g1:m7
  c1:9
  f2:6 aes2:dim
  g2:min7 c2:13

  f2:6 des2:9
  f1:6

  f1*2:13
  ees1*2:13
  des1*2:13
  c1:7
  c1:7.5+

  f1*2:6
  g1*2:7
  g1:m7
  c1:9
  f2:6 des2:9
  f1:6


}

intro = \relative c'' {
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
  \global
  \mark \markup { "Rhythm section intro" }
  %   \repeat unfold 7 {\comp 4}
  R1*7
  \bar "||"
}

melody = \relative c'' {
  \global
  r2 r4 r8 gis8
  \showStartRepeatBar \bar "[|:-|"
  \repeat "volta" 2 {
    \mark \default
    a8 c e4-. g4 f8 a,8~
    a2. r8 bes8
    b8 d f4-. a g8 d~
    d2. r8 a \break
    bes8 d e4-. a g8 d~
    d2.r8 gis,8
  }
  \alternative {
    {
      a8 c e g r8 f r8 a,
      bes8 d e a~ a4 r8 gis, \bar ":|]"
    }
    {
      a8 c d f ees4 des8 f8~
      f1 \bar "||"
    }
  }

  \break
  \mark \default
  %d4-.r8 d8~ d2
  R1
  d8 c g' d~ d2
  %c4-. r8 c8~ c2
  R1
  c8 bes f' c~ c2 \break
  %bes4-. r8 bes8~ bes2
  R1
  bes4 aes ees' des8 c~
  c2 r2 %r8 c8 c c
  r2 r4.%b8 c~ c2 r8
  gis8
  \break
  \mark \default
  a8 c e4-. g f8 a,~
  a2. r8 bes8
  b8 d f4-. a g8 d~
  d2. r8 a8 \break
  bes8 d e4-. a g8 d~ %\mark \markup { \with-color #red \musicglyph "scripts.coda" } %\coda
  \bar "||"
  d2. r8 gis,8
  a8 c d f ees4 des8 f~
  f1 \bar "|."
  \pageBreak
}

Solos = \relative c'' {
  %\showStartRepeatBar \bar "[|:-|"
  \global
  \mark \markup "Solos"
  a'8--_"Stabs at the start of each solo" r8 r4 gis8-- r8 r4
  a8-- r r4 a8-- r r a--
  \repeat unfold 2 {\comp 4} \break
  \repeat unfold 4 {\comp 4} \break
  \repeat unfold 4 {\comp 4} \break
  \repeat unfold 4 {\comp 4} \bar "||" \break
  \repeat unfold 4 {\comp 4} \break
  \repeat unfold 4 {\comp 4} \bar "||" \break
  \repeat unfold 4 {\comp 4} \break
  \repeat unfold 4 {\comp 4} \bar "||" \break
}

SoloChords = \chordmode {
  f1*2:6.9
  g1*2:7
  g1:m7
  c1:7
  f2:maj7 aes2:dim7
  g2:m7 c2:7

  f1*2:6.9
  g1*2:7
  g1:m7
  c1:7
  f2:maj7 des2:7
  f1:6.9

  g1*2:7
  ees1*2:7
  des1*2:7
  c1*2:7

  f1*2:6.9
  g1*2:7
  g1:m7
  c1:7
  f2:maj7 des2:7
  f1:6.9
}

% gtrRiff = \relative c' {
%   \global
%   d8_\markup {Behind 2nd chorus guitar solo bars 1 - 16 and 25 - 32} f~ f2 r4
%   d8 f4. d8 f4.
%   a4 r r2
%   R1
%   d,8 f~ f2 r4
%   d8 f4. d8 f4.
%   f4 r r2
%   R1
% }

LastRiff = \relative c'' {
  \global
  \section
  \sectionLabel "Riff under guitar"
  d8_\markup {Behind 2nd chorus guitar solo bars 1 - 16 and 25 - 32} f~ f2 r4
  d8 f4. d8 f4.
  a4 r r2
  R1
  d,8 f~ f2 r4
  d8 f4. d8 f4.
  f4 r r2
  R1
  \break
  \section
  \sectionLabel "A section riff after all solos"
  \repeat volta 2 {
    c4 %\mark \markup {\with-color #red "After all solos"}
    bes8 g a c bes g
    a c bes g a c a bes
    b4. g8-. r2
    r2 r4 c16 d c a
    bes4. g8-. r2
    r2 r4 bes16 c bes g
    a4. f8-. r2
    R1_"Straight to next page [D]" % ^\markup {\with-color #red "D.S. al Coda"}
  }
  \pageBreak
}

Coda = \relative c'' {
  \global
  \section
  \mark 4
  %d4-. r8 d8~ d2
  R1
  d8 c g' d~ d2
  %c4-. r8 c8~ c2
  R1
  c8 bes f' c~ c2 \break
  %bes4-. r8 bes8~ bes2
  R1
  bes4 aes ees' des8 c~
  c2 r2 %r8 c8 c c
  r2 r4. %b8 c~ c2 r8
  gis8
  \break
  \section
  %  \sectionLabel "Coda"
  \mark 5
  a8 c e4-. g f8 a,~
  a2. r8 bes8
  b8 d f4-. a g8 d~
  d2. r8 a8 \break
  bes8 d e4-. a g8 d~
  %\mark \markup { \with-color #red \musicglyph "scripts.coda"} %\coda
  d2. r8 gis,8
  a8 c e g r8 f r8 a,
  bes8 d e a~ a4 r8 gis,

  a8 c e4-. g4 f8 a,8~
  a2. r8 a8
  b8 d f4-. a g8 d

  r2 r4 r8 a8
  bes8 d f4-. a g8 d

  r2 r4 r8 gis,8
  a8 c d f ees4 des8 f8
  r2 r4 r8 gis,8
  a8 c d f ees4 des8 f8
  r2 r4 r8 gis,8
  a8 c d f ees4 des8 <d g>8~_\markup{ \with-color #red "Tenor plays lower note" }
  <d g>2~ <d g>4 r4^"Fine" \bar "|."
}

\book {
  \bookOutputSuffix "BFlat"
  \header {
    instrument = "Tenor Sax/Trumpet"
  }

  \score {
    \lo
    <<
      \new Voice \transpose bes c' { \intro}
    >>
  }

  \score {
    \lo
    <<
      %\new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
    >>
  }

  \score {
    \lo
    <<
      \new ChordNames \transpose bes c \SoloChords
      \new Voice = Solos \transpose bes c' \Solos
      %\new Voice = GtrRiff \transpose bes c'' \gtrRiff
    >>
  }

  \score {
    \lo
    <<
      \new Voice = RiffOut \transpose bes c'
      \LastRiff
    >>
  }

  \score {
    \lo
    <<
      \new Voice = Coda \transpose bes c' \Coda
    >>
  }
  \soloists
}

\book {
  \bookOutputSuffix "Concert"
  \header {
    instrument = "Concert Instruments"
  }

  \score {
    \lo
    <<
      \new Voice  { \intro}
    >>
  }

  \score {
    \lo
    <<
      %\new ChordNames \transpose bes c \chordNames
      \new Staff   \melody
    >>
  }

  \score {
    \lo
    <<
      \new ChordNames \transpose bes c \SoloChords
      \new Voice = Solos  \Solos
      %\new Voice = GtrRiff \gtrRiff
    >>
  }

  \score {
    \lo
    <<
      \new Voice = RiffOut
      \LastRiff
    >>
  }

  \score {
    \lo
    <<
      \new Voice = Coda  \Coda
    >>
  }
  \soloists
}


% \bookpart {
%   \header {
%     instrument = \markup{"E" \flat "Instruments"}
%   }
%   \score {
%     <<
%       \new ChordNames \transpose ees c \chordNames
%       \new Staff \transpose ees c \melody
%     >>
%
%
%     \layout { }
%     %  \midi { }
%   }
% }




%{
convert-ly (GNU LilyPond) 2.25.11  convert-ly: Processing `'...
Applying conversion: 2.25.0, 2.25.1, 2.25.3, 2.25.4, 2.25.5, 2.25.6,
2.25.8, 2.25.9, 2.25.11
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.25.12
%}
