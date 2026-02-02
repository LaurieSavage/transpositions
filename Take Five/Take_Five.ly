\version "2.24.4"

\include "lilyjazz.ily"

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

today = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

\header {
  title = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text")"Take Five "}
  composer =\markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Paul Desmond "}
  piece = \markup { \fontsize #3 \override #'(font-name . "lilyjazz Text") "Medium"}
  tagline = \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text") "LS, " \today }
}

global = {
  \time 5/4
  \key f \minor
  %\tempo 4 = 120

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  
  \global
 s2
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7

 des1:maj7 s4
 c1:m7 s4
 bes1:m7 s4
 aes1:maj7 s4
 des1:maj7 s4
 c1:m7 s4
 bes1:m7 s4
 g2.:m7 c2:m7

 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m c2:m7
 f2.:m s2

 s1 s4
 f2.:m c2:m7
 f2.:m c2:m7
}

melody = \relative c'' {
  
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
\partial 2 c,8 [ f aes bes] \bar"||" \mark \default
%A
b8  [c b bes] aes4 c, ees
f2. g16 (aes g f) ees4
f2. ees16 (f ees c) bes4
c2. c8 [f aes bes]
b8 [c b bes] aes4 c, ees
f2. ees16 (f ees c) bes4
c2. g'16 (aes g f) ees4
f2. r2 \bar"||" \break
%B
\mark \default
f'8 aes4 f8 des4 bes8 [c des d]
ees8 g4 ees8 c4 aes8 [bes b c]
des8 f4 des8 bes4 g8 [aes bes b]
c8 [b c des] ees4 ees8 [d ees e]
f8 aes4 f8 des4 bes8 [c des d]
ees8 g4 ees8 c4 aes8 [bes b c]
des8 f4 des8 bes4 g8 [bes ees des]
c2. c,8 [ f aes bes] \bar"||" \break

\mark 1
b8  [c b bes] aes4 c, ees
f2. g16 (aes g f) ees4
f2. ees16 (f ees c) bes4
c2. c8 [f aes bes]
b8 [c b bes] aes4 c, ees
f2. ees16 (f ees c) bes4
c2. g'16 (aes g f) ees4
f2. r2 \bar"||"
\break
s1 s4 \break

  \set countPercentRepeats = ##t
\bar ".|:-|"\mark "Solos until cue" \comp #10 \bar ":|."
}


\bookpart {
  \header {
    instrument =\markup {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
    instrument =\markup  {
      \fontsize #2 \override #'(font-name . "lilyjazz Text")
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
