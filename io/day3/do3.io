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

Builder := Object clone do(

		depth := 0

		forward := method(
			# print indent
			depth repeat (
				write("  ")
			)

			write("<", call message name)

			# Increase indentation
			self depth = self depth + 1

			call message arguments foreach(i, arg,

				# first argument is not a Map, close the <>s
				if((arg asString beginsWithSeq("curlyBrackets") == false) and (i == 0),
					writeln(">")
					)

				# recurse as necessary
				content := self doMessage(arg);

				# Handle properties map
				if (content type == "Map",
					content foreach(prop,value,
						write(" ", prop, "=\"", value, "\"")
						)
					writeln(">")
					)
			
				# handle content string
				if (content type == "Sequence", 
					depth repeat (
						"  " print
					)
					writeln(content)
				)
			)
			# drop out indentation
			self depth = self depth - 1

			# print indentation
			depth repeat (
				write("  ")
			)

			# close tag
			writeln("</", call message name, ">")
	)
)

Builder ul( li("Io"), li("Lua"), li("Javascript"))
"--------" println
s := File with("do3.ixml") openForReading contents
xml := Builder doString(s)
