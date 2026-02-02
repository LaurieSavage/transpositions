\version "2.24.4"

\header {
  title = "Moon and Sand"
  composer =  "Alec Wilder/Morty Palitz"
  poet = "Lyric: William Engvick"
  piece = \markup \italic "Medium Bossa"
  copyright = \markup {\small {\italic "Ludlow Music, 1941/Regent Music , 1946"}}
  tagline = ""
}

global = {
  \time 4/4
  \key d \minor
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  %   \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  %  
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

melody = \relative c'' {
  \global
  %  
  \sectionLabel \markup { \bold \large "Verse" }
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
  \section
  \sectionLabel \markup { \bold \large "Bridge" }
  e'1~
  e4 d8 e d4 aes
  g1~
  g4 c8 d c4 ges \break
  f2 bes2~
  bes4 a8 bes c4 bes4
  a1~
  a1 \bar "||" \break
  \sectionLabel \markup { \bold \large "Verse 2" }
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
  d1
  %R1
  %R1
  \bar "|."
}

verses = \lyricmode {
  %\override Lyrics.LyricText.font-name = #"lilyjazz Text"
  Deep__ is the mid -- night sea,__
  Warm__ is the frag -- rant land,__
  Sweet__ are your lips to me,__
  Soft as the moon and sand.__ Oh,
  when__ shall we meet a -- gain? When the night has
  left us, will the spell re -- main?

  Though waves in -- vade the shore,
  Though we may kiss no more,
  Night is at our com -- mand, Moon and
  sand, and the mag -- ic of love
}

femChords = \transpose g d \chordNames
femMelody = \transpose g d \melody

\book {
  \bookOutputSuffix "Vcl"
  \score {
    <<
      \new ChordNames \femChords
      %\transpose d d' { \femMelody }
      \new Staff \with { instrumentName = "Vocal" } { \femMelody }
      \addlyrics { \verses }
    >>
    \layout { }
    \midi { }
  }
}

\book {
  \bookOutputSuffix "Fl"
  \score {
    <<
      \new ChordNames \femChords
      \new Staff \with { instrumentName = "Flute" }
      \transpose d d' \femMelody
    >>
  }
}


%{
\bookpart {
  \header {
    instrument = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")
                            {"B" \flat " Instruments"}
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
      \addlyrics {\verses}
    >>
    \layout { }
    %\midi { }
  }
}

\bookpart {
  \header {
    instrument = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")
                           {"E" \flat " Instruments"}
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
      \addlyrics {\verses}
    >>
    \layout { }
    %  \midi { }
  }
}
%}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


%{
convert-ly.py (GNU LilyPond) 2.24.4  convert-ly.py: Processing `'...
Applying conversion:     The document has not been changed.
%}
