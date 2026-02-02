\version "2.24.4"

#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"
\include "TabA.ily"

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

title = #"The More I see You"
composer = #"- Warren & Gordon"
meter = #" ( Ballad )"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      \override TextScript.color = "tomato"
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
  tagline = "Queens Of The West - L.S."%##f
}

%% Tenor Sax part
theNotesTS = \relative c' {
  \jazzTweaks

  \override Staff.SegnoMark.color = "tomato"
  \override Staff.CodaMark.color = "tomato"

  %\set Staff.midiInstrument = "flute"
  \key f \major
  %\showStartRepeatBar \bar "[|:-|"
  \partial 2.
  c4 f4. e8

  \repeat volta 2{
    f2 \mark \markup { \segno } c2~ | c4 f c'4. bes8 | c2 g2~ | g4 c,4 f4. e8^\markup { \coda }|\break
    f2 c2~ | c4 f c4. b8 | c1~ | c4 c c c \bar "||" \break
    c'2 c4 c4 | c4 ees4 c4. b8 | aes2 aes2~ | aes4 c aes4. g8 | \break
    f2 f2~ | f4 a4 f4. d8 | g1~ | g4 d4 f4. e8_"d.s. al Coda"
  }\break
  \section
  \sectionLabel "Coda"
  f2 c2~ |c4 f4 d'4. c8 | d1~ | d4 c bes a | \break
  f'4 d c bes | des bes f g | c2 c,2~ | c4 c4 f4. g8 | \break
  a2 c,2~ | c4 a' f g | f1~ \bar"|."_"Fine"| f4 r4 r2 \bar "||"
}

%% Real Book 5th edition Tenor Sax chords
theChordsTS = \chordmode {
  \partial 2.
  r2.
  \repeat volta 2 {
    f2 g2:m7 | a2:m d2:7.9- | g1:m7 | c1:7 |
    f2 g2:m7 | a2:m d2:7.9- | g1:m7 | c1:7 |
    f1:m | ees2:m7 aes2:7 | des2:maj7 d2:7.5-.9-  | des2:maj7 c2:7 |
    f1:m | g1:7 | g1:m7 | c1:7sus4 |
  }
  f2 g2:m7 | a2:m c2:maj7.5+ | c1:m7 | f1:7
  bes1:maj7 | bes2:m7 ees2:7 | f2 a2:m7 | d2:7 g2:7
  f1 | g2:m7 c2:7 | f1 | g2:m7 c2:7
}

theWords = \lyricmode {

}

theNotes = \transpose f b \theNotesTS
theChords = \transpose f b \theChordsTS

\book {
  \tabA
  \bookOutputSuffix "TSax"
  \header {
    instrument = \markup \with-color "tomato" "Tenor Sax"
  }
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


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


%{
convert-ly (GNU LilyPond) 2.25.4  convert-ly: Processing `'...
Applying conversion: 2.25.0, 2.25.1, 2.25.3, 2.25.4
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12
%}
