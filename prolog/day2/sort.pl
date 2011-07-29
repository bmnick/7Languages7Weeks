minimal([X], X).
minimal([Head|Tail], Min) :- 
	minimal(Tail, TailMin), 
	Min is min(Head, TailMin).

remove([], _, []).
remove(List, Search, List) :- not(member(Search, List)).
remove([Search|Tail], Search, Tail).
remove([Head|Tail], Search, [Head|RemovedTail]) :-
	remove(Tail, Search, RemovedTail).

mysort([], []).
mysort(Unsorted, [Smallest|TailSorted]) :-
	minimal(Unsorted, Smallest),
	remove(Unsorted, Smallest, Tail),
	mysort(Tail, TailSorted), !.
