using System.Linq;
using System;

namespace RemoveDuplicates
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            if (args.Length != 1)
            {
                Console.WriteLine("Incorrect number of arguments\n" +
                                  "Usage remove_duplicates.exe < input string >");
            }
            else
            {
                Console.Write(args[0].Distinct().ToArray());
            }
        }
    }
}