% Transcripteur automatique avec Prolog.

:- ['../utils/init'].

% :- ['../utils/re'].

% :- ['../dict/phonemes'].

ipa_list([],[]).
ipa_list([Input|SuiteInput], [Result|SuiteResult]) :-
  ipa(Input, Result),
  ipa_list(SuiteInput, SuiteResult).

ipa(Input, Result) :-
  phrase(replace(Chars), Input),
  string_chars(Result, Chars), !.

replace([]) --> [].

%replace([c,h|Suite]) -->
%  ['a'],
%  ['o','p'],
%  !,
%  replace(Suite).

replace([k|Suite]) -->
  ['c','h'], end,
  !,
  replace(Suite).

replace([C|Suite]) -->
  [C],
  replace(Suite).


% ------------------------ Positions -------------------------

beginning --> {true}.

end --> [], {true}.
end --> [X], {member(X, ['.','!','?',','])}.

after(X) --> [X].

before(X) --> [X].


