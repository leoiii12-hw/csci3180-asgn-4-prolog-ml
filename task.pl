task(t1, 2, 4).
task(t2, 4, 6).
task(t3, 7, 8).
task(t4, 9, 10).
task(t5, 10, 12).

%
%
% check_task(t1).
check_task(Task) :-
    task(Task,StartTime,EndTime),
    EndTime > StartTime.

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
    EndTime1 =< StartTime2.
compatible(Task1,Task2) :-
    check_task(Task1),
    check_task(Task2),
    task(Task1,StartTime1,EndTime1),
    task(Task2,StartTime2,EndTime2),
    EndTime2 =< StartTime1.

compatible_pair([Task1,Task2]) :-
    compatible(Task1,Task2).

%
%
% compatible_list([t1,t2,t3,t4,t5]).
compatible_list(Tasks) :-
    pairs(Tasks,Pairs),
    check_compatible_in_list(Pairs).

check_compatible_in_list([]).
check_compatible_in_list([Pair|RestPairs]) :-
    print(Pair),
    compatible_pair(Pair),
    check_compatible_in_list(RestPairs).

%
%
% pairs([1,2,3], Pairs).
pairs(Elements,Pairs) :- pairs_1(Elements,Pairs-[]).

pairs_1([],Ys-Ys).
pairs_1([X|Xs],Ys-As) :-
    pairs_2(Xs,X,Ys-Bs),
    pairs_1(Xs,Bs-As).

pairs_2([],_,Zs-Zs).
pairs_2([X|Xs],Y,[[Y,X]|Zs]-As) :-
    pairs_2(Xs,Y,Zs-As).