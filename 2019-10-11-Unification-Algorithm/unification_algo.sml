(* Datatype to define Monotype *)

datatype mono = Basic of string | Var of string | Arrow of (mono * mono)

exception UnableToUnify

(* Function mention checks whether alpha is FV or not *)
fun mention alpha (Var beta) = (alpha = beta)
	| mention alpha (Basic b) = false
	| mention alpha (Arrow (e1, e2)) = (mention alpha e1) orelse (mention alpha e2)



(* The below structure has the signature ORD_MAP. *)

structure Map = RedBlackMapFn (struct
		type ord_key = string
		fun compare (str1,str2) = String.compare (str1,str2)
		end)

type telescope = mono Map.map

(*	subst: telescope -> mono -> mono	*)

fun subst telescope (Basic b) = Basic b
	| subst telescope (Var alpha) = (	case (Map.find(telescope, alpha)) of
																				SOME x => subst telescope x
																		  | NONE   => Var alpha 	
																	)
	| subst telescope (Arrow(t1,t2)) = let
																				val T1 = subst telescope t1
																				val T2 = subst telescope t2
																			in
																				Arrow(T1, T2)
																			end

 
(*	SUBST: telescope -> mono*mono -> mono*mono	*) 

fun SUBST E (t1,t2) = (subst E t1, subst E t2)



(*	unifyList : (mono * mono)list -> telescope	*)

fun unifyList [] = Map.empty
	| unifyList ((t1,t2)::ts) = let 
																val E  = unify (t1,t2)
																val Ts = List.map(SUBST E)ts
																val EP = unifyList Ts
															in
																Map.unionWith(fn(x,y) => if(x <> y) then raise UnableToUnify else x)(E,EP)
															end         


(*	unify: mono * mono -> telescope *)

and unify (Var alpha, Var beta)     = if(alpha = beta) then 
																				Map.empty
																			else 
																				Map.singleton (alpha, Var beta)
	
	| unify (Var alpha, Basic b)      = Map.singleton(alpha, Basic b)
	| unify (Var alpha, Arrow(t1,t2)) = if(((mention alpha t1) orelse (mention alpha t2) ) = true) then
																				raise UnableToUnify
																			else
																				Map.singleton(alpha, Arrow(t1,t2))
	
	| unify (Basic b, Var alpha) 			= Map.singleton(alpha, Basic b)
	| unify (Basic b1, Basic b2) 			= if (b1 <> b2) then
																				raise UnableToUnify
																		 else
																		 		Map.empty
	| unify (Basic b, Arrow(t1, t2)) 	= raise UnableToUnify
	
	
	| unify (Arrow(t1,t2), Var alpha) = if(((mention alpha t1) orelse (mention alpha t2) ) = true) then
																				raise UnableToUnify
																			else
																				Map.singleton(alpha, Arrow(t1,t2))
	| unify (Arrow(t1,t2), Basic b)		= raise UnableToUnify
	| unify (Arrow(t11,t12), Arrow(t21,t22)) = unifyList [(t11,t21),(t12,t22)]
	
	
(*
val telescope = unifyList [(Var "alpha", Arrow (Basic "abc", Basic "def"))]
val telescope_list = Map.listItemsi telescope
*)

(*
val telescope = unifyList [(Var "alpha", Basic "abc")]
val telescope_list = Map.listItemsi telescope


val t = unify(Var "alpha", Basic "int")
val t1 = Map.listItemsi t
*)
(*
val t2 = unify(Basic "b", Arrow(Basic "t1",Basic "t2"))
*)

(*
val t = unify(Arrow(Var "t1", Var "t2"), Arrow(Var "t3", Var "t4"))
val tl = Map.listItemsi t
*)

val x = Arrow (Var "t1", Var "t2")
val y = Arrow (Var "t3", Var "t4")
val z = Arrow(Var "t5", Var "t6")
val t = unifyList[(x,Arrow(y,z))]
val tl = Map.listItemsi t
