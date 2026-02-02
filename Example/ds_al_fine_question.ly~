\version "2.24.3"

dots = \relative c''
{
  \mark \default
  c1 | c1 | c1 | c1 | \break

  \repeat segno 2 {
    \mark \default
    d1 d1 d1
    \volta 2 \fine
    \volta 2 {
      d1
      s1^"Solos over AB then play C section out" \break

      \repeat volta 2 {
        \mark \default
        e1 | e1 |
        \alternative {
          { e1~ e2 r2 }
          { e1~ e2 ees }
        }
      }
      \section
    }
  }
}

\score { \dots }
\score { \unfoldRepeats \dots }