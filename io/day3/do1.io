Builder := Object clone

Builder depth := 0

Builder forward := method(
	depth repeat (
		write("  ")
	)
	writeln("<", call message name, ">")
	self depth = self depth + 1
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if (content type == "Sequence", 
			depth repeat (
				"  " print
			)
			writeln(content)
		)
	)
	self depth = self depth - 1
	depth repeat (
		write("  ")
	)
	writeln("</", call message name, ">")
)

Builder ul( li("Io"), li("Lua"), li("Javascript"))
