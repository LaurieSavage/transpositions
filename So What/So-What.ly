\version "2.25.28"

\include "AccordsJazzDefs.ily"
\include "LilyJAZZ.ily"
\include "articulate.ly"

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 15\mm
  #(layout-set-staff-size 16)
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
  title = "So What"
  composer = "Miles Davis"
  %piece = "Boogaloo"
  tagline = \markup{ \small \override #'(font-name . "LilyJAZZ Text"){"(As played by Christian Scott")}}
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  \tempo 4 = 140
  %\mark \jazzTempoMarkup #"Straight 1/8ths" c4 #"132"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}

bassRiffA = {
  r8 d,8 a' b c d e c
}

bassRiffB = {
  r8 ees,8 bes'8 c des ees f des
}

chordNames = \chordmode {
  s1
  \repeat volta 2 {
    s2 e4.:m7 d8:m7
    s1
    s2 e4.:m7 d8:m7
    s1
    s2 e4.:m7 d8:m7
    s1
    s2 e4.:m7 d8:m7
  }
  \alternative {
    { s1 }
    { s1 }
  }
  %%{
  s2 f4.:m7 ees8:m7
  s1
  s2 f4.:m7 ees8:m7
  s1
  s2 f4.:m7 ees8:m7
  s1
  s2 f4.:m7 ees8:m7
  s1

  s2 e4.:m7 d8:m7
  s1
  s2 e4.:m7 d8:m7
  s1
  s2 e4.:m7 d8:m7
  s1
  s2 e4.:m7 d8:m7
  %{ees1
  ees2 des4. b8
  b1
  b2 a4. g8
  g1
  g2 f4. ees8
  ees1
  ees2 e4.:m7 d8:m7
  s1
  s2 e4.:m7 d8:m7
  s1
  s2 e4.:m7 d8:m7
  s1
  s2 e4.:m7 d8:m7
  s1
  %}
}

melody = \relative c {
  \global
  \jazzOn
  \clef bass
  \revert Score.BarNumber.stencil
  \bassRiffA
  \repeat volta 2 {
    \mark \default
    d2 r2
    \bassRiffA
    d8 a4. r2
    \bassRiffA
    d2 r2
    r8 e4. e4 e4
    d8 a4. r2
  }
  \alternative {
    {
      \bassRiffA
    }
    {
      \bassRiffB
    }
  } \break

  \mark \default
  ees2 r2
  \bassRiffB
  ees8 bes4. r2
  \bassRiffB \break
  ees2 r2
  r8 f4. f4 f4
  ees8 bes4. r2
  \bassRiffA \bar "||" \break

  \mark 1
  d2 r2
  \bassRiffA
  d8 a4. r2
  \bassRiffA \break
  d2 r2
  r8 e4. e4 e4
  d8 a4. r2
  R1 \bar "|."
}

horns = \relative c''{
  \global
  \jazzOn
  \clef treble
  \revert Score.BarNumber.stencil
  R1
  \repeat volta 2 {
    r2 <d, g b>4. <c f a>8
    R1
    r2 <d g b>4. <c f a>8
    R1
    r2 <d g b>4. <c f a>8
    R1
    r2 <d g b>4. <c f a>8
  }
  \alternative {
    { R1 }
    { R1 }
  }

  %{
%% Original line
  r2 <ees aes c>4. <des ges bes>8
  R1
  r2 <ees aes c>4. <des ges bes>8
  R1
  r2 <ees aes c>4. <des ges bes>8
  R1
  r2 <ees aes c>4. <des ges bes>8
  R1

  r2 <d g b>4. <c f a>8
  R1
  r2 <d g b>4. <c f a>8
  R1
  r2 <d g b>4. <c f a>8
  R1
  r2 <d g b>4. <c f a>8
  R1

%{
  %% Scott's line
  r2 <ees aes c>4. <des ges bes>8~
  <des ges bes>1~
  <des ges bes>2 <aes' c>4. <ges bes>8~
  <ges bes>1~
  <ges bes>2 <ees ges>4. <bes des>8~
  des1~
  des2 c4. bes8~
  bes1

  r2 <d g b>4. <c f a>8~
  <c f a>1~
  <c f a>2 g'4. f8~
  f1
  f2 e4. d8~
  d1~
  d2 c4. b8~
  b1
  %}

  r2 \f<aes' c>4. <ges bes>8~\>
  <ges bes>1~
  <ges bes>2\pp\! <f aes>4.\f <ees ges>8~\>
  <ees ges>1~
  <ees ges>2\pp\! <des f>4.\f <c ees>8~\>
  <c ees>1~
  <c ees>2\pp\! <bes des>4.\f <aes c>8~\>
  <aes c>1\pp\!

  r2 <g' b>4. <f a>8~\f\>
  <f a>1~
  <f a>2\pp\! <e g>4.\f <d f>8~\>
  <d f>1~
  <d f>2\pp\! <b e>4.\f <a d>8~\>
  <a d>1~
  <a d>2\pp\! <a c>4.\f <g' b,>8~\>
  <g b,>1\!
}

\score {
  <<
    \unfoldRepeats
    \new Staff {
      \set Staff.midiInstrument = "trumpet"
      \set Staff.midiMaximumVolume = #0.9
      \horns
    }

    \unfoldRepeats
    \new Staff {
      \set Staff.midiInstrument = "tenor sax"
      \set Staff.midiMaximumVolume = #0.9
      \horns
    }

    \unfoldRepeats
    \new ChordNames {
      \set Staff.midiInstrument = "acoustic grand"
      \set Staff.midiMaximumVolume = #0.6
      \chordNames
    }

    \unfoldRepeats {
      \set Staff.midiInstrument = "electric bass (pick)"
      \melody
    }
  >>
  \midi{}
}

\book {
  \bookOutputSuffix "C"
  \header { subtitle = "C Instruments" }
  \score {
    \new ChoirStaff
    <<
      \new Staff \with {
        instrumentName = "Horns"
        shortInstrumentName = "Horns"
      } { \horns }
      \new ChordNames \chordNames
      \new Staff \with {
        instrumentName = "Bass"
        shortInstrumentName = "Bass"
      } { \melody }
    >>
    \layoutScore
    %\midi{}
  }
  \markup{
    \override #'(font-name . "LilyJAZZ Text")
    {
      "Solo Structure: A - 16 bars Dm7, B - 8 bars Ebm7, A2 - 8 bars Dm7"
    }
  }
}

\book {
  \bookOutputSuffix "Bflat"
  \header { subtitle = "Transposed for B flat horns" }
  \score {
    \new ChoirStaff
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with {
        instrumentName = "Horns"
        shortInstrumentName = "Horns"
      }
      \transpose bes c' { \horns }
      \new Staff \with {
        instrumentName = "Bass"
        shortInstrumentName = "Bass"
      } { \melody }
    >>
    \layoutScore
  }
  \markup{
    \override #'(font-name . "LilyJAZZ Text")
    {
      "Solo Structure for horns: A - 16 bars Em7, B - 8 bars Fm7, A2 - 8 bars Em7"
    }
  }
}

%{
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
%}