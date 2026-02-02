\version "2.25.28"

%\include "LilyJAZZ.ily"
%\include "AccordsJazzDefs.ily"
\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest #'stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest #'thickness = #0.48
            \override Rest #'slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest #'stencil
          #}
          )

%{
\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  % #(define fonts
  %      (set-global-fonts
  %       #:roman "LilyJAZZ Text"
  %       #:sans "Nimbus Sans, Nimbus Sans L"
  %       #:typewriter "DejaVu Sans Mono"
  %       ; unnecessary if the staff size is default
  %       #:factor (/ staff-height pt 20)
  %       ))
}

\header {
  title = "Poinciana"
  subtitle = "The song of the tree"
  subsubtitle = "Female Vocal"
  composer = "Buddy Bernier/Nat Simon"
  piece = "Cuban"
  copyright = "1936"
  tagline = \markup{"Paradiso Connection - Edited by L.S. " \today}
}
%}

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
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Poinciana"
composer = #"- Bernier & Simon"
meter = #" (Cuban / (Bolero?))"

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
  dedication = "Female Key"
  title = \realBookTitle
  subtitle = "(Song of the Tree)"
  copyright = "1936"
  tagline = \markup{"Edited by L.S. " \today}
}


global = {
  \time 4/4
  \key g \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \set Score.startRepeatBarType = #"[|:"
  \set Score.endRepeatBarType = #":|]"
}


chordsIntro = \transpose g ees {
  \chordmode {
    \global
    % Interlude
    \repeat volta 2 {
      d1*4:sus4.9
      d1:sus4.9
      d1:9
      \alternative {
        {
          g1:6.9
           s1
        }
        {
          g1.:6.9
          d2:sus4.9
        }
      }
    }
  }
}

chordsVerse = \transpose g ees {
  \chordmode {
    % Melody
     s1
    \repeat volta 2 {
      g1*2:maj
      g1:sus4.9
      g1:9
      f1:sus4.9
      f1:9

      \alternative {
        {
          g1.:maj
          d2:sus4.9
        }
        {
          g1*2:maj
        }
      }
    }
  }
}

chordsBridge = \transpose g ees {
  \chordmode {
    % Bridge
    ees1*2:maj
    d1*2:maj
    c1*2:m7
    a1:m7
    d1:7

    g1*2:maj
    g1:sus4.9
    g1:9
    f1:sus4.9
    f1:9
    g1*2:maj
  }
}

chordsOutro = \transpose g ees {
  \chordmode {
    % Interlude
     s1
    \repeat volta 2 {
      d1*4:sus4.9
      d1:sus4.9
      d1:9
      \alternative {
        {
          g1*2:6.9
        }
        {
          g1*2:6.9
        }
      }
    }
  }
}

Intro = \transpose g ees' {
  \relative c'' {
    \global
    %\jazzOn
    \revert Score.BarNumber.stencil
    % Introduction
    \section
    \sectionLabel "Intro - play once at start"
    \repeat volta 2 {
      % \showStartRepeatBar \bar "[|:-|"
      d,1~
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
      \alternative {
        {
          g1~ g
        }
        {
          g1~ g4 r4 d'4. b8 \break
        }
      }
    }
  }
}

ASection = \transpose g ees' {
  \relative c' {
    \global
    % Melody
     s1
    \section
    \sectionLabel "Verse"
    \repeat volta 2 {
       %\showStartRepeatBar \bar "[|:-|"
      a2 a2~
      a8 g a b d b a g
      f1~
      f1 \break
      ees2 ees2~
      ees8 ees f g bes g f ees
      \alternative{
        {
          d1~
          d2 d'4. b8 %\break
        }
        {
          d,1~
          d2. r8 d8
        }
      }
    }
  }
}

BSection = \transpose g ees' {
  \relative c' {
    \global
    \section
    \sectionLabel "Bridge"
    ees,8 f g a bes4. a8
    (c4.) bes8 a g f g

    a4 a2.~
    a2. r8 d,8 \break
    ees8 f g a (bes4.) a8
    c4. bes8 a g f g
    d'1~
    d2 d4. b8 \break
    \section
    \sectionLabel "Reprise"
    a2 a2~
    a8 g a b d b a g
    f1~
    f1 \break
    ees2 ees~
    ees8 ees f g bes g f ees
    d1~
    d2. r4 \break
  }
}

