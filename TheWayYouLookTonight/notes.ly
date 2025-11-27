% Refrain
\repeat volta 2 {
bes1 \mark \default
ees1
f4 g aes g
f1
g4 aes bes aes
g1
aes4 bes c bes
aes4 bes c d \bar "||"
ees1
ees,1
f4 g bes aes
g2 f2
}
\alternative {
{
% Repeat 1
ees1~
ees4 r4 r2
R1
r4 c d f
}{
% Repeat 2
ees1~
ees4 r4 r2
R1
R1 \bar "||"
}
}

% Bridge
bes2 \mark \default bes
bes2 bes
bes4 des ces des~
aes1
aes4 bes ges f~
f2 ges
ees1~
ees2. r4 \bar "||"
des2 des
des2 des
des4 ees ces bes~
bes1
aes4 bes2 ges4
f2 ges2
bes1~
bes2. r4 \bar "||"

% Reprise
bes1 \mark 1
ees1
f4 g aes g
f1
g4 aes bes aes
g1
aes4 bes c bes
aes4 bes c d \bar "||"
ees1
ees,1 f4 g bes aes
g2 f2

<<
\relative {
ees4-"(Pedal)" bes (c2)
r4 g (f2)
r4 d (c2)
r4 g (f2)
}
\\
\relative {
bes,1~
bes~
bes~
bes
}
>>

f4 g bes aes
g2 f
ees1~
ees2 r2 \bar "|."