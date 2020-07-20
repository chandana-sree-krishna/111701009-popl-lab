datatype 'a Tree = null | Node of ('a Tree * 'a * 'a Tree);

(*
map : __ -> __ -> __
map : () -> 'a Tree -> 'b Tree
map : ('a -> 'b) -> ('a Tree) -> ('b Tree)
*)

fun map f null = null
	| map f (Node(x,r,y)) = (Node( (map f x), f r, (map f y) ) )
	


fun add x = x + 1;

map add (Node(null,1,null));


map add (Node((Node(null,2,null)),1,(Node(null,3,null))));

map add (Node((Node(null,2,null)),1,(Node((Node(null,6,null)),3,(Node(null,7,null))))));

