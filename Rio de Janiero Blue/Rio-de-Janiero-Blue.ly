\version "2.24.3"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Rio de Janiero Blue"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Torrance/Henry "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Moderately bright"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") {"L. S., " \today} }
}

global = {
  \time 4/4
  \key a \minor
  %\tempo
  \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  a2:m7 d2:/e
  a2:m7 d2:/e
  a2:m7 d2:/e
  a2:m7 d2:/e

  a1*2:m
  s4 d2.:/e
  a2:m7 d2:/e
  a1*2:
  s2 d2:/e
  a2:m7 d2:/e
  d1*2:m
  a2:m a2:3-.5.7+
  a2:m7 a2:m6
  d1:m
  f2 e2:7
  a2:m7 d2:/e
  a2:m7 d2:/e

  % Verse
  b1:m7
  e2:7.9+
  e2:7.9-
  a1:m
  d1:7
  b1:m
  e2:7.9+
  e2:7.9-
  a2: d2:/e
  a2: d2:/e
  a2:m d4:/e e4:7.9+
  s8 e4:7.9- e4:7.9+ e4.:7.9-
  a1*3:m
  a2:m d2:/e
  a1*3:m
  a2:m d2:/e
  d1*2:m
  a1*2:m
  d1:m
  f2 e2:7
  a2:m d2:/e
  a2:m7 e2:m7
  a2:m d2:/e
  a2:m d2:/e
  a2:m d2:/e
  %s1
  a2:m d2:/e
  a2:m7 d2:/e
  a2:m7 e2:m7
  a2:m7 d2:/e
  a2:m7 d2:/e
  a2:m7 d2:/e
  a2:m7 d2:/e
  a2:m7 d2:/e
  a2:m7 d4:/a e4:7.9+
  s8 e4:79- e4:7.9+ e4.:7.9-
  a1:m9

}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \mark \markup { \box "Intro"}
  \comp 15 r8 a8 \bar "||" \break

  \mark \default
  e'4 d8 c d c a g
  e'4 e4 d8 c a a~
  a4 c2.
  r2 r4 r8 a8 \break
  e'4 d8 d~ d4 c8 e8~
  e8 e d c d (e) c a~
  a1
  r1 \break
  ees'8 d c d~ d4 c8 e~
  e4 d8 c d (c) d e~
  e1 \break
  e8 ( d c4~ c4.) a8
  ees'8 d4 d8~ d d (c) e16 (d
  c4) r4 g8 a4 c8
  (a1~
  a2) r2 \break

  \repeat volta 2 {

    \mark \default
    <>\segno
    r2  \tuplet 3/2 { r4 a b}
    b8 d4 c8~ c b a4
    c4 b8 b~ b4 a8 a~
    a1 \break
    r2 g'8 e4 d8~
    d4 c8 d~ d c4 ees8
    ( d8 c a2.)
    R1
    <>\coda
    % \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")"To Coda" }
    \bar "||"

    R1
    r2 r4 r8 a8 \bar "||" \break
    e'4 e8 d~d4 c8 e~
    e8 e8 d (c~ c4.) a8
    e'8 e4. d8 (c) c e~
    e4 r4 r2 \break
    r8 d8 c d~ d4 d8 (c)
    d8 d (c) d8~ d4 d8 (c)
    e4 g8 e (d4) c8 ees
    (d8 c a2.) \break
    r8 a e' e d (c) c d~
    d8 c4. r8 d8 c e~
    (e2.~ e16 d c8
    d8 e c4 a4) r4 \break
    r4 d8 c d d4 e16 (d
    c4) r4 g8 a c4
    (a1) \break
    r2 d8 c d4
    (c8 a4.) r2
  }
  \alternative {
    {
      R1
    }
    {
      \mark  \markup {  \override #'(font-name . "LilyJAZZ Text")"D.S al coda"}
      R1 \break
    }
  }
  %s1\break
  <>^ \coda
  R1
  R1

  \repeat volta 2 {
    r2 b8 c4 d8~
    d8 c4 d8~d8 e4 fis8~
    (fis1
    g2 fis2
    e1)
    R1
  }
  R1
  R1
  R1 \fermata \bar "|."
}

verseOne = \lyricmode {
  \override Lyrics.LyricText.font-name = #"LilyJazz Text"

  The clouds came a -- creep -- in' and you got me weep -- in' this morn -- ing
  I can't be -- lieve__  you're real -- ly gon -- na leave__ this town__
  Ev -- 'ry -- one knows__ I can't make a move__ with -- out__  you__
  You're turn -- in' my__ whole__ world__ up -- side down__

  And I get a feel -- ing I've seen the last__ of you__
  Ri -- o de Ja -- nei -- ro Blue.__

  The salt sea air,__ your wind -- blown hair,__ re -- flec -- tions on__ a dream,
  thoughts of you__ with__ who knows__ who,__ flow__ through me like a stream.
  Bra -- zil -- ian ser -- e -- nad -- ers lin -- ger on.__
  Help me lose my soul__ in your song__, in your song.__

  Ri -- o de Ja -- nei -- ro Blue.__

}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text") \with-color #red
      "Concert"
    }
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
      \addlyrics { \verseOne }
    >>
    \layout { }
    \midi { }
  }
}

%  \bookpart {
%   \header {
%     instrument =\markup {
%       \fontsize #2 \override #'(font-name . "LilyJAZZ Text") \with-color #red
%       "E flat instrument"
%     }
%   }
%   \score {
%     <<
%       \new ChordNames \transpose ees c \chordNames
%       \new Staff \transpose ees c' { \melody }
%     >>
%
%   }
% }

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text") \with-color #red
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
      \addlyrics { \verseOne }
    >>

  }
}
