% Tests for the sonority.pl file.

:- use_module('../logic/sonority.pl').

:- begin_tests(sonority_tests).

        test(cv, [condition(true), fail]) :-
          respect("lœ").

        test(vc, [condition(true), fail]) :-
          respect("yn").

        test(cvc, [condition(true), fail]) :-
          respect("taʃ").

        test(ccv, [condition(true), fail]) :-
          respect("tʁo").

        test(vcc, [condition(true), fail]) :-
          respect("uʁs").

        test(ccvc, [condition(true), fail]) :-
          respect("klɔʃ").

        test(cvcc, [condition(true), fail]) :-
          respect("pɔʁt").

        test(ccvcc, [condition(true), fail]) :-
          respect("klɛʁk").

        test(v, [condition(true), fail]) :-
          respect("ɑ").

        test(vv, [condition(true), fail]) :-
          respect("ai").

        test(ccvvc, [condition(true), fail]) :-
          respect("tsaaʁmt").

        test(no_more_than_3_vowels, [fail, condition(true)]) :-
          respect("tooos").

        test(dont_hold_if_sonority_not_respected, [fail, condition(true)]) :-
          respect("tʁubl").

:- end_tests(sonority_tests).




