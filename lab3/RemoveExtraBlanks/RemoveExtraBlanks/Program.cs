using System;
using System.IO;
using System.Text;

namespace RemoveExtraBlanks
{
    public class Program
    {
        public static string RemoveExtraBlanks( ref string str)
        {
            str = str.Trim();
            str = System.Text.RegularExpressions.Regex.Replace(str, "\\s+|\\t+", " ");
            return str;
        }

        public static bool CopyFileWithRemoveExtraBlanks( ref string inputFileName, ref string outputFileName) 
        {
            if (!File.Exists(inputFileName))
            {
                Console.WriteLine("Ошибка открытия input файла");
                return false;
            }
            using StreamReader inputFile = new StreamReader(inputFileName, encoding: Encoding.UTF8);

            using StreamWriter outputFile = new StreamWriter(outputFileName, append: false, encoding: Encoding.UTF8);


            string str;
            while((str = inputFile.ReadLine()) != null)
            {
                RemoveExtraBlanks(ref str);
                outputFile.WriteLine(str);
            }
            return true;
        }

        static int Main(string[] args)
        {
            if (args.Length != 2)
            {
                Console.WriteLine("Параметры комадной строки: <name.exe> <input.txt> <output.txt>");
                return 1;
            }
            string inputFileName = args[1];
            string outputFileName = args[2];

            if (!CopyFileWithRemoveExtraBlanks(ref inputFileName, ref outputFileName))
            {
                return 1;
            }
        
            return 0;
        }
    }
}
