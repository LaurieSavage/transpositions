\version "2.24.3"

\include "lilyjazz.ily"
\include "jazzchords.ly"
\include "jazzextras.ly"

\header {
  title = "A-Kah-Hah"
  composer = "Lloyd Swanton"
  instrument = "Concert"
  tagline = "Standing Tall - 2015"
}

% Function to print a specified number of slashes
comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

global = {
  \numericTimeSignature
  \time 2/2
  \key c \major
  \tempo 4=168
}

crOn = {
  \override NoteHead.style = #'cross
}

crOff = {
  \revert NoteHead.style
}

chordNames = \chordmode {
  %\global
  s1*8
  g1 a:m g f4 fis g2
  g1 a:m g f4 fis g2
  s1*12
  g1 a:m g f4 fis g2
}

melody = \relative c'' {
  \global
  \set Score.markFormatter = #format-mark-box-alphabet
  \clef bass
  \repeat volta 2 {
    \bar ".|:"
    <d,, g>4^"Bass intro with stick"
    \crOn g8 \crOff <d g>4 <d g>8 \crOn g8 \crOff <d g>

    <d g>4 \crOn g8 \crOff <d g>4 <d g>8 \crOn g8 \crOff <d g>
    <d g>4 \crOn g8 \crOff <d g>4 <d g>8 \crOn g8 \crOff <d g>
    \crOn g8 \crOff <d g> <d g>4 <d g>4 \crOn g4 \crOff
  }
  \break

  \repeat volta 2 {
    \mark \default
    \clef treble
    b'8^"Horns"  d r d e d dis e
    r4 r8 g a4 bes
    a8 g r g a c, cis d
    g, gis b bes gis b r4

    \break
    \comp #4  \mark"Alternate horn solos"
    \comp #4
    \comp #4
    \comp #4

    \break
    \comp #4
    \comp #4
    \comp #4 \mark "Repeat till cue"
    \comp #4
}

\break

  \repeat volta 2 {
    \mark \default
    g'2.^"Horns unison"_"Rhythm section counterline last two times of 'B'"
    d8 (bes c4.) d8 c c g4
    g'2. d8 (bes c) c c4 g2^"6x"
  } \break

  \repeat volta 2 {
    \mark \default
    g4 ges f~f8 a~a ais4 b8~b4 g
    ges f~f8 a4 ais8~ais b4. g4 ges
    f4. a8~a ais4 b8~b4 g ges f~f8 a4 ais b g8~ g4 g g r4
  } \break

  \mark \default
  \comp #4
  \comp #4
  \comp #4
  \comp #4
  \break

  b8^"Horns unison"
  d r d e d dis e
  r4 r8 g a4 bes
  a8 g r g a c, cis d
  g, gis b bes gis-> b-> r4 \bar "|."
}


\score {
  <<
    \new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff {
      %\jazzOn
      \melody
    }
    %\addlyrics { \words }
  >>
  \layout { }
  \midi { }
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0
%}
