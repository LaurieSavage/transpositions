\version "2.24.4"

\header {
  title = "______________________________________________"
  tagline = ##f
  subtitle = " "
  composer = " "
  piece = " "
  poet = " "
}

\paper {
  left-margin = 20
  right-margin = 20
  top-margin = 15
  bottom-margin = 15
}

\score {
  <<
    \new Staff
    {
      \hide Staff.TimeSignature
      \hide Staff.Clef
      \hide Staff.BarLine
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
      \repeat unfold 4 {s1} \break
    }
  >>
}