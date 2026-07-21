import java.util.Scanner;

public class EnhancedSwitch {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Ask user for day number
        System.out.print("Enter day number (1-7): ");
        int day = sc.nextInt();

        // Enhanced switch expression
        String result = switch (day) {
            case 1 -> "Monday";
            case 2 -> "Tuesday";
            case 3 -> "Wednesday";
            case 4 -> "Thursday";
            case 5 -> "Friday";
            case 6 -> "Saturday";
            case 7 -> "Sunday";
            default -> "Invalid";
        };

        System.out.println("Day " + day + " is " + result));

        sc.close();
    }
}
