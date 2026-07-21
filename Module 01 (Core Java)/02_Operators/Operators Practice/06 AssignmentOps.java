// Demonstrate compound assignment operators.

class AssignmentOps {

	public static void main(String[] args) {

		int a = 1;
		int b = 2;
		int c = 3;

		a += 5;
		b *= 4;
		c += a * b;
		c %= 6;

		System.out.println("\n a = " + a); // 6
		System.out.println("\n b = " + b); // 8
		System.out.println("\n c = " + c); // 3
	}
}