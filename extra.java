import java.util.Scanner;

public class NumberInStars {

    static String[][] digits = {
        {" ***** ",
         "*     *",
         "*     *",
         "*     *",
         "*     *",
         "*     *",
         " ***** "},
        {"   *   ",
         "   *   ",
         "   *   ",
         "   *   ",
         "   *   ",
         "   *   ",
         "   *   "},
        {" ***** ",
         "*     *",
         "      *",
         " ***** ",
         "*      ",
         "*      ",
         "*******"},
        {" ***** ",
         "      *",
         "      *",
         "  **** ",
         "      *",
         "      *",
         " ***** "},
        {"*     *",
         "*     *",
         "*     *",
         "*******",
         "      *",
         "      *",
         "      *"},
        {"*******",
         "*      ",
         "*      ",
         " ***** ",
         "      *",
         "*     *",
         " ***** "},
        {" ***** ",
         "*      ",
         "*      ",
         " ***** ",
         "*     *",
         "*     *",
         " ***** "},
        {"*******",
         "      *",
         "     * ",
         "    *  ",
         "   *   ",
         "  *    ",
         " *     "},
        {" ***** ",
         "*     *",
         "*     *",
         " ***** ",
         "*     *",
         "*     *",
         " ***** "},
        {" ***** ",
         "*     *",
         "*     *",
         " ******",
         "      *",
         "      *",
         " ***** "}
    };

	public static void main(String[] args) 
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter a number: ");
		String num = sc.nextLine().trim();
		System.out.println();
		
		for(int row = 0; row < 7; row++)
		{
			for(int i = 0; i < num.length(); i++)
			{
				char ch = num.charAt(i);
				
				if(ch >= '0' && ch <= '9')
				{
					int d = ch - '0';
					System.out.print(digits[d][row]);
					System.out.print("   ");
				}
			}
			System.out.println();
		}
		
		sc.close();
	}
}