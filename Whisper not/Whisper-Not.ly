\version "2.25.28"

\include "lilyjazz.ily"
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "swing.ly"
\include "TabA.ily"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title =  \markup \with-color "tomato" "Whisper Not"
  pdfTtile = \markup \with-color "tomato" "Whisper Not - Female Vocal (Fm)"
  composer = \markup \with-color "tomato" "Bennie Golson"
  piece = \markup \with-color "tomato" "Female Key for Lyric"
  tagline = \markup \with-color "tomato" { "L. S., " \today }
}

global = {
  \time 4/4
  \key c \minor
  \tempo 4 = 112
  \accidentalStyle modern-cautionary
}

chordNames = \transpose c f \chordmode {
  % \global
  s4
  % A
  c2:m c:m/bes
  a:m7.5- d:7.9-
  g:m g:m/f
  e:m7.5- a:7.9-

  d:m b:m7.5-
  e:m a:7.9-
  d:m7 e:m7
  f:m7 g:7.9-

  c2:m c:m/bes
  a:m7.5- d:7.9-
  g:m g:m/f
  e:m7.5- a:7

  d:m d:m/c
  e:m a:7.9-
  d:m e:m
  f:m7 bes:7

  % B
  a1:m7.5-
  d:7.9-
  g:m
  c:7
  e:m7.5-
  a:13.9-
  d:m7.5-
  g:13.9-
  c2:m c:m/bes
  a:m7.5- d:7
  g:m g:m/f
  e:m7.5- a:7
  d:m b:m7.5-
  e:m a:7.9-
  d1:m
  aes2:7 g:aug

  s1
  % C
  c2:m c:m/bes
  a:m7.5- d:7.9-
  g:m g:m/f
  e:m7.5- a:7
  d:m7 b:m7.5-
  e:m a:7
  d:m7 e:m7
  g1:7

}

melody = \transpose c f \relative c'' {
  \global
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \jazzTweaks

  \partial 4
  c,8 g'~  \bar "||"
  \mark \default
  g2. c,8 g'~
  g2. a8 bes~
  bes2. a8 g
  bes2. \tuplet 3/2 {a16 bes a} g8  %\break
  \acciaccatura gis8 (a4) d8 gis,~ \tuplet 3/2 {gis16 bes gis} f8 g4~
  g2. f8 d~
  d2 e4. f8~
  f2. c8 g'~  %\break
  g2. c,8 g'~
  g2. a8 bes~
  bes2. a8 g
  bes2. \tuplet 3/2 {a16 bes a} g8  %\break
  \acciaccatura gis8 (a4) d8 gis,~ \tuplet 3/2 {gis16 bes gis} f8 g4~
  g2. e8 f~
  f2 g4. aes8~
  aes1 %_\markup \with-color "tomato" "Next page"
  \bar "||" \break %\pageTurn

  \mark \default
  r4 \mark \markup {\segno} r8 g8 c8. g16 \tuplet 3/2 {f8 ees fis~}
  fis2 g4 a8 bes~
  bes2~ \tuplet 3/2 {bes4 c bes}
  bes2~ \tuplet 3/2 {bes4 c a}  %\break
  bes2~ bes8 d, g bes
  bes2. a4
  aes2~ aes8 c, f aes
  aes2. c,8 g'~  %\break
  g2. c,8 g'~
  g2. a8 bes~
  bes2. a8 g
  bes2. \tuplet 3/2 { a16 bes a} g8  %\break
  \acciaccatura gis8 (a4) d8 gis,~ \tuplet 3/2 {gis16 bes gis} f8 g4~
  g2. f8 d~
  d1~_"Fine"  \bar "|."
  d2 r2 \bar "||" % %\break

  s1^ \markup \with-color "tomato" "Solos over AB then play C section out"  \break
  \repeat volta 2{
    \mark \default
    r4 \tuplet 3/2 {c8 ees g} c8. ees16 c8. g16
    c8. g16 ees8. c16 fis2
    r4 \tuplet 3/2 {bes,8 d g} bes8. d16 bes8. g16
    bes8. d,16 g8. bes16 cis,8. e16 a8. g16  %\break
    a8 f r4 r8 a,8 d8. f16
    aes8 (f8 g4) r8 a,8 d8. f16
  }
  \alternative
  {
    {
      g8 d8 f2. r2 \tuplet 3/2 {g8 aes g~} g4
    }
    {
      g8 d8 f2.~ f2. \mark "d.s. al fine" r4 \bar "|."
    }
  }


}

\book {
  \bookOutputName "Whisper_not"
  \bookpart {
    \header {
      instrument = "Concert"
    }
    \score {
      <<
        \new ChordNames \chordNames
        \new Staff %\tripletFeel 8
        {
          \melody
        }
      >>
    }
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
      ragged-last-bottom = ##t
      ragged-bottom = ##t
      markup-system-spacing = #'((basic-distance . 13)
                                 (minimum-distance . 8)
                                 (padding . 1))
    }
  }

  \bookpart {
    \header {
      instrument =  "B flat instrument"
    }
    \score {
      <<
        \new ChordNames \transpose bes c \chordNames
        \new Staff \transpose bes c'
        {
          \melody
        }
      >>

    }
  }
}

\book {
  \tabA
  \bookOutputSuffix "Bb_TabA"
  \header {
    instrument =  \markup \with-color "tomato" "B flat instrument"
  }
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \transpose bes c' %\jazzTweaks
      {
        \melody
      }
    >>
  }
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
