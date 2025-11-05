% General fonctions.

dif3(I1, I2, I3) :- 
        dif(I1, I2),
        dif(I1, I3),
        dif(I2, I3).

sublist(Sub, List) :-
        append(_, Rest, List),
        append(Sub, _, Rest).

