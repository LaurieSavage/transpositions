\version "2.25.28"

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
  title = \markup{\smallCaps "The way you look tonight"}
  subtitle = "Female Vocalist: A flat concert key."
  composer = \markup{\large "Jerome Kern"}
  poet = \markup{\large "Dorothy Fields"}
  tagline = ##f
  copyright = \markup {\italic"From 'Swingtime', 1936 "}
}

global = {
  \time 4/4
  \key ees \major
  \tempo 4=200
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

chordNames = \chordmode {
  \global
  % A section
  %%%%%%%%%%%%%%%%%%%%
  ees1:maj
  c1:m
  f1:m
  bes1:7
  g1:m7.5-
  c1:7.9+
  f1:m
  bes1:7

  bes1:m
  ees1:7
  aes2:maj c2:7.9+
  f2:m
  bes2:7

  % Repeats
  % R1
  ees1:maj
  f1:m
  ees1:maj
  f1:m

  % R2
  ees1:maj
  f1:m
  ees1:maj
  aes2:m des2:m

  % Bridge
  ges1:maj
  ees1:7.9-
  aes1:m
  des1:7
  ges1:maj
  ees1:m
  aes1:m
  des1:7
  ges1:maj
  ees1:7
  aes2:m fis2:m
  f2:m7.5- bes2:7.9+
  ees1:m
  c2:m7.5- f2:7.9-
  f1:m
  bes1:7

  % Reprise
  ees1:maj
  c1:m
  f1:m
  bes1:7
  g1:m7.5-
  c1:7.9+
  f1:m
  bes1:7
  bes1:m
  ees1:7
  aes2:maj c2:7.9+
  f2:m bes2:7
  ees1:maj
  f1:m
  ees1:maj
  f1:m
  f1:m
  bes1:7
  ees1:maj
  f2:m bes2:7

}

melody = \relative c'' {
  \global
  % Refrain
  \repeat volta 2 {
    \mark \default
    bes1
    ees,1
    f4 g aes g
    f1
    g4 aes bes aes
    g1
    aes4 bes c bes
    aes4 bes c d \bar "||" \break
    ees1
    ees,1
    f4 g bes aes
    g2 f2  \break
  }
  \alternative {
    {
      % Repeat 1
      ees1~
      ees4 r4 r2
      R1
      r4 c d f
    }{
      % Repeat 2
      ees1~
      ees4 r4 r2
      R1
      R1 \bar "||"  \break
    }
  }

  % Bridge
  \mark \default
  bes'2 bes
  bes2 bes
  bes4 des ces aes~
  aes1
  aes4 bes ges f~
  f2 ges
  ees1~
  ees2. r4 \bar "||" \break
  des'2 des
  des2 des
  des4 ees ces bes~
  bes1
  aes4 bes2 ges4
  f2 ges2
  bes1~
  bes2. r4 \bar "||"  \break

  % Reprise
  \mark \default
  bes1
  ees,1
  f4 g aes g
  f1
  g4 aes bes aes
  g1
  aes4 bes c bes
  aes4 bes c d \bar "||" \break
  ees1
  ees,1 f4 g bes aes
  g2 f2 \break

  <<
   \new Voice = "splitPart" {\voiceOne \relative c'{
      ees4_\markup{\musicglyph "pedal.Ped"} bes'^"hum ..." (c2)
      r4 g'  (f2)
      r4 d (c2)
      r4 g (f2)
    }}
    \new Voice { \voiceTwo
     \relative c {
      bes1_"- night"~
      bes~
      bes~
      bes
    }}
  >>
  \oneVoice
  \break
  f4 g bes aes
  g2 f
  ees1~
  ees2 r2 \bar "|."
}

stanzaone = \lyricmode {
  Some day
  when I'm awf -- 'ly low
  when the world is cold
  I will feel a glow just think -- ing of you
  and the way you look to -- night. __

  Oh, but you're
  \repeat unfold 2 { \skip 1 }
}

stanzatwo = \lyricmode {
  love -- ly,
  with your smile so warm,
  and your cheek so soft,
  There is no -- thing for me but to love you,
  just the way you look to --  _ _ _ _  night. __

}

bridge = \lyricmode {
  %_ _ _ night. __

  With each word your ten -- der -- ness grows
  Tear -- ing my fear a -- part __
  And that laugh that wrink -- les your nose
  touch -- es my fool -- ish heart __
}

reprise = \lyricmode {
  Love -- ly, nev -- er, nev -- er change,
  Keep that breath -- less charm,
  Won't you please ar -- range it, 'Cause I love you,
  Just the way you look \set associatedVoice = "splitPart" to -- \set associatedVoice = "song" night
  %mm __ mm __ mm __ mm __
  Just the way you look to -- night __

}
% \book {
%  \bookOutputSuffix "vocals"
\bookpart {
  \header {
    piece = \markup{ \with-color #red "Vocal"}
  }
  \score {
    <<
      \new Staff {
        \new Voice = "song" \transpose ees aes {  \melody }
      }
      \new Lyrics \lyricsto "song" {
        <<
          {  \stanzaone }
          \new Lyrics
          { \set associatedVoice = "song" \stanzatwo  \bridge \reprise }
        >>
      }
    >>
  }
}

%\book {
 % \book OutputSuffix "concert"
\bookpart {
  \header {
    piece = \markup{ \with-color #red "Concert Instruments"}
  }
  \score {
    <<
      \new ChordNames \transpose ees aes { \chordNames }
      \new Staff \transpose ees aes { \melody }
    >>


    \layout { }
    \midi { }
  }
}

%\book {
 % \bookOutputSuffix "b-flat"
\bookpart {
  \header {
    piece = \markup{ \with-color #red {"Tenor Saxophone"}}
  }
  \score {
    <<
      \new ChordNames \transpose ees bes \chordNames
      \new Staff  \transpose ees bes \melody
    >>


    \layout { }
    %\midi { }
  }
}

% %\book {
% % \bookOutputSuffix "e-flat"
% \bookpart {
%   \header {
%     piece = \markup{ \with-color #red {"E"\flat " Instruments"}}
%   }
%   \score {
%     <<
%       \new ChordNames  \chordNames
%       \new Staff  \melody
%     >>
% 
% 
%     \layout { }
%     %  \midi { }
%   }
% }