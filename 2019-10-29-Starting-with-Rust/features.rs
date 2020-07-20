fn main()
{

	let x = 10;
	let mut y = 100;
	
	println!("x = {0} and y = {1}", x, y);
	y = 42;
	println!("x = {0} and y = {1}", x, y);
	y = x;
	//x = 5;
	println!("x = {0} and y = {1}", x, y);
	
	let xbox = Box::new(10);
	println!("xbox = {0}", xbox);
	
	let ybox = xbox;
	//println!("xbox = {0}", xbox);
	println!("ybox = {0}", ybox);
	
	let zbox = &ybox;
	println!("ybox = {0} and zbox = {1}", ybox, zbox);

}
