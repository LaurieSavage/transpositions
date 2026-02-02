\version "2.24.4"

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 15\mm
}

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
               'length (ly:music-length note)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

nb = \markup {"Play the head 2x, solo on A: after the solos continue to B"}

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

title = #"Blue Bossa"
composer = #"- Kenny Dorham"
meter = #" (Med. Bossa)"

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
  tagline = \markup {"Paradiso Connection - Edited L. S., "  \today }
}

global = {
  \time 4/4
  \key c \minor
  \tempo 4 = 160
  \accidentalStyle modern-cautionary
}

chordNamesOrig = \chordmode {
  %\override ChordNames . ChordName #'font-name = #"LilyJazz Text"

  \global
  %% A
  s4
  c1*2:min6
  f1*2:m7
  d1:m7.5-
  g1:7.5+.9+
  c1*2:min6
  ees1:m7
  aes1:7
  des1*2:maj
  d1:m7.5-
  g1:7.5+.9+
  c1*3:min6
  %% B
  c1*2:min6
  f1*2:m7
  d1:m7.5-
  g1:7.5+.9+
  c1*2:min6
  ees1:m7
  aes1:7
  des1*2:maj
  d1:m7.5-
  g1:7.5+.9+
  c1*3:min6
  %c1:m6
  d1:m7.5-
  g1:7.5+.9+
  c1*2:min6
}

melodyOrig = \relative c'' {

  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4 g4
  \repeat volta 2 {
    \mark 1
    g'4. f8 ees8 d r c~
    c2 r8 bes4 aes8~
    aes2 r8 g'4 f8~
    f1 \break
    f4. ees8 d c r bes~
    bes2 r8 aes4 g8~
    g2 r8 f'4 ees8~
    ees1 \break
    ees4. des8 c bes r aes~
    aes2 r8 ges4 ges8~
    ges4. f8 bes4. aes8
    aes1 \break
    <<
      {
        aes4^"top-tpt" g8 bes~ bes4. aes8
        aes4 g8 bes~ bes4. aes8
        g1~
      }
      \\
      {
        f4_"tnr 2nd time" ees8 f~ f4. f8
        f4 f8 f~ f4. ees8
        d1~
      }
    >>
  }
  \alternative {
    {
      <<
        {g2.}\\{d2.}
      >>
      g4
    }
    {
      <<
        {g2.\repeatTie}\\{d2.\repeatTie}
      >>
      r4 %\bar "||"
    }
  }\break
  \mark 2
  \repeat volta 2 {
    <g' bes>2~ <g bes>8 ees b c~
    c2~ c8 bes g aes~
    aes2~ aes8 g e f~
    f1 \break
    f'2~ f8 d a bes~
    bes2~ bes8 aes ges g~
    g2~ g8 f d ees~
    ees1 \break
    ees'2~ ees8 c g aes~
    aes2~ aes8 ges e f~
    f2~ f8 ees c des~
    des1 \break
    g2. f8 bes~
    bes2~ bes8 g f g~
    g1~
  }
  \alternative{
    {g1}{g2.\repeatTie g4}
  }\break
  \sectionLabel "Vamp under singer at end x 3"
  \repeat volta 2
  {
    %\mark \markup {"Vamp out"} \comp 8
    <<
      {
        aes4^"top-tpt" g8 bes~ bes4. aes8
        aes4 g8 bes~ bes4. aes8
        g1~
      }
      \\
      {
        f4_"tnr 2nd time" ees8 f~ f4. f8
        f4 f8 f~ f4. ees8
        d1~
        <<
          {g2.}\\{d2.}
        >>
        g4
      }
    >>
  }

}

chordNames = \transpose a b { \chordNamesOrig }
melody = \transpose a b { \melodyOrig }

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Pitch"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layoutScore
  }
  \nb
}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Alto/Bari Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c { \melody }
    >>
    \layoutScore
  }
  \nb
}

\book {
  \bookOutputSuffix "Bflat"
  \header {
    instrument = \markup  {\override #'(font-name . "LilyJAZZ Text")"B flat insts"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>
    \layoutScore
  }
  \nb
}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
