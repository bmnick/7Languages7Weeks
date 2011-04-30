// Evaluate 1 + 1 and then 1 + "one".  is Io strongly typed or weakly typed? Support your answer with code
1 + 1 // 2
1 + "one" 
//Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
//---------
//message '+' in 'Command Line' on line 1
// Io is strongly typed, cannot mix operands

// Is 0 true or false? What about the empty string? Is nil true or false?
0 and true // false
"" and true // false
nil and true // false

// How can you tell what slots a prototype supports?
Object slotNames contains("slot?")

// What is the difference between =, := and ::=? When would you use each one?
// 
//   = 	† 	set a currently existing slot to a given value
//  := 	† 	Create a new slot with given value or reset slot
// ::=	†	Create a new slot, assign a value, and create a setter
Foo := Object clone
Foo bar ::= "blah" // bar slot, and setBar method for modifying
Foo baz := "blah" // bar slot, but no setter created
Foo baz = "blah" // slot must exist
Foo setBar("woo!")