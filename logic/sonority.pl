% A simple phonological systeme to test the implementation of the sonority rule.

% Make this file a module.
% :- module(sonority, [respect/1]).

% Initialisation.
:- ['../utils/init'].

% Import modules.
:- ['syllables','../utils/utils'].

% Import phonemes.
:- ['../dict/phonemes'].

% So the sonority principle is as follow : vowel > glide > liquid > nasal > obstruent (fricative (voiced > unvoived) > plosive (voiced > unvoived))

principle(plosive, 1).
principle(fricative, 2).
principle(nasal, 3).
principle(liquid, 4).
principle(glide, 5).
principle(vowel, 6).


sonority(Syl) :-
        nucleus(Syl).
sonority(Syl) :-
        find_nucleus(Syl, Nucleus),
        split_syllable(Attack, Nucleus, Coda, Syl),
        find_traits(Attack, TAttack),
        find_traits(Coda, TCoda),
        attack_sonority(TAttack), !,
        coda_sonority(TCoda).


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

