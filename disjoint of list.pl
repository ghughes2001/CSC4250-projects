% Disjoint of two lists
disjoint([], _, []).
disjoint([H|T], L, [H|Disjoint]) :- 
    \+ member(H, L), 
    disjoint(T, L, Disjoint).
disjoint([H|T], L, Disjoint) :- 
    member(H, L), 
    disjoint(T, L, Disjoint).