\version "2.24.4"

%#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = percent-repeat-item-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
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

title = #"Painted On Canvas"
composer = #"- Gregory Porter"
meter = #" ( med. waltz )"

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
  arranger = "Suggested by an arrangement by Kerry Marsh"
  tagline = \markup { "Queens of the West - edited by L.S. " \today }
}

theNotes = \relative c' {
  \set Staff.midiInstrument = "flute"
  \key c \minor
  \time 3/4
  %\showStartRepeatBar \bar "[|:-|"
  \sectionLabel \markup \box { \huge \larger Intro }
  \repeat unfold 7 {s2.}
  s2. \bar "||"
  \break

  \section
  \sectionLabel \markup \box { \huge \larger A }
  f8 g4. ees4 |
  f4 g d
  r4 f8 g bes4
  aes4 g8 ees~ ees4~| \break
  ees4 c8 d bes4
  c4 d bes8 c~
  c2 r4|

  r2 r8 ees \break
  f8 g4. ees4 |
  f8 g4 r8 d4
  f4 g bes
  aes8 g ees4  r4| \break
  ees4 c4. bes8
  c4. d4 bes8
  c2 r4|
  \tuplet 4/3 { aes'4 g f ees  }
  \break

  \section
  \sectionLabel \markup \box { \huge \larger B }
  %\repeat volta 2 {
  c4 (ees) c
  g'2.~
  g2 r4
  aes8 g f4. ees8\break
  c8 ees~ ees4. c8
  g'4 (f2)~
  f2 r4
  aes8 [g] f4 ees4 \break
  c4. ees8 r8 c8
  g'2.~
  g2 r4
  aes8 g f4 ees \break
  b4. ees8~ ees16 f8.
  g4.~  g4 (ees8)
  (f2.)
  r2 r8 ees  \break

  \section
  \sectionLabel \markup \box { \huge \larger C }
  f4 g4. ees8
  f4 g r8 ees8
  f4 g8 bes4.
  aes8 g ees4 r8 bes8\break
  c8 d4. bes4
  c4. d8~ d16 bes8.
  c2 r4
  r2 ees4\break

  f4 g ees
  f4 g r8 ees
  \tuplet 3/2 { f4 g aes~ } aes4
  \tuplet 3/2 { aes4 g ees~ } ees8 r8 \break
  c8 d4.bes4
  c8 d4. bes4
  c2 r4
  \tuplet 4/3 { aes''4 g f ees }
  \break

  \section
  \sectionLabel \markup \box { \huge \larger D }
  c4 (ees) c
  g2.~
  g2 r4
  aes8 g f4. ees8 \break
  bes'8 g~ g4. ees8
  f2.~
  f2 r4
  aes8 g f4 ees
  c4. ees8 r8 c
  g'2.~
  g2 r4 \break
  aes8 g f4 ees
  b4. ees8~ ees16 f8.
  ges4 (f8 ees g ees
  f2.)
  R2.
  \break

  \section
  \sectionLabel "Interlude"
  <f d>4 <g ees> <ees bes>
  <f d>4 <g ees>4. <ees bes>8
  <f d>4 <g ees>8 <bes g>4.
  <aes f>4 <g ees>8 <ees bes>~ <ees bes>4 \laissezVibrer
  \bar "|."

  %}
}

theChords = \chordmode {
  ees2.*4:maj7
  c2.*4:min7

  % \repeat volta 2 {
  ees2.*4:maj7
  c2.*4:min7

  ees2.*4:maj7
  c2.*3:min7
  bes4.:m7 ees4.:13

  aes2.*4:maj13
  f2.*3:min9
  bes4.:m7 ees4.:13

  aes2.*4:maj13
  des2.*4:13.11+

  ees2.*4:maj7
  c2.*4:min7

  ees2.*4:maj7
  c2.*3:min7
  bes4.:m7 ees4.:13

  aes2.*4:maj7
  f2.*3:min11
  bes4.:m7 ees4.:13

  aes2.*4:maj7
  des2.*4:13.11+

  R2.*4
}

theWords = \lyricmode {

  We are like chil -- dren, we're paint -- ed on can -- vas -- es __
  pic -- kin' up shades as we go. __
  We start off with ges -- so, brushed on by peo -- ple we know.
  Watch your tech -- nique as you go
  Step back and ad -- mire __ my view __
  Can I use the col -- ors I choose? __
  Do I have some say what you use? __
  Can I get some greens and some blues? __
  we're made by the pig -- ment of paint that is put up -- on.
  Our sto -- ries are told by __ our hues.
  Like Mot -- ley and Bear -- den,
  those mas -- ters of __ peace and light,
  lay -- ers of col -- ors and time.

  Step back and ad -- mire my view __
  Can I use the col -- ors I choose? __
  Do I have some say what you use? __
  Can I get some green in my blues? __

  We're just like chil -- dren, we're paint -- ed on can -- vas -- es __
}

melody = \transpose bes a { \theNotes }
Newchords = \transpose bes a { \theChords }

\score {
  <<
    \new ChordNames \Newchords
    \new Voice = soloist \melody
    \new Lyrics \lyricsto soloist \theWords
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
  \bookOutputSuffix "TenorSax"
  \header {
    instrument = "Tenor/Soprano sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \Newchords
      \new Voice = soloist \transpose bes c' \melody
      \new Lyrics \lyricsto soloist \theWords
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