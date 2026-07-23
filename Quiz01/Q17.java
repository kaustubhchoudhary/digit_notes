class Q17 {

    static {
        System.out.println("Test");
    }

    public static void main(String[] args) {

        Demo.display();
    }
}

class Demo {

    static {
        System.out.println("Demo");
    }

    static void display() {
        System.out.println("Display");
    }
}