(* ML function for fst : 'a * 'b * 'c -> 'a

fst : 'a * 'b * 'c -> 'a

#Description:
Domain: 'a * 'b * 'c;
Range: 'a;
*)
 
fun fst (x, y, z) = x
val fst = fn : 'a * 'b * 'c -> 'a

fun fst (x, _, _) = x
val fst = fn : 'a * 'b * 'c -> 'a


(* ML function for snd : 'a * 'b * 'c -> 'b

snd : 'a * 'b * 'c -> 'b

#Description:
Domain: 'a * 'b * 'c;
Range: 'b;
*)

fun snd (x, y, z) = y
fun snd (_, y, _) = y
val snd = fn : 'a * 'b * 'c -> 'b

(* ML function for snd : 'a * 'b * 'c -> 'b

snd : 'a * 'b * 'c -> 'b

#Description:
Domain: 'a * 'b * 'c;
Range: 'b;
*)

fun thd (x, y, z) = z
fun thd (_, _, z) = z
val thd = fn : 'a * 'b * 'c -> 'c
