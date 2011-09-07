class Board(var topLeftValue:String, var topCenterValue:String, var topRightValue:String,
            var centerLeftValue:String, var centerCenterValue:String, var centerRightValue:String,
            var bottomLeftValue:String, var bottomCenterValue:String, var bottomRightValue:String) {
  def this() = this(" ", " ", " ", " ", " ", " ", " ", " ", " ")
  
  def xWinning() = winning("X")

  def oWinning() = winning("O")

  def winning(player:String ) = winningTopLeftDiagonal(player) || winningBottomLeftDiagonal(player) || winningTopHorizontal(player) || winningCenterHorizontal(player) || winningBottomHorizontal(player) || winningLeftVertical(player) || winningCenterVertical(player) || winningRightVertical(player)

  def winningTopLeftDiagonal(player:String) = topLeftValue == player && centerCenterValue == player && bottomRightValue == player
  def winningBottomLeftDiagonal(player:String) = bottomLeftValue == player && centerCenterValue == player && topRightValue == player

  def winningTopHorizontal(player:String) = topLeftValue == player && topCenterValue == player && topRightValue == player
  def winningCenterHorizontal(player:String) = centerLeftValue == player && centerCenterValue == player && centerRightValue == player
  def winningBottomHorizontal(player:String) = bottomLeftValue == player && bottomCenterValue == player && bottomRightValue == player

  def winningLeftVertical(player:String) = topLeftValue == player && centerLeftValue == player && bottomLeftValue == player
  def winningCenterVertical(player:String) = topCenterValue == player && centerCenterValue == player && bottomCenterValue == player
  def winningRightVertical(player:String) = topRightValue == player && centerRightValue == player && bottomRightValue == player
}

val losing = new Board(" ", " ", " ", " ", " ", " ", " ", " ", " ")
if (losing.xWinning)
{
  println("FAIL!")
}

val aWinning = new Board("X", "X", "X", " ", " ", " ", " ", " ", " ")
if (aWinning.xWinning) {
  println("WIN!")
}
