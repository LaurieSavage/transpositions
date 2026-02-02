\version "2.25.28"

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

global = {
  \time 4/4
  \key g \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \autoBeamOff
}

\include "Lyrics.ly"
\include "TheChords.ly"
\include "TheNotes.ly"

\header {
  title = "Poinciana"
  subtitle =  \markup { \center-column {
    \line { "The song of the tree" }
    \line { \small \italic "(From a Cuban folk song)" }
  }
		      }
  composer =  "Buddy Bernier/Nat Simon" 
  copyright = "(1936)"
  tagline = \markup { "L.S. March, " \today }
  poet = "Latin"
}

\bookpart {
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
      \new Lyrics \lyricsto "main" {
	\verseTwo \repeat unfold 3 { \skip 4 } \tagTwo
      }
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

  \paper {
    top-margin = 20
    bottom-margin = 20
    ragged-bottom-last = ##f
    ragged-bottom = ##f
  }
}