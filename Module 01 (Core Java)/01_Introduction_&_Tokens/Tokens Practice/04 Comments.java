class Comments {
	public static void main(String[] args){
		/*  Multiline comment
			principal = Amount deposited
			rate = rate of Interest
			time = time of deposit
		*/
		
		double principal = 10000, rate = 8.5, time = 5;
		double si;
		
		// Single Line comment
		// Formula to calculate simple interest
		si = (principal*rate*time)/100.0;
		
		System.out.println("\n Simple Interest = " + si);
	}
}