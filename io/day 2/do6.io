TwoDArray := Object clone
TwoDArray dim := method(x, y,
	self _list := list();
	self _x := x;
	self _y := y;
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

TwoDArray writeToFile := method(file,
	self _list foreach(subList,
		subList foreach(value,
			file write(value asString, " ")
		);
		file write("\n")	
	);
	self
)

TwoDArray readFromFile := method(file,
	self _list := list();
	file foreachLine(lineNumber, line,
		_list append(line split)
	);
	self
)

test := TwoDArray clone
file := File clone openForUpdating("do6.out")
test dim(4,4)
test set(1,1,3)
test set(0,0,3)
test set(2,2,3)
test set(3,3,3)
test writeToFile(file)
file rewind
for(i, 0, 3, for(j, 0, 3, test get(i,j) print); "" println)
boop := TwoDArray clone
boop readFromFile(file)
for(i, 0, 3, for(j, 0, 3, boop get(i,j) print); "" println)
file close
