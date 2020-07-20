datatype expr = Var of string
							| App of expr * expr
							| Lambda of string*expr

fun delete (item, list) = List.filter(fn x => x <> item) list							

(*
freeVar :: expr -> [string]
FV(v) = {v}
FV(e1 e2 ) = FV(e1) ∪ FV(e2)
FV(λx.e) = FV(e) \ {x}
*)


fun freeVar (Var(x)) = [x]
	| freeVar (App(f,e)) = (freeVar f) @ (freeVar e)
	| freeVar (Lambda(x,e)) = delete (x ,(freeVar e))
	

val L = Lambda("x",App(Var("x"), Var("y")))

fun boundVar (Lambda(x,e)) = [x]
	| boundVar _ = []


val fv = freeVar (Lambda("x",App(Var("x"), Var("y"))))
val bv = boundVar (L)

