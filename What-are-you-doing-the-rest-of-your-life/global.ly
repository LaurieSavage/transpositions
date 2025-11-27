global = {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #3
}