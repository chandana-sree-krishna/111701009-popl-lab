
signature COUNTER = sig
	val incr : unit -> unit
	val	set : int -> unit
	val get : unit -> int
end

functor MkCounter () : COUNTER = struct
	val x = ref 0
	fun incr() = x := (!x + 1)
	fun set s = x := s
	fun get() = !x
end

structure A = MkCounter ()
structure B = MkCounter ()

(*
val A1 = A.set 42
val B1 = B.set 56

val A1 = A.get()
val B1 = B.get()

val A1 = A.incr()
val A1 = A.get()

val B1 = B.incr()
val B1 = B.get()
*)
