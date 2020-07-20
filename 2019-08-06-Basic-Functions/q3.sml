(* 
Natural no.s:
1. O is a natural no.
2. If n is a natural no., it's successor is a natural No.

O: Nat
if n: Nat,
S (n) : Nat
S : Nat -> Nat

*)

(*
Creating Datatype for Natural Numbers (Nat)
*)

datatype Nat = O | S of Nat

(* plus function

plus = fn: Nat -> Nat ->nat

*)

fun plus O y = y
  | plus (S(x)) y = S (plus x y)

(* mul function

mul = fn: Nat * Nat -> Nat

cond1: O*O = O
cond2: 1*y = y [S(O)=1]
cond3: S(x)*y = adding y S(x) times


*)

fun mul (O, y) = O
  | mul (S(O), y) = y
  | mul (S(x), y) = plus y (mul (x, y));



(*
pow

*)

fun pow y O = S(O)
  | pow y (S(O)) = y
  | pow x (S(y)) = mul(x, (pow x y));
  
(*
helper function
*)
fun toInt O = 0
	| toInt (S(x)) = 1 + toInt(x);
	
toInt(mul( S(S(O)), S(S(S(O))) ));
