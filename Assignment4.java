import java.io.*;
import java.util.*;

// Custom Exception
class BankException extends Exception {
    BankException(String msg) {
        super(msg);
    }
}

// Customer Class
class Customer {
    int cid;
    String cname;
    double amount;

    Customer(int cid, String cname, double amount) throws BankException {
        if (cid < 1 || cid > 20)
            throw new BankException("CID must be between 1 and 20");

        if (amount < 1000)
            throw new BankException("Minimum balance must be 1000");

        this.cid = cid;
        this.cname = cname;
        this.amount = amount;
    }

    void deposit(double amt) throws BankException {
        if (amt <= 0)
            throw new BankException("Deposit must be positive");
        amount += amt;
    }

    void withdraw(double amt) throws BankException {
        if (amt > amount)
            throw new BankException("Insufficient balance");
        amount -= amt;
    }

    void display() {
        System.out.println(cid + " " + cname + " " + amount);
    }
}

// 🔥 MAIN CLASS (IMPORTANT NAME)
public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        ArrayList<Customer> list = new ArrayList<>();

        int choice;

        do {
            System.out.println("\n1.Create\n2.Deposit\n3.Withdraw\n4.Display\n5.Exit");
            choice = sc.nextInt();

            try {
                switch (choice) {

                    case 1:
                        System.out.print("Enter CID: ");
                        int cid = sc.nextInt();

                        if (findCustomer(list, cid) != null)
                            throw new BankException("Duplicate CID");

                        System.out.print("Enter Name: ");
                        String name = sc.next();

                        System.out.print("Enter Amount: ");
                        double amt = sc.nextDouble();

                        Customer c = new Customer(cid, name, amt);
                        list.add(c);

                        System.out.println("Account created!");
                        break;

                    case 2:
                        System.out.print("Enter CID: ");
                        int d_id = sc.nextInt();

                        Customer d = findCustomer(list, d_id);
                        if (d == null)
                            throw new BankException("Customer not found");

                        System.out.print("Enter deposit: ");
                        d.deposit(sc.nextDouble());

                        System.out.println("Deposited!");
                        break;

                    case 3:
                        System.out.print("Enter CID: ");
                        int w_id = sc.nextInt();

                        Customer w = findCustomer(list, w_id);
                        if (w == null)
                            throw new BankException("Customer not found");

                        System.out.print("Enter withdraw: ");
                        w.withdraw(sc.nextDouble());

                        System.out.println("Withdrawn!");
                        break;

                    case 4:
                        for (Customer cust : list)
                            cust.display();
                        break;
                }

            } catch (BankException e) {
                System.out.println("Error: " + e.getMessage());
            }

        } while (choice != 5);

        sc.close();
    }

    static Customer findCustomer(ArrayList<Customer> list, int cid) {
        for (Customer c : list) {
            if (c.cid == cid)
                return c;
        }
        return null;
    }
}
