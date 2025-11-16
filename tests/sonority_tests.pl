% Tests for the sonority.pl file.

:- use_module('../logic/sonority').

:- begin_tests(sonority_tests).

        test(cv, [condition(true), fail]) :-
           sonority("lœ").

        test(vc, [condition(true), fail]) :-
           sonority("yn").

        test(cvc, [condition(true), fail]) :-
           sonority("taʃ").

        test(ccv, [condition(true), fail]) :-
           sonority("tʁo").

        test(vcc, [condition(true), fail]) :-
           sonority("uʁs").

        test(ccvc, [condition(true), fail]) :-
           sonority("klɔʃ").

        test(cvcc, [condition(true), fail]) :-
           sonority("pɔʁt").

        test(ccvcc, [condition(true), fail]) :-
           sonority("klɛʁk").

        test(v, [condition(true), fail]) :-
           sonority("ɑ").

        test(vv, [condition(true), fail]) :-
           sonority("ai").

        test(ccvvc, [condition(true), fail]) :-
           sonority("tsaaʁmt").

        test(no_more_than_3_vowels, [fail, condition(true)]) :-
           sonority("tooos").

        test(dont_hold_if_sonority_not_respected, [fail, condition(true)]) :-
           sonority("tʁubl").

:- end_tests(sonority_tests).




