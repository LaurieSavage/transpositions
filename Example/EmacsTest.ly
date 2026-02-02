\version "2.24.4"
 
% Use convert-ly to update this file if the version is different to the lilypond you use.

% For more information go to (info "(lilypond)FIXME"). Place cursor after the last
% parenthesis and C-x C-e.

#(set-global-staff-size 16)
\include "english.ly"

 global = {
   \key c\major
   \time 4/4
   }
% LilyPond example file by Amelie Zapf,
%%%%%%%%%%%% Some macros %%%%%%%%%%%%%%%%%%%

sl = {
  \override NoteHead #'style = #'slash
  \override Stem #'transparent = ##t
  }
nsl = {
  \revert NoteHead #'style
  \revert Stem #'transparent
  }
cr = \override NoteHead #'style = #'cross
ncr = \revert NoteHead #'style

%% insert chord name style stuff here.

jzchords = { }


% ############ Horns ############

% ------ Trumpet ------
trpt = \transpose c d \relative c'' {
  INSERT NOTES
  }
trpharmony = \transpose c' d {
  \jzchords
  }
trumpet = {
  \global
  \set Staff.instrumentName = #"Trumpet"
  \clef treble
  <<
    \trpt
    >>
  }

% ------ Alto Saxophone ------
alto = \transpose c a \relative c' {
  \Key
  INSERT NOTES
  }
altoharmony = \transpose c' a {
  \jzchords
  }
altosax = {
  \global
  \set Staff.instrumentName = #"Alto Sax"
  \clef treble
  <<
    \alto
    >>
  }

% ------ Baritone Saxophone ------
bari = \transpose c a' \relative c {
  \Key
  INSERT NOTES % eg. c1 c \sl d4^"Solo" d d d \nsl
  }
bariharmony = \transpose c' a \chordmode {
  \jzchords
  }
barisax = {
  \global
  \set Staff.instrumentName = #"Bari Sax"
  \clef treble
  <<
    \bari
    >>
  }

% ------ Trombone ------
tbone = \relative c {
  \Key
  INSERT NOTES
  }
tboneharmony = \chordmode {
  \jzchords
  }
trombone = {
  \global
  \set Staff.instrumentName = #"Trombone"
  \clef bass
  <<
    \tbone
    >>
  }

% ############ Rhythm Section #############

% ------ Guitar ------
gtr = \relative c'' {
  INSERT NOTES
  }
gtrharmony = \chordmode {
  \jzchords
  CHORDS %eg s1 c2:min7+ d2:maj9
  }
guitar = {
  \global
  \set Staff.instrumentName = #"Guitar"
  \clef treble
  <<
    \gtr
    >>
  }

%% ------ Piano ------
rhUpper = \relative c'' {
  \voiceOne
  \Key
  INSERT NOTES
  }
rhLower = \relative c' {
  \voiceTwo
  \Key
  INSERT NOTES
  }

lhUpper = \relative c' {
  \voiceOne
  \Key
  INSERT NOTES
  }
lhLower = \relative c {
  \voiceTwo
  \Key
  INSERT NOTES
  }

PianoRH = {
  \clef treble
  \global
  \set Staff.midiInstrument = "acoustic grand"
  <<
    \new Voice = "one" \rhUpper
    \new Voice = "two" \rhLower
    >>
  }

PianoLH = {
  \clef bass
  \global
  \set Staff.midiInstrument = "acoustic grand"
  <<
    \new Voice = "one" \lhUpper
    \new Voice = "two" \lhLower
    >>
  }

piano = {
  <<
    \set PianoStaff.instrumentName = #"Piano"
    \new Staff = "upper" \PianoRH
    \new Staff = "lower" \PianoLH
    >>
  }

% ------ Bass Guitar ------
Bass = \relative c {
  \Key
  INSERT NOTES
  }
bass = {
  \global
  \set Staff.instrumentName = #"Bass"
  \clef bass
  <<
    \Bass
    >>
  }

% ------ Drums ------
up = \drummode {
  INSERT NOTES %eg. hh4 <hh sn>4 hh <hh sn> hh <hh sn>4
  }

down = \drummode {
  INSERT NOTES %eg.bd4 s bd s bd s bd s bd s bd s
  }

drumContents = {
  \global
  <<
    \set DrumStaff.instrumentName = #"Drums"
    \new DrumVoice { \voiceOne \up }
    \new DrumVoice { \voiceTwo \down }
    >>
  }

%%%%%%%%% It All Goes Together Here %%%%%%%%%%%%%%%%%%%%%%

\score {
  <<
    \new StaffGroup = "horns" <<
      \new Staff = "trumpet" \trumpet
      \new Staff = "altosax" \altosax
      \new ChordNames = "barichords" \bariharmony
      \new Staff = "barisax" \barisax
      \new Staff = "trombone" \trombone
      >>
    
    \new StaffGroup = "rhythm" <<
      \new ChordNames = "chords" \gtrharmony
      \new Staff = "guitar" \guitar
      \new PianoStaff = "piano" \piano
      \new Staff = "bass" \bass
      \new DrumStaff { \drumContents }
      >>
    >>
  
  \layout {
    \context { \RemoveEmptyStaffContext }
    \context {
      \Score
      \override BarNumber #'padding = #3
      \override RehearsalMark #'padding = #2
      skipBars = ##t
      }
    }
  
  \midi { }
  }
   