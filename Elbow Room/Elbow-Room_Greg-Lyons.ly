\version "2.25.28"

%#(set-global-staff-size 17)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

\paper {
  #(set-paper-size "a4")
  %indent = 0\mm
  top-margin = 10\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 15\mm
  %bottom-margin = 20\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Elbow Room"
composer = #"Greg Lyons"
meter = #" (New Orleans funk groove)"

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
  tagline = \markup { "Paradiso Connection - Edited by L.S. " \today }
}


global = {
  \time 4/4
  \key f \major
  \tempo 4=84
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle modern-cautionary
  %\jazzOn
}

chordNames = \chordmode {
  \global
  %% Intro 1
  s1*4
  %% Intro 2
  f1*19:7
  des4:/ees
  r2.
  b4:/cis
  r2.
  bes4:/c
  r2.
  f1*4:7
}

melody = \relative c'' {
  \global
  \clef treble
  %% Intro 1
  \tweak X-offset #-10 \mark \markup { "Drums and bass" }
  \inlineMMR R1*4
  % Intro 2
  \repeat volta 2 {
    r1^"Full rhythm section"
    R1
    R1
  }
  \alternative {{R1}{R1}} \break
  \repeat volta 2 {
    %r8 e8-^ d16 ces a e ges a c a-^ r8 f,8~
    r8^"Horns and Gtr"_"Rhythm Break" c8-^ bes16 aes f c ees f aes f-^ r8 f,8~
    f1
    R1
    R1
    %ges'8 f16 e16 f16 f16 a16 ces,-^ r16 f8.~ f4~
    ees'8 d16 c d d f aes-^ r16 d,8.~ d4~
    d1
    R1
    R1
    r16 c f bes aes ees bes f aes bes c bes r8 < cis fis>8~
    <cis fis>8 <b e>16 <ais d>16 <b e>16 <ais d>16 r16 b c ees f aes r8 f8~
    f1
    R1
  }
  \alternative {
    { R1 R1}
    { r4 r16 ees aes des c aes ees c f bes8. }
  }
  r4 r16 f ges aes bes ges ees aes~ aes4
  r4 r16 c, d f bes c a bes g ees r8
  c16 d f aes~ aes8 f16 ees f f ees c aes8-. f~
  f1^"Whole band"
  R1
  R1
  r2
  c'16^"Unison during solos" c d8 f f'-^ \bar "|."


}

bassLine = \relative c {
  \global
  \clef bass
  %% Intro 1
  \tweak X-offset #-10 \mark \markup { "Drums and bass" }
  r8 f8 r16 f8. f8. f16 r8 f8
  r8 f8 r16 f8. f8. f16 r8 f8
  r8 f8 r16 f8. f8. f16 r8 f8
  r8 f8 r16 f8. f8. f16 r8 f8~ \break
  %% Intro 2
  \repeat volta 2 {
    \mark 1 f8. f16 a,8. a16 g8. c16 r8 f,8~
    f16 f'8 f16 a,8. a16 bes8 c8 d8 f8~
    f8. f16 a,8. a16 g8. c16 r8 f,8~
  }
  \alternative {
    { f16 f'8 f16 a,8. a16 bes8 c8 d8 f8}
    { f,16\repeatTie f'8 f16 a,8. a16 bes8_"2nd time break" c8 d8 f8 }
  }

  % Head
  \repeat volta 2 {
    \mark 2 r2^"Break" r4 r8 f,8~
    f16 f'8 f16 a,8. a16 bes8 c8 d8 f8~
    f8. f16 a,8. a16 g8. c16 r8 f,8~
    f16 f'8 f16 a,8. a16 bes8 c8 d8 f8~
    f8. f16 a,8. a16 g8. c16 r8 f,8~
    f16 f'8 f16 a,8. a16 bes8 c8 d8 f8~
    f8. f16 a,8. a16 g8. c16 r8 f,8~
    f16 f'8 f16 a,8. a16 bes8 c8 d8 f8~
    f8. f16 a,8. a16 g8. c16 r8 f,8~
    f16 f'8 f16 a,8. a16 bes8 c8 d8 f8~
    f8. f16 a,8. a16 g8. c16 r8 f,8~
    f16 f'8 f16 a,8. a16 bes8 c8 d8 f8~
  }
  \alternative {
    {
      f8. f16 a,8. a16 g8. c16 r8 f,8~
      f16 f'8 f16 a,8. a16 bes8 c8 d8 f8
    }
    { \mark 3 ees16 ees8 ees16 r4^"Break" r2 }
  }
  des16 des8 des16 r4^"Break" r2
  c16 c8 c16 r4^"Break" r2
  r2 r4 r8 f8~
  f8. f16 a,8. a16 g8. c16 r8 f,8~
  f16 f'8 f16 a,8. a16 bes8 c8 d8 f8
  f8. f16 a,8. a16 g8. c16 r8 f,8~
  f16 f'8 f16 a,8. a16 bes8 c8 d8 f8 \bar "|."
}

\book {
  \bookOutputSuffix "Score"
  \header {
    instrument = "Conductor"
  }
  \paper {
    #(set-paper-size "a4" 'landscape)
    top-margin = 15\mm
    left-margin = 25\mm
    right-margin = 20\mm
    bottom-margin = 15\mm
    %bottom-margin = 20\mm

    between-system-space = 2.5\cm
    between-system-padding = #0
    %%set to ##t if your score is less than one page:
    ragged-last-bottom = ##f
    ragged-bottom = ##f
    markup-system-spacing = #'((basic-distance . 23)
                               (minimum-distance . 8)
                               (padding . 1))
  }
  \score {
    \new ChoirStaff <<
      \new ChordNames \chordNames
      \new Staff \with {
        instrumentName = "Horns + Gtr"
        shortInstrumentName = "Horns/gtr"
      } \melody
      \new Staff \with {
        instrumentName = "Bass"
        shortInstrumentName = "Bass"
      }\bassLine
    >>
    \layout {
      %#(layout-set-staff-size 14)
      indent = 15\mm
    }
    % \midi{}
  }
}
\book{
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "C instruments"} { \melody }
    >>
    \layout {
      indent = 15 \mm
    }
  }
}

\book {
  \bookOutputSuffix "Tpt"
  \header {
    instrument = "Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' \melody
    >>
    \layout {
      indent = 15\mm
    }
  }

}

\book {
  \bookOutputSuffix "TenorSax"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = "Tenor Sax" }  \transpose bes c'' \melody
    >>
    \layout {
      indent = 15\mm
    }
  }
}

\book {
  \bookOutputSuffix "Bass"
  \header {
    instrument = "Bass"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \bassLine
    >>
    \layout {
      indent = 15\mm
    }
  }
}

%{
\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument = \markup \with-color # red {"E" \flat " Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>
  }
}
%}

%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
