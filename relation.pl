:- ensure_loaded('knowledgebase.pl').

/* isa relationship */
isa(X,X).
isa(X,Y) :- kb(X,isa,Z),isa(Z,Y).
overlap(X,Y) :- isa(Z,X), isa(Z,Y).
disjoint(X,Y) :- overlap(X,Y),!,fail.
disjoint(X,Y).

/* haspart relationship */
ae(X,haspart,Y) :- kb(X,haspart,Y).
ae(X,haspart,Z) :- kb(Y,haspart,Z), ae(X,haspart,Y).


/* produces relationship */
produces(X,Y) :- kb(X,produces,Z),produces(Z,Y).




/*
nat(o).
nat(s(N)) :- nat(N)

levels:
1: simple match in kb
2: which cell produces hormon? put together two fact from kb. put togehter by inference rule.
3: ...
*/