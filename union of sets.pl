% Union of two lists
union([], L, L).
union([H|T], L, Union) :- 
    member(H, L), 
    union(T, L, Union).
union([H|T], L, [H|Union]) :- 
    \+ member(H, L), 
    union(T, L, Union).