// Demonstrate casts.
class ImplicitTypeCasting{
  public static void main(String args[]) {
    byte b = 5;
    int i;
    double d;
	long l;
    
    System.out.println("\n Conversion of byte to int.");
    i = b;
    System.out.println("i: " + i + ", b: " + b);

    System.out.println("\n Conversion of int into double.");
    i = 257;
	d = i;
    System.out.println("d: " + d + ", i: " + i);

    System.out.println("\n Conversion of double to byte.");
    d = b;
    System.out.println("d: " + d + ", b: " + b);
	
	System.out.println("\n Conversion of long to double.");
    l = 678;
	d = l;
    System.out.println("d: " + d + ", l: " + l);
	
	System.out.println("\n Conversion of double to long.");
	d = 323.142;
	l = d;
	System.out.println("d: " + d + ", l: " + l);
  }
}





