\version "2.24.4"
\include "lilyjazz.ily"

today = \markup {
  \override #'(font-name . "lilyjazz Text"){
    #(strftime "%d-%m-%Y" (localtime (current-time)))
  }
}

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
  title = \markup {\override #'(font-name . "lilyjazz Text") "This Here/Dis Hyunh"}
  composer = \markup {\override #'(font-name . "lilyjazz Text")"Bobby Timmons"}
  tagline = \markup { \override #'(font-name . "lilyjazz Text") "Edited - L.S. - " {\today}}
}

global = {
  \time 3/4
  %\key c \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  
}

chordNames = \chordmode {
  \global
  \override ChordNames.ChordName.font-name = #"lilyjazz Text"
  s2.
  s2.
  f2.*8:7
  bes2.*4:7
  f2.*4:7

  bes2.*2:7
  a2.*2:7
  aes2.*2:7
  g2.*2:7
  aes2.*2:7
  g2.*2:7

  f2.*8:7

}

melody = \relative c'' {
  \global
  \override TextSpanner.bound-details.left.text =  \markup {"Opt. 8ve for horns"}

  r8 c4 f4 c8
  f8 f16 ees c8 bes aes4
  \repeat volta 2 {
    f2.~
    f2. \break

    r8 c'4 f4 c8
    f8 f16 ees c8 bes aes4
    f2.~
    f2. \break

    r8 f4 aes f8
    aes8 aes16 f c8\startTextSpan bes aes f

    <des' b>4 <d aes>2~
    <d aes>2.\stopTextSpan  \break

    r8 c'4 f4 c8
    f8 f16 ees c8 bes aes4
    f2.~
    f2. \break

    r4 r4 c4
    d f g8. d16 \bar "||"
    f2.~
    f2.~ \break
    f2 f8 f8
    d'8 c4 aes d,8
    f2.~
    f2.~ \break
    f2 c8 c8
    d4 f g8. d16
    f2.~
    f2. \break

    r8 f'4 aes f8
    aes8 aes16 f c8 bes aes f \bar "||"

    <aes d>4 <a ees>2~
    <a ees>2.~ \break
    <a ees>2.~
    <a ees>2.~
    <a ees>2.~
    <a ees>2.

    r8 c4 f4 c8
    f8 f16 ees c8 bes aes4
  }
}

melodyHorns = \relative c'' {
  \global
  %\override TextSpanner.bound-details.left.text =  \markup {"Opt. 8ve for horns"}

  r8 c4 f4 c8
  f8 f16 ees c8 bes aes4
  \repeat volta 2 {
    f2.~
    f2. \break

    r8 c'4 f4 c8
    f8 f16 ees c8 bes aes4
    f2.~
    f2. \break

    r8 f'4 aes f8
    aes8 aes16 f c8 bes aes f

    <des' b>4 <d aes>2~
    <d aes>2.  \break

    r8 c4 f4 c8
    f8 f16 ees c8 bes aes4
    f2.~
    f2. \break

    r4 r4 c4
    d f g8. d16 \bar "||"
    f2.~
    f2.~ \break
    f2 f8 f8
    d'8 c4 aes d,8
    f2.~
    f2.~ \break
    f2 c8 c8
    d4 f g8. d16
    f2.~
    f2. \break

    r8 f'4 aes f8
    aes8 aes16 f c8 bes aes f \bar "||"

    <aes d>4 <a ees>2~
    <a ees>2.~ \break
    <a ees>2.~
    <a ees>2.~
    <a ees>2.~
    <a ees>2.

    r8 c4 f4 c8
    f8 f16 ees c8 bes aes4
  }
}


\bookpart {
  \header {
    instrument = \markup { \override #'(font-name . "lilyjazz Text") { \with-color #red   "Concert Instruments"}}
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>
    \layout {
      indent = 20
    }
    % \midi { }
  }
}

\book{
  \bookOutputSuffix "Bb"
  \header {
    instrument  = \markup{ \with-color #red  "B flat Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melodyHorns
    >>
    \layout {
      indent = 20
    }
    %\midi { }
  }
}
\book{
  \bookOutputSuffix "Flute"
  \header {
    instrument  = \markup{ \with-color #red  "Flute"}
  }
  \score {
    <<
      \new ChordNames  \chordNames
      \new Staff   \melodyHorns
    >>
    \layout {
      indent = 20
    }
    %\midi { }
  }
}

\book{
  \bookOutputSuffix "Eb"
  \header {
    instrument = \markup{ \with-color #red   "E flat Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>
    \layout {
      indent = 20
    }
    %  \midi { }
  }
}




%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
