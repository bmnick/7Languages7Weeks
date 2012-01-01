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
	var censor_words:Map[String,String] = null

	def censorWords():Map[String, String] = {
		if(censor_words == null){
			load_censor_words
		}
		censor_words
	}

	def load_censor_words() = {
		val source = io.Source.fromFile("censors.json")
		val lines = source.mkString
		source.close()

		val parsed = scala.util.parsing.json.JSON.parseFull(lines)

		censor_words = parsed match {
			case Some(map) => map.asInstanceOf[Map[String, String]] // Awful stuff, but give me my dynamic typing back if it's this type of language!
			case _ => null
		}
	}
	
	def censor(dirty: String) = {
		val repl_dict = censorWords()
		dirty.split("""[ ,]+""").map(word => 
			if(repl_dict.contains(word)) repl_dict(word) else word).foldLeft("")((string, word) => 
				string + " " + word)
	}
}

class Censorer extends Censor {
	
}

val cen = new Censorer

println(cen.censor("Hello, World!"))
println(cen.censor("Shoot Darn it all!"))
println(cen.censor("Shoot, Darn it all!")) // TODO: currently modifies string slightly

// Load the curses and alternatives from a file
// JSON file input for the alternatives