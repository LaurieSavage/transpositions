\version "2.25.13"
\paper{
  #(set-paper-size "a4")
  indent = 0
  top-margin = 2.5\cm
  bottom-margin = 2.5\cm
  left-margin = 3.5\cm
  right-margin = 3.5\cm
  %fontSize = #-2
}

\header{
  title = "Finnish waltz"
  composer = ""
  instrument = "B flat"
  tagline = "Edited by LS"
  piece = ""
}

Sax = {
  \relative c' 
  {
    \key d \major 
    \time 3/4
    \set Score.skipBars = ##t
    \override MultiMeasureRest.expand-limit = 1
    \repeat volta 2 {\mark \default
      fis4 b cis d cis b fis'4. g8 fis e fis2. 
      fis,4 b cis d cis b g'4. a8 g fis g2 fis4 
      e4 fis g g fis e fis2 d4 b2. 
      fis4 f fis d'2 cis4
    }
    \alternative {{b2 b4 b2.}{b2 b4 b4. cis8 b4}} 
    
    \repeat volta 2 {
      \mark \default
      a4. a8 a4 a b a fis4. fis8 fis4  fis g fis
      e4. e8 e4 e d e fis4. fis8 fis4 fis d' e 
      fis4. fis8 fis4 fis e d cis2 cis4 cis2.
      fis,4 e fis d'2 cis4 b4. b8 b4
    }
    \alternative{{b4 cis b}{b4 r4 b'8 a}}

    \repeat volta 2 {
      \mark \default
      b2 fis8 e fis2 d8 cis d2 b8 a b4 d4 fis4
      g2 fis4 e g b b4. b8 fis4 fis2.
      fis,4 b fis' e2. fis,4 b cis d2.
      fis4 e fis d2 cis4
    }
    \alternative{{b4. b8 b4 b2 b'8 a}{b4. b8 b4 b2.}}
    
  }
}


\score{
  <<
    \new Staff{
      \set Staff.instrumentName = "Tenor Sax"
      \Sax
      }
    % \transpose ees c' \Sax
  >>

}
