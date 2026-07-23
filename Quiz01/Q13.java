class Q13 {

    static {

        display();
    }

    static void display() {
        System.out.println(x);
    }

    public static void main(String[] args) {

        x = 20;
        display();
    }
	
	static int x = 10;
}