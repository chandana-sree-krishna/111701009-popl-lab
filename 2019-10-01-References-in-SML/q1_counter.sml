signature COUNTER = sig
	val incr : unit -> unit
	val	set : int -> unit
	val get : unit -> int
end

structure Counter : COUNTER = struct
	val x = ref 0
	fun incr() = x := (!x + 1)
	fun set s = x := s
	fun get() = !x
end


val r1 = Counter.get()
val r2 = Counter.incr()
val r3 = Counter.set 10
val r4 = Counter.get()
val r5 = Counter.incr()
val r6 = Counter.get()

