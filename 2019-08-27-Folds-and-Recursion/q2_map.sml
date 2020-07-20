(*
map: ('a -> 'b) -> 'a list -> 'b list

map f l
applies f to each element of l from left to right, returning the list of results.

foldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
foldl: f init [x1, x2, ..., xn] = f(xn,...,f(x2, f(x1, init))...)

foldr : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
foldr: f init [x1, x2, ..., xn] = f(x1, f(x2, ..., f(xn, init)...))
*)

(*
incr: ('a -> 'b)
	Increments the element
	
in_list: ('a -> 'b) -> 'a * 'b list -> 'b list
in_list: f (x, list) -> incr_list

*)

fun incr x = x+1;

fun in_list f (x, l) = (f x)::l;

fun map f l = foldr (in_list incr) ([]) l;

map incr [0,1,2,3];
