structure BinaryTree = struct

datatype 'a Tree = null | Node of 'a Tree * 'a * 'a Tree

fun mapT f (null) = null
  | mapT f (Node(l,R,r)) = Node((mapT f l), (f R), (mapT f r))
			
end
			   

			   
