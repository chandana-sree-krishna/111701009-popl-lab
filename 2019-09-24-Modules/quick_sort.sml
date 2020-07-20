signature SORT = sig
    type t
    val sort : t list -> t list
end

signature ORD_KEY = sig
    type ord_key
    val compare : ord_key * ord_key -> order
end

(*
partition: 'a -> 'a list -> ('a list * 'a list)
*)

functor QSort(O : ORD_KEY) : SORT = struct
	type t = O.ord_key
	fun partitionL pivot [] = []
	  |	partitionL pivot (x::xs) = if(O.compare(pivot,x) = LESS) then x :: (partitionL pivot xs)
	  							   else partitionL pivot xs
	fun partitionG pivot [] = []
	  | partitionG pivot (x::xs) = if(O.compare(pivot,x) = GREATER) orelse (O.compare(pivot,x) = EQUAL) 
	  								then x :: (partitionG pivot xs)
	  							   else partitionG pivot xs
	  							   
	fun sort [] = []
	  | sort (x::xs) = (sort (partitionG x (xs))) @ [x] @ (sort (partitionL x (xs)))
	
end

structure IntOrder : ORD_KEY = struct
type ord_key = int
val compare = fn (x,y) => Int.compare(x,y)
end
			
val l = [5,3,7,9,2,1,6]

structure A = QSort(IntOrder)

val newl = A.sort l

