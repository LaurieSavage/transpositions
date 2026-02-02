\version "2.24.4"

\include "LilyJAZZ.ily"

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
     'length (ly:music-length note)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

soli = \markup { \italic "Soli" }
% pp = \markup { \italic "pp" }
% p = \markup { \italic "p" }
% mp = \markup { \italic "mp" }
% mf = \markup { \italic "mf" }
% f = \markup { \italic "f" }
% ff = \markup { \italic "ff" }

\paper {
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 17\mm
}

layoutScore = \layout {
  indent = 15\mm
}

\header {
  title = "Summer Wind"
  composer = \markup { \huge \box \italic "457B"}
  piece = "Vocal"
  instrument = "1st Tenor Sax"
  tagline = \markup \override #'( font-name . "LilyJAZZ Text" ){"Port Phillip Show Band, LS 2021"}
}

global = {
  \time 4/4
  \key ees \major
  %\tempo 4=100
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
}

melody = \relative c' {
  \jazzOn
  \global
  \revert Score.BarNumber.stencil

  c'1~\p
  c1
  bes'1~\p
  bes1
  f8\mf^\soli f4.~ (\tuplet 3/2 { f8 ees d } \tuplet 3/2 { c8 d ees }
  f4. \appoggiatura b8 c f,4. \appoggiatura b8 c 
  f,1~\>
  f1) \bar "||" \break
  R1*2^\markup \italic {"Vocal"}\!
  r2^\soli aes,8 (aes aes4-.)
  aes8 f aes c r8 c4.-^
  R1*2
  r4\mf^\soli r8 f8~ (\tuplet 3/2 { f8 ees d } \tuplet 3/2 { c8 d ees }
  f4. bes8 f2)
  r4^\soli_\f r8 f8-> bes,4-^ r4
  r4^\soli_\f r8 f'8-> bes,4-^ r4
  aes1\>
  aes8.\< (aes16 bes8. bes16 ces8. <c f>16 f8.f16
  ees4-^\!) r4 r2
  R1
  r4 r8 bes8 (f' g g bes,
  f'8 g g c, ees d4.) \bar "||"\break

  \key f \major \mark #2
  r4 r8 c8-^ r8 d4-> r8
  r4 r8 c8-^ r8 d4-> r8
  r4 r8 c8-^~ c8 f4-^ g8~
  g8 c4 c,8 bes d r4
  bes4.-- d8-. r2
  bes4.-- d8-. r2
  r2^\soli r8 a8 c c
  a8 (c d f c16 bes c8~ c4)
  r4 r8 c8 r4 r8 ees8~\<
  ees1\!
  d8 d r4 r8 bes8 bes [bes]
  r8 bes4.-> des4-- d
  r2^\soli c8. (c16 d8. d16
  bes4-.) bes8 (bes bes-.) r8 d4-^
  r2\f c8 ( [d] d-.) r8
  c8 ( [d] d-.) r8 c4-- ( c-.) \bar "||"\break

  \key g \major \mark #3
  r4 r8 g8 ( d' e e4-.)
  r4 r8 g,8 ( d' e e4-.)
  r2 r8 a,8 (c [e]
  e8 e g g c, d4.)
  r4 r8 e8 (e [c] c4-.)
  r4 r8 g8 (g a c4-.)
  r2 r8 d8 ( e [g]
  d8 fis d b b d4.->) \bar "||"
  r4 r8 f8 f f r4
  r4 r8 f8 f f r4
  r2 r8 e4-^ ees8~
  ees8 ees (g8. g16 ees8. ees16 c8. c16
  e4-^) r4 r2
  r8 e4-> e8-> ees4-. ees4-.
  b2 r8^\soli a'8 ( a8. g16
  g8. e16 c8. a16 c8) c4.->\> \bar "||"
  d1~\p
  d1^\markup { \italic "fade" }\>
  d1~
  d1
  d1~
  d1~
  d4 r4\! r2 \bar"|."






}

\score {
  <<
    \new Staff \with { instrumentName = "T. Sax" }
    \melody
  >>
  \layoutScore
}