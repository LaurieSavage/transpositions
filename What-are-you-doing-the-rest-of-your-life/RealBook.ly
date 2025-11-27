today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 10\mm
  left-margin = 30\mm
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

title = #"What are you doing the rest of your life"
composer = #"Michel LeGrand"
meter = #" (Ballad)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline %\larger \larger
          #title
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
  tagline = \markup { "Edited by L.S. " \today }
}


\layout {
      indent = 0\mm
      ragged-last = ##f
      ragged-right = ##f
      %\override Score.Clef.break-visibility = #'#(#f #f #f)
      %\override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }