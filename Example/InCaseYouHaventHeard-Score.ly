\version "2.24.4"


% Header definitions
G_title = "In Case You Haven't Heard"
G_subtitle = ""
G_subsubtitle = \markup { \italic "dedicated to Jack Pierson (1931-2018)" }
G_composer = "By Woody Shaw"
G_arranger = "Arr. Jeff Kopmanis"
G_poet = ""
G_copyright = "Copyright © 1983, 2023 - Jeff Kopmanis"
G_tagline = ""
G_spacing = \musicLength 16

songTempo = {
  \tempo \markup { \italic "Latin & Swing"} 4 = 150
}

scoreBreaks = {
  \repeat unfold 2 { s1*8 \break } \bar "|."
}

headChords = \chordmode { 
  \set majorSevenSymbol = \markup { "maj7+4" }
  s1*8 
  \repeat percent 4 { bes2 aes2 | bes2 aes2 }
  s1 | s1 |
  \repeat percent 2 { bes2 aes2 | bes2 aes2 }
  bes2 aes4. bes8 | bes4. aes2 aes8 | aes2 ges2:7+ | ges1:7+ |
  aes2 ges4. aes8 | aes4. ges8 r4 aes4 | aes2 bes4. c8:7+ | c1:7+ |
  s4 s8 des2:7+ s8 | s4 s8 ges2:7+ s8 | s4 s8 d4:9 des4:9 c8:9 | c1:9 | 
  g4.:min a8:min a2:min |
  aes4.:min bes8:min bes2:min | 
  a4.:min b8:min b2:min | s8 g2..:7 
  bes2 aes4. bes8 | bes4. aes8 aes2 | aes2 aes8 ges4. | ges1 |
  aes2 ges4. aes8 | aes4. ges8 s4 aes4 | aes2 bes4. c8 | c2. s4 |
  % swing
  ges2..:7+ ees8:min | ees1:min | ges1:7+ | b2:min e2:7 |
  ges1:7+ e1:7+ d1:7+ b2:min e2:7 | e1:7
  
}
soloChords = \chordmode {
  \set chordChanges = ##t
  \set majorSevenSymbol = \markup { "maj7+4" }
  \repeat percent 8 { b1:7+ } \bar "||"
  \mark \default
  \repeat percent 8 { d1:7+ } \bar "||"
  \mark \default
  \repeat percent 8 { f1:7+ } \bar "||"
  \mark \default
  \repeat percent 8 { aes:7+ }
}
codaChords = \chordmode {
  \repeat percent 8 { bes2 aes2 }
  bes8 s8 s4 s2 | s1 | bes4 s4 s2
}

soloRests = {
  s1*8^\markup { \italic \bold Solos }_\markup { \italic Latin } \bar "||"
  s1*8_\markup { \italic Swing } \bar "||"
  s1*8_\markup { \italic Latin } \bar "||"
  s1*8_\markup { \italic Swing } 
}

altoIMusic = \relative c'' {
  \clef treble
  \songTempo
  
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*6 | \repeat percent 3 { g'4 g8 g8 f8 f4 g8 | r8 g8 r g f c-. f4 } | g4 r4 r2 | R1*5 \bar "||"
    \mark \default
    % melody
    b4\mf d8 b a g a b~ | b d b a~ a c, a'4~ | a4 f8 c g' ees~ ees4~ | ees1 |
    g4 bes8 g f cis f g~ | g bes g f r cis a'4~ | a4 f8 a b a b cis~ | cis2.. r8 | 
    \bar "||" \mark \default
    r2 r4 r8 e,8 | a bes g4~ g4. r8 |
    r4 r8 f4-> e-> dis8->~ | dis1 | r1 | f8 g f g~ g4 f8 c | fis8 gis fis gis~ gis4 fis4-. | r8 cis' a dis,-> r8 b'4-.^\markup { \italic "(w/Trts)" } d,8 
    \bar "||" \mark \default
    
    b'4 d8 b a g a b~ | b d b a~ a c, a'4~ | a4 f8 c g' ees~ ees4~ | ees1 |
    g4 bes8 g f cis f g~ | g bes g f r cis\< a'4~ | a f8 a b a b cis~ | cis2..\ff\! r8
    \bar "||" \mark \default

    d4.^\markup { \italic Soli }_\markup { \italic Swing } a8 r g f ees~ | ees4 f8 g~ g f g4 | d'4. a ees4 | bes' aes8 ees8 r2 |
    d'4. a8 r g c, c' | g2. ees8 bes | bes' f~ f4 gis8 bes f ees | b gis b cis~ cis2~ | cis1
    
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"

    \alternative {
      { }
      {
        \break
%         \section
%         \sectionLabel "Coda"
        % Coda
        \mark \markup { \coda \bold Coda } 
        R1*4 |
        \repeat percent 2 { d4 d8 d c c4 d8 | r d r d c g c4 }
        d8-. r8 r4 r2 | r1 | d'4-. r4 r2
        \bar "|."
      }
    }
  }
  
}

altoIIMusic = \relative c'' {
  \clef treble
  \songTempo
    
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*6 | \repeat percent 3 { g4 g8 g8 f8 f4 g8 | r8 g8 r g f c-. f4 } | g4 r4 r2 | R1*5 \bar "||"
    \mark \default
    R1*5 | r2 r8 cis8 f4~ | f4 dis8 f g f g a~ | a2.. r8 | 
    \bar "||" \mark \default
    r2 r4 r8 e | a bes g4~ g4. r8 |
    r4 r8 d4-> cis-> c8->~ | c1 | r1 | f8 g f g~ g4 f8 c | fis8 gis fis gis~ gis4 fis4-. | r8 cis' a dis,-> r2
    \bar "||" \mark \default
    
    R1*5 | r2 r8 cis\< f4~ | f bes,8 d e d e fis~ | fis2..\ff\! r8 |
    \bar "||" \mark \default

    d4.^\markup { \italic Soli }_\markup { \italic Swing } a8 r g f ees~ | ees4 f8 g~ g f g4 | d'4. a ees4 | bes' aes8 ees8 r2 |
    d'4. a8 r g' c, c' | g2. ees8 bes | bes' f~ f4 gis8 bes f ees | b gis b cis~ cis2~ | cis1
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
        \break
%         \section
%         \sectionLabel "Coda"
        % Coda
        \mark \markup { \coda \bold Coda } 
        R1*4 |
        \repeat percent 2 { d4 d8 d c c4 d8 | r d r d c g c4 }
        d8-. r8 r4 r2 | r1 | d'4-. r4 r2
        \bar "|."
      }
    }
  }

}

tenorIMusic = \relative c'' {
  \clef treble
  \songTempo
    
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*6 | \repeat percent 3 { c4 c8 c8 bes8 bes4 c8 | r8 c8 r c bes f-. bes4 } | c4 r4 r2 | R1*5 \bar "||"
    \mark \default
    e4\f g8 e d c d e~ | e g e d~ d f, d'4~ | d4 bes8 f c' aes~ aes4~ | aes1 |
    c4 ees8 c bes fis bes c~ | c ees c bes r fis d'4~ | d4 bes8 d e d e fis~ | fis2.. r8 | 
    \bar "||" \mark \default
    r2 r4 r8 a,8 | d ees c4~ c4. r8 |
    r4 r8 bes4-> a-> gis8->~ | gis1 | r1 | bes8 c bes c~ c4 bes8 f | b cis b cis~ cis4 b4-. | r8 fis' d gis,-> r e'4^\markup { \italic "(w/Trts)" } g,8    
    \bar "||" \mark \default
    
    e'4 g8 e d c d e~ | e g e d~ d f, d'4~ | d4 bes8 f c' aes~ aes4~ | aes1 |
    c4 ees8 c bes fis bes c~ | c ees c bes r fis\< d'4~ | d bes8 d e d e fis~ | fis2..\ff\! r8 |
    \mark \default
    
    g4.^\markup { \italic Soli }_\markup { \italic Swing } d8 r c bes aes~ | aes4 bes8 c~ c bes c4 | g'4. d4. aes4 | ees'4 des8 aes r2 |
    g'4. d8 r c f, f' | c2. aes8 ees | ees' bes~ bes4 cis8 ees bes aes | e cis e fis~ fis2~ | fis1
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
        \break
%         \section
%         \sectionLabel "Coda"
        % Coda
        \mark \markup { \coda \bold Coda } 
        R1*4 |
        \repeat percent 2 { g4 g8 g f f4 g8 | r g r g c c f4 }
        g8-. r8 r4 r2 | r1 | g4-. r4 r2
        \bar "|."
      }
    }
  }

}

tenorIIMusic = \relative c'' {
  \clef treble
  \songTempo
    
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*6 | \repeat percent 3 { c4 c8 c8 d8 d4 c8 | r8 c8 r c d-. r d4-- } | c4 r4 r2 | R1*5 \bar "||"
    \mark \default
    g2\pp f4. g8~ | g4. f4. f4~ | f2 ees2~ | ees4. ees8 ees4 ees | f2 ees4. f8~ | f4. ees8 r fis bes4~ |
    bes4 gis8 bes c bes c d~ | d2.. r8 | 
    \bar "||" \mark \default
    r2 r4 r8 a8 | d ees c4~ c4. r8 |
    r4 r8 g4-> fis4-> f8~ | f1 | r1 | bes8 c bes c~ c4 bes8 f |b cis b cis~ cis4 b4-. | r8 fis' d gis,-> r2 | 
    \bar "||"
    \mark \default
    
    g2 f4. g8~ | g4. f4. f4~ | f4 f4. ees4.~ | ees4. ees8-. ees4-- ees8-- ees8-. |
    f2 ees4. f8~ | f4. ees8 r fis\< bes4~ | bes4 gis8 bes c bes c d~ | d2..\ff\! r8
    \mark \default
    
    g4.^\markup { \italic Soli }_\markup { \italic Swing } d8 r c bes aes~ | aes4 bes8 c~ c bes c4 | g'4. d4. aes4 | ees'4 des8 aes r2 |
    g'4. d8 r c f, f' | c2. aes8 ees | ees' bes~ bes4 cis8 ees bes aes | e cis e fis~ fis2~ | fis1
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
        \break
%         \section
%         \sectionLabel "Coda"
        % Coda
        \mark \markup { \coda \bold Coda } 
        R1*4 |
        \repeat percent 2 { g4 g8 g f f4 g8 | r g r g c c f4 }
        g8-. r8 r4 r2 | r1 | g4-. r4 r2
        \bar "|."
      }
    }
  }

}

bariSaxMusic = \relative c'' {
  \clef treble
  \songTempo    
  
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*6 | \repeat percent 3 { d4 d8 d c c4 d8 | r d r d c-. r c4-- } | d4 r4 r2 | R1*5 \bar "||"
    \mark \default
    b2\pp a4. b8~ | b4. a4. a4~ | a2 g2~ | g4. g8 g4 g | a2 g4. a8~ | a4. g8 r4 a4~ |
    a2 b4. cis8~ | cis8 cis16-. cis-. cis-. cis8-> cis16-. r2 | 
    \bar "||" \mark \default
    r1 | r2 r4 r8 c8 |
    g8 gis4 e e g8~ | g1 | r1 | f'8 g g g~ g4 f8 c | fis8 gis fis gis~ gis4 fis4-. | r8 cis' a dis,-> r2
    \bar "||" \mark \default
    
    b2 a4. b8~ | b4. a4. a4~ | a4 a4. g4.~ | g4. g8-. g4-- g8-- g8-. |
    a2 g4. a8~ | a4. g8 r cis\< f4~ | f4 dis8 f g f g a~ | a2..\ff\! r8 |
    \bar "||" \mark \default

    d,4.^\markup { \italic Soli }_\markup { \italic Swing } a8 r g f ees~ | ees4 f8 g~ g f g4 | d'4. a ees4 | bes' aes8 ees8 r2 |
    d'4. a8 r g' c, c' | g2. ees8 bes | bes' f~ f4 gis8 bes f ees | b gis b cis~ cis2~ | cis1
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
        \break
%         \section
%         \sectionLabel "Coda"
        % Coda
        \mark \markup { \coda \bold Coda } 
        R1*4 |
        \repeat percent 2 { d,4 d8 d c c4 d8 | r d r d c4-. c }
        d8-. r8 r4 r2 | r1 | d4-. r4 r2
        \bar "|."
      }
    }
  }

}

trumpetIMusic = \relative c'' {
  \clef treble
  \songTempo
    
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*8 | c'4 c8 c bes bes4 c8 | r8 c r c bes f bes4 | c4 c8 c bes bes4 ees8 | r ees r c bes f bes4 | c4 r4 r2 | R1*5 \bar "||"
    \mark \default
    e,4\f g8 e d c d e~ | e g e d~ d f, d'4~ | d4 bes8 f c' aes~ aes4~ | aes1 | 
    c4 ees8 c bes fis bes c~ | c ees c bes r8 fis d'4~ | d4 bes8 d e d e fis~ | fis2.. a8 | 
    \bar "||" \mark \default
    e4 fis8 d~ d4. r8 | r1 |
    r4 r8 bes'4 a4 gis8~ | gis1 | R1*2 | b8 cis b cis~ cis4 b4-. | r8 fis'8 d gis, r e4^\markup { \italic "(w/Saxes)" } g,8
    \bar "||" \mark \default
    
    e'4 g8 e d c d e~ | e g e d~ d f, d'4~ | d4 bes8 f c' aes~ aes4~ | aes1 |
    c4 ees8 c bes fis bes c~ | c ees c bes r fis\< d'4~ | d bes8 d e d e fis~ | fis2..\ff\! r8 |
    \bar "||" \mark \default

    R1*9
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \mark \markup { \coda \bold Coda } 
        R1*6 | c4 c8 c bes bes4 c8 | r c r c bes g bes4 | c8 r8 r4 r2 | r1 | c4-. r4 r2 \bar "|."
      }
    }
  }

}

trumpetIIMusic = \relative c'' {
  \clef treble
  \songTempo
    
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*8 | c'4 c8 c bes bes4 c8 | r8 c r c bes f bes4 | c4 c8 c bes bes4 ees8 | r ees r c bes f bes4 | c4 r4 r2 | R1*5 \bar "||"
    \mark \default
    e,4\f g8 e d c d e~ | e g e d~ d f, d'4~ | d4 bes8 f c' aes~ aes4~ | aes1 | 
    c4 ees8 c bes fis bes c~ | c ees c bes r8 fis d'4~ | d4 bes8 d e d e fis~ | fis2.. a8 | 
    \bar "||" \mark \default
    e4 fis8 d~ d4. r8 | r1 |
    r4 r8 bes'4 a4 gis8~ | gis1 | R1*2 | b8 cis b cis~ cis4 b4-. | r8 fis'8 d gis, r e4^\markup { \italic "(w/Saxes)" } g,8
    \bar "||" \mark \default
    
    e'4 g8 e d c d e~ | e g e d~ d f, d'4~ | d4 bes8 f c' aes~ aes4~ | aes1 |
    c4 ees8 c bes fis bes c~ | c ees c bes r fis\< d'4~ | d bes8 d e d e fis~ | fis2..\ff\! r8 |
    \bar "||" \mark \default

    R1*9
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \mark \markup { \coda \bold Coda } 
        R1*6 | c4 c8 c bes bes4 c8 | r c r c bes g bes4 | c8 r8 r4 r2 | r1 | c4-. r4 r2 \bar "|."
      }
    }
  }

}

trumpetIIIMusic = \relative c'' {
  \clef treble
  \songTempo
    
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*8 | g'4 g8 g f f4 g8 | r g r g f c f4 | g g8 g f f4 bes8 | r bes r g f c f4 | g4 r4 r2 | R1*5 \bar "||"
    \mark \default
    R1*5 | r2 r8 fis,8 bes4~ | bes4 gis8 bes c bes c d~ | d2.. a8 | 
    \bar "||" \mark \default
    e'4 fis8 d8~ d4. r8 | r1 |
    r4 r8 g4 fis4 f8~ | f1 | R1*2 | b,8 cis b cis~ cis4 b-. | r8 fis'8 d gis, r2 
    \bar "||" \mark \default
    
    R1*5 | r2 r8 fis\< bes4~ | bes4 gis8 bes c bes c d~ | d2..\ff\! r8
    \bar "||" \mark \default

    R1*9
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \mark \markup { \coda \bold Coda } 
        R1*6 | c4 c8 c bes bes4 c8 | r c r c bes g bes4 | c8 r8 r4 r2 | r1 | c4-. r4 r2 \bar "|."
      }
    }
  }

}

trumpetIVMusic = \relative c'' {
  \clef treble
  \songTempo
  
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*8 | e4 e8 e d d4 e8 | r e r e d a d4 |  e e8 e d d4 g8 | r g r e d a d4 | e4 r4 r2 | R1*5 \bar "||"
    \mark \default
    R1*5 | r2 r8 fis,8 bes4~ | bes4 gis8 bes c bes c d~ | d2.. a8 | 
    \bar "||" \mark \default
    e'4 fis8 d8~ d4. r8 | r1 |
    r4 r8 g4 fis4 f8~ | f1 | R1*2 | b,8 cis b cis~ cis4 b-. | r8 fis'8 d gis, r2 
    \bar "||" \mark \default
    
    R1*5 | | r2 r8 fis\< bes4~ | bes4 gis8 bes c bes c d~ | d2..\ff\! r8
    \bar "||" \mark \default

    R1*9
    \bar "[|:" 
    \mark \default
    \repeat volta 2 { \soloRests }
    \bar ":|]"
    
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \mark \markup { \coda \bold Coda } 
        R1*6 | c4 c8 c bes bes4 c8 | r c r c bes g bes4 | c8 r8 r4 r2 | r1 | c4-. r4 r2 \bar "|."
      }
    }
  }

}

tromboneIMusic = \relative c {
  \clef bass
  \songTempo
  
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*4 | \repeat percent 4 { bes'2\ff aes2 | r8 bes4 bes8 aes2 } | bes4 r4 r2 | r1 | 
      \repeat percent 2 { bes4 bes8 bes aes aes4 bes8 | r8 bes r bes aes ees aes4 } \bar "||"
    \mark \default
    bes2 aes4. bes8~ | bes4. aes4. aes4~ | aes2 ges2~ | ges2\> r2\ppp\! 
    aes2 ges4. aes8~ | aes4. ges8 r4 aes4~ | aes2 bes4. c8~ | c8 c16-. c-. c-. c8-> c16-. r2 | 
    \bar "||" \mark \default
    r1 | r2 r4 r8 ees,8 |
    bes'8 b4 aes g ges8~ | ges f4 e4~ e8 r4 | g8 a g a~ a4 g8 d | aes' bes aes bes~ bes4 aes8 ees |
    a8 b a b~ b4 a4-. | r8 a8 a a r2
    \bar "||" \mark \default
    
    bes2 aes4. bes8~ | bes4. aes4. aes4~ | aes aes4. ges4.~ | ges4. ges8-. ges4-- ges8-- ges8-. |
    aes2 ges4. aes8~ | aes4. ges8 r e8\< aes4~ | aes4 fis8 aes bes aes bes c~ | c2..\!\ff r8
    \bar "||" \mark \default

    R1*3 | r2 r8 e8 r4 | R1*5
    \bar "[|:" 
    \mark \default
    \repeat percent 2 { b8--_\markup { \italic Latin } b-. r2 b8-- b-. | r1 }
    R1*4
    \bar "||"
    \repeat percent 8 { r8_\markup { \italic Swing } d r4 d8 r8 r4 }
    R1*8_\markup { \italic Latin } \bar "||"
    R1*8_\markup { \italic Swing }
    \bar ":|]"
          
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \break
        \mark \markup { \coda \bold Coda } 
        \repeat percent 4 { d4 d8 d c c4 d8 | r8 d r d c g c4 }
        d8-. r8 r4 r2 | r1 | d4-. r4 r2
        \bar "|."
      }
    }
  }

}

tromboneIIMusic = \relative c {
  \clef bass
  \songTempo
  
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*2 | \repeat percent 5 { f2\ff ees2 | r8 f4 f8 ees2 } | f4 r4 r2 | r1 |
      \repeat percent 2 { bes4 bes8 bes aes aes4 bes8 | r8 bes r bes aes ees aes4 } 
    \bar "||" \mark \default
    f2 ees4. f8~ | f4. ees4. ees4~ | ees2 des2~ | des2\> r2\ppp\! |
    ees2 des4. ees8~ | ees4. des8 r4 ees4~ | ees2 f4. g8~ | g g16-. g-. g-. g8-> g16-. r2 | 
    \bar "||" \mark \default
    r1 | r2 r4 r8 ees8 |
    bes'8 b4 aes g ges8~ | ges f4 e4~ e8 r4 | g8 a g a~ a4 g8 d | aes' bes aes bes~ bes4 aes8 ees |
    a8 b a b~ b4 a4-. | r8 a8 a a r2
    \bar "||" \mark \default
    
    f2 ees4. f8~ | f4. ees4. ees4~ | ees4 ees4. des4.~ | des4. des8-. des4-- des8-- des-. |
    ees2 des4. ees8~ | ees4. des8 r e8\< aes4~ | aes4 fis8 aes bes aes bes c~ | c2..\!\ff r8
    \bar "||" \mark \default

    R1*3 | r2 r8 b,8 r4 | R1*5
    \bar "[|:" 
    \mark \default
    \repeat percent 2 { fis'8--_\markup { \italic Latin } fis-. r2 fis8-- fis-. | r1 }
    R1*4
    \bar "||"
    \repeat percent 8 { r8_\markup { \italic Swing } a r4 a8 r8 r4 }
    R1*8_\markup { \italic Latin } \bar "||"
    R1*8_\markup { \italic Swing }
    \bar ":|]"
      
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \break
        \mark \markup { \coda \bold Coda } 
        \repeat percent 4 { d4 d8 d c c4 d8 | r8 d r d c g c4 }
        d8-. r8 r4 r2 | r1 | d4-. r4 r2
        \bar "|."
      }
    }
  }
  
}

tromboneIIIMusic = \relative c {
  \clef bass
  \songTempo
  
  R1*4 \bar "||"
  \repeat segno 2 {
    R1*2 | \repeat percent 5 { d2\ff c2 | r8 d4 d8 c2 } | d4 r4 r2 | r1 |
      \repeat percent 2 { f4 f8 f ees ees4 f8 | r f r f ees bes ees4 } 
    \bar "||" \mark \default
    d2 c4. d8~ | d4. c4. c4~ | c2 bes2~ | bes2\> r2\!\ppp |
    c2 bes4. c8~ | c4. bes8 r4 c4~ | c2 d4. e8~ | e e16-. e-. e-. e8-> e16-. r2 | 
    \bar "||" \mark \default
    r1 | r2 r4 r8 ees8 |
    bes'8 b4 aes g ges8~ | ges f4 e4~ e8 r4 | g8 a g a~ a4 g8 d | aes' bes aes bes~ bes4 aes8 ees |
    a8 b a b~ b4 a4-. | r8 a8 a a r2
    \bar "||" \mark \default
    
    d,2 c4. d8~ | d4. c4. c4~ | c4 c4. bes4.~ | bes4. bes8-. bes4-- bes8-- bes-. |
    c2 bes4. c8~ | c4. bes8 r e8\< aes4~ | aes4 fis8 aes bes aes bes c~ | c2..\!\ff r8
    \bar "||" \mark \default

    R1*3 | r2 r8 g,8 r4 | R1*5
    \bar "[|:" 
    \mark \default
    \repeat percent 2 { dis'8--_\markup { \italic Latin } dis-. r2 dis8-- dis-. | r1 }
    R1*4
    \bar "||"
    \repeat percent 8 { r8_\markup { \italic Swing } fis r4 fis8 r8 r4 }
    R1*8_\markup { \italic Latin } \bar "||"
    R1*8_\markup { \italic Swing }
    \bar ":|]"
      
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \break
        \mark \markup { \coda \bold Coda } 
        \repeat percent 4 { d4 d8 d c c4 d8 | r8 d r d c g c4 }
        d8-. r8 r4 r2 | r1 | d,4-. r4 r2
        \bar "|."
      }
    }
  }

}

