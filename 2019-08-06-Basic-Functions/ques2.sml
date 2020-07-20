(* ML function for fst : 'a * 'b * 'c -> 'a

fst : 'a * 'b * 'c -> 'a

#Description:
Domain: 'a * 'b * 'c;
Range: 'a;
*)
 
fun fst (x, y, z) = x

fun fst (x, _, _) = x



(* ML function for snd : 'a * 'b * 'c -> 'b

snd : 'a * 'b * 'c -> 'b

#Description:
Domain: 'a * 'b * 'c;
Range: 'b;
*)

fun snd (x, y, z) = y
fun snd (_, y, _) = y


(* ML function for thd : 'a * 'b * 'c -> 'c

thd : 'a * 'b * 'c -> 'c

#Description:
Domain: 'a * 'b * 'c;
Range: 'c;
*)

fun thd (x, y, z) = z
fun thd (_, _, z) = z
