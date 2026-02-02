\version "2.24.4"

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "swing.ly"

\paper {
  %top-margin = 10\mm
  left-margin = 10\mm
  right-margin = 10\mm
  bottom-margin = 10\mm
  %\override  #'(font-name . "lilyjazz Text")
  #(define fonts
     (set-global-fonts
      #:roman "lilyjazz Text"
      #:sans "Nimbus Sans, Nimbus Sans L"
      #:typewriter "DejaVu Sans Mono"
      ; unnecessary if the staff size is default
      #:factor (/ staff-height pt 20)
      ))
}

layoutScore = \layout {
  indent = 15\mm
}

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
  title = "I'm Hip"
  poet = "Dave Frishberg"
  composer = "Bob Dorough"
  piece = "Swing"
  tagline = "Queens of the West"
  copyright = \today
}

global = {
  \time 4/4
  \key c \major
  \accidentalStyle modern-cautionary
  \tempo 4 = 150
  %\mark \jazzTempoMarkup #"Swing Waltz" c4 #"140"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  %\override MultiMeasureRest.expand-limit = #3
}


VerseOne = \lyricmode {
  \override Lyrics.LyricText.font-name = #"lilyjazz Text"
  I'm hip, I'm no square
  I'm a -- lert, I'm a -- wake, I'm a -- ware
  I am al -- ways on the scene
  Mak -- in' the rounds, dig -- gin' the sounds
  I read Play -- boy mag -- a -- zine 'cause I'm hip I
}

VerseTwo = \lyricmode {
  \override Lyrics.LyricText.font-name = #"lilyjazz Text"
  _ dig, I'm in step
  When it was hip to be hep, I was hep
  I don't blow but I'm a fan
  Look at me swing, ring a ding ding
  I ev -- en call my girl -- friend _ _ _ _'Man',

  I'm so hip
  Ev -- er -- y Sat -- ur -- day night
  With my suit but -- toned tight and my suedes on
  I'm get -- tin' my kicks
  Wat -- chin' Ar -- ty French flicks with my shades on
  I'm too much I'm a gas
  I am an -- y -- thing but mid -- dle class

  When I hang around the band
  Pop -- pin' my thumbs, dig -- gin' the drums

  Squares don't seem to un -- der -- stand
  Why I flip, they're not hip like I'm hip
}


