/* isa relationship */
isa(X,X).
isa(X,Y) :- kb(X,isa,Z),isa(Z,Y).
overlap(X,Y) :- isa(Z,X), isa(Z,Y).
disjoint(X,Y) :- overlap(X,Y),!,fail.
disjoint(_,_).

/* haspart relationship */
ae(X,haspart,Y) :- kb(X,haspart,Y).
ae(X,haspart,Y) :- kb(X,haspart,Z), ae(Z,haspart,Y).

/* secretes relationship */
ae(X,secretes,Y) :- kb(X,secretes,Y).

/* Relationship inheritance */
ae(CP,R,D) :- kb(CP,isa,C), ae(C,R,D).
ea(C,R,DP) :- kb(DP,isa,D), ea(C,R,D).
aa(CP,R,D) :- kb(CP,isa,C), aa(C,R,D).
aa(C,R,DP) :- kb(DP,isa,D), aa(C,R,D).

/* Relationship generalization */
ae(C,R,DP) :- kb(D,isa,DP), ae(C,R,D).
ee(CP,R,D) :- kb(C,isa,CP), ee(C,R,D).
ee(C,R,DP) :- kb(D,isa,DP), ae(C,R,D).
ea(CP,R,D) :- kb(C,isa,CP), ea(C,R,D).

/* Weakening of quantifier */
ae(C,R,D) :- aa(C,R,D).
ea(C,R,D) :- aa(C,R,D).
ee(C,R,D) :- ae(C,R,D).
ee(C,R,D) :- ea(C,R,D).