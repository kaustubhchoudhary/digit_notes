class Q16 {

    static int a = 10;
    static int b = a++;
    static int c = ++a;

    public static void main(String[] args) {

        System.out.println(a);
        System.out.println(b);
        System.out.println(c);
    }
}