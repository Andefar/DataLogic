:- ensure_loaded('relation.pl').
/* Inference rules */
/* Relationship inheritance */
ae(CP,R,D) :- ae(C,R,D), isa(CP,C).
ea(C,R,DP) :- ea(C,R,D), isa(DP,D).
aa(CP,R,D) :- aa(C,R,D), isa(CP,C).
aa(C,R,DP) :- aa(C,R,D), isa(DP,D).

/* Relationship generalization */
ae(C,R,DP) :- ae(C,R,D), isa(D,DP).
ee(CP,R,D) :- ee(C,R,D), isa(C,CP).
ee(C,R,DP) :- ae(C,R,D), isa(D,DP).
ea(CP,R,D) :- ea(C,R,D), isa(C,CP).

/* Weakening of quantifier */
ae(C,R,D) :- aa(C,R,D).
ea(C,R,D) :- aa(C,R,D).
ee(C,R,D) :- ae(C,R,D).
ee(C,R,D) :- ea(C,R,D).