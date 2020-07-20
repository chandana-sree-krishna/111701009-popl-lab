datatype expr = Var of string
             | App of expr * expr
             | Lam of string * expr

(*
fresh : string list -> string
			computes a fresh variable name, 
			i.e. fresh xs gives a string x which is different from all strings in xs
*)

(*
val foo = fn : string * string -> string
val longest = fn : string list -> string
*)
fun foo(x ,y) = if(String.size(x) >= String.size(y)) then x else y

val f = foo("ab","abcd")

fun longest (xs) = foldl foo "" xs 

val l = longest ["a", "abcde", "acd", "ab"]

fun fresh [] = "x"
	| fresh xs = concat [longest xs , "x"]
	
val f1 = fresh ["a", "abcde", "acd", "ab"]
