package ex10.interface_members;

public class InterfaceMembers {
    public static void main(String[] args) {

        System.out.println(FourWheeler.WHEELS);
        System.out.println(Car.WHEELS);
        System.out.println(Jeep.WHEELS);

        // FourWheeler.WHEELS = 3;
        FourWheeler fourWheeler = new Jeep(); // upcasting & RTP
        fourWheeler.speed(200, 2);
        fourWheeler.mileage(100, 2);

        fourWheeler = new Car();
        fourWheeler.speed(200, 4);
        fourWheeler.mileage(100, 1);

        // Child class can use static variables but not static methods of parent
        // interface
        FourWheeler.calculateResaleValue(1000000, 5);

    }
}
