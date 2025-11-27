% Mozart Quartet K464 Line 1 Bb Clarinet pitch         \
% File K464_Bb_L1.ly                                              \
% ----------------------------------------------------------
\version "2.24.3"
#(set-global-staff-size 20)

%--------------------------------------------------------------------
% variables for later use to avoid repititions
%---------------------------------------------------------------------
date = #(strftime "%d-%m-%Y" (localtime (current-time)))
xtitle = "String Quartet K464"
xsubtitle = "transposed for flute, clarinet, alto flute, and bass
 clarinet"
xChristian = "Wolfgang Amadeus"
xSurname = "Mozart"
xdates = "(1756-1791)"
xpart = "Clarinet 1"
xinstrument = "Clt 1"
xmidiInstrument = "clarinet"
xgraphic="./mozza2.eps"
xstamp = \markup{\concat { "Engraved "  \bold \date " with "  \with-url
                           "http://lilypond.org/"; "LilyPond " \simple
                           #(lilypond-version) " (http://lilypond.org/)" }  }

%-----------------------------------------------------------------------------------
% variable to control minimum ledger space after pageturn shrinkage
%-----------------------------------------------------------------------------------
ledgers =  \override Staff.LedgerLineSpanner.minimum-length-fraction =
#0.4


% ------------------------------------------------------------------------
% header for the first page only
%--------------------------------------------------------------------------
\header {
  mycustomtext= \markup  {
    \fill-line {
      \column {
        \center-align {
          \xstamp
          " "
          \fontsize #-1 "Original
 IMSLP64141-PMLP05225-Mozart_Werke_Breitkopf_Serie_14_KV464"
          \fontsize #-1 "Clarinet Quartet
 Copyright @ 2002 by Oliver Seeley and assigned to the public
 domain" }
      }
    }
  }
}
% -----------------------------------------------------------
% define staffclarinet
% -----------------------------------------------------------

staffinstrument = \new Staff {
  \set Staff.instrumentName = \xinstrument
  \set Staff.midiInstrument = \xmidiInstrument
}

% -----------------------------------------------------------
% set the paper layout for binding
% footer has title and page number
% -----------------------------------------------------------
\paper {
  two-sided = ##t
  top-margin = 10\mm
  bottom-margin = 10\mm
  inner-margin = 20 \mm
  outer-margin = 15 \mm
  binding-offset = 5 \mm
  first-page-number = #1
  blank-after-score-page-penalty = #10
  page-breaking = #ly:page-turn-breaking
  ragged-bottom = ##t
  indent = 0\mm
  print-page-number = ##t
  print-first-page-number = ##f
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \null \fontsize #2
      \fromproperty #'header:mycustomtext
      \if \should-print-page-number
      \fontsize #2
      \fromproperty #'page:page-number-string
    } % end of
    fill line

  } % end of
  markup block
  evenFooterMarkup = \oddFooterMarkup
} % end of paper block

% -----------------------------------------------------------
% typeset the music in a book
% use bookpart for individual movements
% -----------------------------------------------------------

\book {

  % -----------------------------------------------------------
  % Frontispiece block - note use of variables
  % -----------------------------------------------------------
  \markuplist {
    \justified-lines {
      \hspace #8
      {\fontsize #8  \xChristian \fontsize #8 \xSurname } }
  }

  \markuplist {
    \justified-lines {
      \vspace #1
      \hspace #26
      {\fontsize #6  \xdates} }
  }
  \markuplist {
    \justified-lines {
      \vspace #1
      \hspace #12
      {\fontsize #12  \xtitle } }
  }

  \markuplist {
    \justified-lines {
      \vspace #2
      \hspace #18
      {\fontsize #4 \xsubtitle} }
  }


  \markup {
    \vspace #6
    \hspace #20
    \general-align #Y #DOWN {\epsfile #Y #40 #"./mozza2.eps" }

  }

  \markuplist {
    \justified-lines {
      \vspace #2
      \hspace #32
      {\fontsize #8 \xpart} }
  }


  \markuplist {
    \wordwrap-lines {
      \vspace #2
      { Wolfgang Amadeus Mozart baptismal name Johannes
        Chrysostomus Wolfgangus Theophilus Mozart (27 January 1756 - 5
        December 1791), was a prolific and influential composer of the Classical
        era. He composed over 600 works, many acknowledged as
        pinnacles of symphonic, concertante, chamber, operatic, and choral music.
        He is among the most enduringly popular of classical
        composers.

        Mozart showed prodigious ability from his earliest childhood in Salzburg.
        Already competent on keyboard and violin, he composed from
        the age of five and performed before European royalty. At 17, he was
        engaged as a court musician in Salzburg, but grew restless and
        travelled in search of a better position, always composing abundantly.
        While visiting Vienna in 1781, he was dismissed from his
        Salzburg position. He chose to stay in the capital, where he achieved fame
        but little financial security. During his final years in
        Vienna, he composed many of his best-known symphonies, concertos, and
        operas, and portions of the Requiem, which was largely
        unfinished at the time of his death.

        Mozart learned voraciously from others, and developed a brilliance and
        maturity of style that encompassed the light and graceful
        along with the dark and passionate. His influence on subsequent Western
        art music is profound. Beethoven composed his own early
        works in the shadow of Mozart, and Joseph Haydn wrote that posterity will
        not see such a talent again in 100 years.
      }
    }
  }

  \pageBreak