bassTromboneMusic = \relative c {
  \clef bass
  \songTempo
  
  R1*4 \bar "||" 
  \repeat segno 2 {
    \repeat percent 6 { bes2\ff aes2 | r8 bes4 bes8 aes2 } | bes4 r4 r2 | r1 |
      \repeat percent 2 { d4 d8 d c c4 d8 | r d r d c g c4 } 
    \bar "||" \mark \default
    
    bes2 aes4. bes8~ | bes4. aes4. aes4~ | aes2 ges2~ | ges2\> r2\ppp\! |
    aes2 ges4. aes8~ | aes4. ges8 r4 aes4~ | aes2 bes4. c8~ | c c16-. c-. c-. c8-> c16-. r2 | 
    \bar "||" \mark \default
    r1 | r2 r4 r8 ees8 |
    bes'8 b4 aes g ges8~ | ges f4 e4~ e8 r4 | g8 a g a~ a4 g8 d | aes' bes aes bes~ bes4 aes8 ees |
    a8 b a b~ b4 a4-. | r8 a8 a a r2
    \bar "||" \mark \default
    
    bes,2 aes4. bes8~ | bes4. aes4. aes4~ | aes aes4. ges4.~ | ges4. ges8-. ges4-- ges8-- ges-. |
    aes2 ges4. aes8~ | aes4. ges8 r e'8\< aes4~ | aes4 fis8 aes bes aes bes c~ | c2..\!\ff r8
    \bar "||" \mark \default

    R1*3 | r2 r8 e,,8 r4 | R1*5
    \bar "[|:" 
    \mark \default
    \repeat percent 2 { b'8--_\markup { \italic Latin } b-. r2 b8-- b-. | r1 }
    R1*4
    \bar "||"
    \repeat percent 8 { r8_\markup { \italic Swing } d r4 d8 r8 r4 }
    R1*8_\markup { \italic Latin } \bar "||"
    R1*8_\markup { \italic Swing }
    \bar ":|]"
    
    \alternative {
      { }
      {
%         \section
%         \sectionLabel "Coda"
        \break
        \mark \markup { \coda \bold Coda } 
        \repeat percent 4 { d4 d8 d c c4 d8 | r8 d r d c g c4 }
        d8-. r8 r4 r2 | r1 | d,4-. r4 r2
        \bar "|."
        }
      }      
    }

}

guitarMusic = {
  \clef treble
  \songTempo
  
  R1*98
}

pianoRHMusic = {
  \clef treble
  \songTempo
  
  R1*4 \bar "||" 
  \repeat segno 2 {
    R1*94 |
    \alternative {
      {}
      {
%         \section
%         \sectionLabel "Coda"
      }
    }
  }
}

pianoDynamics = {
}

pianoLHMusic = {
  \clef bass
  R1*4 \bar "||" 
  \repeat segno 2 {
    R1*94 |
    \alternative {
      {}
      {
%         \section
%         \sectionLabel "Coda"
      }
    }
  }
}

bassGuitarMusic = \relative c {
  \clef bass
  \songTempo
  
  R1*4 \bar "||" 
  \repeat segno 2 {
    R1*4 | \repeat percent 4 { bes2 aes2 | r8 bes4 bes8 aes2 } | bes4 r4 r2 | r1 |
    \repeat percent 2 { bes4 bes aes8 aes4 bes8 | r bes r bes aes4-. aes-. }
    \bar "||" \mark \default
    
    bes2 aes4. bes8~ | bes4. aes4. aes4~ | aes2 ges2~ | ges1 | aes2 ges4. aes8~ | aes4. ges8 r4 aes4 ~
    aes2 bes4. c8 | \tuplet 3/2 { c4 e4 g4 } r2 | r4 r8 des2 r8 | r4 bes2~ bes8 r8 | r4 r8 d4-^ des4-^ c8~ |
    c2.. c8 | g4. a4~ a4. | aes4. bes4~ bes4. | a4. b4~ b4. | r8 g2.. 
    \bar "||" 
    \mark \default
    bes2 aes4. bes8~ | bes4. aes4. aes4~ | aes4 aes4. ges4.~ | ges4. ges4. ges4 | 
    aes2 ges4. aes8~ | aes4. ges8 r e8 aes4~ | aes4 fis8 aes bes aes bes c8 ~ | c4. c8 c c r4
    \bar "||"
    \mark \default
    
    ges4_\markup { \italic Swing } bes des ees | bes g ees g | ges bes des bes | b d e b |
    ges bes des ges | b, e b g | a d a f | f b b des | e des b g

    \bar "[|:" 
      \mark \default
      \repeat percent 4 { b4_\markup { \italic Latin } b8 b dis d4 b8 | r b r b dis4 dis }
      \bar "||" \mark \default
      \repeat percent 8 { d,4_\markup { \italic Swing } fis a fis | }
      \bar "||" \mark \default
      \repeat percent 4 { f4_\markup { \italic Latin } f8 f a a4 f8 | r f r f a4 a4 }
      \bar "||" \mark \default 
      \repeat percent 8 { aes4_\markup { \italic Swing } c ees c }      
    \bar ":|]"
    
    
    \alternative {
      {}
      { % Coda
        \break
        \mark \markup { \coda \bold Coda } 
        \repeat percent 4 { bes4 bes8 bes aes aes4 bes8 | r bes r bes aes ees aes4 }
        bes8 r r4 r2 | r1 | bes4-. r4 r2
        \bar "|."
      }
    }
  }
}

drumSetMusic = {
  \clef percussion
  \songTempo
  
  R1*4 \bar "||" 
  \repeat segno 2 {
    R1*94 |
    \alternative {
      {}
      {
%         \section
%         \sectionLabel "Coda"
      }
    }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Score"
  \paper {
    %#(set-paper-size "letter" )
    #(set-paper-size "letter" 'landscape)
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    %poet = "Bari Sax"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new StaffGroup = "saxophones" <<
        \new Staff \with {
          instrumentName = "Alto 1"
          shortInstrumentName = "Alto 1"
        }\altoIMusic
        \new Staff \with {
          instrumentName = "Alto 2"
          shortInstrumentName = "Alto 2"
        } \altoIIMusic
        \new Staff \with {
          instrumentName = "Tenor 1"
          shortInstrumentName = "Tenor 1"
        } \tenorIMusic
        \new Staff \with {
          instrumentName = "Tenor 2"
          shortInstrumentName = "Tenor 2"
        } \tenorIIMusic
        \new Staff \with {
          instrumentName = "Bari"
          shortInstrumentName = "Bari"
        } \bariSaxMusic
      >>
      \new StaffGroup = "horns" <<
        \new Staff \with {
          instrumentName = "Trumpet 1"
          shortInstrumentName = "Tpt. 1"
        } \trumpetIMusic
        \new Staff \with {
          instrumentName = "Trumpet 2"
          shortInstrumentName = "Tpt. 2"
        } \trumpetIIMusic
        \new Staff \with {
          instrumentName = "Trumpet 3"
          shortInstrumentName = "Tpt. 3"
        } \trumpetIIIMusic
        \new Staff \with {
          instrumentName = "Trumpet 4"
          shortInstrumentName = "Tpt. 4"
        } \trumpetIVMusic
        \new Staff \with {
          instrumentName = "Trombone 1"
          shortInstrumentName = "Tbn. 1"
        } \tromboneIMusic
        \new Staff \with {
          instrumentName = "Trombone 2"
          shortInstrumentName = "Tbn. 2"
        } \tromboneIIMusic
        \new Staff \with {
          instrumentName = "Trombone 3"
          shortInstrumentName = "Tbn. 3"
        } \tromboneIIIMusic
        \new Staff \with {
          instrumentName = "BassTrombone"
          shortInstrumentName = "B. Tbn."
        } \bassTromboneMusic
      >>
      \new Staff \with {
        instrumentName = "Guitar"
        shortInstrumentName = "Guitar"
      } \guitarMusic
      \new PianoStaff \with {
        instrumentName = "Piano"
        shortInstrumentName = "Piano"
      }<<
        \new Staff = "rh" \pianoRHMusic
        \new Dynamics \pianoDynamics
        \new ChordNames { \headChords \soloChords \codaChords }
        \new Staff = "lh" \pianoLHMusic
      >>
      \new Staff \with {
        instrumentName = "Bass"
        shortInstrumentName = "Bass"
      } \bassGuitarMusic
      \new DrumStaff \with {
          instrumentName = "Drum Set"
          shortInstrumentName = "Drums"
      }\drumSetMusic
    >>
    \layout {
      #(layout-set-staff-size 12)
      %\omit Staff.TimeSignature
  
      % The following gets rid of the volta spanner (first-ending spanner), but doesn't eliminate the "1."
      %\set Score.voltaSpannerDuration = 0
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1
      \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \numericTimeSignature
    
  %     \set Score.markFormatter = #format-mark-box-barnumbers
  %       \context {
  %         \Score
  %         %\remove "Volta_engraver"
  %         \override SpacingSpanner.base-shortest-duration = \musicLength 16
  %       }
      
    }
    %\midi {}  % uncomment for midi output
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Alto1"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Alto Sax I"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c a { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \altoIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
      \numericTimeSignature

      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Alto2"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Alto Sax II"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c a { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \altoIIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}
\book {
  \bookOutputName "InCaseYouHaventHeard-Tenor1"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Tenor Sax I"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c d { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \tenorIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}
\book {
  \bookOutputName "InCaseYouHaventHeard-Tenor2"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Tenor Sax II"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c d { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \tenorIIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}
\book {
  \bookOutputName "InCaseYouHaventHeard-Bari"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Baritone Sax"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c a { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \bariSaxMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Trumpet1"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Trumpet I"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c d { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \trumpetIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Trumpet2"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Trumpet 2"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c d { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \trumpetIIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Trumpet3"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Trumpet III"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c d { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \trumpetIIIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Trumpet4"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Trumpet IV"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c d { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \trumpetIVMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Trombone1"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Trombone I"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c c { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \tromboneIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Trombone2"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Trombone II"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c c { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \tromboneIIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Trombone3"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Trombone III"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c c { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \tromboneIIIMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-BassTrombone"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Bass Trombone"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c c { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \bassTromboneMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

\book {
  \bookOutputName "InCaseYouHaventHeard-Bass"
  \paper {
    #(set-paper-size "letter" )
    left-margin = 0.5\in
    right-margin = 0.5\in
    top-margin = 0.5\in
    bottom-margin = 0.5\in
    markup-system-spacing = #'((padding . 10))
    last-bottom-spacing = #'((padding . 5))
    ragged-bottom = ##f
    ragged-last = ##f
    ragged-last-bottom = ##f
    ragged-right = ##f
    
    print-page-number = ##t
  }
  \header {
    title = \G_title
    subtitle = \G_subtitle
    subsubtitle = \G_subsubtitle
    composer = \G_composer
    arranger = \G_arranger
    poet = "Bass"  % part
    copyright = \G_copyright
    tagline = " "
  }

  \score {
    <<
      \new ChordNames { \transpose c c { s1*55 \soloChords }  }
      \new Staff {
          \revert Score.BarNumber.stencil
          \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers
          \bassGuitarMusic
          }
    >>
    \layout {
      #(layout-set-staff-size 14)
      \set Score.skipBars = ##t
      \override MultiMeasureRest.expand-limit = 1      
      \set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
      \context {
        \Score
        %\remove "Volta_engraver"
        \override SpacingSpanner.base-shortest-duration = \G_spacing
      }
    }
    %\midi { }
  }
}

