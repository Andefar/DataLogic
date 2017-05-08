/* Knowledge base types */
isclass(X) :- kb(X,_,_).
isclass(X) :- kb(_,_,X).
isrelation(R) :- kb(_,R,_).

/* isa relationship */
isa(X,X).
isa(X,Y) :- kb(X,isa,Z),isa(Z,Y).
overlap(X,Y) :- isa(Z,X), isa(Z,Y).
disjoint(X,Y) :- isclass(X),isclass(Y),\+ overlap(X,Y).

/* haspart relationship */
ae(X,haspart,Y) :- kb(X,haspart,Y).
ae(X,haspart,Y) :- kb(X,haspart,Z), ae(Z,haspart,Y).

/* secretes relationship */
ae(X,secretes,Y) :- kb(X,secretes,Y).

/* Relationship inheritance */
ae(CP,R,D) :- kb(CP,isa,C), ae(C,R,D).

/* Relationship generalization */
ae(C,R,DP) :- kb(D,isa,DP), ae(C,R,D).
ee(CP,R,D) :- kb(C,isa,CP), ee(C,R,D).

/* Weakening of quantifier */
ee(C,R,D) :- ae(C,R,D).

/* Meta level relationships */
relates(every,X,isa,Y) :- isa(X,Y).
relates(some,X,isa,Y) :- overlap(X,Y).
relates(no,X,isa,Y) :- disjoint(X,Y).

relates(every,X,R,Y) :- ae(X,R,Y).
relates(some,X,R,Y) :- ee(X,R,Y).
relates(no,X,R,Y) :- isclass(X),isclass(Y),isrelation(R), \+ relates(some,X,R,Y).