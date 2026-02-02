\version "2.25.28"
\include "headerJazz.ly"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

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
  title = \markup{\override #'(font-name . "LilyJAZZ Text")"Afro Blue"}
  composer = \markup{\override #'(font-name . "LilyJAZZ Text")"Mongo Santamaria"}
  piece = \markup{\override #'(font-name . "LilyJAZZ Text")"Medium fast"}
  tagline = ""
  copyright = \markup{\override #'(font-name . "LilyJAZZ Text"){"Edited L.S. " \today}}
}

global = {
  \time 3/4
  \key f \minor
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  %\compressEmptyMeasures
}

chordNames = \chordmode {
  \global
  \override ChordNames.ChordName.font-name = #"lilyjazzchord"
  %\jazzOn
  s2.*4
  f2.*2:m7
  des4.:7.9+/aes c4.:7.9+/g
  f2.:m7

  f2.*2:m7
  des4.:7.9+/aes c4.:7.9+/g
  f2.:m7

  ees2.*2
  des4. ees4.
  f2.:m7

  ees2.*2
  des4. ees4.
  f2.:m7

  % solo interlude
  f2.*8:m7

  f2.:m7

  f2.*2:m7
  des4.:7.9+/aes c4.:7.9+/g
  f2.:m7

  f2.*2:m7
  des4.:7.9+/aes c4.:7.9+/g
  f2.:m7

  ees2.*2
  des4. ees4.
  f2.:m7

  ees2.*2
  des4. ees4.
  f2.:m7
}

melody = \relative c'' {
  \global
  \jazzOn
  \repeat volta 2 {\mark"Percussion until ready"} r2.*4 %\break
  \repeat volta 2{
    \mark \default
    f,4 c'4. aes8
    bes4 bes2
    aes4. bes4.
    f2 r8 c8 \break

    f4 c'4. aes8
    bes4 bes2
    aes4. bes4.
    f2. \break

    ees4 ees g
    ees4 ees2
    des4. ees4.
    f2. \break

    ees4 ees g
    ees4 ees2
    des4. aes'4.
  }
  \alternative{
    {
      f2.\break
      \mark "Percussion Break" R2.*8 \break
    }{
      f2 f8 aes \bar "||"
    }
  }
  \mark \default
  c8 ees8 r8 ees4 des8
  c8 c8 c4 bes8 c,8
  aes'8 aes aes4 g8 ees
  f2 f8 aes \break

  c8 ees ees4. des8
  c8 c c4 bes8 c,8
  aes'8 aes aes g r ees
  f f f f~ f4 \bar "||" \break
  \mark \default
  ees4 ees g
  ees4 ees2
  des4. ees4.
  f2. \break

  ees4 ees g
  ees4 ees2
  des4. aes'4.
  f2. \bar "|." \break \break
  \mark "Percussion between solos" R2.*8

}


\bookpart {
  \header {
    instrument = \markup{\override #'(font-name . "LilyJAZZ Text") \with-color #red  "Concert Instruments"}
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>


    \layout { }
    \midi { }
  }

  \markup{\override #'(font-name . "LilyJAZZ Text")"Open solos over F minor or 3/4 minor blues"}
}

\bookpart {
  \header {
    instrument = \markup{\override #'(font-name . "LilyJAZZ Text")\with-color #red  "Concert Instruments"}
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>


    \layout { }
    \midi { }
  }
  \markup{\override #'(font-name . "LilyJAZZ Text")"Open solos over F minor or 3/4 minor blues"}
}

\bookpart {
  \header {
    instrument = \markup{\override #'(font-name . "LilyJAZZ Text")\with-color #red  "Concert Instruments"}
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>


    \layout { }
    \midi { }
  }
  \markup{\override #'(font-name . "LilyJAZZ Text")"Open solos over F minor or 3/4 minor blues"}
}

\bookpart {
  \header {
    instrument = \markup{\override #'(font-name . "LilyJAZZ Text")\with-color #red  "B flat Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
    >>


    \layout { }
    %\midi { }
  }
  \markup{\override #'(font-name . "LilyJAZZ Text")"Open solos over F minor (concert) or 3/4 minor blues"}
}

\bookpart {
  \header {
    instrument = \markup{\override #'(font-name . "LilyJAZZ Text")\with-color #red  "E flat Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>


    \layout { }
    %  \midi { }
  }
  \markup{\override #'(font-name . "LilyJAZZ Text")"Open solos over F minor (concert) or 3/4 minor blues"}
}

%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}


%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
