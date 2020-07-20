fun isEmpty [] = true
	| isEmpty _ = false
	
val e1 = isEmpty []
val e2 = isEmpty [1,2,4]

(*
map  f 'a list = 'b list
map ('a -> 'b) -> 'a list -> 'b list
*)


fun map f [] = []
	| map f (x::xs) = (f x)::(map f xs)
	


fun foldr f [] b = b
	| foldr f (x::xs) b = f x (foldr f xs b)

	
fun foldl f b [] = b
	| foldl f b (x::xs) = f (foldl f b xs) x
	
fun f1 x y = x - y

val fl1 = foldl f1 2 [1,2,3,4,5]
val fr1 = foldr f1 [1,2,3,4,5] 2

fun range n m = if (n <= m) then (n::(range (n+1) m))
								else []
								
val r1 = range 1 10

fun f2 x y = x*y
fun factorial n = foldl f2 1 (range 1 n)

val fact1 = factorial 5

