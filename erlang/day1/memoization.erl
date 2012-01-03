-module (memoization).
-export ([memoize/2]).

memoize(Module, Fun) ->
	case ets:info(Fun) of
		undefined ->
			ets:new(Fun, [public, named_table]);
		_ -> ok
	end,
	fun(Args) -> calc(Module, Fun, [Args]) end.

calc(Module, Fun, Args) -> 
	case ets:lookup(Fun, Args) of
		[] ->
			Value = apply(Module, Fun, Args),
			ets:insert(Fun, {Args, Value}),
			Value;
		[{Args, Value}] ->
			Value
	end.