/* Knowledge base interpretation */
ae(X,R,Y) :- kb(X,R,Y).

/* Relation properties */
ae(X,R,X) :- reflexive(R).
ae(X,R,Y) :- transitive(R), kb(X,R,Z), ae(Z,R,Y).

/* Relationship inheritance */
ae(CP,R,D) :- kb(CP,isa,C), ae(C,R,D).

/* Relationship generalization */
ae(C,R,DP) :- kb(D,isa,DP), ae(C,R,D).
ee(CP,R,D) :- kb(C,isa,CP), ee(C,R,D).

/* Weakening of quantifier */
ee(C,R,D) :- ae(C,R,D).