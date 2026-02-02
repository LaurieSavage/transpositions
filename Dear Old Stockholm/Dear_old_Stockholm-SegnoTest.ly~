\version "2.24.3"

%#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 25\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 16)
                             (minimum-distance . 6)
                             (padding . 1))
}

title = #"Dear Old Stockholm"
composer = #"- Traditional"
meter = #" ( Med swing )"

segno = \tweak color #red \segno
coda = \tweak color #red \coda

performanceNote = \markup {
  \left-column {
    ""}
  \hbracket
  \center-column {
    %\line { " " }
    \line { "Solo over the entire form, including the Coda" }
    \line { "Horns play the coda from bar 22 under the end of each solo" }
    %\line { " " }
  }
  \right-column {
    ""
  }
}

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
  subtitle = "'Ack Värmeland, du sköna'"
  arranger = "Arr: Miles Davis"
  tagline = \markup {
    \center-column {
      \line { " " }
      \line {"____"}
      \line { "Edited by L.S. " \today }
    }
  }
}

theNotes = \relative c' {
  \accidentalStyle modern-cautionary
  \set Staff.midiInstrument = "flute"
  % \set Score.startRepeatBarType = #"[|:"
  % \set Score.endRepeatBarType = #":|]"

  \key f \major
  \section
  \sectionLabel "Introduction"

  \repeat volta 2 {
    \repeat percent 2 {
      r4%_"1. Piano + Rhythm 2. Add horns"
      r8 e8 e2
      r4 r8 e8 e4. e8
    }
  }
  \break

  \repeat segno 2 {
    \repeat volta 2 {
      %\showStartRepeatBar \bar "[|:-|"
      d4-. r8 e8 f4-. g8 a~
      a2 r4 d8 e8~
      e4 d8 c8~ c4 bes8 a~
      a1~
      a8 g fis g bes c16 bes a8 g \coda

      f2~ f8 a f e~
      e1
      r2 r8 ees4.

      %\bar ":|]"
      %}
      \alternative {
        \volta 1 {
          \repeat percent 2 {
            r4 r8 e8 e2
            r4 r8 e8 e4. e8
          }
        }
        \volta 2 {
          r8 f4. f8 e f a~
          a8 a4 g8~ g2
          r8 f4. f8 e f c'~
          c8 bes4 g8  des8 c4.
        }
      }
    }
    \break

    \section
    \sectionLabel "Coda"
    f2~ %\coda
    f8 c' f, c
    \section
    \repeat percent 2 {
      r8 f4. f4-^ g-^
      a4. a8 r2
    }
    \break
    r8 f4. f4 g
    a4. g8~ g4. f8~
    f2 g4. f8
    R1_"Pickup for solos"
    R1 \fine
  }
}


theChords = \chordmode {
  \repeat volta 2 {
    \repeat percent 2 {
      d1:m7
      d1:m6
    }
  }

  \repeat segno 2 {

    \repeat volta 2 {
      d1:m
      e2:m7.5- a2:7.9-
      d2:m a2:7.9+
      d1:m
      g1:m7
      d1:m
      e1:m7.5-
      a1:7.9-
      \repeat percent 2 {
        d1:m7
        d1:m6
      }
    }
    f1
    g2:m7 c2:7
    f1
    e2:m7.5- bes4:7 a4:7
  }


  %\section
  %\sectionLabel "Coda"
  d1:m
  \repeat percent 2 {
    c1:7sus4
    c1:7sus4
  }
  c1:7sus4
  c2:7sus4
  a2:7.9-.10-.11+.13-
  g2:m7
  a2:7.9-
  d1*2:m

}

theWords = \lyricmode {

}

\bookpart {
  \score {
    %\performanceNote
    <<
      \new ChordNames %\unfoldRepeats
      \theChords
      \new Voice = soloist %\unfoldRepeats
      \theNotes
      %\new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars

      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        %\override SectionLabel.font-size = #3
        %\override RehearsalMark.font-size = #3
        \override RehearsalMark.color = #red
      }
    }
    %  \midi {
    %   \tempo 4 = 88
    %  }
  }
  \performanceNote
}

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = "Tenor Sax/Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \theChords
      \new Voice = soloist \transpose bes c' \theNotes
      \new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars

      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        %\override SectionLabel.font-size = #3
        %\override RehearsalMark.font-size = #3
        \override RehearsalMark.color = #red
      }
    }
    %  \midi {
    %   \tempo 4 = 88
    %  }
  }
  \performanceNote
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument = "Eb Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \theChords
      \new Voice = soloist \transpose ees c' \theNotes
      \new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars

      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        %\override SectionLabel.font-size = #3
        %\override RehearsalMark.font-size = #3
        \override RehearsalMark.color = #red
      }
    }
  }
  %  \midi {
  %   \tempo 4 = 88
  %  }
  %}
  \performanceNote
}

%{
convert-ly (GNU LilyPond) 2.25.4  convert-ly: Processing `'...
Applying conversion: 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4
%}
