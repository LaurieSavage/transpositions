\version "2.24.4"

\include "LilyJAZZ.ily"
today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\header {
  title = \markup{\override #'(font-name . "LilyJAZZ Text")"On Green Dolphin Street"}
  composer = \markup{\override #'(font-name . "LilyJAZZ Text")"Music - Bronislaw Kaper"}
  poet = \markup{\override #'(font-name . "LilyJAZZ Text")"Lyric - Ned Washington"}
  piece = \markup{\override #'(font-name . "LilyJAZZ Text") \italic "A - Latin, B & C - swing"}
  copyright =\markup{\override #'(font-name . "LilyJAZZ Text") {"L. S. " \today}}
}

global = {
  \time 4/4
  \key c \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

gdsMIles = \lyricmode {
  It seems like a dream, yet I know it happened
  A man, a maid, a kiss, and then goodbye
  Romance was the theme
  And we were the players
  I never think of this without a sigh
  Lover, one lovely day
  Love came, planning to stay
  Green Dolphin Street supplied the setting
  The setting for nights beyond forgetting
  And through these moments apart memories live in my heart
  When I recall the love I found on
  I could kiss the ground on Green Dolphin Street
  Lover, one lovely day
  Love came,…
}

gdsElla = \lyricmode {
  Lov-__ _er, one love-__ _ly day
  Love came plan-__ _ning to stay

  Green Dol-__ _phin Street supp-__ _lied the setting
  The setting for nights beyond forgetting
  Through these moments apart
  Love come here in my heart
  When I recall the love I found on
  I could kiss the ground on Green Dolphin Street

  Lov-er, one lovely day
  A love came planning to stay

  Green Dolphin Street supplied the setting
  The setting for nights beyond forgetting
  And through these moments apart
  Love come here in my heart
  When I recall the love I found on
  I'm gonna kiss the ground I found on Green Dolphin Street
}
chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  % A
  c1*2:maj
  c1*2:min7
  d1:7/c
  s2 des2/c
  c1*2:maj

  % B
  d1:m7
  g1:7
  c1*2:maj7

  f1:m7
  bes1:7
  ees1*2:maj7

  % C
  d2:min7 d2:m/c
  b2:m5.5- e2:7.9-
  a2:m7 a2:m/g
  fis2:m7.5- b2:7
  e2:m7 a2:7
  d2:m7 g2:7
  c1:maj
  \parenthesize d2:m7 \parenthesize g2:7


}

melody = \relative c'' {
  \jazzOn
  \global
  \repeat volta 2 {
    \mark \default
    c2 c2~
    c2 \tuplet 3/2 {b4 g e}
    bes'1~
    bes1 \break

    a2 a2~
    a2 \tuplet 3/2 {aes4 f des}
    g1~
    g1 \bar "||" \break
  }
  \alternative{
    {
      \mark \default
      r8 g4. d4 e
      f4 g aes bes
      g1~
      g1 \break

      r8 bes4. f4 g
      aes4 bes ces des
      bes1~
      bes2 b2 \break
    }
    {
      \mark \default
      r8 g4. d4 e
      f4 g gis e'
      d4. c8~ c2
      c,4 d f b' \break
      a4. g8~ g2
      r8 g4. g4 g
      g1~
      g1 \bar "|."
    }

  }
}


\bookpart {
  \header {
    instrument = \markup{\override #'(font-name . "LilyJAZZ Text")"Concert Instruments"}
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
     % \addlyrics {\gdsElla }
    >>


    \layout { }
    \midi { }
  }
}

\bookpart {
  \header {
    instrument =\markup{\override #'(font-name . "LilyJAZZ Text") {"B" \flat " Instruments"}}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
    >>


    \layout { }
    %\midi { }
  }
}

\bookpart {
  \header {
    instrument = \markup{\override #'(font-name . "LilyJAZZ Text"){"E" \flat " Instruments"}}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>


    \layout { }
    %  \midi { }
  }
}


