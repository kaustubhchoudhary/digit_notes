class Q15 {

    static int x = increment();

    static int increment() {
        x += 10;
        return x;
    }

    public static void main(String[] args) {
        System.out.println(x);
    }
}