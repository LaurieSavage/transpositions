\version "2.25.28"

%#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"The Glory of Love"
composer = #"- Billy Hill "
meter = #" ( Medium Swing )"

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
  tagline = \markup { "QOTW - edited by L.S. " \today }
}

theNotes = \relative c' {
  \set Staff.midiInstrument = "flute"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \set Score.startRepeatBarType = #"[|:"
  \set Score.endRepeatBarType = #":|]"
  \key g \major
  %\showStartRepeatBar \bar "[|:-|"
  \partial 2
  r8. d16 e8. d16
  \repeat volta 2 {
    \mark \default
    b'4. g8 e8 d4.
    c'4. a8 fis8 d4.
    r8. d'16 d8.d16 d4 d4
    d4. c8 g8 e4.
    r4 b'8. ais16 b8. a16 g4
    r4 a8. gis16 a8. g16 fis4
    g1~
  }
  \alternative {
    {
      g4 r4 r8. d16 e8. d16
    }
    {
      g4 \repeatTie r4 r4 g4
    }
  }

  \section
  \mark \default
  c8 r8 r8 b8 c8 r8 r8 d8
  e8 d c r8 r8 g c e
  d4 d e cis
  d2~ d8 r8 g,4
  c8 r r b c r r d
  ees d c r r2
  r8. b16 b8. b16 b4 g4
  a2~ a8 r16 d,16 e8. d16

  \section
  \mark 1
  b'4. g8 e8 d4.
  c'4. a8 fis8 d4.
  r8. d'16 d8.d16 d4 d4
  d4. c8 g8 e4.
  r4 b'8. ais16 b8. a16 g4
  r4 a8. gis16 a8. g16 fis4
  g1~
  g2. r4 \fine
}

theChords = \chordmode {
  \partial 2
  s2
  \repeat volta 2 {
    g1
    d1:7
    g2 g2:7
    c1
    g1
    d1:7
    g2 e2:m7
  }
  \alternative {
    {
      a4:m7 d2.:7
    }
    {
      g2 g2:7
    }
  }

  %% B
  %%%%%%%%%%%%

  c1*2
  g2 g2:dim7
  g2. g4:7
  c1*2:m
  a1:7
  d1:7

  %% A'
  %%%%%%%%%%
  g1
  d1:7
  g2 g2:7
  c1
  g1
  d1:7
  g2 c2:m7
  g1


}

theWords = \lyricmode {

}

theChordsTransG = \transpose a d \theChords
theNotesTransG = \transpose a d' \theNotes

\score {
  <<
    \new ChordNames \theChordsTransG
    \new Voice = soloist \theNotesTransG
    %\new Lyrics \lyricsto soloist \theWords
  >>
  \layout {
    %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    \override Score.Clef.break-visibility = #'#(#f #f #f)
    \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
    \context {
      \Score
      \override CodaMark.color = #red
      \override SegnoMark.color = #red
      \override SectionLabel.color = #red
      %\override SectionLabel.font-size = #3
      %\override RehearsalMark.font-size = #3
      \override RehearsalMark.color = #red
    }
  }
  %  \midi {
  %   \tempo 4 = 88
  %  }
}

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \theChordsTransG
      \new Voice = soloist \transpose bes c'  \theNotesTransG
      %\new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        %\override SectionLabel.font-size = #3
        %\override RehearsalMark.font-size = #3
        \override RehearsalMark.color = #red
      }
    }
    %  \midi {
    %   \tempo 4 = 88
    %  }
  }
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument = "Baritone Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \theChordsTransG
      \new Voice = soloist \transpose ees c'  \theNotesTransG
      %\new Lyrics \lyricsto soloist \theWords
    >>
    \layout {
      %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
      \override Score.Clef.break-visibility = #'#(#f #f #f)
      \override Score.KeySignature.break-visibility = #'#(#f #f #f)  % make only the first time signature visible
      \override Score.SystemStartBar.collapse-height = #1  % allow single-staff system bars
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        %\override SectionLabel.font-size = #3
        %\override RehearsalMark.font-size = #3
        \override RehearsalMark.color = #red
      }
    }
    %  \midi {
    %   \tempo 4 = 88
    %  }
  }
}