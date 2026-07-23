class Test {

    static int count = 0;

    Test() {
        count++;
    }

    public static void main(String[] args) {

        new Test();
        new Test();
        new Test();

        System.out.println(count);

    }

}