\version "2.24.4"

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

title = #""
composer = #"- "
meter = #" ( )"

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
  tagline = \markup { "Paradiso Connection - edited by L.S. " \today }
}

theNotes = \relative c' {
  \set Staff.midiInstrument = "flute"
  \set Score.startRepeatBarType = #"[|:"
  \set Score.endRepeatBarType = #":|]"
  \key c \major
  %\showStartRepeatBar \bar "[|:-|"

}

theChords = \chordmode {

}

theWords = \lyricmode {

}

\score {
  <<
    \new ChordNames \theChords
    \new Voice = soloist \theNotes
    \new Lyrics \lyricsto soloist \theWords
  >>
  \layout {
    %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    \override Score.Clef.break-visibility = #'#(#f #f #f)
    \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
  }
%  \midi {
%   \tempo 4 = 88
%  }
}
