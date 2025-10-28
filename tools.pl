% General fonctions.

sublist(Sub, List) :-
        append(_, Rest, List),
        append(Sub, _, Rest).

