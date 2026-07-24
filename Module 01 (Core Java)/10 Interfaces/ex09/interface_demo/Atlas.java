package ex09.interface_demo;

public abstract class Atlas implements RacingCycle {

    @Override
    public void bodyType() {
        System.out.println("Streamlined body");
    }

    @Override
    public void gears(int numberOfGears) {
        System.out.println("\n Number of gears : " + numberOfGears);
    }

    // @Override
    // public void run() {
    // System.out.println("run");
    // }

}
