\version "2.24.3"

% Nica's Dream
% Horace Silver
% Sources:
% Intro, Interlude and Coda https://www.learnjazzstandards.com/jazz-standards/nicas-dream/
% Melody: Real Book, 5th and 6th editions
% Chords: Jamie Aebersold


\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"


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

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  top-margin = 15\mm
  left-margin = 20\mm
  right-margin = 20\mm
  bottom-margin = 10\mm
  bottom-margin = 10\mm

  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Nica's Dream"
composer = #"Horace Silver"
meter = #" (Med. Latin)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
          \override #'(offset . 7)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  piece = "A - Latin, B - Swing, C - Latin"
  tagline = \markup {
    \center-column {
      \line {"Nica's Dream"}
      \line {"Paradiso Connection - Edited by L.S. " \today }
    }
  }
}

indentsEtc = \layout {
  %indent = 15 \mm
}

global = {
  \time 4/4
  \key bes \minor
  \tempo 4=130
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

note = \markup {
  \column{
    \line {"Solo over AABC"}
    \line {"Play the interlude between solos"}
    \line {"Either horn plays the harmony/stabs in bars 18-19 and 61-62"}
  }
}

chordNames = \chordmode
{
  %\transpose bes fis
  {
    \global
    % Intro
    %{
    ees2.:m9 des4:m9
    s2 b2:m9
    f1:7
    %}
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

    % Interlude
    bes1:m7+
    aes1:m7+
    ges1:maj
    c1:m7.5-
    f1*2:7.5+
    bes4:m7+
    r2.
    R1

    %     % Coda
    %     bes1*2:m7+
    %     ees2:m7 aes2:7
    %     des1:maj
    %     c1:m7.5-
    %     b1/f
    %     c1:m7.5-
    %     b1/f
    %     b1*4
    %     b1:m11
  }
}

melody =
%\transpose b fis'
% {
\relative c''
{
  \global
  \section
  \sectionLabel "Intro"
  % Intro

%   \new Voice \with {
%     \consists "Pitch_squash_engraver"

%{
    %\improvisationOn
    \chordmode { ees4:m9  r4 r4 des4:m9 r2 ces4:m9 r4 f4:7 }
    %\improvisationOff
    f,8 ges f ees des c

  \break
%}

  \section
  \sectionLabel "Latin"
  bes4  \comp 14 f'4 \break

  % A section
  \section
  \sectionLabel "Latin"
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
    <<
      \new CueVoice = "1"
      { \voiceOne
        ees'4. ees8~ ees4 ees4~
        ees2
      }
      \new Voice = "2"
      {
        \voiceTwo
        \tieUp
        ees,1~
        ees1
      }\\
      \new CueVoice ="3"
      {
        \voiceThree
        \stemDown {bes4.\tieDown b8~ b4 bes4~
                   bes2 }
      }
    >>
    \break

    ees8 f ees f ges2~
    ges2 f4-. r8 des8
    c1~
  }
  \alternative{
    {c2. f4}
    {c1\repeatTie \bar "||"}
  }
  \break

  % Bridge
  \section
  \sectionLabel "Swing"
  \mark \default
  r4 f4-. des4. ees8
  f4-. des2 ees4
  f4 ges aes bes8 b8~
  b2. bes4
  \break

  a4 bes8 bes,8 r8 des4 ees8
  f4-. des2 c8 ees8~
  ees1
  fis8 d e fis~ fis2 \bar "||"
  \break

  r4 f4-. des4. ees8
  f4-. des2 ees4
  f4 ges aes bes8 b8~
  b2. bes4
  \break

  a4 bes8 bes,8 r8 des4 ees8
  f4-. des2 c8 ees8~
  ees2. f8 ges
  r8 f8 e f des'4 a8 c~ \bar "||"
  \break

  % Reprise A
  \section
  \sectionLabel "Latin"
  \mark \default
  c1~_"Latin"
  c2 \tuplet 3/2 {bes4 f des}
  f1~
  f2. f4
  \break

  \tuplet 3/2 {c'4 des a} c2~
  c2 \tuplet 3/2 {bes4 f des}
  \tuplet 3/2 {ees4 f des} ees2~
  ees2. des4 \bar "||"
  \break

  bes'1~
  bes2 \tuplet 3/2 {aes4 f des}
  ees1~
  ees1
  \break

  ees8 f ees f ges2~
  ges2 f4-. r8 des8
  c1~
  c4^"Fine" r4 c8 des f a \bar "||" \break

  % Interlude
  \section
  \sectionLabel "Interlude"
  \mark \default
  <c a>8 <a f>8~ <a f>2.
  <bes g>8 <g ees>8~ <g ees>2.
  <aes f>8 <f des>8~ <f des>2.

  <<
    \new CueVoice
    {
      \voiceOne
      s1
      ges'4. ges8~ ges4 ges4
      ges4 r4 r2
    }
    \new Voice
    {
      \voiceTwo
      <ges, ees>8 <ees bes>8~ <ees bes>2.~ \break
      <ees bes>2. r4
      r4 f8 ges f ees des c
    }
  >>

  bes4 r4_"Pickup to solo" r2
  R1
  \break

  % Coda
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
  % }
}

melodyTwo =
\transpose b fis'
{
  \relative c''
  {
    \global
    %\jazzOn

    % Intro

    \new Voice \with {
      \consists "Pitch_squash_engraver"
    }{
      \mark "Intro"
      \improvisationOn
      bes4 r r bes
      r2 bes4 r4
      bes4 r4 r2
      \improvisationOff
    }

    \break
    \mark "Latin"
    \comp 1  \comp 14 f4 \break

    % A section

    \repeat volta 2 {
      \mark \default
      c'1~_"Latin"
      c2 \tuplet 3/2 {bes4 f des}
      f1~
      f2. f4
      \tuplet 3/2 {c'4 des a} c2~
      c2 \tuplet 3/2 {bes4 f des}
      \tuplet 3/2 {ees4 f des} ees2~
      ees2. des4 \bar "||"
      bes'1~
      bes2 \tuplet 3/2 {aes4 f des}
      ees1~
      ees1
      ees8 f ees f ges2~
      ges2 f4-. r8 des8
      c1~
    }
    \alternative{
      {c2. f4}
      {c1\repeatTie \bar "||"}
    }

    % Bridge

    \mark \default
    r4_"Swing" f4-. des4. ees8
    f4-. des2 ees4
    f4 ges aes bes8 b8~
    b2. bes4
    a4 bes8 bes,8 r8 des4 ees8
    f4-. des2 c8 ees8~
    ees1
    fis8 d e fis~ fis2 \bar "||"

    r4 f4-. des4. ees8
    f4-. des2 ees4
    f4 ges aes bes8 b8~
    b2. bes4
    a4 bes8 bes,8 r8 des4 ees8
    f4-. des2 c8 ees8~
    ees2. f8 ges
    r8 f8 e f des'4 a8 c~ \bar "||"

    % Reprise A

    \mark 1
    c1~_"Latin"
    c2 \tuplet 3/2 {bes4 f des}
    f1~
    f2. f4
    \tuplet 3/2 {c'4 des a} c2~
    c2 \tuplet 3/2 {bes4 f des}
    \tuplet 3/2 {ees4 f des} ees2~
    ees2. des4 \bar "||"
    bes'1~
    bes2 \tuplet 3/2 {aes4 f des}
    ees1~
    ees1
    ees8 f ees f ges2~
    ges2 f4-. r8 des8
    c1~
    c2. r4 \bar "||" \break

    % Interlude
    \mark "Interlude"
    \comp 24
    \new Voice \with {
      \consists "Pitch_squash_engraver"
    }{
      \improvisationOn
      bes4 r4 r2
      \improvisationOff
    }\break

    % Coda
    \mark "Coda"
    \comp 32
    \new Voice \with {
      \consists "Pitch_squash_engraver"
    }{
      \improvisationOn
      bes4 r4 r2
      \improvisationOff
    }
    R1
    R1
    R1
    \new Voice \with {
      \consists "Pitch_squash_engraver"
    }{
      \improvisationOn
      bes1 \fermata \bar "|."
      \improvisationOff
    }
  }
}

\book {
  \bookOutputSuffix "C"
  \header {
    instrument = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff  %\transpose c c'
      \melody
    >>
    \indentsEtc
  }
  \note
}


\book{
  \bookOutputSuffix "Bb"
  \header {
    instrument = "Bb instruments"
  }

  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff
      { \transpose bes c' \melody}
    >>
    \indentsEtc
  }
  \note
}

\book{
  \bookOutputSuffix "Eb"
  \header {
    instrument = "E flat Instruments"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff
      {\transpose ees c' \melody}
    >>
    \indentsEtc
  }
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
