list() proto myAverage := method(
	myTotal := 0;
	myCount := 0;
	foreach(val,
		if(val type != "Number", Exception raise("non-numeric value"));
		myTotal = myTotal + val;
		myCount = myCount + 1
	);
	myTotal / myCount
)

list(1, 2, 3) myAverage println
list(1, 2, "banana") myAverage println