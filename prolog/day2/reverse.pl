reverse([], []).
reverse([Head|Tail], Reverse) :- reverse(Tail, RevTail), append(RevTail, [Head], Reverse).
