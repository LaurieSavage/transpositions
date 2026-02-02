\version "2.24.4"

%#(set-global-staff-size 24)

%\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"
%\include "interlude.ly"

%\override Segno.color = "Red"

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
  markup-system-spacing = #'((basic-distance . 13)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Gibraltar"
composer = #"- Freddie Hubbard"
meter = #" ( 185 )"

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
  piece = \markup {
    \fontsize #4
    \larger "Solos over A-A-B-Interlude"
  }
  tagline = \markup { "Paradiso Connection - edited by L.S. " \today }
}

theNotes = \relative c' {
  \set Staff.midiInstrument = "flute"
  \set Score.startRepeatBarType = #"[|:"
  \set Score.endRepeatBarType = #":|]"
  %\set Score.markFormatter = #red

  \accidentalStyle modern-cautionary
  \key f \major
  %\showStartRepeatBar \bar "[|:-|"
  \section
  \sectionLabel \markup { \with-color #red "Latin Intro, until horns wake up" }
  \repeat percent 3 { s1 s1 } s1
  r4 g'4-^ bes8 (d4-.) c8~ \break

  \repeat volta 2 {
    \section
    \sectionLabel \markup { \with-color #red \fontsize #6 \box "A" }
    \repeat volta 2 {
      c1~_"Latin"^ \markup {
        \with-color #red \larger \larger
        \segno
      }
      c1~
      c1~
      c4 g8 ( a_"Rall. last time ..." bes c d bes \break
      c_"contnue rall ...." a f d~) d2~ \fine
      d1~
      d1~
    }
    \alternative {
      \volta 1 {
        d4 g4-^ bes8 (d4-.) c8 \laissezVibrer
      }
      \volta 2 {
        d,4\repeatTie f8 ( g bes c d f ) \break
      }
    }
    \section
    \sectionLabel \markup { \with-color #red \fontsize #6 \box "B" }
    g4._"Swing" f8 ees ( d4-.) cis8~
    cis2. c8 (bes)
    f'4. f8 ees (f4-.) c8~ \break
    c4._"Stop" bes8 \tuplet 3/2 { c16 (des c } bes8 g f)
    g1~_"Latin"
    g2 \tuplet 3/2 { c16 (des c } bes8 g f)
    g8 (bes) r4 r2
  }
  \alternative {
    { r4 g4-^ bes8 (d4-.) c8 \laissezVibrer _"D.S." }% \break
    { R1 \pageBreak }
  }

  %{
  \section
  \sectionLabel \markup { \box "A2" }
  \repeat volta 2 {
    c1~_"Latin"
    c1~
    c1~
    c4 g8 ( a bes c d bes \break
    c a f d~) d2~
    d1~
    d1~
  }
  \alternative {
    {
      d4 g4-^ bes8 (d4-.) c8 \laissezVibrer
    }
    {
      d,4\repeatTie r4 r2 \break
    }
  }
  %}

  \section
  \sectionLabel \markup { \with-color #red "Interlude (steady pulse, legato)" }
  d,2. d4 (f2 g2) g4. (d8~ d2~ d1) \break
  f2. f4 (aes2 bes2) bes4. ( f8~ f2~ f2. ) f4( \break
  aes2.) aes4( b2 des2) des4. (aes8~ aes2~ aes2.) aes4_^ \break
  b2. b4 (d2 e2) e2 b4. c8~
  c4 g4-^ bes8 (d4-.) c8~ \break


  \section
  \sectionLabel \markup { \with-color #red \fontsize #6 \box "A" }
  \repeat volta 2 {
    c1~_"Latin"
    c1~
    c1~
    c4 g8 ( a bes c d bes \break
    c a f d~) d2~
    d1~
    d1~
  }
  \alternative {
    {
      d4 g4-^ bes8 (d4-.) c8 \laissezVibrer
    }
    {
      d,4\repeatTie f8 ( g bes c d f ) \break
    }
  }
  \section
  \sectionLabel \markup { \with-color #red \fontsize #6 \box "B" }
  g4._"Swing" f8 ees ( d4-.) cis8~
  cis2. c8 (bes)
  f'4. f8 ees (f4-.) c8~
  c4._"Stop" bes8 \tuplet 3/2 { c16 (des c } bes8 g f) \break
  g1~_"Latin"
  g2 \tuplet 3/2 { c16 (des c } bes8 g f)
  g8 (bes) r4 r2_"To Solos"
  R1_\markup { \with-color #red"D.S al Fine" } \bar "||"
}

theChords = \chordmode {
  \repeat percent 3 {g1:m c1:7}
  g1:m c1:7

  \repeat volta 2 {
    \repeat volta 2 {
      g1:m c1:7
      g1:m c1:7
      g1:m c1:7
      g1:m
    }
    \alternative {
      {
        c1:7
      }
      {
        c2:7 bes2:7.9+
      }
    }
    ees1:maj
    a1:7.9+
    aes1:maj
    d1:7.9+

    g1:m c1:7
    g1:m
  }
  \alternative {
    { c1:7 }
    { c1:7 }
  }

  %{
  \repeat volta 2 {
    g1:m c1:7
    g1:m c1:7
    g1:m c1:7
    g1:m
  }
  \alternative {
    {
      c1:7
    }
    {
      c1:7
    }
  }
  %}

  %% Interlude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  d1*4:m
  f1*4:m
  aes1*4:m
  b1*3:m g4:m r2.

  %% Reprise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \repeat volta 2 {
    g1:m c1:7
    g1:m c1:7
    g1:m c1:7
    g1:m
  }
  \alternative {
    {
      c1:7
    }
    {
      c2:7 bes2:7.9+
    }
  }
  ees1:maj
  a1:7.9+
  aes1:maj
  d1:7.9+

  g1:m c1:7
  g1:m c1:7
}


theWords = \lyricmode {

}

\score {
  <<
    \new ChordNames \theChords
    \new Voice = soloist \theNotes
    %\new Lyrics \lyricsto soloist \theWords
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

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = "Tenor Sax/Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \theChords
      \new Voice = soloist \transpose bes c' \theNotes
      %\new Lyrics \lyricsto soloist \theWords
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
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument = "Alto/Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \theChords
      \new Voice = soloist \transpose ees c \theNotes
      %\new Lyrics \lyricsto soloist \theWords
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
}

%{
convert-ly (GNU LilyPond) 2.25.11  convert-ly: Processing `'...
Applying conversion: 2.25.0, 2.25.1, 2.25.3, 2.25.4, 2.25.5, 2.25.6,
2.25.8, 2.25.9, 2.25.11
%}
