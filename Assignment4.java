import java.io.FileWriter;
import java.util.Scanner;

public class Assignment4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int cid;
        String name;
        double balance;

        System.out.print("Enter CID (1-20): ");
        cid = sc.nextInt();

        if (cid < 1 || cid > 20) {
            System.out.println("Invalid CID");
            return;
        }

        System.out.print("Enter Name: ");
        name = sc.next();

        System.out.print("Enter Amount (>=1000): ");
        balance = sc.nextDouble();

        if (balance < 1000) {
            System.out.println("Minimum balance is 1000");
            return;
        }

        while (true) {
            System.out.println("\n1.Deposit 2.Withdraw 3.Display 4.Exit");
            int choice = sc.nextInt();

            if (choice == 1) {
                System.out.print("Enter deposit: ");
                double d = sc.nextDouble();
                if (d > 0) balance += d;
                else System.out.println("Invalid amount");

            } else if (choice == 2) {
                System.out.print("Enter withdraw: ");
                double w = sc.nextDouble();
                if (w > balance) System.out.println("Insufficient balance");
                else balance -= w;

            } else if (choice == 3) {
                System.out.println(cid + " " + name + " " + balance);

            } else {
                break;
            }
        }

        try {
            FileWriter fw = new FileWriter("bank.txt", true);
            fw.write(cid + " " + name + " " + balance + "\n");
            fw.close();
        } catch (Exception e) {
            System.out.println("File error");
        }

        sc.close();
    }
}
