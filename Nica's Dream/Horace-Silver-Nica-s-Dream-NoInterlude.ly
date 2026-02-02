\version "2.25.28"

% Nica's Dream
% Horace Silver
% Sources:
% Intro, Interlude and Coda https://www.learnjazzstandards.com/jazz-standards/nicas-dream/
% Melody: Real Book, 5th and 6th editions
% Chords: Jamie Aebersold

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
  %dedication = "For Baroness Kathleen Annie Pannonica de Koenigswarter"
  title = "Nica's Dream"
  composer = \markup{ "Horace Silver"}
  piece = \markup {\italic {"Solos AABA - " \box{"A"} " Latin, " \box{"B"} " swing" }}
  tagline = ""%\today
  copyright = \markup {"Edited L.S. " \today}
  %meter = "Medium tempo"
}

global = {
  \time 4/4
  \key bes \minor
  %\tempo 4=130
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  % Intro
  %  ees2.:m9 des4:m9
  %   s2 b2:m9
  %   f1:7
  bes1:m7+
  aes1:m7+
  bes1:m7+
  aes1:m7+

  % A section
  bes1*2:m7+
  aes1*2:m7+
  bes1*2:m7+
  aes1:m
  des1:7
  aes1:m
  des1:7
  ges1:maj
  c1:7.9-
  c1:m7.5-
  f1:7.9+
  bes1:m7+
  bes1:m7+
  bes1:m7+

  % B section
  ees1:m/aes
  aes1:7
  des1:maj
  bes1:7.9-
  ees1:7
  ees2:m aes2:7
  des1:maj
  e2:m a2:7

  ees1:m/aes
  aes1:7
  des1:maj
  bes1:7.9-
  ees1:7
  ees2:m aes2:7
  des1:maj
  f1:7.9+

  % A section
  bes1*2:m7+
  aes1*2:m7+
  bes1*2:m7+
  aes1:m
  des1:7
  aes1:m
  des1:7
  ges1:maj
  c1:7.9+
  c1:m7.5-
  f1:7.9+
  bes1*2:m7+
}

interludeC = \chordmode {
  % Interlude
  bes1:m7+
  aes1:m7+
  ges1:maj
  c1:m7.5-
  f1*2:7.5+
  bes1:m7

  % Coda
  bes1*2:m7+
  ees2:m7 aes2:7
  des1:maj
  c1:m7.5-
  b1/f
  c1:m7.5-
  b1/f
  b1*4
  b1:m11
}

melody = \relative c'' {
  \global

  % Intro
  %
  %   \new Voice \with {
  %     \consists "Pitch_squash_engraver"
  %   }{
  %     \mark "Intro"
  %     \improvisationOn
  %     bes4 r r bes
  %     r2 bes4 r4
  %     bes4 r4 r2
  %     \improvisationOff
  %   }
  %
  \mark \markup {\vspace #2 "Latin"}
  \comp 1  \comp 14 f,4 \break

  % A section

  \repeat volta 2 {
    \mark \default
    c'1~_"Latin"
    c2 \tuplet 3/2 {bes4 f des}
    f1~
    f2. f4 \break
    \tuplet 3/2 {c'4 des a} c2~
    c2 \tuplet 3/2 {bes4 f des}
    \tuplet 3/2 {ees4 f des} ees2~
    ees2. des4 \bar "||" \break
    bes'1~
    bes2 \tuplet 3/2 {aes4 f des}
    ees1~
    ees1 \break
    ees8 f ees f ges2~
    ges2 f4-. r8 des8
    c1~
  }
  \alternative{
    {c2. f4}
    {c1\repeatTie \bar "||"}
  }\break

  % Bridge

  \break
  \mark \default
  r4_"Swing" f4-. des4. ees8
  f4-. des2 ees4
  f4 ges aes bes8 b8~
  b2. bes4 \break
  a4 bes8 bes,8 r8 des4 ees8
  f4-. des2 c8 ees8~
  ees1
  fis8 d e fis~ fis2 \bar "||" \break

  r4 f4-. des4. ees8
  f4-. des2 ees4
  f4 ges aes bes8 b8~
  b2. bes4 \break
  a4 bes8 bes,8 r8 des4 ees8
  f4-. des2 c8 ees8~
  ees2. f8 ges
  r8 f8 e f des'4 a8 c~ \bar "||" \break

  % Reprise A

  \break
  \mark 1
  c1~_"Latin"
  c2 \tuplet 3/2 {bes4 f des}
  f1~
  f2. f4 %\break
  \tuplet 3/2 {c'4 des a} c2~
  c2 \tuplet 3/2 {bes4 f des}
  \tuplet 3/2 {ees4 f des} ees2~
  ees2. des4 \bar "||"
  bes'1~
  bes2 \tuplet 3/2 {aes4 f des}
  ees1~
  ees1 \break
  ees8 f ees f ges2~
  ges2 f4-. r8 des8
  c1~
  c2. r4 \bar "|."
}

% interludeM = \relative c'' {
%
%   %  Interlude
%   \mark "Interlude"
%   \comp 24
%   \new Voice \with {
%     \consists "Pitch_squash_engraver"
%   }{
%     \improvisationOn
%     bes4 r4 r2
%     \improvisationOff
%   }\break

  %   Coda
  %   \mark "Coda"
  %   \comp 32
  %   \new Voice \with {
  %     \consists "Pitch_squash_engraver"
  %   }{
  %     \improvisationOn
  %     bes4 r4 r2
  %     \improvisationOff
  %   }
  %   R1
  %   R1
  %   R1
  %   \new Voice \with {
  %     \consists "Pitch_squash_engraver"
  %   }{
  %     \improvisationOn
  %     bes1 \fermata \bar "|."
  %     \improvisationOff
  %   }
}

% 3 Concert parts

\bookpart {
  \header {
    % \override instrument.color = #red
    instrument = \markup \with-color #red "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff  \melody
    >>
  }

}

\bookpart {
  \header {
    % \override instrument.color = #red
    instrument = \markup \with-color #red "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff  \melody
    >>
  }

}

\bookpart {
  \header {
    % \override instrument.color = #red
    instrument = \markup \with-color #red "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff  \melody
    >>
  }

}

\bookpart {
  \header {
    instrument = \markup \with-color #red { "B" \flat " Instruments"}
  }
  \score {

    <<

      \new ChordNames \transpose bes c \chordNames
      \new Staff  \transpose bes c' \melody
    >>


    %    \layout { }
    %\midi { }
  }
}

\bookpart {
  \header {
    instrument = \markup \with-color #red { "E" \flat " Instruments" }
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \transpose ees c' \melody
    >>


    % \layout { }
    %  \midi { }
  }
}


