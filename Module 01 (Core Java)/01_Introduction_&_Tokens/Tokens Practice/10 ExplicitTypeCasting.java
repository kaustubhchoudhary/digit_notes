// Demonstrate casts.
class ExplicitTypeCasting{
  public static void main(String args[]) {
    byte b;
    int i = 258;
    double d = 323.142;
    
    System.out.println("\n Conversion of int to byte.");
    b = (byte) i; // Modulus
    System.out.println("\n i: " + i + ", b: " + b);

    System.out.println("\n Conversion of double to int.");
    i = (int) d; // Truncation
    System.out.println("\n d: " + d + ", i: " + i);

    System.out.println("\n Conversion of double to byte.");
    b = (byte) d; // Modulus and Truncation
    System.out.println("\ d: " + d + ", b: " + b);
  }
}