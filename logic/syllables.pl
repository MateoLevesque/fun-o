% Fonctions about syllables.

% Import modules.
:- ['../utils/utils.pl'].

% Import phonemes.
:- ['../dict/phonemes.pl'].

% Syllabic constructions

attack([]).
attack([P]) :-
        phoneme(V, vowel),
        dif(P, V).
attack([P1, P2]) :- 
        phoneme(V, vowel),
        dif3(P1, P2, V).
attack([P1, P2, P3]) :-
        phoneme(V, vowel),
        dif3(P1, P2, P3),
        dif(P1, V),
        dif(P2, V),
        dif(P3, V).

nucleus([P]) :-
        phoneme(P, vowel).
nucleus([P1,P2]) :-
        phoneme(P1, vowel),
        phoneme(P2, vowel).

rime([Nucleus]) :-
        nucleus(Nucleus).
rime([Nucleus, Coda]) :- 
        nucleus(Nucleus),
        coda(Coda).

coda([]).
coda([P]) :-
        phoneme(V, vowel),
        dif(P, V).
coda([P1, P2]) :-
        phoneme(V, vowel),
        dif3(P1, P2, V).

syllable([Nucleus]) :-
        nucleus(Nucleus).
syllable([Attack, Nucleus]) :-
        attack(Attack),
        nucleus(Nucleus).
syllable([Rime]) :-
        rime(Rime).
syllable([Attack, Rime]) :-
        attack(Attack),
        rime(Rime).


% Fonctions related to syllables.
split_syllable(Attack, Nucleus, Coda, Syl) :-
        append(Attack, Rime, Syl),
        append(Nucleus, Coda, Rime).

find_nucleus(Syl, Nucleus) :-
        nucleus(Nucleus),
        sublist(Nucleus, Syl).


