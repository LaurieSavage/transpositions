\version "2.25.28"

\include "jazzchords.ily"
\include "lilyjazz.ily"

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
  title =  "Moon and Sand"
  subtitle = "Singer Key: A minor"
  composer =  "Comp: Alec Wilder/Morty Palitz"
  poet =  "Lyr: William Engvick"
  piece = "Bossa"
  copyright = \markup \small { "Ludlow Music, 1941 / Regent Music, 1946" }
  tagline = \markup { "Paradiso Connection - Edited by L.S. " \today }
}

global = {
  \time 4/4
  \key d \minor
  \tempo 4=140
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \revert Score.BarNumber.stencil
}

chordNames = \transpose d a \chordmode {
  \global
  d1:m
  bes1:maj7
  aes1:maj7
  bes1:sus
  ees2:maj a2:13
  aes1:maj
  a1:m7
  d1:7
  g1:min
  c1:7
  ges1:maj
  f1:6.9
  b1:min7.5-
  e1:7.9+
  e1:min7.5-
  a1:7
  d1:min9
  g1:13.9-
  c1:min9
  f1:13.9-
  bes1:maj
  ees1:9
  e1:min7.5-
  a1:7

  d1:m
  bes1:maj7
  aes1:maj7
  bes1:sus
  ees2:maj a2:13
  aes1:maj
  a1:m7
  d1:7
  g1:min9
  c1:7
  ees1:13.11+
  d1:9
  g1:min9
  e2:min7.5- a2:7
  d1*4:min7


}

melody = \transpose d a  \relative c'' {
  \global
  \revert Score.BarNumber.stencil

  a1~
  a4 g8 f g4 e
  f1~ f1 \break
  g1~
  g4 f8 ees f4 ees4
  d1~
  d1 \break
  a'1~ a4 g8 f g4 e4
  f1~
  f1 \break
  f1~
  f4 e8 f g4 f
  e1~
  e2. a4 \break
  e'1~
  e4 d8 e d4 aes
  g1~
  g4 c8 d c4 ges \break
  f2 bes2~
  bes4 a8 bes c4 bes4
  a1~
  a1 \bar "||" \break
  \mark #2
  a1~
  a4 g8 f g4 e
  f1~
  f1 \break
  g1~
  g4 f8 ees f4 ees
  d1~
  d1 \break
  a'1~
  a4 g8 f g4 e4
  c'1
  e2. d4 \break
  a1~
  a4 g8 f g4 f8 e
  d1~
  d1 \bar "|."



}

verses = \lyricmode {
  \override Lyrics.LyricText.font-name = #"LilyJazz Text"
  Deep __ is the mid -- night sea, __
  Warm __ is the frag -- rant land, __
  Sweet __ are your lips to me, __
  Soft as the moon and sand. __ Oh,
  when __ shall we meet a -- gain? When the night has
  left us, will the spell re -- main?

  Though waves in -- vade the shore,
  Though we may kiss no more,
  Night is at our com -- mand, Moon and
  sand, and the mag -- ic of love
}

\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
      \addlyrics { \verses }
    >>
    \layout {
      indent = 15
    }
  }
}

\book{
  \bookOutputSuffix "Bflat"
  \header {
    instrument = "Trumpet/Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' \melody
      \addlyrics {\verses}
    >>
    \layout {
      indent = 15
      ragged-right = ##f
    }
    %\midi { }
  }
}

%{
\book{
  \bookOutputSuffix "Tpt"
  \header {
    instrument = "Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff %\with { instrumentName = "Trumpet" }
      \transpose bes c' \melody
      \addlyrics {\verses}
    >>
    \layout {
      indent = 15
    }
    %\midi { }
  }
}
%}

\book {
  \bookOutputSuffix "Eflat"
  \header {
    instrument = "Baritone/Alto Sax"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c \melody
      \addlyrics {\verses}
    >>
    \layout {
      indent = 15
      ragged-last = ##t
    }
    %  \midi { }
  }
}




%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4,
2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12
%}
