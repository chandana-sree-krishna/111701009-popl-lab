datatype 'a Tree = null | Node of ('a Tree * 'a * 'a Tree);

fun inorder null = []
	| inorder (Node(x,r,y)) = (inorder (x))@[r]@(inorder (y));
	
fun preorder null = []
	| preorder (Node(x,r,y)) = [r]@(preorder (x))@(preorder (y));

fun rotate (Node((Node(t1,b,t2)),a,t3)) = Node(t1,b,(Node(t2,a,t3)))
	| rotate null = null;

(*	
inorder (rotate (Node((Node(null,2,null)),1,(Node(null,3,null)))));

inorder (rotate (Node((Node(null,2,null)),1,(Node((Node(null,6,null)),3,(Node(null,7,null)))))));
*)

val x = (Node( (Node( (Node(null,4,null)), 2, null)) , 1 , (Node( (Node(null,5,null)), 3, (Node(null,6,null)) )) ));

inorder(x);
preorder(x);

val y = rotate(x);

inorder(y);
preorder(y);

