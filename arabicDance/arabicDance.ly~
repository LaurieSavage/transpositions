\version "2.25.28"
\include "lilyjazz.ily"
 
\header{
  title = "Arabic Dance"
  composer = "Traditional"
  instrument = "B flat"
  tagline = "Edited by LS"
  piece = ""
}

Sax = {
  \relative c' 
  {
    \key c \major 
    \time 4/4
    \set Score.skipBars = ##t
    \override MultiMeasureRest.expand-limit = 1
    \partial 4 e4
    gis8 a b4 b b c2. b8 a gis a b4 c8 (b) a b a (gis4.) r4 e
    gis8 a b4 b b d2 ~d8 c b a gis a b4 c8 (b) a b a (gis4.) r2
    
    e8 e'4 dis8 e4 b c4. d8 e4 d16 c b a gis8 a4. ~a8 gis f gis f e4. r8 e \tuplet 3/2 {c'8 b a}

    \repeat volta 2 { 
      gis1 a 1 gis8 a b gis ~gis e f d e f gis a b e b a
      gis1 a2 r8 e \tuplet 3/2 {c'8 b a} gis8 a b gis ~gis e f d
    }
    \alternative {
      {e2 r8 e \tuplet 3/2 {c'8 b a}}
      {e2 r8 e' d16 c b a}
    }
    
    \repeat volta 2 {
      gis8 a b gis ~gis e f16 e f d e8 f gis a b e d16 c b a gis8 a b gis ~gis e f16 e f d
    }
    \alternative {
      {e8 e4 b8 e b e4}
      {e2. r4}
    }
  }
}

ScaleTones = {
  \relative c'{
      \key c \major
      e1 f gis a b c d e
    }
}

jazzChords =  \chordmode {
  \partial 4 s4 
  e1 a1:m e2 f2 e1
  e1 d1:min e2 f2 f1
  e1 a:m e e

  \repeat volta 2 {
    e1 a:m e4*3 d4:min e1 e a:min e4*3 d4:min 
  }
  \alternative {
    {d1:m}
    {e4*3 d4:min}
  }

  \repeat volta 2 {
    e4*3 d4:min e4*3 d4:min e4*3 d4:min
  }
  \alternative {
    { e1 }
    { e1 }
  }

}

\score{
  <<
    \transpose bes c 
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
    }
    %\new Staff{
      %\set Staff.instrumentName = "Tenor Sax"
      \transpose bes c' \Sax
      %}
    % \transpose ees c' \Sax
  >>
  \header {
    piece = "Play twice, solos, then twice out"
  }
  \layout { 
   % #(layout-set-staff-size 18) 
    \context{ 
      \Score \override SpacingSpanner.base-shortest-duration = \musicLength 1 
    }
  }
}

\score{
  <<
    \transpose bes c' \ScaleTones
  >>
  \header {
    piece = "Ahava Raba Scale"
    }
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.15.7, 2.15.9, 2.15.10, 2.15.16, 2.15.17,
2.15.18, 2.15.19, 2.15.20, 2.15.25, 2.15.32, 2.15.39, 2.15.40,
2.15.42, 2.15.43, 2.16.0, 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11,
2.17.14, 2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27,
2.17.29, 2.17.97, 2.18.0
%}
