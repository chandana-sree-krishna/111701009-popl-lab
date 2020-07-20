fn main()
{
	//Transfer of Ownership	
	
	let x = Box::new(12);
	println!("x = {0}", x);
	let y = x;
	//println!("x = {0}", x);
	println!("y = {0}", y);
	
	let x : Box<i32> = Box::new(19);
	let y : &Box<i32> = &x;
	
	println!("x = {0}", x);
	println!("y = {0}", y);
	
	let x1 = 13;
	{
		let y = &x1;
		println!("x = {0}", x);
		println!("y = {0}", y);
	}
	
	let u = x1;
	println!("x = {0}", x);
	println!("y = {0}", y);
	println!("x = {0}", x);

	
}
