(*
val foldr : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
    foldr f : -> 'a list -> 'b -> 'b
    foldr f ('a list) : 'b -> 'b
    foldr f ('a list) y : 'b
    foldr f ('a list) y : 'b
*)

fun foldr f [] b = b
  | foldr f (x::xs) b = f x (foldr f xs b);


(*
val foldl : ('b -> 'a -> 'b) -> 'b -> 'a list -> 'b
	foldl f : 'b ->'a list -> 'b
	foldl f b : 'a list -> 'b
	foldl f b ('a list) : 'b
*)

fun foldl f b [] = b
	| foldl f b (x::xs) = f ( foldl f b xs ) x ;


fun f1 x y = x-y;

foldr f1 [1,2,3,4] 2;
foldl f1 2 [1,2,3,4];
