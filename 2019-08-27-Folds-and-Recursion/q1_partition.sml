(*
partition : ('a -> bool) -> 'a list -> 'a list * 'a list

partition f_par l

applies f to each element x of l, from left to right, and returns a pair (pos, neg) where pos is
the list of those x for which f x evaluated to true, and neg is the list of those for which f x
evaluated to false. The elements of pos and neg retain the same relative order they possessed in l.

foldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
foldl: f bo [a0,a1,..,an] = f..(f(f bo ao)a1..)an

*)

(*
To check whether it is pos or neg (>0 or not)
check: 'a -> bool
*)

fun check x = if(x > 0) then true
							else false;
							
(*
To evaluate and separate the pos and neg lists
eval: ('a -> bool) -> ('a * ('a list * 'a list) ) -> ('a list * 'a list)
eval: f (x, (pos,neg)) = if(x>0), ([x]@pos, neg)
												 else (pos, [x]@neg); 
*)

fun eval f (x, (pos,neg)) = if f x = true then (pos @ [x], neg)
														else (pos, neg @ [x]);
														
														
(*
partition: ('a -> bool) -> 'a list -> ('a list * 'a list)
The range of foldl will be ([..],[..]), So, bo in foldr is of type ('a list * 'a list)
partition: f_par l = foldr (eval f_par) ([], []) l 
*)

fun partition f_par l = foldl (eval f_par) ([], []) l; 

val p1 = partition check [1,~1,2,~2,3,~3];
