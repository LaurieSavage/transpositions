\version "2.24.3"

\header {
  title = "Pick up the pieces"
  composer = "Average White Band"
  subtitle = "Concert, Part 1"
  %meter = ""
  piece = "Funk, 16ths feel"
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
  \key f \major
%  \tempo 4=100
}

fourBarBreak = {
  \repeat volta 2 {\bar ".|:-|"r1 r1 r1 r1}
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


chordNames = \chordmode {
  %\time 4/4
  %\partial 8*3 c8*3:m7
  % e.g c1*4:m7.5+
  s1*39
  g1:7 g:7 g:7 g:7
  g:7 g:7 g:7 g:7
  d:m7 d:m7 d:m7 d:m7
}

rm = {\mark \default}

partA = \relative c' {
  \global
  % g8 bes g
  \fourBarBreak \break
  \repeat volta 3 {
    \rm
    f'16\segno (a e' d) r8 c16 a b-. a-. r8 g'16 (c, d) f~ |
    f8 d c16 d r f~ f8 d c16-. d-. r8 |
    r1 | r1 |
    f,16 (a e' d) r8 c16 a b-. a-. r8 g'16 (c, d) f~ |
    f8 d c16 d r f~ f8 d c16-. d-. r8 |
    r1 | r1 | \break
    f16 (a, e' d) r8 f16 d g-. f-. r8 g16 (c, d) f~ |
    f8 d c16 d r16 f16~ f8 d c16-. d-. r8 |
  }
  \alternative{
    { r1 r1 r1 r1 \break}
    {
      r1 r1 r1 r1
      g16 (f g f) d8-. g16 (f g f) c8-. r4 |
      g'16 (f g f) d8-. g16 (f g f) c8-. r4 |
      g'16 (f g f) d8-. g16 (f g f) a8-. r4 |
      g16 (f g f) d8-. g16 (f g f) c8-. <c' c,>4~ |
      <c c,>1 |
      r1 r1 \break
    }
    {
      r1 r1 
      g16 (f g f) d8-. g16 (f g f) c8-. r4 |
      g'16 (f g f) d8-. g16 (f g f) c8-. r4 |
      g'16 (f g f) d8-. g16 (f g f) a8-. r4 |
      g16 (f g f) d8-. g16 (f g f) c8-. <c' c,>4~ |
      <c c,>1~ |
      <c c,>1~ |
      <c c,>1~ |
      <c c,>1 |\bar "||" \break
    }
  }
  \mark\markup {"Solos"}
  \comp #16 \break
  \repeat volta 2 {
    g,8 g r4 r2
    b8 bes a16 a16 r8 r2
    g8 g r4 r2
    b8 bes a16 a16 r8 r2 \break
  }
  
  \repeat volta 2 {
    \comp # 16 
    \mark \markup {"D.S al coda"} \break
  }
  
  r1\coda r1 \break
  
  \repeat volta 2 {
      g16 (f g f) d8-. g16 (f g f) c8-. r4 |
      g'16 (f g f) d8-. g16 (f g f) c8-. r4 |
  }
  g'16 (f g f) d8-. g16 (f g f) c8-. <c' c,>4~ |
      <c c,>1~ |
      <c c,>1~ |
      <c c,>1~ |
      <c c,>1 |
 f,16 (a e' d) r8 c16 a b-. a-. r8 g'16 (c, d) f~ |
    f8 d c16 d r f~ f8 d c16-. d-. r8 \bar "|." |      
 


}

partB = \relative c' {
  %\global
  % g8 bes g
  \fourBarBreak
}

%words = \lyricmode {


%}

\score {
  %\new StaffGroup
  <<
    \new ChordNames \transpose c ees \chordNames
    \new Staff {
      \set Staff.instrumentName="Part 1"
      \transpose c ees, \partA
    }
    %  \new ChordNames \transpose ees c \chordNames
    %  \new Staff {
    %    \set Staff.instrumentName="Part 2"
    %   \partB
    %  }
  >>
  \layout { }
  \midi { }
}
