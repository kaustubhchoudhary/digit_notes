
class Child extends Parent {

    private void display() {
        System.out.println("Child");
    }

    public static void main(String[] args) {

        Child c = new Child();

        c.display();
    }

}

class Parent {

    private void display() {
        System.out.println("Parent");
    }

}