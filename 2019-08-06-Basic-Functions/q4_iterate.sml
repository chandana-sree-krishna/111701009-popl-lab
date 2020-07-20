datatype Nat = O | S of Nat

fun toInt O = 0
	| toInt (S(x)) = 1 + toInt(x);
  
fun iterate f x0 O = x0
	| iterate f x0 (S(O)) = f(x0)
	|	iterate f x0 (S(n)) = f(iterate f x0 n)
	

fun f1 O = (S(O))
	| f1 (S(x)) = S(f1 x)
	

fun plus x y = iterate f1 x y;

toInt(plus (S(S(O))) (S(S(S(O)))));


fun mul (O, y) = O
  | mul (S(O), y) = y
  | mul (S(x), y) = plus y (mul (x, y));
	

toInt(mul ((S(O)),(S(S(O)))) );


fun pow y O = (S(O))
  | pow y (S(O)) = y
  | pow x (S(y)) = mul (x, (pow x y));


pow (S(S(O))) (S(S(O)));

