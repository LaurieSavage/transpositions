\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

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
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Morning"
composer = #"- Clare Fisher"
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
  %subtitle = "Female vocal"
  tagline = \markup { "Paradiso Connection - edited by L.S. " \today }
}

%{
\header {
  title = "Morning"
  subtitle = "Female vocal"
  composer ="Clare Fisher"
  piece = "Bossa"
  tagline = \markup { "Edited Laurie Savage, " \today }
}
%}

rm={\mark \default}

global = {
  \time 4/4
  \key bes \minor

}

chordNames = \transpose c d {
  \chordmode {

    %Introduction
    \repeat volta 2 {
      c2:m7.5- f:7.5+ bes:m7 ees:7
      c2:m7.5- f:7.5+ bes:m7 ees:7
      ees:m5 aes:7 des:maj7 ges:maj7
      c2:m7.5- f:7.5+
    }
    \alternative {{bes:m7 ees:7}{bes:m7 ees:7}}

    % Section A
    \repeat volta 2{
      c2:m7.5- f:7.5+ bes:m7 ees:7
      c2:m7.5- f:7.5+ bes:m7 ees:7
      ees:m5 aes:7 des:maj7 ges:maj7
      c2:m7.5- f:7.5+
    }
    \alternative {{bes:m7 ees:7}{bes:m7 ees:7}}

    %Section B
    ees1:m7 aes:7 des2:maj7 ges2:maj7 f:m5 bes:7.9+
    ees1:m7 aes:7 b:7 bes:7/f

    %Section A Reprise
    c2:m7.5- f:7.5+ bes:m7 ees:7
    c2:m7.5- f:7.5+ bes:m7 ees:7
    ees:m5 aes:7 des:maj7 ges:maj7
    c2:m7.5- f:7.5+
    bes:m7 ees:7
  }
}

melody = \transpose c d {
  \relative c' {

    \global
    \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
    \repeat volta 2 {

      \mark \markup {\box "Rhythm Intro"} r1 r r r \break
      r r r
    }
    \alternative{{r1 \bar ":|]" \break }{r2 r8 f c' des }}
    \rm
    \repeat volta 2{
      \bar "[|:"
      ees f~ f2.~f2 r8 f, c' des ees4 f8 aes~aes f4.~f2 r8 f, c' f
      ees2 r8 f8 f, aes c2 r8 des8 c des ees2 r8 des4 bes8~
    }
    \alternative{{bes2 r8 f c' des \bar ":|]" }{bes1\repeatTie }}
    \break
    \rm
    \bar "||"
    bes4-^ bes r8 bes4-^ bes8~ bes4. c8 \times 2/3 {f16 ges f} ees8 des c
    bes4-^ bes r8 bes4-^ bes8~ bes4. c8 \times 2/3 {f16 ges f} ees8 des c
    bes4-^ bes r8 bes4-^ bes8~ bes4. c8 des ees f ges aes2 r8 ges4 f8~ f2 r8 f, c' des
    \bar "||" \break

    \mark \markup{\box "A"}
    ees f~ f2.~f2 r8 f, c' des ees4 f8 aes~aes f4.~f2 r8 f, c' f
    ees2 r8 f8 f, aes c2 r8 des8 c des ees2 r8 des4 bes8~ bes1 \bar "|."

  }
}


\book {
  \bookOutputSuffix "C"
  \header {
    instrument =  "Concert"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout {
      indent = 10
    }
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
      \new Staff \transpose ees c { \melody }
    >>
    \layout {
      indent = 10
    }
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
    \layout {
      indent = 10
    }
  }
}

%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
