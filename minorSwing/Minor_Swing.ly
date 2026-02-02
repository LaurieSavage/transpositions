\version "2.25.28"

\header {
  title = "Minor Swing"
  composer = "Django"
  meter = ""
  piece = "Swing"
  tagline = \markup {
    \smaller
    Engraved by Laurie Savage at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

\paper{
  myStaffSize = #20
  property-defaults.fonts.serif = "Comic Sans MS"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
}


global = {
  \time 4/4
  \key c \major
  %  \tempo 4=100
}

chordNames = \chordmode {
  \repeat volta 2 {
    a1:min d:min a:min d:min
    a:min d:min a:min a:min
  }

  \repeat volta 2{
    a1*2:min d1*2:min
    e1*2:7 a1*2:min
    d1:min g:7 c f
    b:maj7-5 e:7 a:min e:7
  }

  \repeat volta 2{
    a1*2:min d1*2:min
    e1*2:7
  }\alternative{{a1*2:min}{a1*2:min}}
}

% Function to print a specified number of slashes
comp = #(define-music-function (count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

rm = {\mark \default}
line = { c4\staccato e4~ e8 \tuplet 3/2 { e16 f e } d4 f8 a~ a4 r4}
makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
     'length (ly:music-length note)))
melody = \relative c' {
  %\global
  % g8 bes g
  \repeat volta 2{
    \mark "Intro"
    a4\staccato \line a,4\staccato \line a,4\staccato \line a,4 r4 r2 r1
  }\break

  \repeat volta 2{
    \mark "Solos"
    \comp #64
  }\break

  \repeat volta 2{
    \mark "Outro"
    a4\staccato c\staccato e2 a,4\staccato c8 e r e4. d4\staccato f\staccato a2
    d,4\staccato f8 a r a4.
    e4\staccato gis\staccato b2 e,4\staccato gis8 b r c4.
  }
  \alternative{{a,4 r r2 r1}{a'8\staccato e dis e f fis g gis a4\staccato r8 a, r2 \bar "|."}}
}

%words = \lyricmode {


%}

\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c'' \melody
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
