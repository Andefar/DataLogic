:- ensure_loaded('relation.pl').

/* Inference rules */

ae(CP,R,D) :- ae(C,R,D), isa(CP,C).

ae(C,R,DP) :- ae(C,R,D), isa(D,DP).

ae(C,R,D) :- ee(C,R,D).

/* Functionality */
produces_hormone(C) :- ae(C,produces,D), isa(D,hormone).
