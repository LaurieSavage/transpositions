\version "2.24.4"
\include "LilyJAZZ.ily"

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
  title = \markup{\override #'(font-name . "LilyJAZZ Text"){\underline "Listen Here"}}
  composer = \markup{\override #'(font-name . "LilyJAZZ Text") "Eddie Harris"}
  poet = \markup{\override #'(font-name . "LilyJAZZ Text")"Latin Funk"}
  piece = \markup{\override #'(font-name . "LilyJAZZ Text")" "}
  tagline = \markup{\override #'(font-name . "LilyJAZZ Text") {"L.S " \today}}
}

global = {
  \time 4/4
  \key c \major
  %\tempo 4= 136
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global
  bes1:7
  ees1:7
  bes1:7
  ees1:7

  bes2.:7 s8 ees8:7
  s1
  bes2.:7 s8 ees8:7
  s1

  bes1:7
  ees1:7
  bes1:7
  ees1:7

  bes1:7
  ees1:7
  bes1:7
  ees1:7

}

melody = \relative c'' {
  \jazzOn
  \global

  % Intro
  \mark "Intro"
  \repeat percent 2 { \comp 8}
  \jazzOff
  \new Voice \with {
    \consists "Pitch_squash_engraver"
  } {
    \improvisationOn
    \override NoteHead.style = #'cross
    bes4. bes8~bes4 r8 bes8~
    \revert NoteHead.style
    \override NoteHead.style = #'harmonic
    bes1
    \revert NoteHead.style
    \override NoteHead.style = #'cross
    bes4. bes8~bes4 r8 bes8~
    \revert NoteHead.style
    \override NoteHead.style = #'harmonic
    bes2
    \revert NoteHead.style
    \improvisationOff
  }
  \jazzOn
  r4 bes8 aes8

  % Head
  \mark "Head"
  \repeat volta 2 {
    bes4 r4 r2
    r4 r8 bes8 (ees g f ees
    d8) r8 bes4~ bes4 r4

    r4 r8 bes8 (ees g f ees
    d4) r4 r2

    r4 r8 bes8 (ees g f ees
    d8) r8 bes4~ bes4 r4

    r2 r4 bes8 aes8
  }

}


%\bookpart {

\score {
  %\header {
  %instrument =
  %}
  <<
    \new ChordNames \chordNames
    \new Staff  \with {
      instrumentName = \markup{
        \center-column{
          "Instruments"
          \line{ "in C" }
        }
      }
    }  { \melody }
  >>


  \layout {
    indent = 2\cm
  }
  %\midi { }
}
%}

%\bookpart {
%  \header {
%     instrument = "B flat Instruments"
%   }
\score {
  <<
    \new ChordNames \transpose bes c \chordNames
    \new Staff  \with {
      instrumentName = \markup{
        \center-column{
          "Instruments"
          \line{ "in B"\flat }
        }
      }
    }  \transpose bes c' \melody
  >>
  \layout {
    indent = 2\cm
  }

  % \layout { }
  %\midi { }
}
%}

%\bookpart {
%  \header {
%     instrument = "E flat Instruments"
%   }
\score {
  <<
    \new ChordNames \transpose ees c\chordNames
    \new Staff  \with {
      instrumentName = \markup{
        \center-column{
          "Instruments"
          \line{ "in E"\flat }
        }
      }
    }  \transpose ees c \melody
  >>


  \layout {
    indent = 2\cm
  }
  %  \midi { }
}
%}


