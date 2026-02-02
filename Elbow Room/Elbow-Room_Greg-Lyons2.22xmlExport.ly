\version "2.24.4"

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
  title = "Elbow Room"
  composer = "Greg Lyons"
  meter =  "New Orleans funk groove"
  copyright = "Paradiso Connection"
  tagline = "" %\markup { "Edited by L.S. " \today }
}

global = {
  \time 4/4
  \key f \major
  \tempo 4=84
  %\set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle modern-cautionary
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

  r1^"Drums and bass"
  R1
  R1
  R1
  % Intro 2
  \repeat volta 2 {
    r1^"Full rhythm section"
    R1
    R1
  }
  \alternative {{R1}{R1}} \break
  \repeat volta 2 {
    %r8 e8-^ d16 ces a e ges a c a-^ r8 f,8~
    r8^"Horns and Gtr" c8-^ bes16 aes f c ees f aes f-^ r8 f,8~
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

\score {
  <<
    \new ChordNames \chordNames
    \new PianoStaff <<
      \new Staff \unfoldRepeats \melody
      \new Staff \unfoldRepeats \bassLine
    >>
  >>
  \layout {
    %#(layout-set-staff-size 14)
  }
}

%{
\book{
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
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
      \new Staff  \transpose bes c' \melody
    >>
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
      \new Staff  \transpose bes c'' \melody
    >>
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
      \new Staff  \bassLine
    >>
  }
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument = "Eb Instruments"
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


%{
convert-ly (GNU LilyPond) 2.25.16  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
