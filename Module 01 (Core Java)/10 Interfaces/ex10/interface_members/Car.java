package ex10.interface_members;

public class Car implements FourWheeler {

    @Override
    public void speed(double distance, double time) {
        System.out.println("\n Car Speed : " + (distance / time));
    }

    @Override
    public void mileage(double distance, double litres) {
        System.out.println("Car Mileage: " + (distance / litres));
    }

}
