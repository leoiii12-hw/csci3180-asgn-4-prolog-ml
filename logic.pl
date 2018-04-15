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
% uint_num(X), (X == s(s(s(0))) -> !; writeln(X)), false.

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
% product(X,s(s(s(s(0)))),s(s(s(s(s(s(s(s(0))))))))).

% 2a
nth(0,[MatchedElement|_],MatchedElement) :- !.

nth(Index,[_|RestElements],Element) :-
    nonvar(Index),
    NewIndex is Index - 1,
    nth(NewIndex,RestElements,Element).

% 2b
third(X,L) :- nth(2,L,X), !.