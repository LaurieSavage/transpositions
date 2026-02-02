\version "2.24.4"

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
  title = "In Walked Bud"
  composer = "Bud Powell"
  copyright = "Paradiso Connection"
  meter = \markup \italic "Swing"
  tagline = ##f
}

global = {
  \time 4/4
  \key aes \major
  \tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle modern-cautionary
}

chordNames = \chordmode {
  \global
  \repeat volta 2 {
    f1:m
    c1:7.5+
    f1:7
    bes1:7
    aes2.:maj f4:m7
    bes2:m7 a2:7
    aes1:6
  }
  \alternative{ {aes2:6 c2:7}{aes1:6 }}
  %% B
  f2:m7 bes2:7
  f2:m7 bes2:7
  aes2:m7 des2:7
  aes2:m7 des2:7
  f2:m7 bes2:7
  f2:m7 bes2:7
  aes2:m7 des2:7
  aes2:m7 des2:7
  %% A
  f1:m
  c1:7.5+
  f1:7
  bes1:7
  aes2.:maj f4:m7
  bes2:m7 a2:7
  aes1:6


}

melody = \relative c'' {
  \global
  \repeat volta 2 {
    \mark 1
    f,8 c'~ c2 f,4
    e8 c'~ c2 e,4
    ees8 c'~ c2 ees,4
    d8 bes'~ bes4~bes8 des,4 b8 \break
    c8 aes'8~ aes2 c,8 bes8
    b8 g'4 <a, des>8~ <a des>4. b8
    c8 ees f4 aes4 f8 ees8~
  }
  \alternative{ { ees8 aes,4. r2} { ees'8 aes,4. r2 \bar "||"}}
  \mark 2
  f'8 g aes4 bes8 bes aes bes
  aes4 bes8 bes aes bes aes4
  <<
    {
      ces1~
      ces1
    }
    \\
    {
      r4 ges4 f8 ces~ ces4
      ges'4 f8 ces8~ ces2
    }
  >>
  \break
  f8 g aes4 bes8 bes aes bes
  aes4 bes8 bes aes bes aes4
  <<
    {
      ces1~
      ces1
    }
    \\
    {
      ges2 f2
      ges2 f2
    }
  >>
  \bar "||" \break
  \mark 1
  f8 c'~ c2 f,4
  e8 c'~ c2 e,4
  ees8 c'~ c2 ees,4
  d8 bes'~ bes4~bes8 des,4 b8 \break
  c8 aes'8~ aes2 c,8 bes8
  b8 g'4 <a, des>8~ <a des>4. b8
  c8 ees f4 aes4 f8 ees8~
  ees8 aes,~ aes2 r4 \bar "|."

}

\bookpart{
  \header {
    instrument = \markup \with-color # red "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
  }
}

\book{
  \bookOutputSuffix "_C"
  \header {
    instrument = \markup \with-color # red "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
  }
}

\book {
  \bookOutputSuffix "_Bb"
  \header {
    instrument = \markup \with-color # red {"B" \flat " Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
    >>
  }
}

\book {
  \bookOutputSuffix "_TenorSax"
  \header {
    instrument = \markup \with-color # red {"Tenor sax"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c'' \melody
    >>
  }
}

\book {
  \bookOutputSuffix "_Eb"
  \header {
    instrument = \markup \with-color # red {"E" \flat " Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>
  }
}




%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
