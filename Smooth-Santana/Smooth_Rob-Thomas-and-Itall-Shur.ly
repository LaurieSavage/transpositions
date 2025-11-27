\version "2.25.16"

%#(set-global-staff-size 18)

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"

\header {
  title = "Smooth"
  composer = "Mus: Rob Thomas and Itall Shur"
  poet = "Lyr: Rob Thomas"
  piece = "Medium Latin Rock"
  copyright = "1999"
  tagline = "Edited by LS for Paradiso Connection"
}

\paper {
  #(set-paper-size "a4")
}

global = {
  \key c \major
  \time 4/4
  \partial 2

}

chordNames =   \transpose c f \chordmode {
  \global
  % Chords follow here.
  s2
  a2:m f4.:7 e8:7
  s1
  a2:m f4.:7 e8:7
  s1
  a2:m f4.:7 e8:7
  s1
  a2:m f4.:7 e8:7
  s1
  d1:m
  b1:dim
  e1:7
  s1
  a2:m f4.:7 e8:7
  s1
  a2:m f4.:7 e8:7
  s1
  d1:m
  b1:dim
  e1:7
  s1
  %% B
  a1:m7
  f4.:7 e8:7 s2
  a1:m7
  f4.:7 e8:7 s2
  a1:m7
  f4.:7 e8:7 s2
  d1:m
  b1:dim
  e1*2:7
  %% C
  a1:m7
  f4.:7 e8:7 s2
  a1:m7
  f4.:7 e8:7 s2
  a1:m
  f2.:7 e4:7
  d2..:m7 e8:7
  s1
}

melodyA =   \transpose c f \relative c' {
  \global
  % Music follows here.
  \partial 2
  r8 d16 (e g8 e) | <<{a1}\\{r4 <c, e>4 r2}>> | r8 gis' a b c b4 a16 b| c4 a2.| r4 < d, gis>4
}

melodyB =   \transpose c f \relative c' {
  r8 ees d c |
  e4 <a, c>2. | r8 ees' d c d c d c | d8 8 <a c>2 r8 gis~ |gis ees' d c d c d c  |
  | <a d>4. c8 <a d>4. c8 | b4 r8 b ees d4 c8  | <b e>1 |
  | r4 <d gis>4-. r8 ees d c | e4-. < a, c>2. | r8 ees' d c d c d c |
  | d4-. <c a>2 r8 gis~ |gis (ees' d) c d (c) d c |
  | <a d>4. (c8 <a d>4. c8) | b4 r8 b ees d4 c8  | <b e>1 |
  r4 <d e>4 <d e>8 <d e> g a \break
  \section
  \mark 2
  | r4 <g c> <e a> g | a4 g8 e~ e e g a |
  | r4 <g c> <e a> r8 c' | <a c>4 c8 b r a g a | r4 <g c> <e a> g |
  | a8 g4 e8~ e4 d8 (c) | e8 (c d2.) | r4 d d c |
  | <b e>1~ | <b e>4 r r8 e (g) a | \break
  \section
  \mark 3
  <g c>8 <g c> a <g c>~ <g c>4 a |
  | c8 c a <gis d'>~ <gis d'> e g a | <g c>8 a c a c a c a |
  | r8 ees' c d~ d4 c | \grace{ dis8 } e g e c d c a g |
  | <a d>8 <a d>4 <a d>8~ <a d>4 c |
  | <f, c>8 <f c> a <f c> r c' a <gis d'> |
  | r8 g g g g g g a \fine

}


tenorSax = \relative c'' {
  \global
  \transposition bes,
  % Music follows here.
  %\melody

}

electricBass =   \transpose c f  \relative c, {
  \global
  % Music follows here.

}

verse = \lyricmode {
  % Lyrics follow here.
  %1 1 1 1 1 1 1 1 1 1 1 1
  Man it's a
  hot one.
  Like sev -- en in -- ches from the mid -- day sun
  1 1 I hear you whis -- per, and the words__ __ melt ev -- ry one,
  but you stay so cool.
  1 1 My Mu -- ñe -- qui -- ta,
  My Span -- ish Har -- lem Mo -- na Li -- sa.
  You're __ my re -- son for rea -- son,
  the step in my groove.
  1 1 And if you said
  this life ain't good e -- nough __
  I would give my world to lift you up.
  I would change my life to bet -- ter suit __ your __ mood __
  'cause you're so smooth __
  And it's just like the o -- cean,
  un -- der the moon. __
  Well, it's the same as the e -- mo -- tion that I get from you. __
  You got the kind of lo -- vin' that can be so smooth. __
  Yeah, give me your heart, make it real, or else for -- get a -- bout it.
}

tenorSaxPart = \new Staff \with {
  instrumentName = "Tenor Sax" shortInstrumentName = "TSax"
  midiInstrument = "tenor sax"
} \transpose bes c'' \tenorSax

trumpetPart =\new Staff \with {
  instrumentName = "Trumpet" shortInstrumentName = "Tpt"
  midiInstrument = "trumpet"
} \transpose bes c' \tenorSax


electricBassPart = \new Staff \with {
  midiInstrument = "electric bass (finger)"
  instrumentName = "Electric bass"
} { \clef "bass_8" \electricBass }

% leadSheetPart = <<
%   \new ChordNames \chordNames
%   \new Staff { \melody }
%   \addlyrics { \verse }
% >>

\book {
  \score {
    <<
      \new ChordNames \chordNames
      \new Voice = "intro" {
        \melodyA
        \new Voice = "song"
        \melodyB
      }
      \new Lyrics
      <<
        \lyricsto "song" \verse
      >>
    >>
  }
}
\book {
  \bookOutputName "Smooth-Trumpet"
  \header {
    instrument = "Trumpet"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Voice = "intro" \transpose bes c' {
        \melodyA
        \new Voice = "song"
        \melodyB
      }
      \new Lyrics
      <<
        \lyricsto "song" \verse
      >>
    >>
  }
  %
  %   \layout {
  %     \paper = "a4"
  %   }

}
\book {
  \bookOutputName "Smooth-Tenor"
  \header {
    instrument = "Tenor Sax"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Voice = "intro" \transpose bes c' {
        \melodyA
        \new Voice = "song"
        \melodyB
      }
      \new Lyrics
      <<
        \lyricsto "song" \verse
      >>
    >>
  }
  %
  %   \layout {
  %     \paper = "a4"
  %   }

}


