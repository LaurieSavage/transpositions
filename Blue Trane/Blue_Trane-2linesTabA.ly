\version "2.24.4"

%#(set-global-staff-size 22)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "swing.ly"
\include "TabA.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))
title = #"Blue Trane"
composer = #"- John Coltrane "
meter = #" ( Med. Swing )"

\tabA


%{
realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \with-color "tomato"
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
      %ragged-right = ##f
    }
  }
}
%}

\header {
  title = \markup \with-color "tomato" { \title }
  instrument = "B flat horns"
  composer = \markup \with-color "tomato" { \composer }
  meter = \markup \with-color "tomato" { \meter }
  tagline = \markup{ \with-color "tomato" \small{ "Paradiso Connection - edited L.S., " \today }}
}

global = {
  \time 4/4
  \key f \major
}

theChords = \chordmode {
  s4 s2
  \repeat volta 2 {
    | f1*4:7.9+
    bes1*2:7.11+ | f1*2:7.9+
    c1*2:7.9+

    \volta 1 {f1*2:7.9+}
    \volta 2 {f1*2:7.9+}

  }
}

theNotesMelody = \relative c'' {
  \global
  \partial 2.
  r8 c \stemUp ees g ees f~
  \repeat volta 2 {
    f1 | r4 r8 c ees g ees f~ | f1 | \break
    r4 r8 f, aes c aes bes~ |bes1 | r4 r8 c ees g ees f~ | f1 \break
    r4 r8 c ees aes f ees~ | ees1 | r4 r8 c ees g ees f~ | f1
    \alternative {
      \volta 1 { r4 r8 c ees g ees f\laissezVibrer }
      \volta 2 { R1 }
    }
  }
}

theNotesHarmony = \relative c'' {
  \global
  \partial 2.
  r8 r8 r2
  \repeat volta 2 {
    c1^\markup \with-color "tomato" { "Unison 1st time, harmony on rpt." } | r4 r8 g bes d bes c~ | c1 |
    r4 r8 c, ees g ees f~ | f1 | r4 r8 g bes d bes c~ | c1 |
    r4 r8 g bes ees c bes~ | bes1 | r4 r8 g bes d bes c~ | c1 |
    \alternative {
      \volta 1 { r4 r8 g^\markup \with-color "tomato" { "Play 1st time" } bes d bes c\laissezVibrer }
      \volta 2 { R1 }
    }
  }
}

\score {
  <<
    \new ChordNames \theChords
    \new Staff
    \with {
      midiInstrument = "flute"
      instrumentName = "Part I "
      shortInstrumentName = "I "
    }
    \tripletFeel 8 \theNotesMelody

    \new Staff
    \with {
      midiInstrument = "flute"
      instrumentName = "Part II "
      shortInstrumentName = "II "
    }
    \tripletFeel 8 \theNotesHarmony
  >>

  \layout {
    indent = 10
    ragged-right = ##f
  }

  \midi {
    %\applySwing
    \tempo 4 = 150
  }
}

\book {
  \tabA
  \bookOutputSuffix "TabA"
  \score {
    <<
      \new ChordNames \theChords
      \new Staff
      \with {
        midiInstrument = "flute"
        instrumentName = "Part I "
        shortInstrumentName = "I "
      }
      \tripletFeel 8 \theNotesMelody

      \new Staff
      \with {
        midiInstrument = "flute"
        instrumentName = "Part II "
        shortInstrumentName = "II "
      }
      \tripletFeel 8 \theNotesHarmony
    >>

    \layout {
      indent = 10
      ragged-right = ##f
      %ragged-bottom = ##t
    }

    \midi {
      %\applySwing
      \tempo 4 = 150
    }
  }
}
%{
convert-ly (GNU LilyPond) 2.25.4  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12
%}
