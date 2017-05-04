/* isa relationship */
isa(X,X).
isa(X,Y) :- kb(X,isa,Z),isa(Z,Y).
overlap(X,Y) :- isa(Z,X), isa(Z,Y).
disjoint(X,Y) :- overlap(X,Y),!,fail.
disjoint(X,Y).

/* haspart relationship */
ae(X,haspart,Y) :- kb(X,haspart,Y).
ae(X,haspart,Y) :- kb(X,haspart,Z), ae(Z,haspart,Y).

/* Relationship inheritance */
ae(CP,R,D) :- isa(CP,C), CP \= C, ae(C,R,D).
ea(C,R,DP) :- isa(DP,D), DP \= D, ea(C,R,D).
aa(CP,R,D) :- isa(CP,C), CP \= C, aa(C,R,D).
aa(C,R,DP) :- isa(DP,D), DP \= D, aa(C,R,D).

/* Relationship generalization */
ae(C,R,DP) :- isa(D,DP), DP \= D, ae(C,R,D).
ee(CP,R,D) :- isa(C,CP), CP \= C, ee(C,R,D).
ee(C,R,DP) :- isa(D,DP), DP \= D, ae(C,R,D).
ea(CP,R,D) :- isa(C,CP), CP \= C, ea(C,R,D).

/* Weakening of quantifier */
ae(C,R,D) :- aa(C,R,D).
ea(C,R,D) :- aa(C,R,D).
ee(C,R,D) :- ae(C,R,D).
ee(C,R,D) :- ea(C,R,D).