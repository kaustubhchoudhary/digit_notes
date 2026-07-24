package ex10.interface_members;

public class Jeep implements FourWheeler {

    @Override
    public void speed(double distance, double time) {
        System.out.println("\n Jeep Speed : " + (distance / time));
    }

}
