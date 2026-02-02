%%%%%%%%%
\version "2.25.28"

chordNamesPrel = \transpose g ees {
  \chordmode {
    \global
				% Interlude
    d1*4:sus4.9
    d1:sus4.9
    d1:9
    g1:6.9
    s1
    g1.:6.9
    d2:sus4.9
  }
}

chordNamesInterL = \transpose g ees {
  \chordmode {
    \global
				% Interlude
    d1*4:sus4.9
    d1:sus4.9
    d1:9
    g1*2:6.9
  }
}

chordNameMain = \transpose g ees {
  \chordmode {
    \global
				% Melody
    g1*2:maj
    g1:sus4.9
    g1:9
    f1:sus4.9
    f1:9
    g1:maj
    s2 d2:sus4.9
    g1*2:maj

    ees1*2:maj
    d1*2:maj
    c1*2:m7
    a1:m7
    d1:7

    g1*2:maj
    g1:sus4.9
    g1:9
    f1:sus4.9
    f1:9
    g1*2:maj
  }
}
