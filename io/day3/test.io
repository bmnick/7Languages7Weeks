curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg)
		)
	r
)

OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
		)
)

s := File with("test.ixml") openForReading contents
test := doString(s)
test keys println
test values println
