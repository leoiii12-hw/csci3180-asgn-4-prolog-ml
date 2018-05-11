% /*
%  * CSCI3180 Principles of Programming Languages
%  *
%  * --- Declaration ---
%  *
%  * I declare that the assignment here submitted is original except for source
%  * material explicitly acknowledged. I also acknowledge that I am aware of
%  * University policy and regulations on honesty in academic work, and of the
%  * disciplinary guidelines and procedures applicable to breaches of such policy
%  * and regulations, as contained in the website
%  * http://www.cuhk.edu.hk/policy/academichonesty/
%  *
%  * Assignment 4
%  * Name : Choi Man Kin
%  * Student ID : 1155077469
%  * Email Addr : mkchoi6@cse.cuhk.edu.hk
%  */

% Assume the set of natural numbers consists of zero

% 1a
uint_num(0).
uint_num(s(X)) :- uint_num(X).

% 1b
gt(s(_),0).
gt(s(X),s(Y)) :- gt(X,Y).

% 1c
% uint_num(X), (X == s(s(s(0))) -> !; write(X), write('\n')), false.

% 1d
sum(0,Result,Result).
sum(s(X),Y,s(A)) :- sum(X,Y,A).

product(0,_,0).
product(s(X),Y,Result) :- % X * Y = (X - 1) * Y + Y
    product(X,Y,A),
    sum(Y,A,Result).

% 1e
% product(s(s(0)),s(s(s(0))),Product).

% 1f
% product(X,s(s(s(s(0)))),s(s(s(s(s(s(s(s(0))))))))),!.

% 2a
% Retrieived from sicstus/3.12.7/lib/sicstus-3.12.7/library/lists.pl
% nth(3,[1,2,3,4,3,3],X).
% nth(X,[1,2,3,4,3,3],3).
nth0v([Element|Tail], Element, Index, Index, Tail).
nth0v([Head|Tail], Element, M, Index, [Head|Rest]) :-
        N is M + 1,
        nth0v(Tail, Element, N, Index, Rest).

nth0i(0, List, Head, Tail) :- !,
        List = [Head|Tail].
nth0i(N, [Head|Tail], Element, [Head|Rest]) :-
        M is N - 1,
        nth0i(M, Tail, Element, Rest).

nth0v([Element|_], Element, Index, Index).
nth0v([_|Tail], Element, M, Index) :-
        N is M + 1,
        nth0v(Tail, Element, N, Index).

nth0i(0, List, Head) :- !,
        List = [Head|_].
nth0i(N, [_|Tail], Element) :-
        M is N - 1,
        nth0i(M, Tail, Element).

nth(Element, List, N) :-
        integer(N), !,
        N >= 1,
        N1 is N-1,
        nth0i(N1, List, Element).
nth(Element, List, N) :-
        var(N),
        nth0v(List, Element, 1, N).

% 2b
% third(X,[1,2,7,4,3,3]).
third(X,L) :- nth(X,L,3), !.