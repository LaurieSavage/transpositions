
\version "2.25.13"
% automatically converted by musicxml2ly from /home/laurie/Documents/Sax/Transpositions/chords.mxl

\header {
  encodingsoftware = "MuseScore 0.9.5"
  source = "http://beta.wikifonia.org/node/681/revisions/934/view"
  encodingdate = "2009-02-16"
  copyright = "All Rights Reserved"
  title = Chords
}

\layout {
  \context {
    \Score
    skipBars = ##t
  }
}
PartPOneVoiceOne =  \relative c' {
  \clef "treble" \key c \major \numericTimeSignature\time 4/4 | % 1
  R1 | % 2
  R1 | % 3
  R1 | % 4
  R1 | % 5
  R1 | % 6
  R1 | % 7
  R1 | % 8
  R1 | % 9
  R1 | \barNumberCheck #10
  R1 | % 11
  R1 | % 12
  R1 | % 13
  R1 | % 14
  R1 | % 15
  R1 | % 16
  R1 | % 17
  R1 | % 18
  R1 | % 19
  R1 | \barNumberCheck #20
  R1 | % 21
  R1 | % 22
  R1 | % 23
  R1 | % 24
  R1 | % 25
  R1 | % 26
  R1 | % 27
  R1 | % 28
  R1 | % 29
  R1 | \barNumberCheck #30
  R1 | % 31
  R1 | % 32
  R1 | % 33
  R1 | % 34
  R1 | % 35
  R1 | % 36
  R1 | % 37
  R1 | % 38
  R1 | % 39
  R1 | \barNumberCheck #40
  R1 | % 41
  R1 | % 42
  R1 | % 43
  R1 | % 44
  R1 | % 45
  R1 | % 46
  R1 | % 47
  R1 | % 48
  R1 | % 49
  R1 | \barNumberCheck #50
  R1 | % 51
  R1 | % 52
  R1 | % 53
  R1 | % 54
  R1 | % 55
  R1 | % 56
  R1 | % 57
  R1 | % 58
  R1 | % 59
  R1 | \barNumberCheck #60
  R1 | % 61
  R1 | % 62
  R1 | % 63
  R1 | % 64
  R1 | % 65
  R1 | % 66
  R1 | % 67
  R1 | % 68
  R1 | % 69
  R1 | \barNumberCheck #70
  R1*3 \bar "|."
}


% The score definition
\score {
  <<
    \new Staff <<
      \context Staff <<
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
      >>
    >>

  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  %  \midi {}
}

