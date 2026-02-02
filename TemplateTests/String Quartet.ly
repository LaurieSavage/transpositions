%%%%% piece.ly
%%%%% (This is the global definitions file)

\version "2.24.4"

\header {
  title = "Test Piece"
  composer = "Nobody"
}

global= {
  \time 4/4
  \key c \major
}

Violinone = \new Voice {
  \transpose c bes \relative c''{
    \set Staff.instrumentName = #"Violin 1 " \global

    c2 d e1

    \bar "|."
  }
}

%*********************************
Violintwo = \new Voice {
  \relative c''{
    \set Staff.instrumentName = #"Violin 2 "

    g2 f e1

    \bar "|."
  }
}

%*********************************
Viola = \new Voice {
  \relative c' {
    \set Staff.instrumentName = #"Viola "
    \clef alto

    e2 d c1

    \bar "|."
  }
}


%*********************************
Cello = \new Voice {
  \relative c' {
    \set Staff.instrumentName = #"Cello "
    \clef bass

    c2 b a1

    \bar "|."
  }
}

%**********************************

music = {
  <<
    \tag #'score \tag #'vn1 \new Staff { <<  \Violinone >> }
    \tag #'score \tag #'vn2 \new Staff { << \global \Violintwo>> }
    \tag #'score \tag #'vla \new Staff { << \global \Viola>> }
    \tag #'score \tag #'vlc \new Staff { << \global \Cello>> }
  >>
}

%%% These are the other files you need to save on your computer

%%%%% score.ly
%%%%% (This is the main file)

%%% uncomment the line below when using a separate file
%\include "piece.ly"
#(set-global-staff-size 14)
\score {
  \new StaffGroup \keepWithTag #'score \music
  \layout { }
  \midi { }
}


%%%{ Uncomment this block when using separate files

%%%%% vn1.ly
%%%%% (This is the Violin 1 part file)

%\include "piece.ly"
\bookpart {
%{  \header {
    title = "Test piece"
  }%}
\score {
  \keepWithTag #'vn1 \music

\layout { }

}}



%%%%% vn2.ly
%%%%% (This is the Violin 2 part file)

%\include "piece.ly"
\score {
  \keepWithTag #'vn2 \music
  \layout { }
}


%%%%% vla.ly
%%%%% (This is the Viola part file)

%\include "piece.ly"
\score {
  \keepWithTag #'vla \music
  \layout { }
}


%%%%% vlc.ly
%%%%% (This is the Cello part file)

%\include "piece.ly"
\score {
  \keepWithTag #'vlc \music
  \layout { }
}

%%%}