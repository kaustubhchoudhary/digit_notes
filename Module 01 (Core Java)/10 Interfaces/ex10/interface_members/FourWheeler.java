package ex10.interface_members;

public interface FourWheeler {
    /* public final static */ int WHEELS = 4;

    /* public abstract */ void speed(double distance, double time);

    default void mileage(double distance, double litres) {
        System.out.println("\n FourWheeler Mileage : " + division(distance, litres));
    }

    private double division(double num, double div) {
        return num / div;
    }

    static void calculateResaleValue(double originalPrice, double years) {
        double currentPrice = multiply(originalPrice, 0.5);
        System.out.println("\n Original Price : " + originalPrice);
        System.out.println("\n Current Price : " + currentPrice);
    }

    private static double multiply(double n1, double n2) {
        return n1 * n2;
    }

}
