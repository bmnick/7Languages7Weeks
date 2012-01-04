-module (day2).
-export ([getval/2, getval2/2]).
-export ([totalList/1]).
-export ([checkWinner/1]).

getval(TupleList, Keyword) ->
	Tuple = lists:keyfind(Keyword, 1, TupleList),
	case Tuple of
		{_, Value} ->
			Value;
		_ ->
			false
	end.

getval2(TupleList, Keyword) ->
	Values = [Value || {Key, Value} <- TupleList, Key == Keyword],
	case Values of
		[Found|_] -> Found;
		_ -> false
	end.


totalList(ShoppingList) ->
	[{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].

checkWinner([[Winner, Winner, Winner], [_, _, _], [_, _, _]]) -> isWinner(Winner);
checkWinner([[_, _, _] ,[Winner, Winner, Winner], [_, _, _]]) -> isWinner(Winner);
checkWinner([[_, _, _], [_, _, _], [Winner, Winner, Winner]]) -> isWinner(Winner);
checkWinner([[Winner, _, _], [Winner, _, _], [Winner, _, _]]) -> isWinner(Winner);
checkWinner([[_, Winner, _], [_, Winner, _], [_, Winner, _]]) -> isWinner(Winner);
checkWinner([[_, _, Winner], [_, _, Winner], [_, _, Winner]]) -> isWinner(Winner);
checkWinner([[Winner, _, _], [_, Winner, _], [_, _, Winner]]) -> isWinner(Winner);
checkWinner([[_, _, Winner], [_, Winner, _], [Winner, _, _]]) -> isWinner(Winner);
checkWinner(Board) -> 
	case lists:all(fun(X) -> (X == x orelse X == o) end, lists:flatten(Board)) of
		true -> cat;
		false -> no_winner
	end.

isWinner(x) -> x;
isWinner(o) -> o;
isWinner(_) -> no_winner.