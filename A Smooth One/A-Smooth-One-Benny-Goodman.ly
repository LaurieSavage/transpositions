\version "2.24.4"

\include "lilyjazz.ily"
\include "jazzchords.ily"

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

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  markup-system-spacing = #25
}

layoutScore = \layout {
  indent = 15\mm
}

\header {
  title = \markup { \underline "A Smooth One" }
  composer = "Benny Goodman"
  %meter = \markup \italic "Medium Bounce"
  copyright = \markup \italic "Paradiso Connection"
  tagline = ##f
}

global = {
  \time 4/4
  \key f \major
%  \tweak X-offset #-8 \mark \jazzTempoMarkup #"Medium Swing" c4 #"140"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {
  \global
  %% A
  \repeat volta 2  {
    b2:dim7 bes2:6
    f2:6/a f2:6
    b2:dim7 bes2:6
    f2:6/a f2:6
    b2:dim7 bes2:6
    f2:6/a f2:6
    g2:9 c4.:9 \parenthesize c8:9.5+
  }
  \alternative{{ f1:6} {f2:6 f2:7 \bar "||"}}
%%B
bes1:6
b1:dim7
f1:6
c2:m7 f2:9
bes1:6
b1:dim7
f2:6 d2:7.9-
g2:m7.5- c2:7
%% A'
b2:dim7 bes2:6
    f2:6/a f2:6
    b2:dim7 bes2:6
    f2:6/a f2:6
    b2:dim7 bes2:6
    f2:6/a f2:6
    g2:9 c4.:9 \parenthesize c8:9.5+
    f1:6
}

melody = \relative c'' {
  \global
  
  \repeat volta 2 {
    d8 \mark \default aes4. f8 g f d
    f8 a4. r2
    d8 aes4. f8 g f d
    f8 d4. r2 \break
    d'8 aes4. f8 g f d
    f8 a4. r4 \tuplet 3/2 {d,8 des c}
    b8 d f a d, d4 d8~
  }
  \alternative{{ d4 r4 r2}{d4 r4 r4 f8 g8~}} \break
\mark 2
  g4 f8 d~ d4 f8 g~
  g4 f8 aes r4 bes8 c~
  c4 bes8 a~ a4 g8 g~
  g2. f8 g~ \break
  g4 f8 d~ d4 f8 g~
  g4 f8 aes r2
  a8 c d c ees c d bes
  \tuplet 3/2 {c8 a bes} \tuplet 3/2 {g8 a f} \tuplet 3/2 {g8 e f} \tuplet 3/2 {d8 e c} \bar "||" \break
\mark 1
  d'8 aes4. f8 g f d
    f8 a4. r2
    d8 aes4. f8 g f d
    f8 d4. r2 \break
    d'8 aes4. f8 g f d
    f8 a4. r4 \tuplet 3/2 {d,8 des c}
    b8 d f a d, d4 d8~
    d4 r4 r2 \bar "|."


}


\book {
  %\bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Concert" }{ \melody }
    >>
    \layoutScore
}
}

\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Flute" } \transpose c c' { \melody }
    >>
    \layoutScore
}
}

\book {
  \bookOutputSuffix "Bb"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = "Bb horn" } \transpose bes c' \melody
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eb"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Eb horn" } \transpose ees c' \melody
    >>
    \layoutScore
  }
}




%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
