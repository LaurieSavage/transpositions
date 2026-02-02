\version "2.25.28"

\include "lilyjazz.ily"
\include "jazzchords.ily"

\paper {
  indent = 0\mm
}

headA = \relative c'' { a4 b c d c b a g }
riff = \relative c'' { a4 a a a b b b b }

\score {
  <<
    \new Voice = Head \repeat unfold 16 { \headA }
  >>
}
\score {
  \new Staff {
  \mark \markup { \bold "Riff" }
      \new Voice = Riff \riff
  }

}