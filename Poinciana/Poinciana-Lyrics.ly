\version "2.24.3"

today = #(strftime "%d-%m-%Y" (localtime (current-time)))

comp = #(define-music-function (parser location count) ( integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-interface::beat-slash
            \override Rest.thickness = #0.48
            \override Rest.slope = #1.7
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

\paper {
   top-margin = 20
   bottom-margin = 20
   ragged-bottom = ##f
}

\header {
  title = "Poinciana"
  subtitle = "The song of the tree"
  composer = "Buddy Bernier/Nat Simon"
  %piece = "From a Cuban folk song"
  copyright = "(1936)"
  tagline = \markup { "L.S. March, " \today }
  poet = "Latin"
}

global = {
  \time 4/4
  \key g \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \autoBeamOff
}

chordNamesPrel = \transpose g ees {
  \chordmode {
    \global
    % Interlude
    d1*4:sus4.9
    d1:sus4.9
    d1:9
    g1:6.9
    s1
    g1.:6.9
    d2:sus4.9
  }
}

chordNamesInterL = \transpose g ees {
  \chordmode {
    \global
    % Interlude
    d1*4:sus4.9
    d1:sus4.9
    d1:9
    g1*2:6.9
  }
}

chordNameMain = \transpose g ees {
  \chordmode {
    \global
    % Melody
    g1*2:maj
    g1:sus4.9
    g1:9
    f1:sus4.9
    f1:9
    g1:maj
    s2 d2:sus4.9
    g1*2:maj

    ees1*2:maj
    d1*2:maj
    c1*2:m7
    a1:m7
    d1:7

    g1*2:maj
    g1:sus4.9
    g1:9
    f1:sus4.9
    f1:9
    g1*2:maj
  }
}

preludeMelody = \transpose g ees' {
  \relative c'' {
    \global
    \mark 1
    % Introduction
    \repeat volta 2 {

      d1~
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
    }
    \alternative {
      {
        g1~ g
      }
      {
        g1~ g4 r4 d'4. b8 \break
      }
    }
  }
}

mainMelody = \transpose g ees'{
  \relative c''{
    % Melody
    \repeat volta 2{
      \mark 2
      a2 a2~
      a8 g a b d b a g
      f1~
      f1 \break
      ees2 ees~
      ees8 ees f g bes g f ees
    }
    \alternative{
      {
        d1~
        d2 d'4. b8
      }
      {
        d,1~
        d2. r8 d8 \bar "||"
      }
    } \break
    \mark 3
    ees8 f g a bes4. a8
    c4. bes8 a (g) f g
    a4 a2.~
    a2. r8 d,8 \break
    ees8 f g (a) bes4. a8
    c4. bes8 a g f g
    d'1~
    d2 d4. b8 \bar "||" \break
    \mark 4
    a2 a2~
    a8 g a b d b a g
    f1~
    f1 \break
    ees2 ees~
    ees8 ees f g bes g f ees
    d1~
    d2. r4 \bar "||" \break
  }
}

interlude = \transpose g ees' {
  \relative c'' {
    \global
  \bar ".|:-|"
    \repeat volta 2 {
      \mark 5
      d1~
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
      g1~ g1
    }
  }
}

preludeLyricOne = \lyricmode {
  \set stanza = "1."
  Blow... Tro -- pic wind...
  Sing a song...
  Through the trees..
}
preludeLyricTwo = \lyricmode {
  \set stanza = "2."
  Trees... Sigh to me...
  Soon my love...
  I will
}
preludeRpt = \lyricmode {
  see...
  Poin -- ci
}

interludeLyric = \lyricmode {
  \set stanza = "1."
  Blow... Tro -- pic wind...
  Sing a song...
  Through the trees..
}
interludeLyricTwo = \lyricmode {
  \set stanza = "2."
  Trees... Sigh to me...
  Soon my love...
  I will see...
}

verseOne = \lyricmode {
  \set stanza = "1." 
  an -- a
  Your bran -- ches speak to me of love
  Pale moon is cast -- ing sha -- dows from ab -- ove

  Poin -- ci
}

verseTwo = \lyricmode {
  \set stanza = "2."
  an -- a
  Some -- how I feel the jung -- le beat
  Within me, there grows a rhyth -- mic, sav -- age
}

tagTwo = \lyricmode {
  Beat
  Love
  is ev -- er -- y -- where, it's mag -- ic per -- fume fills the air
  To and fro, you sway, my heart's in time
  I've learned to care
  Poin -- ci -- an -- a
  Though skies may turn from blue to gray
  My love will live for ev -- er and a day
}

%\bookpart {
  \score {
    <<
      \new ChordNames {\set chordChanges = ##t \chordNamesPrel}
      \new Voice = "prelude" { \preludeMelody }
      \new Lyrics \lyricsto "prelude" {\preludeLyricOne}
      \new Lyrics \lyricsto "prelude" {
      \preludeLyricTwo
      \repeat unfold 1  {\skip 1}
      \preludeRpt
      }
    >>
       \layout {  }
  }

  \score {
    <<
      \new ChordNames \chordNameMain
      \new Voice = "main" {\mainMelody}
      \new Lyrics \lyricsto "main" \verseOne
      \new Lyrics \lyricsto "main" {\verseTwo \repeat unfold 3 {\skip 4 } \tagTwo }
    >>
       \layout {
      indent = #0
    }
}

  \score {
    <<
      \new ChordNames {\set chordChanges = ##t \chordNamesInterL}
      \new Voice = "prelude" { \interlude }
      \new Lyrics \lyricsto "prelude" {\interludeLyric}
      \new Lyrics \lyricsto "prelude" {\interludeLyricTwo }
    >>
       \layout {
      indent = #0
    }
  }
%  }