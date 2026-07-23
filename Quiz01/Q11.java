class Q11 {
	// SB1 // SB2 // x: 30 // Get value // 10
    static {
        x = 20;
		System.out.println("Static block 1");
	}

    static {
        x = 30;
		System.out.println("Static block 2");
    }

    static int x = getValue();
	
	static int getValue(){
		System.out.print("x: " + x);
		System.out.print("Get Value");
		return 10;
	}

    public static void main(String[] args) {
        System.out.println(x);
    }
}