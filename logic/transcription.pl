% Graphème-Phonème transcription avec Prolog.

:- ['../utils/init'].   % Initialize the script to work with the strings.
:- ['../dict/phonemes_dcg'].
:- ['../dict/grapheme_segment'].


ipa(Input, Output) :-
  phrase(replace(Output), Input), !.

segmentation([], ['-']).
segmentation([G|S1], ['-',G|S2]) :- % from grapheme_segment.pl
  gsegment(G),
  segmentation(S1, S2).

% TODO: add beginning and ending markers.

% affrication
replace([TD,SZ,IU|Suite]) --> [TD,IU], {phrase(phoneme(syll,haut,avant,_,_), [IU]), phrase(phoneme(cons, plosive, alv, cor, Voix), [TD]), phrase(phoneme(cons, fricative, alv, cor, Voix), [SZ])}, !, replace(Suite).

replace([Sh|Suite]) --> [c,h], {phrase(phoneme(cons,fricative, postalv, cor, sourd), [Sh])}, !, replace(Suite).

% replace([|Suite]) --> [], !, replace(Suite).

replace([G|Suite]) --> [G], replace(Suite).

replace([]) --> [].


