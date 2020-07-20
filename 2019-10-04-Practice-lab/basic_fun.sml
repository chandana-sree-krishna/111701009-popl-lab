fun curry f x y = f (x,y)
fun uncurry f(x,y) = f x y

fun fst (x,_,_) = x
fun snd (_,y,_) = y
fun thd (_,_,z) = z

val f1 = fst ("a", "b", "c")
val s1 = snd ("a", "b", "c")
val t1 = thd ("a", "b", "c")

datatype Nat = O | S of Nat

fun toInt O = 0
	| toInt (S x) = 1 + (toInt x)

fun plus y O = y
	| plus y (S x) = S(plus y x)
	

val p1 = toInt(plus (S(S(O))) (S(S(S(O)))) )

fun mul y O = O
	| mul y (S x) = plus y  (mul y x)
	
val m1 = toInt(mul (S(S(O))) (S(S(S(O)))) )

fun pow y O = S(O)
	| pow y (S x) = mul y (pow y x)
	
val pw1 = toInt(pow (S(S(O))) (S(S(S(O)))) )

fun iterate f x0 O = x0
	| iterate f x0 (S n) = f (iterate f x0 n)
	
fun f1 O = S(O)
	| f1 (S x) = S(f1 x)
	
fun plusi x y = iterate f1 x y 

(*
fun f2 O = S(O)
	| f2 (S x) = plusi x (f2 x)

val pi1 = toInt(plusi (S(S(O))) (S(S(S(O)))) )
	
fun muli x y = iterate f2 (S(O)) y

val mi1 = toInt(muli (S(S(S(O)))) (S(S(S(O)))) )

*)
