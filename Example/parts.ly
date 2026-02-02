%%%%% parts.ly
\version "2.25.28"
% Use convert-ly to update this file if the version is different to the lilypond you use.

global = {
  \key c\major
  \time  4/4
  }

Violinone = \new Voice { \relative c''{
  \set Staff.instrumentName = "Violin 1"
  
  \bar "|." }}   %*********************************

Violintwo = \new Voice { \relative c''{
  \set Staff.instrumentName = "Violin 2"
  INSERT NOTES
  \bar "|." }}   %*********************************

Viola = \new Voice { \relative c' {
  \set Staff.instrumentName = "Viola"
  \clef alto
  INSERT NOTES
  \bar "|." }}   %*********************************

Cello = \new Voice { \relative c' {
  \set Staff.instrumentName = "Cello"
  \clef bass
  INSERT NOTES
  \bar "|."}}   %**********************************

music = {
  <<
    \tag #'score \tag #'vn1 \new Staff { << \global \Violinone >> }
    \tag #'score \tag #'vn2 \new Staff { << \global \Violintwo>> }
    \tag #'score \tag #'vla \new Staff { << \global \Viola>> }
    \tag #'score \tag #'vlc \new Staff { << \global \Cello>> }
    >>
  }

% You can call M-x LilyPond-sub-buffer in new  buffer and get the related parts files.
% And call M-x LilyPond-score-buffer in new  buffer and get the related score.ly file.
% It needs to be called score.ly or you need to change the \tag #'score to whatever the name is.
% If you name the parts files things like vn1.ly etc all will be well. If you name
% them some other name you will need to change the name of the \tags in this file.