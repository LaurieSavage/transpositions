\version "2.25.28"

#(set-global-staff-size 19)
\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

performanceNote = \markup {
  \column {
    \line { \bold \underline Notes }
    \line { Form: AAB AA...AA solos, singer returns to B AA B Coda }
    \line { Intro played freely by flute, sax or trumpet }
    \line { Solos played over the A section - 32 bars }
    \line { Trumpet/Flugel backs the singer on the last section }
  }
}

% \header {
%   title = "Antonio's Song"
%   composer = "Michael Franks"
%   tagline = \markup{ "Paradiso Connection - Edited L.S. " \today }
%   copyright = ""
% }

global = {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"" c4 #""
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 10\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 10\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Antonio's Song"
composer = #"Michael Franks"
meter = #" (Light Bossa)"

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

introChordNames = \transpose a g {
  \chordmode {
    %% Intro
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
  }
}

chordNames = \transpose a g {
  \chordmode {
    % A
    \repeat volta 2 {
      a1:m7
      d1:m7
      a1:m7
      a1:7
      d1:m7
      a1:m7
      b1:m7.5-
    }
    \alternative {
      {
        e1:7
      }
      {
        e1:7
      }
    }

    % B
    a1:m7
    a1:7
    d1*2:m7
    b1:m7.5-
    e1:7
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    a1:7
    d1*2:m7
    b1:m7.5-
    e1:7
    a1:m7
    b2:m7.5- e2:7
  }
}

chordsIntro = \chordmode {
  a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
    a1:m7
    b2:m7.5- e2:7
}

restIntro = \transpose a g'' {
  \relative c {
    \global
    \mark \markup{\box{"Flute/Sax Intro"}}
    R1*7
    r2 r4 r8 g8 \bar "||"
  }
}

woodwindIntro =  \transpose a g {
  \relative c' {
    \global
    \revert Score.BarNumber.stencil
    %{ R1^"Flute + Rhythm" R1*3 \break
    R1*3 r2 r4 r8 a,8%}
    r4 \mark \markup{\box{"Solo Intro"}} r8 e'~e2
    d4 des c gis
    b2~ b8 \breathe a4 e8
    d4~ d8 e16 f e4 d \break

    e4. e8~e \breathe r8 e'4
    d4 des c gis
    b2~ b8 a4.  %e8
    % d4~ d8 e16 f e4 d
    r2 r4 r8 a,8^"Vocal"
    \bar "||" \break
  }
}

melody =  \transpose a g' {
  \relative c {
    \global
    \revert Score.BarNumber.stencil
    \repeat volta 2 {
      \bar "[|:-|"
      \mark \default
      c8_"Solos over Ax4" \segno d e c~ c e4 c8~
      c8 a4. r4 r8 a8
      c8 d e c~ c e4 a8~
      a2 r4 r8 f8 \break
      a8 b c b16 (c b8) a4 e8~
      e8 c4. r8 d c d~
      d4 b8 e~ e4 r4
    }
    \alternative {
      {
        r2 r4 r8 a,8 \bar ":|]"
      }
      {
        r2_"Vocals re-entry" c'4 e,8 b'~ \bar"||" \break
      }
    }

    \mark \default
    b2 r4 r8 e,8
    b'8 a4 g8~ g4 cis,8 f~
    f2 r4 r8 d8
    b'4 a8 g~ g4 d8 e~ \break
    e2 r4 b8 e~
    e4 d8 c~ c b4 b8~
    b8 c4. r2
    r4 e8 c'~ c4 e,8 b'~\break
    b2 r4 e,8 b'~
    b8 a a g~ g4 cis,8 f~
    f2 r4 r8 d8
    b'8 a4 g8~ g4 d8 e~\break
    e2 r4 b8 e~
    e4 d8 c~ c b4 b8~
    b8 c4. r2
    r1_"d.s. al Coda after all solos" \bar"||"


    <c e g b>1 \tenuto \coda \bar"|."
  }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert"
  }
  \score {
    \layout {
     indent = 0\mm
     ragged-last = ##f
     ragged-right = ##f
      %\override Score.Clef.break-visibility = #'#(#f #f #f)
      %\override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
    <<
      \new ChordNames \introChordNames
      \new Voice = "Intro" \restIntro
    >>
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \transpose c c' { \melody }
    >>
    \layout{}
  }
  \performanceNote
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    \layout {
      indent = 10\mm
    }
    <<
      \new Staff \with { instrumentName = "Flute" } \transpose c c' \woodwindIntro
      \new Staff \with { instrumentName = "Tenor Sax" } \transpose bes c'' \woodwindIntro
    >>
  }
  \score {
    \layout {
    }
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c'' \melody
    >>
  }
  \performanceNote
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Baritone Sax"
  }
  \score {
    \layout {
      indent = 10\mm
    }
    <<
      \new Staff \with { instrumentName = "Flute" } \transpose c c' \woodwindIntro
      \new Staff \with { instrumentName = "Bari. Sax" } \transpose ees c' \woodwindIntro
    >>
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Bari. Sax" } \transpose ees c' \melody
    >>
    \layout{}
  }
  \performanceNote
}

\book {
  \bookOutputSuffix "Fl"
  \header {
    instrument = "Flute"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \transpose c c' \melody
    >>
    \layout{}
  }
  \performanceNote
}


%{
convert-ly (GNU LilyPond) 2.25.4  convert-ly: Processing `'...
Applying conversion: 2.25.0, 2.25.1, 2.25.3, 2.25.4
%}


%{
convert-ly.py (GNU LilyPond) 2.24.4  convert-ly.py: Processing `'...
Applying conversion:     The document has not been changed.
%}


%{
convert-ly.py (GNU LilyPond) 2.25.21  convert-ly.py: Processing `'...
Applying conversion: 2.25.0, 2.25.1, 2.25.2, 2.25.3, 2.25.4, 2.25.5,
2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12, 2.25.13, 2.25.18
%}
