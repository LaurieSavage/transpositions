\version "2.25.13"

\header {
  title = "Song for Bilbao"
  composer = "Pat Metheny"
  meter = "Med. Latin Rock"
  piece = "Repeat whole song AABA x 2"
  tagline = \markup {
    Engraved by Laurie Savage at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

\paper{
  myStaffSize = #20
  property-defaults.fonts.serif = "Comic Sans MS"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
}

chordNames = \chordmode {
  \time 4/4
  \partial 8*3 s4.
  %c8*3:m7
  \repeat volta 2{
    \repeat volta 2 {c1*4:m7 des1*2:maj7 }
    \alternative {{c1*2:m7}{c1*2:m7}}

    a4.:min7 bes4. g4.:min7 aes4. f4.:min7 g4.:min7 a4.:min7 b4.:min7

    c1*4:min7 des1*2:maj7 c1:m7
  }
  \alternative{{c1:m7}{c1:m7}}
  des1:maj7 c:min7.11+
}

rm = {\mark \default}

melody = \relative c'' {
  %\global
  \time 4/4
  \tempo 4=168
  \partial 8*3
  g8 bes g
  \repeat volta 2{
    \repeat volta 2
    {
      \rm
      c4. c8~ c2~ c2 bes4 c4 g4. \acciaccatura g8 f8~ f2~ f2. es8 f \coda
      c1~ c1~
    }
    \alternative
    {
      {c1~ c2 r8 g'8 bes g }
      {c,1~ c2 r8 g'8 c bes}
    }

    \break

    \time 6/8 \rm \tempo \markup {(\smaller \note {8} #1 "=" \smaller \note {8} #1 )}
    a4 f8 bes4 a8 r8 g ees aes4 g8 r8 f8 ees g4 ees8 a4 f8 b4 g8
    \break
    \time 4/4 \mark "A"
    c4. c8~ c2~ c2 bes4 c4 g4. \acciaccatura g8 f8~ f2~ f2. es8 f
    c1~ c1~ c1~
  }
  \alternative{
    {c2 r8 g'8 bes g}
    {
      c,2 \mark \markup{"d.c al coda"}
      r8 g'8 bes g  \bar "|."
    }
  }\break
  c2.\coda bes4 c1 \bar "|."

}

\score {
  <<
    \new ChordNames  \chordNames
    \new Staff {
      \set Staff.instrumentName="Concert"
      \melody
    }
    \new ChordNames \transpose bes c \chordNames
    \new Staff {
      \set Staff.instrumentName="B flat"
      \transpose bes c' \melody
    }
    \new ChordNames \transpose ees c \chordNames
    \new Staff {
      \set Staff.instrumentName="E flat"
      \transpose ees c' \melody
    }
  >>
  \layout { }
}
