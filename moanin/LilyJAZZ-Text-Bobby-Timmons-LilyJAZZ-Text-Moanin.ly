\version "2.25.28"

\include "LilyJAZZ.ily"

today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }
lick ={ \tuplet 3/2 {ces8 bes aes} f2.}

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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")" Moanin'"}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Bobby Timmons "}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "LS, " \today }
}

global = {
  \time 4/4
  \key f \major
  %\tempo 4 = 120

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  % A section
  s1
  s2 bes4 f
  s1
  s2 bes4 f
  s1
  s2 bes4 f
  s1
  s2 bes4 f
  s4 g4:m7.5- c2:7
  s4 c4:m7.5- f2:7.9-

  bes2:m9 aes:9
  g2:7.9- c2:7.9+
  g1:m7
  f2 b:9
  bes2:m9 aes:9
  g1:7.9-
  g1:m7
  c1:7

  s2 bes4 f
  s1
  s2 bes4 f
  s1
  s2 bes4 f
  s1
  s2 bes4 f
  s1
  s1

  f1:m
  aes1:9
  g1:7
  c1:7

}

melody = \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

  s4 f,8 f aes aes f c
  \repeat volta 2 {
    \mark \default
    ees4_"No rhythm - call and response" f2.
    r4 f8 f aes4 bes8 bes
    \lick
    r4 f8 f c'4 ees8 c
    \lick
    r4 f8 f aes aes f c
    ees4 f2.

  }
  \alternative{
    {
      r4 f8 f aes aes f c
    }{
      r2 f4 f \bar"||" \break
    }
  }

  \mark \default c'2_"Swing"  \tuplet 3/2 {ces8 bes f} bes8 f
  aes4. f8 ees c ees f~
  f1
  r2 f4 f
  c'2 \tuplet 3/2 {ces8 bes f} bes8 f
  aes4. f8 aes f aes c~
  c2 ees8 c bes c
  r4 f,8 f aes aes f c \bar "||" \break

  \mark 1
  ees4_"No rhythm - call and response" f2.
  r4 f8 f aes4 bes8 bes
  \lick
  r4 f8 f c'4 ees8 c \break
  \lick
  r4 f8 f aes aes f c
  ees4 f2.
  r1 \bar "|." \break
  s1 \break

  \set countPercentRepeats = ##t
  \repeat volta 1{
    \mark "Solos" \comp #16
  }
}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "Concert"
    }
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout { }
    \midi { }
  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "E flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' { \melody }
    >>

  }
}

\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "LilyJAZZ Text")
      "B flat instrument"
    }
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' { \melody }
    >>

  }
}
