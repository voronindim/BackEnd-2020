using System;
namespace CheckIdentifier
{
    
    internal class Program
    {
        public static bool CheckIdentifier(string ident)
        {
            if ((ident[0] >= 'A' && ident[0] <= 'Z' || ident[0] >= 'a' && ident[0] <= 'z') && (ident != ""))
            {
                for (int i = 1; i < ident.Length; i++)
                {
                    if (!(ident[i] >= 'A' && ident[i] <= 'Z' || ident[i] >= 'a' && ident[i] <= 'z' ||
                        ident[i] >= '0' && ident[i] <= '9'))
                    {
                        Console.WriteLine("No");
                        Console.WriteLine("Встречен неизвестный символ в строке" + "\'" + ident[i] + "\'");
                        return false;
                    }
                }
                Console.WriteLine("Yes");
                return true;
            }
            Console.WriteLine("No");
            return false;
            }
        
        public static bool ParseArg(string[] args)
        {
            if (args.Length == 1)
            {
                return true;
            }
            return false;
        }
        
        public static int Main(string[] args)
        {
            if (!ParseArg(args))
            {
                return 1;
            }

            string ident = args[0];

            if (!CheckIdentifier(ident))
            {
                return 1;
            }
            return 1;
        }
    }
}