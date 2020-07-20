(*
val map = fun : _ -> _ -> _
							: ('a->'b) -> 'a list -> 'b list
*)

fun map f (x::xs) = (f x)::(map f xs)
	| map f [] = [] 
