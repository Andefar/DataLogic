:- ensure_loaded('inference.pl').
:- ensure_loaded('knowledgebase.pl').

/* Meta level relationships */
relates(every,X,isa,Y) :- isa(X,Y).
relates(some,X,isa,Y) :- overlap(X,Y).
relates(no,X,isa,Y) :- disjoint(X,Y).

relates(every,X,R,Y) :- ae(X,R,Y).
relates(some,X,R,Y) :- ee(X,R,Y).
relates(no,X,R,Y) :- isclass(X),isclass(Y),isrelation(R), \+ relates(some,X,R,Y).