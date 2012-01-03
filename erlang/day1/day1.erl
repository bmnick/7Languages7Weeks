-module (day1).
-export ([word_count/1]).
-export ([count_ten/0]).
-export ([error_matcher/1]).

word_count(Sentence) -> length(string:tokens(Sentence, " ,.")).

count_up(10) -> 
	io:fwrite("~w~n", [10]);
count_up(Num) -> 
	io:fwrite("~w~n", [Num]),
	count_up(Num + 1).

count_ten() -> count_up(1).

error_matcher(success) ->
	io:fwrite("success~n");
error_matcher({error, Message}) ->
	io:fwrite("error: ~s~n", [Message]).
