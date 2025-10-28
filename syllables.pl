% Fonctions about syllables.

% Import modules.
:- [tools].

% Import phonemes.
:- [phonemes].


% Fonctions related to syllables.
nucleus([P]) :-
        phoneme(P, vowel).
nucleus([P1,P2]) :-
        phoneme(P1, vowel),
        phoneme(P2, vowel).

split_syllable(Attack, Nucleus, Coda, Syl) :-
        append(Attack, Rime, Syl),
        append(Nucleus, Coda, Rime).

find_nucleus(Syl, Nucleus) :-
        nucleus(Nucleus),
        sublist(Nucleus, Syl).

