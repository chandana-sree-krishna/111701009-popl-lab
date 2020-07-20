datatype 'a Tree = null | Node of ('a Tree * 'a * 'a Tree);

(*
recTree: 'b
				 (('b * 'a * 'b) -> 'b)
				 ('a Tree -> 'b)
*)

fun recTree bo f null = bo
	| recTree bo f (Node(l,R,r)) = f ((recTree bo f l) , R, (recTree bo f r));
	

fun pre (x,r,y) = (r::x)@y;

recTree [] pre (Node((Node(null,2,null)),1,(Node(null,3,null))));

val tree = (Node( (Node( (Node(null,4,null)), 2, null)) , 1 , (Node( (Node(null,5,null)), 3, (Node(null,6,null)) )) ));


fun inorder (x,r,y) = x@(r::y);

fun postorder (x,r,y) = x@y@[r];

recTree [] pre tree;
recTree [] inorder tree;
recTree [] postorder tree;







	
