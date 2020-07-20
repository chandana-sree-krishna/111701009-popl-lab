(*
rev l 
	returns a list consisting of l's elements in reverse order.

reverse : 'a list -> 'a list

foldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
foldl: f bo [a0,a1,..,an] = f..(f(f bo ao)a1..)an

*)

(*

(* Using two functions, type of reverse1: ('a -> 'b) ->'a list ->'b list *)
fun identity x = x;
fun rev_list f (x, l) = (f x)::l;
fun reverse1 f l = foldl (rev_list identity) ([]) l;

reverse1 identity [1,2,3];

*)

(* Another Method using only one function *)

(*
R: ('a * 'a list) -> 'b list
*)

fun R (x,y) = x::y;
fun reverse1 l = foldl R ([]) l;