Outro = \transpose g ees' {
  \relative c' {
    \global
    % Interlude
     s1
    \section
    \sectionLabel "Outro - only play at the end"
    \repeat volta 2 {
       %\showStartRepeatBar \bar "[|:-|"
      d1~
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
      \alternative {
        {
          g1~ g
        }
        {
          g1~ g
        }
      }
    }
    \bar "|."
  }
}

interlude = \lyricmode {
  Blow __ Tro -- pic wind __
  Sing a song __
  Through the trees __

  Trees __ Sigh to me __
  Soon my love __
  I will see __
  Poin -- ci
}

verse = \lyricmode {
  an -- a __
  Your bran -- ches speak to me of love
  Pale moon is cast -- ing sha -- dows from ab -- ove __

  Poin -- ci -- an -- a __
  Some -- how I feel the jung -- le beat __
  Within me, there grows a rhyth -- mic, sav -- age
  Beat __
  Love
}

Bridge = \lyricmode {
  is ev -- er -- y -- where, its __ mag -- ic per -- fume fills __ the air __
  To and fro, you sway, my heart's in time
  I've learned to care __

  Poin -- ci -- an -- a __
  Though skies may turn from blue to gray __
  My love will live for ev -- er and a day __
}

InterludeTwo = \lyricmode {
  Blow __ Tro -- pic wind __
  Sing a song __
  Through the trees __

  Trees __ Sigh to me __
  Soon my love __
  I will see __
}

\book {
  \bookOutputSuffix "Vcl"
  \header {
    instrument = "Vocalist"
  }
  \score {
    <<
      \new ChordNames \unfoldRepeats { \chordsIntro }
      \new Voice = Interlude \unfoldRepeats { \Intro }
      \new Lyrics \lyricsto Interlude \interlude
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>

    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames \unfoldRepeats { \chordsVerse }
      \new Voice = VerseOne \unfoldRepeats { \ASection }
      \new Lyrics \lyricsto VerseOne \verse
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
    \Staff
    \RemoveEmptyStaves
  }
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames \unfoldRepeats { \chordsBridge }
      \new Voice = VerseTwo \unfoldRepeats { \BSection }
      \new Lyrics \lyricsto VerseTwo \Bridge
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames \unfoldRepeats { \chordsOutro }
      \new Voice = Outro \unfoldRepeats { \Outro }
      \new Lyrics \lyricsto Outro \InterludeTwo
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>

    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert"
  }
  \score {
    <<
      %\context FretBoards { \chordsIntro }
      \new ChordNames  { \chordsIntro }
      \new Voice = Interlude  { \Intro }
      %\new Lyrics \lyricsto Interlude \interlude
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>

    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames  { \chordsVerse }
      \new Voice = VerseOne  { \ASection }
      %\new Lyrics \lyricsto VerseOne \verse
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames  { \chordsBridge }
      \new Voice = VerseTwo  { \BSection }
      %\new Lyrics \lyricsto VerseTwo \Bridge
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames  { \chordsOutro }
      \new Voice = Outro  { \Outro }
      %\new Lyrics \lyricsto Outro \InterludeTwo
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
}

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c' { \chordsIntro }
      \new Voice = Interlude \transpose bes c' { \Intro }
      %\new Lyrics \lyricsto Interlude \interlude
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c' { \chordsVerse }
      \new Voice = VerseOne \transpose bes c' { \ASection }
      %\new Lyrics \lyricsto VerseOne \verse
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c' { \chordsBridge }
      \new Voice = VerseTwo \transpose bes c' { \BSection }
      %\new Lyrics \lyricsto VerseTwo \Bridge
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c' { \chordsOutro }
      \new Voice = Outro \transpose bes c' { \Outro }
      %\new Lyrics \lyricsto Outro \InterludeTwo
      %\addlyrics { \interlude \verseOne \verseTwo \interlude }
    >>
    \layout {
      \context {
        \Score
        \override CodaMark.color = #red
        \override SegnoMark.color = #red
        \override SectionLabel.color = #red
        \override RehearsalMark.font-size = #6
        \override RehearsalMark.color = #red
      }
    }
  }
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `' __
Applying conversion: 2.20.0
%}
