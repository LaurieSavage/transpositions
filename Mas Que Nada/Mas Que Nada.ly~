\version "2.24.3"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\paper {
  #(set-paper-size "a4")
  %  paper-height = 11\in
  %  paper-width = 8.5\in
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Mas Que Nada"
composer = #"- Jorge Ben"
meter = #" (Med. funky samba - mm 88)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \with-color #red
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
  tagline = ##f
}

global = {
  \key f \minor
  \time 2/2
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
  %\override coda.color = #red
}

theNotes = \relative c' {
  %\set Staff.midiInstrument = "flute"
  \global
  %\showStartRepeatBar \bar "[|:-|"
  \repeat volta 2 {
    \section
    \sectionLabel \markup {\larger \with-color #red \box A }
    f1~_\markup {\with-color #red "Solos over ABCD"} | f1~ | f4. aes8~ aes c4 bes8~ | bes2~ bes8 aes4 f8~ |
    f2 r4 r8 c8 | f4. c8 f4. c8 | f1 | R1 |
    f1~ | f8 c'4 bes8~ bes8 aes4 f8~ | f4. aes8~ aes8 c4 bes8~ | bes2~ bes8 aes4 f8~^\markup { \large \larger \with-color #red \coda } |

    f2\repeatTie r4 r8 c8 | f4. c8 f4. c8 | f1 | r4 ees2 des8 c~ |
    \section
    \sectionLabel \markup {\larger \with-color #red \box B }
    c8 f4. ees8 ees ees des | ees8 des ees des ees des4 c8~ | c8 f r4 r4 ees8 des |
    ees4 ees8 des ees des ees c~ | c4. c8 r8 bes4 aes8 | c4 c8 e~ e e4 f8~ |
    f1 | r2 f4 g4 |
    \section
    \sectionLabel \markup {\larger \with-color #red \box C }
    aes4. f8~ f4 bes8 g~ | g8 ees ees ees c ees4 f8~ | f1 | r4 f8 f f f c' c |
    c4. bes8~ bes2 | g4 ees8 ees c ees4 f8~ | f1 | r4 ees2 des8 c~ |
    \section
    \sectionLabel \markup { \larger \with-color #red \box D }
    c8 f4. r4 r8 c8 | ees8 ees ees des ees des ees des | c8 f4. r4 r8 c8 |
    ees4. des8 ees4. des8 | c2 r8 bes8 aes4 | c4 c8 e8~ e e4 f8 |
    f1 | f2_\markup {\with-color #red {"D.C. al "\coda " after solos"}} r2 \break
  }
  \section
  \sectionLabel \markup {\larger \with-color #red {\coda}}
  f2\repeatTie r4 r8 <c f>8 | <f bes>4. <c f>8 <f bes>4. <c f>8 | <f bes>4 r4^\markup {\with-color #red "Piano Break"} r2 |
  r2 r4 r8 <c f>8 \break
  \repeat volta 2 {
    <f bes>4._\markup {\large \larger \with-color #red "Vamp and fade"} <c f>8 <f bes>4. <c f>8 | <f bes>2 r2 | r2 r4 r8 <c f>8
  }


}

theChords = \chordmode {
  \global
  \repeat volta 2 {
    f2:m7 bes2:9 | f2:m7 bes2:9 | bes1:m7 | ees1:9
    f2:m7 bes2:9 | f2:m7 bes2:9 | f2:m7 bes2:9 | f2:m7 bes2:9 |
    f2:m7 bes2:9 | f1*2:m7 | ees1:9 | %to coda

    f2:m7 bes2:9 | f2:m7 bes2:9 | f2:m7 bes2:9 | f4:m7 c2.:7.9+ |

    %% B
    f1:m7 | c1:7.9+ | f1:m7 | c1:7.9+ |
    f1:m7 | c2:9 c2:7.9- |
    f2:m7 c2:sus4.7.9 | f2:m7 c2:sus4.7.9 |

    %% C
    bes1:m7 | ees1:9 | aes1:maj9 | aes1:6 | bes1:7/d | ees2/des c2:m7
    f1:m7 | f4:m7 c2.:7.9+ |

    %% D
    f1:m7 | c1:7.9+ | f1:m7 | c1:7.9+ |
    f1:m7 | c2:9 c2:7.9- | f2:m7 c2:sus4.7.9 | f2:m7 c2:sus4.7.9 |
  }

  %% Coda
  f2:m7 bes2:9 | f2:m7 bes2:9 | bes4:9 r2. | R1 |
  \repeat volta 2 {
    f2:m7 bes2:9 | f2:m7 bes2:9 | f2:m7 bes2:9 |
  }
}

theWords = \lyricmode {

}

\book {
  \bookOutputSuffix "Concert"
  \score {
    <<
      \new ChordNames \theChords
      \new Voice = soloist \theNotes
      \new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
    \midi {
      \tempo 4 = 88
    }
  }
}

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = \markup {\large \larger "Bb Sax"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \theChords
      \new Voice = soloist \transpose bes c' {\theNotes}
      \new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      \override Score.Clef.break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    }
  }
}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


%{
convert-ly (GNU LilyPond) 2.25.11  convert-ly: Processing `'...
Applying conversion: 2.25.0, 2.25.1, 2.25.3, 2.25.4, 2.25.5, 2.25.6,
2.25.8, 2.25.9, 2.25.11
%}
