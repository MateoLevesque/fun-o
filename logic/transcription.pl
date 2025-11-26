% Graphème-Phonème transcription avec Prolog.

:- ['../utils/init'].

:- ['../dict/phonemes'].

ipa(Input) :-
  replace(Input, Result),
  write(Result).

replace([o,u|S1], [u|S2]) :-
  replace(S1,S2).

replace([V1,s,V2|S1], [V1,z,V2|S2]) :-
  phoneme(V1,vowel),
  phoneme(V2, vowel),
  replace(S1,S2).

replace([o,n|S1], [P|S2]) :-
  phoneme(P,_,onasal),
  replace(S1,S2).

replace([], []).
replace([L|S1], [L|S2]) :-
  replace(S1, S2).


