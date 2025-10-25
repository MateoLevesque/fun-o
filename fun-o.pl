% A simple phonological systeme to test the implementation of the sonority rule.
:- set_prolog_flag(double_quotes, chars).

% TODO: Add more phonemes.
phon(a, vowel).
phon(t, plosive).
phon(b, plosive).
phon(s, fricative).
phon(n, nasal).
phon(l, liquid).

principle(plosive, 1).
principle(fricative, 2).
principle(nasal, 3).
principle(liquid, 4).
principle(glide, 5).
principle(vowel, 6).

% So the sonority principle is as follow : vowel > glide > liquid > nasal > obstruent (fricative (voiced > unvoived) > plosive (voiced > unvoived))

respect([P]) :- phon(P, vowel).
respect(Syl) :-
        find_nucleus(Syl, Nucleus),
        append(Attack, [Nucleus|Coda], Syl),
        find_traits(Attack, TAttack),
        find_traits(Coda, TCoda),
        attack_sonority(TAttack),
        coda_sonority(TCoda).

find_nucleus(Syl, N) :-
        member(N, Syl),
        phon(N, vowel).


find_traits([], []).
find_traits([P|R1], [T|R2]) :-
        phon(P, T),
        find_traits(R1, R2).


attack_sonority(Traits) :-
        maplist(principle, Traits, Order),
        attack_order(Order).


coda_sonority(Traits) :-
        maplist(principle, Traits, Order),
        coda_order(Order).


attack_order([]).
attack_order([_]).
attack_order([T1,T2|R]) :-
        T1 =< T2,
        attack_order([T2 | R]).


coda_order([]).
coda_order([_]).
coda_order([T1, T2|R]) :-
        T1 >= T2,
        coda_order([T2 | R]).