VerseThree = \markup {
  \column \fontsize #4 \override#'(font-name . "lilyjazz Text")
  {
    \line { \vspace #2 \hspace #4 "Verses 3/4  "}
  }
  \vspace #4
  \hspace #10
  \column \fontsize #2 \override#'(font-name . "lilyjazz Text")
  {
    \vspace #2
    \line { I'm hip, I'm alive }
    \line { I enjoy any joint where there's jive}
    \line { I'm on top of every trend }
    \line { Look at me go vo dee o do}
    \line { Bobby Darin knows my friend }
    \line {\vspace #1 }
    \line { I'm so hip }
    \line { I'm hip but not weird }
    \line { Like you notice, I don't wear a beard }
    \line { Beards were in but now they're out }
    \line { They had their day now they're passe }
    \line { Just ask me if you're in doubt, 'cause I'm hip }
    \line { Now whatever the fads }
    \line { And whatever the ads say }
    \line { It's needs fill }
    \line { I'll be keeping abreast }
    \line { Out in front of the rest with elites ville }
    \line { 'Cause I'm cool as a cuke }
    \line { I'm a cat, I'm a card, I'm a kook, kook }
    \line { I get so much out of life }
    \line { Really, I do skoo ba doo boo }
    \line { One more time play 'Mack the knife' }
    \line { Let 'er rip, I may flip, but I'm hip }
    \line { Ooh, I'm hip, ooh, I'm hip }
    \line { Skoo ba doo boo, doo boo, doo boo }
    \line { Boo doo boo doo doo doo }
  }
}
%}

chordNames = \chordmode {
  %% A Section
  s4
  \repeat volta 2 {
    bes2:maj7 f2:7 |
    bes2:maj7 f2:7 |
    bes2:maj7 f2:7 |
    bes2:maj7 a4:m7.5- d4:aug7 |
    g2:m g2:m/f |
    e1:m7 |
    ees1:m7 |
    ees1:m7 |
    d1:m7 |
    s2 g2:7 |
  }
  \alternative {
    {
      c2:7 c2:aug7 |
      f2:9 f2:aug7 |
    }
    {
      g2:m7 a2:7 |
      aes2:7 ees2:7 |
    }
  }

  %% Bridge
  aes2:maj7 bes2:m7 |
  b2:dim aes2:maj7/c |
  ees2:min6 a2:m7 |
  cis2:m7 e2:7 |
  a2:maj7 b2:m7 |
  c2:dim a2:maj7/cis |
  e2:m6 bes2:m7 |
  d2:m7 f2:6 |

  %% C section (Reprise)
  bes2:maj7 f2:7 |
  bes2:maj7 f2:7 |
  bes2:maj7 f2:7 |
  bes2:maj7 a4:m7.5- d4:aug7 |
  g2:m g2:m/fis |
  e1:m7 |
  ees2:m7 aes2:7 |
  ees2:m7 aes2:7 |
  d1:m7/g |
  s2 g2:7 |
  c2:7 c2:aug7 |
  f2:9sus4 f2:9.5+ |
  bes4:6 d4:m7 des2:dim |
  c2 f2 |
}

melody = \relative c'' {
  \global
  
  \revert Score.BarNumber.stencil
  \partial 4
  des4
  \repeat volta 2 {
    \mark \default
    a4 r4 \tuplet 3/2 { r4 c des } |
    a4 r4 r8 c4 des8 |
    a8 c des a~ a c des a~ |
    a4 r4 r8 a8 bes4 | %\break
    fis4 g bes8 d4 fis8~ |
    fis2 r2 |
    f8 ees des bes~ bes4 f'8 e |
    des8 bes4. r2 | %\break
    e4 e e d |
    e8 d4 e8~ e g, a4 |
  }
  \alternative {
    {
      c4 r4 r2 |
      r2 r8 des4. | %\break
    }
    {
      c4 r4 r2 |
      r8 c4 aes8 c bes aes g~ \bar "||"|
    }
  }

  %% Bridge
  \mark \default
  g4 r4 r8 aes4 f8 |
  g4 aes8 f g aes c ees~ | %\break
  ees4. c8~ c2 |
  r8 cis4. cis8 b a gis |
  gis4 r4 r8 a4 fis8 |
  gis8 a fis gis~ gis a cis e~ | %\break
  e4. cis8~ cis2 |
  r2 cis8 d4. \bar "||"

  %% C section
  \mark \default
  a4 r4 \tuplet 3/2 { r4 c des } |
  a4 r4 r8 c4 des8 | %\break
  a8 c des a a c d a~ |
  a4 r4 a bes |
  fis4 g bes8 d4 fis8 |
  fis2 r2 | %\break
  f8 ees des bes~ bes2 |
  f'8 ees des bes~ bes2 |
  e4 e e d |
  e4 d8 e~ e g, a c~ | %\break
  c4 r4 r8 c8 d f~ |
  f4 r4 r8 f,8 g4 |
  bes4 r4 r2 |
  R1 \bar "|."
}

%{ \score {
  <<
    \new ChordNames \with {
      midiInstrument = #"rock organ"
      midiMaximumVolume = #0.7
    } { \chordNames }
    \new ChordNames \with {
      midiInstrument = #"electric guitar (jazz)"
      midiMaximumVolume = #0.7
    } { \chordNames }
    \new Staff \with {midiInstrument = #"clarinet"} { %\swingIt #'8
      \tripletFeel 8
      << \transpose c c \melody >>
    }
    \new Staff \with {midiInstrument = #"flute"} {
      \tripletFeel 8
      << \transpose c c, \melody >>
    }
    \new Staff \with {midiInstrument = #"trombone"} {
      \tripletFeel 8
      << \transpose c c, \melody >>
    }
  >>
  \midi {}
}
%}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "C insts." } { \melody }
      \addlyrics \VerseOne
      \addlyrics \VerseTwo
    >>
    \layoutScore
  }
  \VerseThree
}

\book {
  \header {
    instrument = "Tenor Sax"
  }
  \bookOutputSuffix "Bflat"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff %\with { instrumentName = "Bb Horns" }
      \transpose bes c' \melody
      \addlyrics \VerseOne
      \addlyrics \VerseTwo
    >>
    \layoutScore
  }
  \VerseThree
}

\book {
  \bookOutputSuffix "Eflat"
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = "Eb Sax" } \transpose ees c' \melody
    >>
    \layoutScore
  }
}
\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff \with { instrumentName = "Flute" } \transpose c c' \melody
    >>
    \layoutScore
  }
}