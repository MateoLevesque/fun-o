% A list of all basic phoneme in french.

% phoneme/2   phoneme(Phoneme, Trait)

% Vowels
phoneme(i, vowel).
phoneme(y, vowel).
phoneme(u, vowel).
phoneme(e, vowel).
phoneme(ø, vowel).
phoneme(o, vowel).
phoneme(ɛ, vowel).
phoneme(œ, vowel).
phoneme(ɔ, vowel).
phoneme(a, vowel).
phoneme(ɑ, vowel).

% Consonants
phoneme(p, plosive).
phoneme(b, plosive).
phoneme(m, nasal).
phoneme(f, fricative).
phoneme(v, fricative).
phoneme(t, plosive).
phoneme(d, plosive).
phoneme(n, nasal).
phoneme(l, liquid).
phoneme(s, fricative).
phoneme(z, fricative).
phoneme(ʃ, fricative).
phoneme(ʒ, fricative).
phoneme(ɲ, nasal).
phoneme(j, ɡlide).
phoneme(ɥ, ɡlide).
phoneme(k, plosive).
phoneme(ɡ, plosive).
phoneme(ʁ, fricative).
phoneme(w, ɡlide).


% Fonctions related to phonemes.
find_traits([], []).
find_traits([P|R1], [T|R2]) :-
        phoneme(P, T),
        find_traits(R1, R2).




