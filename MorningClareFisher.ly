\version "2.25.13"

\header{
  title = "Morning"
  composer = "Clare Fischer"
  instrument = ""
  piece = "Med. Slow Latin, AABA"
  tagline = \markup {
    Engraved by Laurie Savage at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }}
  }

\paper{
  myStaffSize = #20
  property-defaults.fonts.serif = "Comic Sans MS"
  property-defaults.fonts.sans = "Comic Sans MS"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
}


  rm = {
    \mark \default
  }

  Concert = {
    \relative c'
    {
      \key bes \minor
      \time 4/4
      \repeat volta 2 {

        r1^"Introduction" r r r r r r
      }
      \alternative{{r1}{r2 r8 f c' des}}
      \break

      \rm
      \repeat volta 2{
        ees f~ f2.~f2 r8 f, c' des ees4 f8 aes~aes f4.~f2 r8 f, c' f
        ees2 r8 f8 f, aes c2 r8 des8 c des ees2 r8 des4 bes8~
      }
      \alternative{{bes2 r8 f c' des }{bes1}}
      \break
      \rm
      \bar "||"
      bes4-^ bes r8 bes4-^ bes8~ bes4. c8 \tuplet 3/2 {f16 ges f} ees8 des c
      bes4-^ bes r8 bes4-^ bes8~ bes4. c8 \tuplet 3/2 {f16 ges f} ees8 des c
      bes4-^ bes r8 bes4-^ bes8~ bes4. c8 des ees f ges aes2 r8 ges4 f8 f2 r8 f, c' des
      \bar "||"

      \mark \markup{\bold "A"}
      ees f~ f2.~f2 r8 f, c' des ees4 f8 aes~aes f4.~f2 r8 f, c' f
      ees2 r8 f8 f, aes c2 r8 des8 c des ees2 r8 des4 bes8~ bes1 \bar "|."

    }
  }

  jazzChords =  \chordmode {

    %Introduction
    \repeat volta 2 {
      c2:m7.5- f:7.5+ bes:m7 ees:7
      c2:m7.5- f:7.5+ bes:m7 ees:7
      ees:m5 aes:7 des:maj7 ges:maj7
      c2:m7.5- f:7.5+
    }
    \alternative {{bes:m7 ees:7}{bes:m7 ees:7}}

    % Section A
    \repeat volta 2{
      c2:m7.5- f:7.5+ bes:m7 ees:7
      c2:m7.5- f:7.5+ bes:m7 ees:7
      ees:m5 aes:7 des:maj7 ges:maj7
      c2:m7.5- f:7.5+
    }
    \alternative {{bes:m7 ees:7}{bes:m7 ees:7}}

    %Section B
    ees1:m7 aes:7 des2:maj7 ges2:maj7 f:m5 bes:7.9+
    ees1:m7 aes:7 b:7 bes:7/f

    %Section A Reprise
    c2:m7.5- f:7.5+ bes:m7 ees:7
    c2:m7.5- f:7.5+ bes:m7 ees:7
    ees:m5 aes:7 des:maj7 ges:maj7
    c2:m7.5- f:7.5+
    bes:m7 ees:7
  }


  {
    <<
      \transpose ees c
      \new ChordNames { \set chordChanges = ##t \jazzChords }
      \new Staff{ \set Staff.instrumentName = #"E flat" \transpose ees c \Concert}

      \transpose bes c'
      \new ChordNames { \set chordChanges = ##t \jazzChords }
      \new Staff { \set Staff.instrumentName = #"B flat" \transpose bes c' \Concert }
    >>
  }
