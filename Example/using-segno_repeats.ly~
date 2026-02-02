\version "2.24.3"
\language "english"

\layout {
  \context {
    \Score
    \override CodaMark.color = #red
    \override SegnoMark.color = #red
    \override SectionLabel.color = #red
    \override SectionLabel.font-size = #3
    \override RehearsalMark.font-size = #3
    \override RehearsalMark.color = #red
  }
}

\new Score {
  \new Staff {
    \new Voice {
      \fixed c' {
        \mark \default
        f1 f1
        \sectionLabel "A1"
        f1 f1
        \repeat segno 2 {
          g1 g1
          \alternative {
            \volta 1 { \repeat unfold 4 { a2 } }
            \volta 2 \volta #'() {
              \section
              \sectionLabel "Coda"
            }
          }
        }
        b1
        \fine
      }
    }
  }
}