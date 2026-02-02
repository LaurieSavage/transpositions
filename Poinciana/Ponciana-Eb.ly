\version "2.24.4"

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
  left-margin = 15
  right-margin = 15
}

\header {
  title = "Poinciana"
  subtitle = "The song of the tree"
  subsubtitle = "Singer's key Eb"
  composer = "Buddy Bernier/Nat Simon"
  piece = "Cuban"
  copyright = "1936"
  tagline = \markup{"Edited " \today}
}

global = {
  \time 4/4
  \key g \major
  %\tempo 4=100
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \transpose g ees {
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

    % Interlude
    d1*4:sus4.9
    d1:sus4.9
    d1:9
    g1*2:6.9
  }
}

melody = \transpose g ees' {
  \relative c'' {
    \global
    % Introduction
    \repeat volta 2 {

      d1_"Verse"~
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

    % Melody
    \repeat volta 2{
      \mark \default
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
    \mark \default
    ees8 f g a bes4. a8
    c4. bes8 a g f g
    a4 a2.~
    a2. r8 d,8 \break
    ees8 f g a bes4. a8
    c4. bes8 a g f g
    d'1~
    d2 d4. b8 \bar "||" \break
    \mark \default
    a2 a2~
    a8 g a b d b a g
    f1~
    f1 \break
    ees2 ees~
    ees8 ees f g bes g f ees
    d1~
    d2. r4 \break


    % Interlude
    \repeat volta 2 {
      d'1_"Interlude"~
      d2 c4 e
      d1~
      d2 c4 e \break
      d1~
      d2 c4 a
      g1~ g
    }
  }
}

interlude = \lyricmode {
  Blow Tro -- pic wind...
  Sing a song...
  Through the trees...

  Trees Sigh to me...
  Soon my love...
  I will see...
}

verseOne = \lyricmode {
  Poin -- ci -- an -- a
  Your bran -- ches speak to me of love
  Pale moon is cast -- ing sha -- dows from ab -- ove

  Poin -- ci -- an -- a
  Some -- how I feel the jung -- le beat
  With -- in me, there grows a rhyth -- mic, sav -- age
  Beat
}

verseTwo = \lyricmode {
  Love is ev -- ery -- where, it's mag -- ic per -- fume fills the air
  To and fro, you sway, my heart's in time
  I've learned to care

  Poin -- ci -- an -- a
  Though skies may turn from blue to gray
  My love will live for ev -- er and a day
}

% \bookpart {
%   \header {
%     piece = \markup{ \with-color #red "Vocal"}
%   }
%   \score {
%     <<
%       \new Staff {
%         \new Voice = "song" {  \melody }
%       }
%       \new Lyrics \lyricsto "song" {
%         \interlude
%         %<<
%         % {  \interlude }
%         %\new Lyrics
%         % { \set associatedVoice = "song" \stanzatwo  \bridge \reprise }
%         % >>
%       }
%     >>
%   }
% }

\bookpart {
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
    >>

    \layout { }
    \midi { }
  }
}

\book {
  \bookOutputSuffix "Tpt"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with{ instrumentName = "Trumpet"}  \transpose bes c \melody
    >>


    \layout {
      indent = 20
    }
    %\midi { }
  }
}

\book {
  \bookOutputSuffix "TSax"
  \score {
    <<
      \new ChordNames \transpose bes c \chordNames
      \new Staff \with { instrumentName = "Tenor Sax"}  \transpose bes c' \melody
    >>


    \layout {
    indent = 20
    }
    %  \midi { }
  }
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
