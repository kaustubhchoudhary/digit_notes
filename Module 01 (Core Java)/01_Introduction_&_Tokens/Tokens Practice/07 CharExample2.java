// char variables behave like integers. 
class CharExample2 {
  public static void main(String args[]) {
    char ch1;

    ch1 = 'A';
    System.out.println("ch1 contains " + ch1);

    ch1++;
    System.out.println("ch1 is now " + ch1);
	
	ch1 = ch1 + 1; // Change it to (char)(ch1 + 1)
	
	System.out.println("ch1 is now " + ch1);
  }
}
