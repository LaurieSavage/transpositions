	\version "2.25.13"

\header{
  title = "Hideaway"
  composer = "Dave Sanborn"
  instrument = "Tenor Sax"
  tagline = "Edited by LS, from Aebersold Vol 103"
  piece = "B flat instruments"
}

Sax = {
  \relative c' 
  {
    \key aes \major 
    \time 4/4
    \partial 8*3 r8 r4 
    r4 r8 ees16 f16 aes8 bes8 c8 c8 %1
    des4 c8 aes (aes) ees4 des8 %2
    (des8) r8 des-. ees-. ges aes bes ces  %3
    (bes-.) des (bes-.) ges (ges4) r4 \break
    r4 r8 ees16 f aes8 bes c c
    des (ees-.) c-. aes (aes) ees4 des8 
    (des) r8 des-. ees-. ges aes bes ces 
    (bes-.) des bes ges (ges4) r4 \break
    \mark \default
    \repeat volta 2 {
      
      r2 r8 es-. f-. aes-.
      aes4 f16 ees aes8-. r8 ces (f,-.) aes
      (aes) ces r4 r2
      des8 (ces-.) des (ces-.) ees ces4 aes8
      (aes) r r aes (aes) ees4 ges8-.
      ges aes4 ces8 r ees c16 aes8.
      aes4 r r2
      r8 des-. des (ces) des ces aes ces
      (ces) des r4 r2 
      ees8 ces-. des ces-. ees ces ces aes
      (aes) r r aes (aes) ees4 ges8-.
      ges-. aes4 ces8 r ees ces16 aes8.
      aes4. aes8 ces-. des ces des
      (ces-) aes4 ces8 (ces) des r4
    }
    \alternative {
     
      {r8 ees8-. ges-. aes-. ces d4. }
      {
	\repeat volta 4 
	{ \mark \default
	  < b, fis d >1 ~ 
	  < b fis d >2 <cis gis e>8 <cis gis e>8 r8 <cis gis e>8 
	  r8 <b fis d> <b fis d>2. ~ 
	}
	\alternative{
	  { < b fis d >1 }
	  { r1 }
	}
      }
    }
  }
}

jazzChords =  \chordmode {
  %\partial 8*3 
  s8 s4 
  ees2:min7/aes aes:7
  ees2:min7/aes aes:7
  des2:m7/ges ges:7
  des2:m7/ges ges:7
  ees2:min7/aes aes:7
  ees2:min7/aes aes:7
  des2:m7/ges ges:7
  des2:m7/ges ges:7
}

{
  <<
    \transpose bes c 
    \new ChordNames {
      \set chordChanges = ##t
      \jazzChords
    }
    \transpose bes c' \Sax
  >>
}
