\version "2.24.3"

t =
#(define-music-function (text) (markup?)
   #{
     \once \set chordNameFunction =
       #(lambda (sorted-pitches bass inversion context)
          (let* ((root (first sorted-pitches))
                 (root-namer
                  (ly:context-property context 'chordRootNamer))
                 (root-markup (root-namer root #f))
                 (bass-markup
                  (if (ly:pitch? bass)
                      #{ \markup { / #(root-namer bass #f) } #}
                      "")))
            #{ \markup { #root-markup \super #text #bass-markup } #}))
   #})

bass = \withMusicProperty bass ##t \etc

myChordNames =
\relative {
  \t "6-9" c1
  \t "6-9" << c \bass g >>
}

<<
  \new ChordNames \myChordNames
  \new ChordNames \transpose c d \myChordNames
>>
