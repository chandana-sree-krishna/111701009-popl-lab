(* Tri-variate version of curry *)

(*
Succesive refinement

For tri-variate version,
Type of curry: ('a * 'b * 'c -> 'd) -> 'a -> 'b -> 'c -> 'd
		curry f : 'a -> 'b -> 'c -> 'd
		curry f x : 'b -> 'c -> 'd
		curry f x y : 'c -> 'd
		curry f x y z : 'd
		curry f x y z = f (x, y, z)

*)

fun curry f x y z = f (x, y, z)


(* Tri-variate version of uncurry *)

(*
Type of uncurry: ('a -> 'b -> 'c) -> ('a * 'b -> 'c)

For tri-variate version,
Type of ucurry: ('a -> 'b -> 'c -> 'd) -> ('a * 'b * 'c -> 'd)

*)

fun uncurry f (x, y, z) = f x y z

