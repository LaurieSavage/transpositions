\version "2.25.28"
% automatically converted by musicxml2ly from Chain-Reaction_TS.mxl
\pointAndClickOff

\header {
    title =  "Chain Reaction"
    copyright =  "Warner - Tamerlane 1977"
    composer =  "Michael Franks/ Joe Sample"
    encodingsoftware =  "MuseScore 4.1.1"
    encodingdate =  "2023-12-14"
    source =  "https://musescore.com/user/27643488/scores/11420038"
    }

\layout {
    \context { \Score
        skipBars = ##t
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative d'' {
    \clef "treble" \numericTimeSignature\time 4/4 \key d \major
    \transposition bes, | % 1
    \mark \markup { \box { INTRO } } \stemDown d2 r8 \stemDown d8 r4 | % 2
    r4 \stemDown e8 r4 \stemDown d8 r4 | % 3
    r4 \stemDown d4 r8 \stemDown d8 r4 | % 4
    r8 \stemDown e8 [ \stemDown d8 \stemDown e8 ] \stemDown e4 \stemDown
    e8 [ \stemDown d8 ] | % 5
    \stemDown b'2 r8 \stemDown d,8 r4 \break | % 6
    r4 \stemDown d4 r8 \stemDown e16 [ \stemDown es16 ] \stemDown d4 | % 7
    r4 \stemDown d4 r8 \stemDown d8 r4 | % 8
    r4 \stemDown d4 \stemDown b'8 \stemDown d4 \stemDown d8 \repeat
    volta 2 {
        | % 9
        \mark \markup { \musicglyph "scripts.segno" } \mark \markup {
            \box { A } } r8 \stemDown fis,,8 [ \stemDown b8 \stemDown
        fis'8 ] \stemDown b8 [ \stemDown cis8 \stemDown a8 \stemDown b8
        ] \break | \barNumberCheck #10
        \stemDown fis8 [ \stemDown a8 \stemDown e8 \stemDown d8 ]
        \stemDown e16 ( [ \stemDown f16 ) \stemDown e8 ] \stemDown d8 [
        \stemDown b8 ~ ] | % 11
        \stemDown b2 r8 \stemUp fis8 [ \stemUp b8 \stemUp d8 ] | % 12
        \stemDown f8 [ \stemDown d8 \stemDown f8 \stemDown d8 ~ ]
        \stemDown d8 \stemDown b4. | % 13
        \stemDown b'8 [ \stemDown b8 \stemDown d8 \stemDown b8 ~ ]
        \stemDown b2 \break | % 14
        r8 \stemDown b8 [ \stemDown d8 \stemDown b8 ( ] \stemDown a8 ) ~
        [ \stemDown a8 \stemDown fis8 ( \stemDown d8 ) ] | % 15
        \stemDown e8 \stemDown d4. r2 | % 16
        R1 \bar "||"
        r8 \stemUp fis,8 [ \stemUp b8 \stemUp d8 ~ ] \stemDown d4
        \stemDown e4 | % 18
        r8 \stemUp fis,8 [ \stemUp b8 \stemUp d8 ~ ] \stemDown d4
        \stemDown e4 \break | % 19
        r4 \stemUp fis,8 [ \stemUp b8 ] \stemDown d8 [ \stemDown d8
        \stemDown e8 \stemDown d8 ] | \barNumberCheck #20
        \stemDown fis4 \stemDown b,8 [ \stemDown d8 ~ ] \stemDown d4
        \stemDown b4 | % 21
        r8 \stemUp fis8 [ \stemUp b8 \stemUp d8 ~ ] \stemDown d4
        \stemDown e4 | % 22
        r8 \stemUp fis,8 [ \stemUp b8 \stemUp d8 ~ ] \stemDown d4
        \stemDown e4 | % 23
        r4 \stemUp fis,8 [ \stemUp b8 ] \stemDown d8 [ \stemDown d8
        \stemDown e8 \stemDown e8 ] \break | % 24
        r8 \stemDown fis8 [ \stemDown b,8 \stemDown d8 ~ ] \stemDown d4
        \stemDown b8 [ \stemDown b8 ] }
    \repeat volta 2 {
        %^ "<font size="14"/>To Coda" | % 25
        \mark \markup { \box { B } } \stemDown d8 [ \stemDown fis8
        \stemDown e8 \stemDown d8 ~ ] \stemDown d4 \stemDown e4 ~ | % 26
        \stemDown e4 r4 \stemDown fis8 \stemDown a4 \stemDown cis8 ~ | % 27
        \stemDown cis8 \stemDown b4 \stemDown a8 ~ \stemDown a4
        \stemDown b4 ~ | % 28
        \stemDown b4 r4 r8 \stemDown fis4 \stemDown a8 \break | % 29
        \stemDown fis8 \stemDown e4 \stemDown d8 ~ \stemDown d4
        \stemDown e4 ~ | \barNumberCheck #30
        \stemDown e4 r8 \stemDown e8 \stemDown fis8 \stemDown a4
        \stemDown cis8 ~ | % 31
        \stemDown cis8 \stemDown b4 \stemDown a8 ~ \stemDown a4
        \stemDown b4 ~ | % 32
        \stemDown b2 r2 }
    \repeat volta 2 {
        %^ "<font size="14"></font>D.S. al Coda" | % 33
        \mark \markup { \musicglyph "scripts.coda" } \stemDown d8 [
        \stemDown cis8 \stemDown b8 \stemDown b8 ~ ] \stemDown b4
        \stemDown d8 [ \stemDown cis8 ] \break | % 34
        \stemDown b8 [ \stemDown b8 ~ ] \stemDown b4 \stemDown d8 [
        \stemDown cis8 \stemDown b8 \stemDown b8 ~ ] | % 35
        \stemDown b4 \stemDown d8 [ \stemDown cis8 ] \stemDown b8 [
        \stemDown b8 ~ ] \stemDown b4 | % 36
        \stemDown d8 [ \stemDown cis8 \stemDown b8 \stemDown b8 ~ ]
        \stemDown b4 - "Repeat and fade" r4 }
    }

PartPOneVoiceOneChords =  \chordmode {
    | % 1
    b2:m7 s8 s8 s4 | % 2
    s4 s8 s4 s8 s4 | % 3
    e4:7 s4 s8 s8 s4 | % 4
    s8 s8 s8 s8 s4 s8 s8 | % 5
    b2:m7 s8 s8 s4 | % 6
    s4 s4 s8 s16 s16 s4 | % 7
    e4:7 s4 s8 s8 s4 | % 8
    s4 s4 s8 s4 s8 \repeat volta 2 {
        | % 9
        b8:m7 s8 s8 s8 s8 s8 s8 s8 | \barNumberCheck #10
        s8 s8 s8 s8 s16 s16 s8 s8 s8 | % 11
        e2:7 s8 s8 s8 s8 | % 12
        s8 s8 s8 s8 s8 s4. | % 13
        b8:m7 s8 s8 s8 s2 | % 14
        s8 s8 s8 s8 s8 s8 s8 s8 | % 15
        e8:7 s4. s2 | % 16
        s1 \bar "||"
        b8:m7 s8 s8 s8 s4 s4 | % 18
        s8 s8 s8 s8 s4 s4 | % 19
        e4:7 s8 s8 s8 s8 s8 s8 | \barNumberCheck #20
        s4 s8 s8 s4 s4 | % 21
        b8:m7 s8 s8 s8 s4 s4 | % 22
        s8 s8 s8 s8 s4 s4 | % 23
        e4:7 s8 s8 s8 s8 s8 s8 | % 24
        s8 s8 s8 s8 s4 s8 s8 }
    \repeat volta 2 {
        | % 25
        e8:m7 s8 s8 s8 s4 s4 | % 26
        a4:7 s4 s8 s4 s8 | % 27
        fis8:m7 s4 s8 s4 s4 | % 28
        b4:7 s4 s8 s4 s8 | % 29
        e8:m7 s4 s8 s4 s4 | \barNumberCheck #30
        a4:7 s8 s8 s8 s4 s8 | % 31
        fis8:m7 s4 s8 s4 s4 | % 32
        b2:7 s2 }
    \repeat volta 2 {
        | % 33
        b8:m7 s8 s8 s8 s4 s8 s8 | % 34
        s8 s8 s4 s8 s8 s8 s8 | % 35
        e4:7 s8 s8 s8 s8 s4 | % 36
        s8 s8 s8 s8 s4 s4 }
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata =
    ##t\skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "1.Well," af -- ter all
    the tears and laugh -- ter you and I -- "'ve " __\skip1 been
    "through, " __\skip1 How can you ask me what "love " __\skip1 "is?"
    Love is a "chain, " __\skip1 Just a "chain " __\skip1 \skip1 re
    --\skip1 act "ion." Once you "break " __\skip1 "it," You "can't"
    "fake " __\skip1 "it," Once you wind it up you "can't" un -- "wind "
    __\skip1 "it." Once you "lose " __\skip1 "it," Or mis -- "use "
    __\skip1 it You can hunt for -- ev -- er Nev -- er "find " __\skip1
    "it. " __\skip1 some love in "your " __\skip1 "groove, " __\skip1
    Just get "hip " __\skip1 to for --\skip1 "give. " __\skip1 Are you
    try -- ing "to " __\skip1 "prove " __\skip1 that you can "take "
    __\skip1 more "than " __\skip1 "give? " __\skip1 Love is a "chain, "
    __\skip1 Love is a "chain, " __\skip1 Love is a "chain, " __\skip1
    Love is a "chain, " __\skip1 Love is a "chain. " __\skip1
    }

PartPOneVoiceOneLyricsTwo =  \lyricmode {\set ignoreMelismata =
    ##t\skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "2.You" come home bro --
    ken like your "soul " __\skip1 "is " __\skip1 "black " __\skip1
    \skip1 and "blue, " __\skip1 And then you ask me what "love "
    __\skip1 "is?" \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 "2.Get" What good is "your " __\skip1
    "song, " __\skip1 If it "ain't " __\skip1 in "my " __\skip1 "key? "
    __\skip1 Lone -- li -- ness makes "you " __\skip1 "strong " __\skip1
    but on -- ly "love " __\skip1 makes "you " __\skip1 "free. "
    __\skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
    }


% The score definition
\score {
    <<
        
        \context ChordNames = "PartPOneVoiceOneChords" { \PartPOneVoiceOneChords}
        \new Staff
        <<
            \set Staff.instrumentName = "Tenor Saxophone"
            \set Staff.shortInstrumentName = "T. Sax."
            
            \context Staff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                \new Lyrics \lyricsto "PartPOneVoiceOne" { \set stanza = "1." \PartPOneVoiceOneLyricsOne }
                \new Lyrics \lyricsto "PartPOneVoiceOne" { \set stanza = "2." \PartPOneVoiceOneLyricsTwo }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

