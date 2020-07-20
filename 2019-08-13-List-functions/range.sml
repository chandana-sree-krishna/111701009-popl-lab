(* range = fn : int -> int -> int list *)

fun range n m = if (n <= m) then n::range (n+1) m
  							 else [];
 
(* mul = fn : int * int -> int *)
 							 
fun mul(x,y) = x*y;

(* fact = fn : int -> int *)
(* foldr : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b *)

fun fact x = foldr mul 1 (range 1 x);

fact 5;

fact 10;
