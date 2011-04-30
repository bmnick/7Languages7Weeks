# setup math object
Math := Object clone

# start in on the fibo method
Math fibonacci := method(position,
	if (position < 3,
		1,
		fibonacci(position - 1) + fibonacci(position - 2)
	)
)

Math fiboLoop := method(position,
	if (position < 3,
		1,
		i := 3;
		first := 1;
		second := 1;
		while(i <= position, 
			tmp := first; 
			first = second; 
			second = tmp + first;
			i = i + 1
		);
		second
	)

)

for(i, 1, 8, Math fibonacci(i) print; " " print); nil println
for(i, 1, 8, Math fiboLoop(i) print; " " print); nil println