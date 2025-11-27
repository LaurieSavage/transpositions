%%%%% emacsTemplates.ly
\version "2.25.13"

\include "lilyjazz.ily"
\include "jazzchords.ily"

global = {
  \key c\major
  \time 4/4
}
  
\header {
  title = "A Quartet" 
  composer = "Me" 
  copyright = "2024"
  poet = "Me"
  subtitle = "Testing a template"
  meter = "Allegro" 
}

words = \lyricmode { I like green frogs }
myChords = \new ChordNames {  \chordmode { a1:m7 b1:dim c1:maj d1:m7 }}

Violinone = { <<
				%\new ChordNames { \myChords %}
  
  \new Voice = "song" { \relative c''{
  \set Staff.instrumentName = "Violin 1"
  a1 b1 c1 d1
  \bar "|." }}
  
  \new Lyrics \lyricsto "song" { \words }
  >>  }
				%*********************************

Violintwo = \new Voice { \relative c''{
  \set Staff.instrumentName = "Violin 2"
  a1 b1 c1 d1
  \bar "|." }}   %*********************************

Viola = \new Voice { \relative c' {
  \set Staff.instrumentName = "Viola"
  \clef alto
  a1 b1 c1 d1
  \bar "|." }}   %*********************************

Cello = \new Voice { \relative c' {
  \set Staff.instrumentName = "Cello"
  \clef bass
  a1 b1 c1 d1
  \bar "|."}}   %**********************************

music = {
  <<
    \tag #'score \tag #'sax { << \myChords >> }
    \tag #'score \tag #'sax \new Staff { << \global \Violinone >> }
    \tag #'score \tag #'vn2 \new Staff { << \global \Violintwo>> }
    \tag #'score { << \transpose bes c \myChords >> }
    \tag #'score \tag #'vla \new Staff { << \global \transpose bes c' \Viola>> }
    \tag #'score \tag #'vlc \new Staff { << \global \Cello>> }
    >>
  }

% You can call M-x LilyPond-sub-buffer in new  buffer and get the related parts files.
% And call M-x LilyPond-score-buffer in new  buffer and get the related score.ly file.
% It needs to be called score.ly or you need to change the \tag #'score to whatever the name is.
% If you name the parts files things like vn1.ly etc all will be well. If you name
% them some other name you will need to change the name of the \tags in this file.%%%%% templatesEmacs.ly
