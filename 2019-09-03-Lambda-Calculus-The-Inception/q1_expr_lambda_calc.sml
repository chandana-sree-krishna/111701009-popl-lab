(*
e := v | e1 e2 | Lx.e

*)




datatype expr = Var of string
							| App of expr * expr
							| Lambda of string*expr




(*
type x = string ref
fun x  s = ref s


datatype expr = Free of string | App of expr*expr | Lambda of x*expr
*)
