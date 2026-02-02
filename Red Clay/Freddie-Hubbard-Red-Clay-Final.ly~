\version "2.24.3"

% Red Clay: Freddie Hubbard
% Source: Real Book, 6th Edition
% 23/08/2018

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
  title = "Red Clay"
  composer = "Freddie Hubbard"
  tagline = \today
}

global= {
  \key c \minor
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordIntro = \chordmode {
  r2 c2:m11
  r4 bes8:m11 s8 s2
  r4 des4:sus4.7 r4 ees4:sus4.7
  r4 f4:sus4.7 r8 g4.:sus4.7
}

chordNames = \chordmode {
  s1*4
  \chordIntro
  r4 f4:sus4.7 r8 g4.:sus4.7

  c1:m11
  bes1:m11
  des2:sus4.7 ees2:sus4.7
  f2:sus4.7 g2:sus4.7

  c1:m11
  bes1:m11
  des2:sus4.7 ees2:sus4.7
  f2:sus4.7 g2:sus4.7
  f2:sus4.7 g2:sus4.7

  c1:m11
  bes1:m11
  des2:sus4.7 ees2:sus4.7
  f2:sus4.7 g2:sus4.7
  f2:sus4.7 g2:sus4.7

  c1:m11
  bes1:m11
  des2:sus4.7 ees2:sus4.7
  f2:sus4.7 g2:sus4.7

  c1:m11
  bes1:m11
  des2:sus4.7 ees2:sus4.7
  f2:sus4.7 g2:sus4.7

  c1:m11
  bes1:m11
  des2:sus4.7 ees2:sus4.7
  f2:sus4.7 g2:sus4.7
}

chordCoda = \chordmode {
  \chordIntro
  c1:m11
}

melodyLine = {
  \global
  \relative c''{

    % Intro

    R1\mark "Drums, Rock Feel"
    R1*3

    \repeat volta 2 {
      \mark "Rhythm"
      r2 r2
      r4 r8 r8 r2
      r4 r4 r4 r4
    }
    \alternative{
      {r4 r4 r8 r4.}
      {r4 r4 r4 r8 c8~}
    }
    \break

    % Head

    \repeat volta 2 {
      \mark 1
      c8 \segno bes c bes g f ees f~
      f4. ees8~ ees2
      r8 des8 ees ges aes4 f8 ees
      bes'4 g8 f c' d16 ees f4
      r2 f8 ees16 c bes8 f
      g8 ees c f~ f ees4.~
      ees1~
    }
    \alternative{
      {ees2 r4 r8 c'8}
      {ees,2\repeatTie r2}
    }
    \break

    % Bridge

    \repeat volta 2{
      \mark 2
      r2 f2
      r4 r8 ees8~ ees4 r4
      r4 ges4 r4 aes4
    }
    \alternative{
      {r4 bes4 r8 c8 r4}
      {r4 bes4 r8 c8 r8 c8~}
    }
    \break

    % Reprise

    \mark 1
    c8 bes c bes g f ees f~
    f4. ees8~ ees2
    r8 des8 ees ges aes4 f8 ees
    bes'4 g8 f c' d16 ees f4
    r2 f8 ees16 c bes8 f
    g8 ees c f~ f ees4.~
    ees1~
    ees2 r2 \coda \bar "||"  \break

    %Solos

    \repeat volta 2{
      \mark Solos
      \comp 16
    }
  }
}

bassLine = {
  \global
  \relative c {
    \clef bass
    R1*4
    \repeat volta 2 {
      c8 g' c g c4. f,8
      bes,8 f' bes4 bes4. aes8
      des,8 aes'8 des4 ees,8 bes'8 ees4
    }
    \alternative{
      {f,8 c' f g, d' g4 r8}
      {f,8 c' f g, d' g4 r8}
    }
  }
}

\bookpart {
  \header {
    % piece = "Concert Instruments"
  }
  \score {
    <<
      \new ChordNames \chordNames
      \new StaffGroup
      <<
        \new Staff \melodyLine
        \new Staff \bassLine
      >>
    >>
  }
  \markup {d.s. al coda after all solos}

  % Coda

  \score {
    <<
      \new ChordNames \chordCoda
      \new StaffGroup
      <<
        \new Staff {
          \repeat volta 2 {
            r4 \coda \mark Coda r4 r2
            R1*3
          } R1
        }
        \new Staff {
          \relative c {
            \clef bass
            \repeat volta 2 {
              c8 g' c g c4. f,8 \noBreak
              bes,8 f' bes4 bes4. aes8 \noBreak
              des,8 aes'8 des4 ees,8 bes'8 ees4 \noBreak
              f,8 c' f g, d' g4 r8 \noBreak
            }
            c,1 \fermata \bar "|."
          }
        }
      >>
    >>
    \layout {
      indent = 0\cm
    }
  }
}

\bookpart {
  \header {
    piece = "B flat Instruments"
  }
  \score {
    <<
      \new ChordNames \transpose bes c  \chordNames
      \new Staff \transpose bes c' \melodyLine
    >>
  }
  \markup {Rhythm section plays intro as Coda after last bar.}
}

\bookpart {
  \header {
    piece = "E flat Instruments"
  }
  \score {
    <<
      \new ChordNames \transpose ees c  \chordNames
      \new Staff \transpose ees c' \melodyLine
    >>
  }
  \markup {Rhythm section plays intro as Coda after last bar.}
}