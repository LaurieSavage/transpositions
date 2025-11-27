\version "2.25.13"

\header {
  title = "*"
  composer = "*"
  meter = "*"
  piece = "*"
  tagline = \markup {
    Engraved by Laurie Savage at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }  

\paper{
  myStaffSize = #20
  property-defaults.fonts.serif = "Comic Sans MS"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
}


%global = {
%  \time 4/4
%  \key c \major
%  \tempo 4=100
%}

chordNames = \chordmode {
  %\time 4/4
  %\partial 8*3 c8*3:m7
  % e.g c1*4:m7.5+
}

rm = {\mark \default}

melody = \relative c'' {
  %\global
   % g8 bes g
  
}

%words = \lyricmode {


%}

\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c' \melody
    }
    \new ChordNames \transpose ees c \chordNames
    \new Staff {
      \set Staff.instrumentName="E flat"
      \transpose ees c' \melody
    }
  >>
  \layout { }
  \midi { }
}
