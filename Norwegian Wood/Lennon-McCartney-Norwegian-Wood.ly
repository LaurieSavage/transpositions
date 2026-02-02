\version "2.24.4"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
}

layoutScore = \layout {
  indent = 15\mm
}

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
  title = "Norwegian Wood"
  composer = "Lennon & McCartney"
}

global = {
  \time 3/4
  \key g \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \transpose g c { \chordmode {
  \global

  g2.
  f2./g
  g
  f/g
  c
  f/g
  g2.*2

  g2.
  f2./g
  g
  f/g
  c
  f/g
  g2.*2

  g2.*4:m
  c2.*4
  g2.*4:m
  a2.*2:m7
  d2.*2:7
  % g2.
  %   f2./g
  %   g
  %   f/g
  %   c
  %   f/g
  %   g2.*2
  %
  %   g2.
  %   f2./g
  %   g
  %   f/g
  %   c
  %   f/g
  %   g2.*2

                              }
}


melody =\transpose g c' { \relative c'' {
  \global
  \repeat volta 2
  {
    d2.
    e4 d c
    b2.
    a4 c b
    g2.
    f4 c' e,
    d2.~
    d2. \break

    d'2.
    e4 d c
    b2.
    a4 c b
    g2.
    f4 c' e,
    d2.~
    d2^"Fine" g4 \bar "||"  \break

    % Bridge
    d'4 d d
    d c c
    c bes bes
    bes c4. bes8
    c2.~
    c2.~
    c2.~
    c2
    d,4 \break
    d' d d
    d c c
    c bes bes
    bes c4. bes8
    c2.~
    c2.
    r4 d8 d d4
    d d d
    \override Score.RehearsalMark.self-alignment-X = #RIGHT
    \mark "D.C. al Fine"
  }
  % \break

  % reprise
  % d2.
  %   e4 d c
  %   b2.
  %   a4 c b
  %   g2.
  %   f4 c' e,
  %   d2.~
  %   d2. \break
  %
  %   d'2.
  %   e4 d c
  %   b2.
  %   a4 c b
  %   g2.
  %   f4 c' e,
  %   d2.~
  %   d2 r4 \bar "|."


                         }
}

versOne = \lyricmode {
  \set stanza = "1. "
  I once had a girl,
  or should I say
  she once had me;__
  She showed me her room,
  is -- n't it good
  Nor -- we -- gian Wood?

  She asked me to  stay and she told me to sit an -- y -- where
  So I looked a -- round and I no -- ticed there was -- n't a chair__
  _ _ _ _ _ _
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  I sat on a rug
  bi -- ding my time,
  drink -- ing her wine.
  We talked un -- til two
  and then she said
  'It's time for bed'

  She told me she worked in the mor -- ning and start -- ed to laugh
  I told her I did -- n't and crawled off to sleep in the bath.
  _ _ _ _ _ _

}

verseThree = \lyricmode {
  \set stanza = "3. "
  And when I a -- woke
  I was a --  lone
  this bird had flown
  So I lit a fire,
  is -- n't it good
  Nor -- we -- gian Wood?
}


\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      %\new Staff { \melody }
      \new Staff \with { instrumentName = "C insts." } {\melody}
      \addlyrics { \versOne}
      \addlyrics { \verseTwo }
      \addlyrics { \verseThree }
    >>

    \layoutScore
    %\midi { }
  }
}

\book {
  \bookOutputSuffix "Bb"
  \header {
    instrument = \markup {"B" \flat " Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff\with { instrumentName = "Bflat insts." }   \transpose bes c' \melody
      \addlyrics { \versOne}
      \addlyrics { \verseTwo }
      \addlyrics { \verseThree }
    >>
    \layoutScore
  }
}

\book {
  \bookOutputSuffix "Eb"
  \header {
    instrument = \markup {"E" \flat " Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Eflat insts." } \transpose ees c' \melody
      \addlyrics { \versOne}
      \addlyrics { \verseTwo }
      \addlyrics { \verseThree }
    >>
    \layoutScore
  }
}




%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
