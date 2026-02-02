\version "2.25.28"

\include "AccordsJazzDefs.ily"
\include "LilyJAZZ.ily"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 20 \mm
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
  title = \markup \underline "Blame it on my youth"
  composer = "Music - Oscar Levant"
  poet = "Lyrics - Edward Heyman"
  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key ees \major
  \tweak X-offset #-10 \mark \jazzTempoMarkup #"Med. Ballad" c4 #"80"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}

chordNames = \chordmode {
  ees2:maj f:m7
  g:m7 c:m7
  f:m7 e:dim7
  f:m7 bes:7

  f:m e:dim7
  f:m7 bes:7
  g:m7 f4:m7 bes4:7
  ees2:maj ees4:sus4.7 ees4:7

  aes2:maj bes:7
  g:m7 c:m7
  f:m7 bes:7
  ees1:maj

  d2:m7.5- g:7
  c1:m
  aes2:maj c:7
  f2:7 bes4:sus4.7 bes4:7

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ees2:maj f:m7
  g:m7 c:m7
  f:m7 e:dim7
  f:m7 bes:7

  f:m e:dim7
  f:m7 bes:7
  g:m7 f4:m7 bes4:7
  ees2:maj ees4:sus4.7 ees4:7

  aes2:maj bes:7
  g:m7 c:m7
  f:m7 f:m7/ees
  d:sus4.7.9 c:7

  f:m7 e:dim7
  f:m7 bes:7
  ees2:6 \parenthesize c2:m7 \parenthesize f2:m7 \parenthesize bes:7

}

melody = \relative c'' {
  \global
  \jazzOn

  g2\mark \default aes8 bes \tuplet 3/2 { g8 aes bes~ }
  bes4 bes, c ees
  f2 g8 aes \tuplet 3/2 { f8 g aes~ }
  aes1 \break

  aes2 bes8 c \tuplet 3/2 { aes8 bes c~ }
  c4 c, d f
  bes2 aes8 bes \tuplet 3/2 { g8 aes bes~ }
  bes1 \break

  c2~ c8 c, d f
  bes8 bes bes4~ bes2
  aes4 c bes aes
  g1 \break

  aes2~ aes8 d, ees f
  g8 g g4~ g2
  c4 c g g
  f1 \bar "||" \break

  %%%%%%%%%%%%%%%%%%%%

  \mark \default g2 aes8 bes \tuplet 3/2 { g8 aes bes~ }
  bes4 bes, c ees
  f2 g8 aes \tuplet 3/2 { f8 g aes~ }
  aes1 \break

  aes2 bes8 c \tuplet 3/2 { aes8 bes c~ }
  c4 c, d f
  bes2 aes8 bes \tuplet 3/2 { g8 aes bes~ }
  bes1 \break

  c2~ c8 c, d f
  bes8 bes bes4~ bes g
  aes4 ees' c aes
  g1 \break

  aes2 bes8 c \tuplet 3/2 { aes8 bes c~ }
  c2 c8 d \tuplet 3/2 { bes8 c ees~ }
  ees1
  R1 \bar "|."

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
      \new Staff \with { instrumentName = "Bb Horns" } \transpose bes c' \melody
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