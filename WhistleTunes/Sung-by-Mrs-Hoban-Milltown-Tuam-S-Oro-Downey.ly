\version "2.24.4"

global = {
  \time 6/8
  \key c \major
  \tempo 4.=120
}

chordNames = \chordmode {
  \global
  c1

}

melody = \relative c'' {
  \global
  \partial 2
  a8 a4 a8
  g8 (e) d a'4 b8
  c4\< (d8)\! d8\> c\! a \break
  g8 e c' e, d d
  d4 a'8 a d d
  c a g a a b \break
  c4 d8 d8 c a
  g8 e c' e, d d
  d4 a'8 a4 a8 \break
  g8 (e) d a'4 b8
  c4\< (d8)\! d8\> c\! a
  g8 e c' e, d d
  d4 \bar "|."

}

words = \lyricmode {


}

\book {
  \paper {
    print-all-headers = ##t
  }
\header {
  title =  \markup {\smallCaps "Whistle Tunes"}
  subtitle = " "
 %  subtitle = \markup {\smallCaps "'S Óró, Downey"}
%   composer = "Sung by Mrs Hoban, Milltown, Tuam"
%   piece = "Dorian Mode"
%   copyright = \markup {\italic \small "Amhrain Mhuighe Seolla, Dublin, 1923"}

}


\score {
  <<
    %\new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff { \melody }
    %\addlyrics { \words }
  >>
\header {
  %title = "Whistle Tunes"
  title =  "'S Óró, Downey"
  composer = "Sung by Mrs Hoban, Milltown, Tuam"
  %piece = "Dorian Mode"
  copyright = \markup {\italic \small "Amhrain Mhuighe Seolla, Dublin, 1923"}
}
}


\score {
  <<
    %\new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff { \melody }
    %\addlyrics { \words }
  >>
\header {
  %title = "Whistle Tunes"
  title = "'S Óró, Downey"
  composer = "Sung by Mrs Hoban, Milltown, Tuam"
  %piece = "Dorian Mode"
  copyright = \markup {\italic \small "Amhrain Mhuighe Seolla, Dublin, 1923"}
}
}
}