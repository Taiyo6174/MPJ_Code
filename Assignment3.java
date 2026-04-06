import java.util.Scanner;

class Shapes {
    Shapes(double r) { System.out.println("Circle Area: " + (3.14 * r * r)); }
    Shapes(double l, double b) { System.out.println("Rectangle Area: " + (l * b)); }
    Shapes(int s) { System.out.println("Square Area: " + (s * s)); }
    void area(double base, double height) {
        System.out.println("Triangle Area: " + (0.5 * base * height));
    }
}

class Hillstations {
    void famousfood() { System.out.println("Famous Food"); }
    void famousfor() { System.out.println("Famous For"); }
}

class Manali extends Hillstations {
    void famousfood() { System.out.println("Siddu"); }
    void famousfor() { System.out.println("Snow"); }
}

class Mussoorie extends Hillstations {
    void famousfood() { System.out.println("Momos"); }
    void famousfor() { System.out.println("Hills"); }
}

class Gulmarg extends Hillstations {
    void famousfood() { System.out.println("Kashmiri Food"); }
    void famousfor() { System.out.println("Skiing"); }
}

public class Assignment3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter radius: ");
        double r = sc.nextDouble();
        new Shapes(r);

        System.out.print("Enter length and breadth: ");
        double l = sc.nextDouble();
        double b = sc.nextDouble();
        new Shapes(l, b);

        System.out.print("Enter side: ");
        int s = sc.nextInt();
        new Shapes(s);

        Shapes obj = new Shapes(1);
        obj.area(10, 5);

        Hillstations h;

        h = new Manali();
        h.famousfood();
        h.famousfor();

        h = new Mussoorie();
        h.famousfood();
        h.famousfor();

        h = new Gulmarg();
        h.famousfood();
        h.famousfor();

        sc.close();
    }
}
