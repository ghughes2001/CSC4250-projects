% Facts
male(pete).
male(mark).
male(tom).
male(john).
male(frank).
male(matt).
male(henry).
male(todd).

female(anne).
female(lilly).
female(kate).
female(alice).
female(jenny).

parent(pete, mark).
parent(pete, tom).
parent(pete, anne).
parent(mark, lilly).
parent(mark, john).
parent(mark, frank).
parent(tom, kate).
parent(anne, alice).
parent(anne, matt).
parent(matt, jenny).
parent(matt, todd).
parent(alice, henry).

% Rules
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
sister(X, Y) :- female(X), sibling(X, Y).
brother(X, Y) :- male(X), sibling(X, Y).
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).