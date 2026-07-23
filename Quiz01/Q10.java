class Q10 {

    static int x = getValue();

    static int getValue() {
        System.out.println("Method");
        return 100;
    }

    public static void main(String[] args) {
        System.out.println(x);
    }
}