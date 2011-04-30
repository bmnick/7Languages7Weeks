squareBrackets := method(
	a := list()
	call message arguments foreach(arg,
		a append(doMessage(arg))
	)
	a
)

[ 1, 2, 3, 4, 5 ] println
