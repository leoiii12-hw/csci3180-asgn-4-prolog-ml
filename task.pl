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

task(t1, 2, 4).
task(t2, 4, 6).
task(t3, 3, 7).
task(t4, 8, 9).
task(t5, 1, 10).
task(t6, 10, 1).
task(t7, 1, 1).

%
%
% check_task(t1).
check_task(Task) :-
    task(Task,StartTime,EndTime),
    EndTime >= StartTime.

% 123456789
%  111
%     222
%
% 123456789
%     111
%  222
% 123456789
%  111
% 555
% compatible(t1,t2).
compatible(Task1,Task2) :-
    check_task(Task1),
    check_task(Task2),
    task(Task1,StartTime1,EndTime1),
    task(Task2,StartTime2,EndTime2),
    ((StartTime1 < StartTime2) -> EndTime1 =< StartTime2 ; EndTime2 =< StartTime1).

compatible([Task1,Task2]) :-
    compatible(Task1,Task2).

%
%
% compatible_list([t1,t2,t3,t4,t5]).
compatible_list(Tasks) :-
    pairs(Tasks,Pairs),
    check_compatible_in_list(Pairs).

check_compatible_in_list([]).
check_compatible_in_list([Pair|RestPairs]) :-
    compatible(Pair),
    check_compatible_in_list(RestPairs).

pairs(Elements,Pairs) :- pairs_1(Elements,Pairs-[]).

pairs_1([],Ys-Ys).
pairs_1([X|Xs],Ys-As) :-
    pairs_2(Xs,X,Ys-Bs),
    pairs_1(Xs,Bs-As).

pairs_2([],_,Zs-Zs).
pairs_2([X|Xs],Y,[[Y,X]|Zs]-As) :-
    pairs_2(Xs,Y,Zs-As).