Math := Object clone
Math sumFlat := method(outerList,
	total := 0;
	outerList foreach(innerList, 
		innerList foreach(val,
			total = total + val
		)
	);
)

Math sumFlat(list(list(1, 2, 3), list(1, 2, 3), list(1, 2, 3))) println