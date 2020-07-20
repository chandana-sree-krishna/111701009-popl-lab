(*

foldr: ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
nth : 'a list -> int -> 'a option

*)

datatype 'a option = NONE | SOME of 'a


fun consf (x,f) n = if(n=0) then SOME x
										else f (n-1)
										
fun nth n = List.foldr consf (fn x => NONE) n;												
