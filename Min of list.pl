% Minimum of a list
min([H], H). % Base case: the minimum of a single-element list is the element itself.
min([H|T], Min) :- 
    min(T, MinTail), 
    Min is min(H, MinTail).