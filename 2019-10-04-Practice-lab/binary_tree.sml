datatype 'a tree = nullTree | Node of ('a tree * 'a * 'a tree)

fun inorder nullTree = []
	| inorder (Node(l,R,r)) = (inorder l)@ [R] @ (inorder r)
	
val inord1 = inorder (Node((Node(Node(nullTree,4,nullTree),2,(Node(nullTree,5,nullTree)))), 1, (Node((Node(nullTree,6,nullTree)),3, (Node(nullTree,7,nullTree) ))) ))

fun preorder nullTree = []
	| preorder (Node(l,R,r)) = [R] @ (preorder l) @ (preorder r)
	
val pre1 = preorder (Node((Node(Node(nullTree,4,nullTree),2,(Node(nullTree,5,nullTree)))), 1, (Node((Node(nullTree,6,nullTree)),3, (Node(nullTree,7,nullTree) ))) ))

fun postorder nullTree = []
	| postorder (Node(l,R,r)) = (postorder l) @ (postorder r) @ [R]
	
val post1 = postorder (Node((Node(Node(nullTree,4,nullTree),2,(Node(nullTree,5,nullTree)))), 1, (Node((Node(nullTree,6,nullTree)),3, (Node(nullTree,7,nullTree) ))) ))

fun mapT f nullTree = nullTree
	| mapT f (Node(l,R,r)) = Node(mapT f l, f R, mapT f r)
	
fun f1 x = x+1

val m1 = inorder ( mapT f1 (Node((Node(Node(nullTree,4,nullTree),2,(Node(nullTree,5,nullTree)))), 1, (Node((Node(nullTree,6,nullTree)),3, (Node(nullTree,7,nullTree) ))) )) )

(*
recTree: 'b
					(('b * 'a * 'b) -> 'b)
					('a Tree -> 'b)
*)

val tree1 = (Node((Node(Node(nullTree,4,nullTree),2,(Node(nullTree,5,nullTree)))), 1, (Node((Node(nullTree,6,nullTree)),3, (Node(nullTree,7,nullTree) ))) ))

val tree = (Node( (Node( (Node(nullTree,4,nullTree)), 2, nullTree)) , 1 , (Node( (Node(nullTree,5,nullTree)), 3, (Node(nullTree,6,nullTree)) )) ));

fun recTree bo f nullTree = bo
	| recTree bo f (Node(l,R,r)) = f ((recTree bo f l), R, (recTree bo f r))
	
fun pre (l,R,r) = (R::l)@r
fun ino (l,R,r) = l@[R]@r
fun post (l,R,r) = l@r@[R]

val p2 = recTree [] pre tree1
val i2 = recTree [] ino tree1
val po2 = recTree [] post tree1

fun rotate (Node((Node(t1,b,t2)),a,t3)) = Node(t1,b,(Node(t2,a,t3)))
	| rotate nullTree = nullTree;
	
val x = (Node( (Node( (Node(nullTree,4,nullTree)), 2, nullTree)) , 1 , (Node( (Node(nullTree,5,nullTree)), 3, (Node(nullTree,6,nullTree)) )) ));

inorder(x);
preorder(x);

val y = rotate(x);

inorder(y);
preorder(y);

