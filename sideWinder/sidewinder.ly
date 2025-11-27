\version "2.24.3"

\header {
  title = "Sidewinder"
  composer = "Lee Morgan"
  piece = "Harmony part"
  tagline = \markup {\smaller
                     Engraved by Laurie Savage at
                     \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
                     with \with-url "http://lilypond.org/"
                     \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }}
}  

\paper{
  myStaffSize = #20
  property-defaults.fonts.serif = "Comic Sans MS"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
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
          global = {
            \time 4/4
            \key f \major
            %  \tempo 4=100
          }
          
          chordNames = \chordmode {
            s1
            f1:7 f:7 f:7 f:7
            f1:7 f:7 f:7 f:7
            bes:7 bes:7 bes:7 bes:7
            f1:7 f:7 f:7 f:7
            g:m7 g:m7 g:m7 c:7
            f1:7 f:7 f:7 f:7
          }
          
          rm = {\mark \default}
          
          melody = \relative c'' {
            \global
            r1
            \repeat volta 2{ % 2 to 5
            r4 gis' r8 a r4 
            r4 gis r8 a r4
            r8 d,8 ees4 f g 
            d8 ees d c~ c2
            \break % 6 to 9
            r4 gis' r8 a r4 
            r4 gis r8 a r4
            r8 d,8 ees4 f g 
            gis8 a f ees r8 b4. 
            \break % 10 - 13
            bes4 cis r8 d r4
            r4 cis r8 d r4
            r8 g aes bes c bes a g 
            bes f g aes~ aes-\tweak style #'zigzag \glissando c, bes c
            \break % 14 - 17
            f,4 gis r8 a r4
            r4 gis r8 a r4
            r8 c d ees f g4.
            r8 a, bes b c d4.
            \break % 18 - 21
            r4 bes r8 c r4
            r4 bes r8 c r4
            r8 g' a4 bes b
            b8 c bes fis r8 fis c fis
            \break % 22 - 24
            f4 gis r8 a r4
            r4 gis r8 a r4
            r4 r8 c,16 (ees f8 f f16 c ees8
            f4)_"Fine" r8 ees8~ ees c bes c }
          }
          
          \score {
            \new StaffGroup
            <<
              \new ChordNames \chordNames
              \new Staff {
                \set Staff.instrumentName="B flat"
                \melody
              }
              \new ChordNames \transpose ees bes \chordNames
              \new Staff {
                \set Staff.instrumentName="E flat"
                \transpose ees bes, \melody
              }
            >>
            \layout { }
            \midi { }
          }
          