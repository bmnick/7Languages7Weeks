-module(speed_test).
-export ([factorial/1]).
-export ([fib/1]).

factorial(0) -> 1;
factorial(N) -> factorial(N-1) * N.

fib(0) -> 1;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).