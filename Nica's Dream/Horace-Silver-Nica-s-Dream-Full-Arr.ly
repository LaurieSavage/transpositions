\version "2.24.4"

% Nica's Dream
% Horace Silver
% Sources:
% Intro, Interlude and Coda https://www.learnjazzstandards.com/jazz-standards/nicas-dream/
% Melody: Real Book, 5th and 6th editions
% Chords: Jamie Aebersold
%{
\include "jazzchords.ily"
\include "lilyjazz.ily"
%}

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
  top-margin = 20\mm
  left-margin = 25\mm
  right-margin = 25 \mm
  bottom-margin = 15 \mm
}

indentsEtc = \layout {
  indent = 15 \mm
}

\header {
  title = "Nica's Dream"
  % subtitle = "Singer's key - F# minor"
  composer = "Horace Silver"
  tagline = \today
  piece = "A & C - Latin, B - Swing"
}

global = {
  \time 4/4
  \key bes \minor
  \tempo 4=130
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode
{
  \transpose bes g
  {
    \global
    % Intro
    ees2.:m9 des4:m9
    s2 b2:m9
    f1:7
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

    % C Section
    bes1:m7+
    aes1:m7+
    ges1:maj
    c1:m7.5-
    f1:7.11
    f1:7.11
    bes1:m7+
  }
}

melody =
\transpose bes g'
{
  \relative c''
  {
    \global
    %

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
      {c2. f4 \break}
      {c1\repeatTie \bar "||"}
    }

    % Bridge

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

    \mark \default
    c1~_"Latin"
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
    c4^"Fine"\bar "|." r4  c8 des f a \bar "||" \break

    \mark \default
    <a c>8 <f a>8~ <f a>2.
    <g bes>8 <ees g>8~ <ees g>2.
    <f aes>8 <des f>8~ <des f>2.
    <ees ges>8 <bes ees>8~ <bes ees>2.~ \break
    <bes ees>2. r4
    r4 f'8 ges f ees des c
    bes4^"Solo break pickup" r4 r2
    R1 \bar "|."
  }
}


\book {
  \bookOutputSuffix "C"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff  %\transpose c c'
      \with { instrumentName = \markup { \with-color #red "Concert" }}\melody
    >>
    \indentsEtc
  }
  \markup \bold \underline{"Performance Notes"}
  \markup {"Sections A and C are Latin throughout, section B is swing."}
  \markup {"Play D between each solo, the piece can either end after 'D' or beat one, bar 56."}
}

\book {
  \bookOutputSuffix "Flute"
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff
      \with { instrumentName = \markup { \with-color #red "Flute" }} %\transpose c c'
      \melody
    >>
    \indentsEtc
  }
  \markup \bold \underline{"Performance Notes"}
  \markup {"Sections A and C are Latin throughout, section B is swing."}
  \markup {"Play D between each solo, the piece can either end after 'D' or beat one, bar 56."}
}

\book{
  \bookOutputSuffix "Bb"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = \markup{ \with-color #red \concat { "B" \flat " Horn"}}}{ \transpose bes c' \melody}
    >>
    \indentsEtc
  }
  \markup \bold \underline{"Performance Notes"}
  \markup {"Sections A and C are Latin throughout, section B is swing."}
  \markup {"Play D between each solo, the piece can either end after 'D' or beat one, bar 56."}
}

\book{
  \bookOutputSuffix "Eb"
  \header {
    instrument = "E flat Instruments"
  }
  \score {
    <<
      \new ChordNames \transpose ees c \chordNames
      \new Staff \with { instrumentName = \markup{ \with-color #red \concat { "E" \flat " Horn"}}} {\transpose ees c' \melody}
    >>
    \indentsEtc
  }
  \markup \bold \underline{"Performance Notes"}
  \markup {"Sections A and C are Latin throughout, section B is swing."}
  \markup {"Play D between each solo, the piece can either end after 'D' or beat one, bar 56."}
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.25.12  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0, 2.25.0, 2.25.1, 2.25.3, 2.25.4,
2.25.5, 2.25.6, 2.25.8, 2.25.9, 2.25.11, 2.25.12
%}
