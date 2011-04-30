TwoDArray := Object clone
TwoDArray dim := method(x, y,
	self _list := list();
	for(i, 0, x-1, _list append(list()));
	self _list foreach(subList,
		for(i, 0, y-1, subList append(0))
	);
	self
)
TwoDArray set := method(x, y, value,
	_list at(x) atPut(y, value)
)
TwoDArray get := method(x, y,
	_list at(x) at(y)
)

test := TwoDArray clone
test dim(4,4)
test set(1,1,3)
test set(0,0,3)
test set(2,2,3)
test set(3,3,3)
for(i, 0, 3, for(j, 0, 3, test get(i,j) print);"" println)
