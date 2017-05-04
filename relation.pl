:- ensure_loaded('knowledgebase.pl').

/* isa relationship */
isa(X,X).
isa(X,Y) :- kb(X,isa,Z),isa(Z,Y).

/* haspart relationship */
haspart(X,X).
haspart(X,Y) :- kb(X,haspart,Z),haspart(Z,Y).

/* produces relationship */
produces(X,X).
produces(X,Y) :- kb(X,produces,Z),produces(Z,Y).




/*
nat(o).
nat(s(N)) :- nat(N)

levels:
1: simple match in kb
2: which cell produces hormon? put together two fact from kb. put togehter by inference rule.
3: ...
*/