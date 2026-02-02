\version "2.25.28"
\include "LilyJAZZ.ily"
today = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text")#(strftime "%d-%m-%Y" (localtime (current-time))) }

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
  title = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text")"Gaviota "}
  composer =\markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") "Clare Fischer"}
  piece = \markup { \fontsize #3 \override #'(font-name . "LilyJAZZ Text") ""}
  tagline = \markup { \fontsize #2 \override #'(font-name . "LilyJAZZ Text") "L. S., " \today }
}

global = {
  \time 4/4
  \key c \minor
  \tempo "medium latin"
 % \accidentalStyle modern-cautionary

}

chordNames = \chordmode {
  \override ChordNames.ChordName.font-name = #"LilyJazz Text"
  \jazzOn
  \global

  %% Intro
  c4.:m9 ees4:7 e4:7 f8:7
  s2 s8 f8:7 g8:7 c8:m9
  s4. ees4:7 e4:7 f8:7
  s2 s8 f8:7 g8:7 c8:m9
  c4.:m9 ees4:7 e4:7 f8:7
  s2 s8 f8:7 g8:7 c8:m9
  s4. ees4:7 e4:7 f8:7
  s1

  %% Head

  %% Vamp
}

introRhythm =  \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \clef treble
  {
    \mark "Intro"
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >2 r4 r8 ees' \bar "||"
  }

}

introBass = \relative c {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

  \clef bass
  {
    % \mark "Intro"
    c,8 g' c ees,~ees8 e4 f8~
    f8 c' ees e, f fis g c,~
    c8 g' c ees,~ees8 e4 f8~
    f8 c' ees e, f fis g c,~
    c8 g' c ees,~ees8 e4 f8~
    f8 c' ees e, f fis g c,~
    c8 g' c ees,~ees8 e4 f8~
    f2 r2^"Similar"
  }


}

introHorns =  \relative c'' {
  \jazzOn
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \repeat percent 8 {R1} \bar "||"
}

melody =  \relative c'' {
  \jazzOn
  %\global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \mark \default
  g'8 g ees g~ g2~
  g2~ g8 aes ees f~
  f1~
  f2. r8 g,8
  f'8 f g,e'~ e2~
  e2 g8 f e d~
  d1~
  d2. r8 c8
  d8 ees e g,~g8 g4 e'8~
  e2. r8 g,8
  d'8 ees e g,~ g g4 e'8~
  e4. d8 \tuplet 3/2 {c4 b a'~}
  a2~ a8 g4 bes,8~
  bes2 b8 c b b~
  b8 g r g fis g b d
  g4 ges f e \break
  \mark \default
  ees r8 ees 8 g g ees g~
  g2~ g8 aes ees f~
  f1~
  f2. r8 g,8
  f'8 f g, e'~ e2~
  e2 g8 f e d~
  d4. c8 b c4 b'8~
  b2 r8 c4.
  g8 g g,g'~ g g,4 g'8~
  g2. r8 g,8
  g'8 g g, g'~ g g,4 g'8~
  g2~  g8 ges f e~
  e8 e g, e'~ e g,4 e'8~
  e4. g8 f8 e4 d8~
  d4. c8 b c4 d8~
  d4 ees2 g,8 c
  \repeat volta 2 {
    \mark \default
  <<
    {c1^"Vamp between solos" \repeatTie R1}
    \\
    {
    <g, d' ees>4 r8 <des' f, g>8~ <des f, g>8 <d a fis>4 <ees g, f >8~
    <ees g, f >4 r4 r8 <e bes aes >8 <f bes, aes >8 <ees d g, >~}
  >>
  }


}

% vampRhythm = \relative c'' {
%  \new StaffGroup
%  << \new Staff {
%   \jazzOn
%   %\global
%   \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
%
%   \clef treble
%   \repeat percent 2 {
%    %<<
%       R1
%     % \\
%     % {}
%   % >>
%   }
%      }
%
%
% %vampBass = \relative c'' {
%   \new Staff {
%   \jazzOn
%   %\global
%   \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
%   \clef bass
%   \repeat percent 2 {
%     R1
%   }
% }
% >>
% }

% vamp= \new StaffGroup <<
%   \new Staff \clef treble { R1 R1}
%   \new Staff \clef bass { R1 R1}
% >>


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
      \new Staff { \introRhythm \break \melody }
      \new Staff {\introBass }% \vamp}
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
      \new Staff \transpose ees c { \introHorns \melody }
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
      \new Staff \transpose bes c' { \introHorns \melody  }
    >>

  }
}
