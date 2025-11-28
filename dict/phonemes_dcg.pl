% Phoneme list with DCG.

phoneme(syll, haut, avant, nonRond, tendu) --> i.
phoneme(syll, haut, avant, nonRond, relache) --> ɪ.
phoneme(syll, haut, avant, rond, tendu) --> y.
phoneme(syll, haut, avant, rond, relache) --> ʏ.
phoneme(syll, haut, arriere, rond, tendu) --> u.
phoneme(syll, haut, arriere, rond, relache) --> ʊ.
phoneme(syll, mihaut, avant, nonRond, tendu) --> e.
phoneme(syll, mihaut, avant, rond, tendu) --> ø.
phoneme(syll, mihaut, arriere, rond, tendu) --> o.
phoneme(syll, mibas, avant, nonRond, relache) --> ɛ.
phoneme(syll, mibas, avant, rond, relache) --> œ.
phoneme(syll, mibas, arriere, rond, relache) --> ɔ.
phoneme(syll, bas, avant, nonRond, relache) --> a.
phoneme(syll, bas, arriere, nonRond, relache) --> ɑ.

phoneme(syll, mihaut, avant, nonRond, nasal) --> 'ẽ'.
phoneme(syll, mibas, arriere, rond, nasal) --> 'ɔ̃'.
phoneme(syll, mibas, avant, rond, nasal) --> 'œ̃'.
phoneme(syll, bas, arriere, nonRond, nasal) --> 'ɑ̃'.

phoneme(syll, centre, centre, nonRond, schwa) --> ə.

% Consonants
phoneme(cons, plosive, bilab, lab, sourd) --> p.
phoneme(cons, plosive, bilab, lab, voix) --> b.
phoneme(cons, nasal, bilab, lab, voix) --> m.
phoneme(cons, fricative, labdent, lab, sourd) --> f.
phoneme(cons, fricative, labdent, lab, voix) --> v.
phoneme(cons, plosive, alv, cor, sourd) --> t.
phoneme(cons, plosive, alv, cor, voix) --> d.
phoneme(cons, nasal, alv, cor, voix) --> n.
phoneme(cons, lateral, alv, cor, voix) --> l.
phoneme(cons, fricative, alv, cor, sourd) --> s.
phoneme(cons, fricative, alv, cor, voix) --> z.
phoneme(cons, fricative, postalv, cor, sourd) --> ʃ.
phoneme(cons, fricative, postalv, cor, voix) --> ʒ.
phoneme(cons, nasal, palatal, dor, voix) --> ɲ.
phoneme(cons, plosive, velaire, dor, sourd) --> k.
phoneme(cons, plosive, velaire, dor, voix) --> ɡ.
phoneme(cons, fricative, uvul, dor, voix) --> ʁ.
phoneme(cons, semivoy, velaire, lab, voix) --> w.
phoneme(cons, semivoy, palatal, lab, voix) --> ɥ.
phoneme(cons, semivoy, palatal, cor, voix) --> j.
