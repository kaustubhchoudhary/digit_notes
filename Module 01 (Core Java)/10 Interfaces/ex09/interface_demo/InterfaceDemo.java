package ex09.interface_demo;

public class InterfaceDemo {

    public static void main(String[] args) {

        Rockstar rockstar = new Rockstar();

        if (rockstar instanceof RacingCycle) {
            System.out.println("Permit for mass production");
        } else {
            System.out.println("Satisfy the criteria");
        }

    }

}
