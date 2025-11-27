\version "2.24.3"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 15\mm
}

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

\header {
  title = "Antonio's Song"
  composer = "Michael Franks"
  piece = ""
  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  %\mark \jazzTempoMarkup #"" c4 #""
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \transpose a g {
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

    % A
    a1:m7
    d1:m7
    a1:m7
    a1:7
    d1:m7
    a1:m7
    b1:m7.5-
    e1:7
    a1:m7
    d1:m7
    a1:m7
    a1:7
    d1:m7
    a1:m7
    b1:m7.5-
    e1:7

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

    % Bridge
    a1:m7
    d1:m7
    a1:m7
    a1:7
    d1:m7
    a1:m7
    b1:m7.5-
    e1:7
    a1:m7
    d1:m7
    a1:m7
    a1:7
    d1:m7
    a1:m7
    b1:m7.5-
    e1:7

    %
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
    b2:m7.5 e2:7
    s1
    a1:m9
  }
}

intro =  \transpose a g {
  \relative c {
    \global

    \revert Score.BarNumber.stencil
    %{ R1^"Flute + Rhythm" R1*3 \break
    R1*3 r2 r4 r8 a,8%}
    \mark \markup{\box{"Solo Intro"}}
    r4 r8 e'~e2
    d4 des c gis
    b2~ b8 a4 e8
    d4~ d8 e16 f e4 d \break
    e4. e8~e r8 e'4
    d4 des c gis
    b2~ b8 a4.  %e8
    % d4~ d8 e16 f e4 d
    r2 r4 r8 a8
    \bar "||" \break
  }
}

melody =  \transpose a g' {
  \relative c {
    \global
    \revert Score.BarNumber.stencil
    \mark \default
    c8\segno d e c~ c e4 c8~
    c8 a4. r4 r8 a8
    c8 d e c~ c e4 a8~
    a2 r4 r8 f8 \break
    a8 b c b16 (c b8) a4 e8~
    e8 c4. r8 d c d~
    d4 b8 e~ e4 r4
    r2 r4 r8 a,8 \break
    c8 d e c~ c e4 c8~
    c a4. r2
    c8 d e c~ c e4 a8~
    a2 r4 r8 f8 \break
    a8 b c b16 (c b8) a4 e8~
    e c4. r8 d c d~
    d4 b8 e~ e4 r4
    r2 c'4 e,8 b'~ \bar"||" \break

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
    r1^"to Coda" \bar"||" \break

    \mark \default
    R1*4 \break
    R1*4 \break
    R1*4 \break
    R1*3
    r2 c'4 e,8 b'~\bar"||" \break

    \mark \default
    b2 r4 r8 e,8
    b'8 a4 g8 g4 cis,8 f~
    f2 r4 r8 d8
    b'4 a8 g~ g4 d8 e~\break
    e2 r4 c8 e~
    e4 d8 c8~ c b4 b8~
    b8 c4. r2
    r4 e8 c'~ c4 e,8 b'\break
    b2 r4 e,8 b'~
    b8 a a g~ g4 cis,8 f8~
    f2 r4 r8 d8
    b'8 a4 g8~ g4 d8 e~\break
    e2 r4 b8 e~
    e4 d8 c~ c8 b4 b8~
    b8 c4. r2
    r1^"d.s. al coda" \bar"||"
    s1
    <c e g b>1 \tenuto \coda \bar"|."
  }
}

\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "C insts." } { \melody }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = "Bb Sax" } \transpose bes c'' \melody
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eflat"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Eb Sax" } \transpose ees c' \melody
    >>
    \layoutScore
  }
}
\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Flute" } \transpose c c' \melody
    >>
    \layoutScore
  }
}