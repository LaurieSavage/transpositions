\version "2.25.16"

\pointAndClickOff

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

% \paper {
%   top-margin = 10
%   bottom-margin = 10
%   ragged-bottom-last = ##f
%   ragged-bottom = ##f
% }

global = {
  \time 4/4
  \key g \major
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \autoBeamOff
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
  \override Score.RehearsalMark.font-size = #2
  \override Score.RehearsalMark.color = "tomato"
  \override Score.CodaMark.color = "tomato"
  \override Score.SegnoMark.color = "tomato"
  \override Score.SectionLabel.color = "tomato"
  \override Score.JumpScript.color = "tomato"
  \override Score.TextMark.color = "tomato"
}

\include "Lyrics.ly"
\include "TheChords.ly"
\include "TheNotes.ly"

\header {
  title = \markup \with-color "tomato" "Poinciana"
  subtitle =  \markup {
    \with-color "tomato" \center-column
    {
      \line { "The song of the tree" }
      \line { \small \italic "(From a Cuban folk song)" }
    }
  }
  composer = \markup \with-color "tomato" "Buddy Bernier/Nat Simon"
  copyright = \markup \with-color "tomato" "(1936)"
  tagline = \markup { \with-color "tomato" "L.S. March, " \today }
  poet = \markup \with-color "tomato" "Latin"
}

\bookpart {
  \score {
    <<
      \new ChordNames {\set chordChanges = ##t \chordNamesPrel}
      \new Voice = "prelude" {\tempo 4=100 \preludeMelody }
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
}


%{
convert-ly (GNU LilyPond) 2.25.16  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}
