\version "2.25.28"

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
  title = "Sign Offs"
  tagline = "Paradiso Connection"

}

global = {
  \time 4/4
 % \key c \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle modern-cautionary
}
%% Chords
SMOchordNames = \chordmode {
  \global
  b2:dim7 bes2:6
  f2:6/a f2:6
  b2:dim7 bes2:6
  f2:6/a f2:6
  b2:dim7 bes2:6
  f2:6/a f2:6
  g2:9 c4.:9 c8:9.5+
  f1:6
 g2:9 c4.:9 c8:9.5+
  f1:6
  g2:9 c4.:9 c8:9.5+
}

IWBchordnames = \chordmode {
f1:m
c1:7.5+
f1:7
bes1:7
aes2.:maj f4:m7
bes2:m7 a2:7
aes1*2:6
}

%% Melodies
SMOmelody = \relative c'' {
  \global
\key f \major
d8 aes4. f8 g f d
f8 a4. r2
d8 aes4. f8 g f d
f8 d4. r2 \break
d8 aes'4. f8 g f d
f8 a4. r4 \tuplet 3/2 {d,8 des c}
b8 d f a d, d4 d8~
d4 r4 r2 \break
b8 d f a d, d4 d8~
d4 r4 r2
b8 d f a d, d4 e8~
e4 r4 r2 \bar "|."
}

IWBmelody = \relative c''{
  \global
  \key aes \major
  f,8 c'~ c2 f,4
  e8 c'~ c2 e,4
  ees8 c'~ c2 ees,4
  d8 bes'~ bes4~bes8 des,4 b8 \break
  c8 aes'8~ aes2 c,8 bes8
  b8 g'4 <a, des>8~ <a des>4. b8
  c8 ees f4 aes4 f8 ees8~
  ees8 aes,4. r2 \bar "|."
}

IWBmelodySax = \transpose bes c'' { \IWBmelody }
IWBBbChords = \transpose bes c { \IWBchordnames }

\bookpart {
  \header {
    instrument = "C Instruments"
  }
\score {
  \header {
    % \override piece.color = #red
    piece = \markup \with-color #red {\italic "Smooth One"}
  }
  <<
    \new ChordNames \SMOchordNames
    \new Staff { \SMOmelody }
  >>
}
\score {
  \header {
    piece  = \markup \with-color #red {\italic "In walked Bud"}
  }
<<
   \new ChordNames \IWBchordnames
    \new Staff { \IWBmelody }
>>
  \layout { }
  \midi { }
}
}

\bookpart {
  \header {
    instrument = "Trumpet"
  }
\score {
    \header {
       piece = \markup \with-color #red {\italic {"Smooth One"}}
  }
  <<
    \new ChordNames \transpose bes c \SMOchordNames
    \new Staff  \transpose bes c' \SMOmelody
  >>
}
\score {
    \header {
    piece  = \markup \with-color #red {\italic "In walked Bud"}
  }
  <<
    \new ChordNames \transpose bes c \IWBBbChords
    \new Staff \transpose bes c' \IWBmelody
  >>
  \layout { }
  %\midi { }
}
}

\bookpart {
  \header {
    instrument = "Tenor Sax"
  }
\score {
    \header {
       piece = \markup \with-color #red {\italic {"Smooth One"}}
  }
  <<
    \new ChordNames \transpose bes c \SMOchordNames
    \new Staff \transpose bes c' \SMOmelody
  >>
}
\score {
    \header {
    piece  = \markup \with-color #red {\italic "In walked Bud"}
  }
  <<
    \new ChordNames \IWBchordnames
    \new Staff \IWBmelodySax
  >>
  \layout { }
%  \midi { }
}
}




%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
