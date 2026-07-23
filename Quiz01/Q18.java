class Q18 {

    static int x = 10;

    static {
        x = display();
    }

    static int display() {
        System.out.println(x);
        return x + 10;
    }

    public static void main(String[] args) {

        System.out.println(x);
    }
}