% Graphème-Phonème transcription avec Prolog.

:- ['../utils/init'].

:- ['../dict/phonemes_dcg'].

ipa(Input, Output) :-
  phrase(replace(Output), Input), !.

%replace([k|Suite]) --> [c,h], !, replace(Suite).
% affrication 
replace([TD,SZ,IU|Suite]) --> [TD,IU], {phrase(phoneme(syll,haut,avant,_,_), [IU]), phrase(phoneme(cons, plosive, alv, cor, Voix), [TD]), phrase(phoneme(cons, fricative, alv, cor, Voix), [SZ])}, !, replace(Suite).
replace([G|Suite]) --> [G], replace(Suite).
replace([]) --> [].


