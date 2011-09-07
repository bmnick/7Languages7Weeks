// Compute total 
def foldingCount(inList: List[String]) = {
	inList.foldLeft(0)((count, curItem) => count + curItem.size)
}

def foldingCountAlt(inList: List[String]) = {
	(0 /: inList) ((count, curItem) => count + curItem.size)
}

println("count of list [\"abcd\", \"b\"] should be 5, is: "+foldingCount(List("abcd", "b")))
println("Alt count of list [\"abcd\", \"b\"] should be 5, is: "+foldingCountAlt(List("abcd", "b")))

// Write a Censor trait with a method that will replace curse words
// Shoot -> Pucky, Darn -> Beans
// Use a map to store curses and alternatives
trait Censor {
	val censorWords = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
	
	def censor(dirty: String) = {
		dirty.split(' ').map(word => if(censorWords.contains(word)) censorWords(word) else word).foldLeft("")((string, word) => string + " " + word)
	}
}

class Censorer extends Censor {
	
}

val cen = new Censorer

println(cen.censor("Hello, World!"))
println(cen.censor("Shoot Darn it all!"))
println(cen.censor("Shoot, Darn it all!")) // TODO: currently not supported(splitting on ,s)

// Load the curses and alternatives from a file