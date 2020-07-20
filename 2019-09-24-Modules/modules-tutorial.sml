structure A
= struct

type t = int
val v = 42
fun f x = x + 1

end      


structure B :
    sig
	type t
	val v : t
	val f : t -> t
    end

= struct

datatype t = Foo of int | Bar of bool
val v = Foo 42

fun fromInt x = x > 0
fun fromBool true   = 1
  | fromBool false  = 0 			

fun f (Foo x) = Bar (fromInt x)
  | f (Bar x) = Foo (fromBool x)


end		    
		    
signature MYSIG = sig
    type t
    val v : t
    val f : t -> t
end

structure C : MYSIG = struct

type t  = int
val  v   = 42
fun  f x = x + 1
end		  
