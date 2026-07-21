import java.util.Scanner;

public class SwitchYieldExample {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Ask user for a day number
        System.out.print("Enter day number (1-7): ");
        int day = sc.nextInt();

        // Enhanced switch expression with multiple statements and yield
        String result = switch (day) {
            case 1, 2, 3 -> {       // Multiple cases grouped
                System.out.println("It's a weekday");
                yield "Weekday";
            }
            case 4, 5 -> {
                System.out.println("Almost weekend!");
                yield "Weekday";
            }
            case 6, 7 -> {
                System.out.println("Enjoy your weekend!");
                yield "Weekend";
            }
            default -> {
                System.out.println("Invalid day number entered");
                yield "Invalid";
            }
        };

        System.out.println("Result: " + result);
        sc.close();
    }
}
