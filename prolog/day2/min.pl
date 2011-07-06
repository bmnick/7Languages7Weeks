minimal([X], X).
minimal([Head|Tail], Min) :- 
	minimal(Tail, TailMin), 
	Min is min(Head, TailMin).
