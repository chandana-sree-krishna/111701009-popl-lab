datatype expr = Var of string
             | App of expr * expr
             | Lam of string * expr

(*
subst :: Expr -> String -> Expr -> Expr

subst e₁ x e₂
	 substitutes in e₁ all free occurance of x by e₂.
*)

fun subst (Var(x)) y e2 = if(x = y) then e2 else Var(x)
	| subst (App(f,a)) x e2 = App((subst f x e2),(subst a x e2))
	| subst (Lam(y,a)) x e2 = if(y = x) then Lam(y,a) 
														else Lam(y,(subst a x e2))
														
val E3 = Lam("x",App(Var("x"),Var("y")))

val E1 = Lam("x",Var("y"))
val E2 = Var("z")


val S = subst E1 "x" E2
