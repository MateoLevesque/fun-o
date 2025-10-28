% A simple phonological systeme to test the implementation of the sonority rule.
% TODO: add to init.pl (Maybe).
:- set_prolog_flag(double_quotes, chars).

% TODO: add to phonemes.pl
phon(a, vowel).
phon(t, plosive).
phon(b, plosive).
phon(s, fricative).
phon(n, nasal).
phon(l, liquid).


% So the sonority principle is as follow : vowel > glide > liquid > nasal > obstruent (fricative (voiced > unvoived) > plosive (voiced > unvoived))

principle(plosive, 1).
principle(fricative, 2).
principle(nasal, 3).
principle(liquid, 4).
principle(glide, 5).
principle(vowel, 6).


respect(Syl) :-
        nucleus(Syl).
respect(Syl) :-
        find_nucleus(Syl, Nucleus),
        split_syllable(Attack, Nucleus, Coda, Syl),
        find_traits(Attack, TAttack),
        find_traits(Coda, TCoda),
        attack_sonority(TAttack),
        coda_sonority(TCoda).

% TODO: add to syllabes.pl
split_syllable(Attack, Nucleus, Coda, Syl) :-
        append(Attack, Rime, Syl),
        append(Nucleus, Coda, Rime).

nucleus([P1,P2]) :-
        phon(P1, vowel),
        phon(P2, vowel).
nucleus([P]) :-
        phon(P, vowel).


% TODO: add to tools.pl
sublist(Sub, List) :-
        append(_, Rest, List),
        append(Sub, _, Rest).


find_nucleus(Syl, N) :-
        nucleus(N),
        sublist(N, Syl).


find_traits([], []).
find_traits([P|R1], [T|R2]) :-
        phon(P, T),
        find_traits(R1, R2).


attack_sonority([]).
attack_sonority(Traits) :-
        maplist(principle, Traits, Order),
        attack_order(Order).


coda_sonority([]).
coda_sonority(Traits) :-
        maplist(principle, Traits, Order),
        coda_order(Order).


attack_order([]).
attack_order([_]).
attack_order([T1,T2|R]) :-
        dif(T1, T2),
        T1 =< T2,
        attack_order([T2 | R]).


coda_order([]).
coda_order([_]).
coda_order([T1, T2|R]) :-
        dif(T1, T2),
        T1 >= T2,
        coda_order([T2 | R]).
