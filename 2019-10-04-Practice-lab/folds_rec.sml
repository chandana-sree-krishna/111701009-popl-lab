fun check x = if(x>= 0) then true
							else false
							
fun eval f (x, (pos,neg)) = if(f x = true) then (pos@[x], neg)
														else (pos, neg@[x])
														
fun partition f_par l = foldl (eval f_par) ([],[]) l

val p1 = partition check [1,~1,2,~2,3,~3]




fun incr x = x+1
fun in_list f (x,l) = (f x)::l

fun map f l = foldr (in_list f) ([]) l

val t = map incr [0,1,2,3,4,5]




fun R (x,y) = x::y
fun reverse l = foldl R ([]) l;

val r1 = reverse [1,2,3,4,5]




datatype 'a option = NONE | SOME of 'a

fun consf (x,f) n = if(n=0) then SOME x
										else f (n-1)

fun nth n = List.foldr consf (fn x => NONE) n

val n1 = nth [1,2,3,4,5] 3 
