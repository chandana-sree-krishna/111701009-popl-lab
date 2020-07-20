datatype expr = Var of string
							| App of expr * expr
							| Lam of string * expr
							
fun delete (item, list) = List.filter(fn x => x <> item) list
							
fun free (Var(x)) = [x]
	| free (App(e1,e2)) = (free e1) @ (free e2)
	| free (Lam(x,e)) = delete (x, (free e))
	
fun bound (Lam(x,e)) = [x]
	| bound _ = []
	
val L = Lam("x",App(Var("x"), Var("y")))

val fv = free L
val bv = bound L

fun foo(x,y) = if(String.size(x) >= String.size(y)) then x
							 else y
							 
fun longest (xs) = foldl foo "" xs

fun fresh [] = "x"
	| fresh xs = concat [longest xs, "x"]
	
val f1 = fresh ["a", "abcde", "acd", "ab"]	

fun subst (Var(x)) y e2 = if(x = y) then e2 else Var(x)
	| subst (App(f,a)) x e2 = App((subst f x e2), (subst a x e2))
	| subst (Lam(y,a)) x e2 = if(y=x) then (Lam(y,a))
														else Lam(y, (subst a x e2))
														
val E3 = Lam("x",App(Var("x"),Var("y")))

val E1 = Lam("x",Var("y"))
val E2 = Var("z")


val S1 = subst E1 "x" E2
val S2 = subst E3 "x" E2
val S3 = subst E1 "y" E2
