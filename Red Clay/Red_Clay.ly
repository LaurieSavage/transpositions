\version "2.24.4"

% Taken from the Bflat version in Ed 6 Real Book

today =% \markup { \fontsize #2 \override #'(font-name . "lilyjazz Text")
%#(strftime "%d-%m-%Y" (localtime (current-time))) %}
#(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = "Red Clay"
  composer = "Freddie Hubbard"
  tagline = \today
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

global = {
\key d \minor
}

chordNames = \chordmode {
  s1*4
  r2 d2:m7
  r4. c8:m s2
  r4 ees4:sus4.7 r4 f4:sus4
  s4 g4:sus4.7 r8 a4.:sus4.7
  s4 g4:sus4.7 r8 a4.:sus4.7

  d1:m11
  c1:m11
  ees2:sus4.7 f2:sus4.7
  g2:sus4.7 a2:sus4.7

  d1:m11
  c1:m11
  ees2:sus4.7 f2:sus4.7
  g2:sus4.7 a2:sus4.7
  g2:sus4.7 a2:sus4.7

    d1:m11
  c1:m11
  ees2:sus4.7 f2:sus4.7
  g2:sus4.7 a2:sus4.7
  g2:sus4.7 a2:sus4.7

    d1:m11
  c1:m11
  ees2:sus4.7 f2:sus4.7
  g2:sus4.7 a2:sus4.7

    d1:m11
  c1:m11
  ees2:sus4.7 f2:sus4.7
  g2:sus4.7 a2:sus4.7

    d1:m11
  c1:m11
  ees2:sus4.7 f2:sus4.7
  g2:sus4.7 a2:sus4.7


}

chordNamesCoda =  \chordmode {
  s2 d2:m7
  s4. c8:m s2
  s4 ees4:sus4.7 s4 f4:sus4
  s4 g4:sus4.7 s8 a4.:sus4
  d1:11
}

melodyLine = {
  \global
  R1^"Drums, rock feel"
  R1*3
  \repeat volta 2 {
    r2 r2
    r4 r8 r8 r2 %R1
    r4 r4 r4 r4%R1
  }
  \alternative{{r4 r4 r8 r4.}{r2 r4 r8 d8~ }}
  \break
  \repeat volta 2 {
    \mark 1 %\bar ".|:-|"
    d8 \segno \repeatTie c d c a, g, f, g,
    g,4. f,8~ f,2
    r8 ees,8 f, aes, bes,4 g,8 f,
    c4 a,8 g, d e16 f g4
    r2 g8 f16 d c8 g,
    a,8 f, d, g,~ g, f,4.~
    f,1~
  }
  \alternative {{f,2 r4 r8 d8 }{f,2\repeatTie r2}}
  \break

  \repeat volta 2 {
    \mark 2
    r2 g,2
    r4 r8 f,8~ f,4 r4
    r4 aes,4 r4 bes,4
  }
  \alternative{
    {r4 c4 r8 d8 r4}
    {r4 c4 r8 d8 r8d~}
  }

  d8\repeatTie \mark 1 c d c a, g, f, g,
  g,4. f,8~ f,2
  r8 ees,8 f, aes, bes,4 g,8 f,
  c4 a,8 g, d e16 f g4
  r2 g8 f16 d c8 g,
  a,8 f, d, g,~ g, f,4.~
  f,1~
  f,2 r2 \coda  \break

  \repeat volta 2 {
    \mark Solos
    \comp 16
  }


}

horns =  {
  \global
  R1^"Drums, rock feel"
  R1*3
  \repeat volta 2 {
    r2 r2
    r4 r8 r8 r2 %R1
    r4 r4 r4 r4%R1
  }
  \alternative{{r4 r4 r8 r4.}{r2 r4 r8 d8~ }}
  \break
  \repeat volta 2 {
    \mark 1 %\bar ".|:-|"
    d8 \segno \repeatTie c d c a g f g
    g4. f8~ f2
    r8 ees8 f aes bes4 g8 f
    c'4 a8 g d' e16 f g4
    r2 g8 f16 d c8 g
    a8 f d g~ g f4.~
    f1~
  }
  \alternative {{f2\repeatTie r4 r8 d'8 }{f,2 r2}}
  \break

  \repeat volta 2 {
    \mark 2
    r2 g2
    r4 r8 f8~ f4 r4
    r4 aes4 r4 bes4
  }
  \alternative{
    {r4 c4 r8 d8 r4}
    {r4 c4 r8 d8 r8d~}
  }

  d8\repeatTie \mark 1 c d c a g f g
  g4. f8~ f2
  r8 ees8 f aes bes4 g8 f
  c'4 a8 g d' e16 f g4
  r2 g8 f16 d c8 g
  a8 f d g~ g f4.~
  f1~
  f2 r2 \coda  \break

  \repeat volta 2 {
    \mark Solos
    \comp 16
  }


}


bassLine = {
  \global
  R1*4
  \repeat volta 2{
    d,8 a, d a d4. g,8
    c,8 g, c4 c4. bes,8
    ees,8 bes, ees4 f,8 c f4
  }
  \alternative{{g,8 d g a, e a4 r8}{g,8 d g a, e a4 r8 }}

}

\bookpart {
  \header {
    piece = "Concert"
  }
\score {
  <<
    \new ChordNames  \transpose c bes \chordNames
    \new StaffGroup <<

      \new Staff  \transpose c bes' {
        \melodyLine
      }
      \new Staff \transpose c bes {
        \clef bass
        \bassLine
      }
    >>
  >>
}
 \markup{d.s. al coda when the solos are finished}
\score {

  <<
    \new ChordNames \transpose c bes \chordNamesCoda
    \new StaffGroup <<
      \new Staff \relative c' \transpose c bes {
        \repeat volta 2 {
          r4 \coda \mark "Coda" r4 r2
          R1*3
        }
        R1 \fermata
      }
      \new Staff \relative c \transpose c bes {
        \clef bass
        \repeat volta 2{
         d,8 a, d a d4. g,8
    c,8 g, c4 c4. bes,8
    ees,8 bes, ees4 f,8 c f4
    g,8 d g a, e a4 r8
        }
        d,1\fermata \bar "|."
      }
    >>
  >>
}
}


% \bookpart {
%   \header {
%     piece = "B flat Instruments"
%   }
% \score {
%   <<
%     \new ChordNames \chordNames
%       \new Staff \relative c'' {
%         \horns
%       }
%   >>
% }
% \markup{Intro is played as a coda when the solos are finished}
% }
%
% \bookpart {
%   \header {
%     piece = "E flat Instruments"
%   }
% \score {
%   <<
%     \new ChordNames \transpose ees bes \chordNames
%       \new Staff \transpose ees bes {
%         \horns
%       }
%   >>
% }
% \markup{Intro is played as a coda when the solos are finished}
% }