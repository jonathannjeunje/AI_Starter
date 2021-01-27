parent(ace, john).
parent(john, tom).
parent(john, jack).

parent(aba, bill).
parent(bill, cecil).
parent(cecil, david).
parent(aba, brown).
parent(brown, cathy).
parent(cathy, daniel).
parent(daniel, ellen).

wife(cecil, jack).
male(jack).
female(cecil).
male(bill).
male(john).
male(ace).
male(david).
female(aba).
male(brown).
female(cathy).
male(daniel).
female(ellen).
male(tom).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
descendent(X, Y) :- parent(Y, X).
descendent(X, Y) :- parent(Y, Z), descendent(X, Z).
fatherinlaw(X,Y) :- X\==Y, wife(Y, Z), parent(X, Z), male(X).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X\==Y.
siblinginlaw(X, Y) :- wife(Y, Z), sibling(Z, X), X\==Y.

niece(X, Y) :- female(X),  parent(Z, X), sibling(Z, Y).
niece(X, Y) :- female(X),  parent(Z, X), siblinginlaw(Z, Y).
