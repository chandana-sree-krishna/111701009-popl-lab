datatype 'a Tree = null | Node of ('a Tree * 'a * 'a Tree);

fun preorder null = []
	| preorder (Node(x,r,y)) = [r]@(preorder (x))@(preorder (y));
	

preorder (Node((Node(null,2,null)),1,(Node(null,3,null))));

preorder (Node((Node(null,2,null)),1,(Node((Node(null,6,null)),3,(Node(null,7,null))))));

fun inorder null = []
	| inorder (Node(x,r,y)) = (inorder (x))@[r]@(inorder (y));
	
inorder (Node((Node(null,2,null)),1,(Node(null,3,null))));

inorder (Node((Node(null,2,null)),1,(Node((Node(null,6,null)),3,(Node(null,7,null))))));

fun postorder null = []
	| postorder (Node(x,r,y)) = (postorder (x))@(postorder (y))@[r];
	
postorder (Node((Node(null,2,null)),1,(Node(null,3,null))));

postorder (Node((Node(null,2,null)),1,(Node((Node(null,6,null)),3,(Node(null,7,null))))));

preorder (Node( (Node( (Node(null,4,null)), 2, null)) , 1 , (Node( (Node(null,5,null)), 3, (Node(null,6,null)) )) ));

inorder (Node( (Node( (Node(null,4,null)), 2, null)) , 1 , (Node( (Node(null,5,null)), 3, (Node(null,6,null)) )) ));

postorder (Node( (Node( (Node(null,4,null)), 2, null)) , 1 , (Node( (Node(null,5,null)), 3, (Node(null,6,null)) )) ));
