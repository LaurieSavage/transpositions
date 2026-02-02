\version "2.24.4"
\include "lilyjazz.ily"
today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
     'length (ly:music-length note)))

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
  title = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"Beautiful Love "}
  composer =\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Victor Young"}
  piece = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Swing"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key d \minor
  %\tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  
  \global
  s1
  e1:m7.5-
  a1:7.5+
  d1*2:m
  g1:m7
  c1:7
  f1:maj7
  e2:m7.5- a2:7.5+
  d1:m
  g1:m7
  bes1:7.11+
  a1:7

  %%% 1st ending %%%
  d1:m
  g1:7.11+
  e1:m7.5-
  a1:7

  %%% 2nd ending %%%
  d2:m b2:7.9+
  bes2:7 a2:7
  d1*2:m
}

melody = \relative c' {
  
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \partial 4*4 r8 d4. e4 f4
  \repeat volta 2 {
    a2. g4
    f4. e8 d4 e8 f8~
    f1
    r8 f4. g4 a4 \break
    c2. bes4
    a4. g8 f4 g8 a8~
    a1
    r8 a4. b4 cis \break
    e4. d8~d4 a4
    c4. bes8~ bes4 d,4
    e1
    r8 e4. f4 g4 \break
  }
  \alternative{
    {
      a2. d,4
      cis2. d4
      e1
      r8 d4. e4 f4 \break
    }
    {
      a2 cis,4 d4
      f2 e2
      d1
      R1 \bar "|."
    }
  }
}

verses = \lyricmode {
  Beautiful love, you are all mystery
  Beautiful love, what have you done to me?
  I was contented 'till you came along
  Thrilling, my soul with your song
  Beautiful love, I've roamed your paradise
  Searching for love, my dreams to realize
  Reaching for heaven, depending on you
  Beautiful love, will my dreams come true
  Beautiful love, you are all mystery
  Beautiful love, what have you done to me?
  I was contented 'till you came along
  Thrilling, my soul with your song
  Beautiful love, I've roamed your paradise
  Searching for love, my dreams to realize
  Reaching for heaven, depending on you
  Beautiful love, will my dreams come true
  Beautiful love, you are all mystery
  Beautiful love, what have you done to me?
  I was contented 'till you came along
  Thrilling, my soul with your song
  Beautiful love, I've roamed your paradise
  Searching for love, my dreams to realize
  Reaching for heaven, depending on you
  Beautiful love, will my dreams come true
  Reaching for heaven, depending on you
  Beautiful love, will my dreams come true
  Beautiful love
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
      "Concert"
    }
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
    \midi { }
  }
  \markup{
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "Real Book, 6th Edition"}
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
      "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
  \markup{
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "Real Book, 6th Edition"}
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
  \markup{
    \fontsize #2 \override #'(font-name . "lilyjazz Text")
    "Real Book, 6th Edition"}
}
