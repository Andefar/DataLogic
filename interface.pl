:- ensure_loaded('inference.pl').
:- ensure_loaded('knowledgebase.pl').

/* Types */
isclass(X) :- kb(X,_,_).
isclass(X) :- kb(_,_,X).
isrelation(R) :- kb(_,R,_).

/* Meta level relationships */
relates(every,X,R,Y) :- ae(X,R,Y).
relates(some,X,R,Y) :- ee(X,R,Y).
relates(no,X,R,Y) :- isclass(X),isclass(Y),isrelation(R), \+ relates(some,X,R,Y).

/* Short cuts */
isa(X,Y) :- ae(X,isa,Y).
overlaps(X,Y) :- isa(Z,X), isa(Z,Y).
disjoint(X,Y) :- isclass(X), isclass(Y),\+ overlaps(X,Y).
secretes(X,Y) :- ae(X,secretes,Y).
haspart(X,Y) :- ae(X,haspart,Y).
