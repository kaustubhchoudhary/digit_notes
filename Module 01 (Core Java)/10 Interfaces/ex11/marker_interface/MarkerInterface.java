package ex11.marker_interface;

interface Ticket {

}

class Viewer implements Ticket {

}

public class MarkerInterface {
    public static void main(String[] args) {

        Viewer viewer = new Viewer();

        if (viewer instanceof Ticket) {
            System.out.println("Watch movie");
        } else {
            System.out.println("Buy ticket");
        }

    }
}
