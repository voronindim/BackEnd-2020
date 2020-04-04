using System;
using System.Collections.Generic;
using System.Linq;

namespace PasswordStrength
{
    public class Program
    {
        public static int CalculateByLenght( ref string password)
        {
            return 4 * password.Length;
        }

        public static int CalculateByDigitsAmount( ref string password)
        {
            var digitsAmount = password.Where((n) => n >= '0' && n <= '9').Count();
            return digitsAmount *= 4;
        }

        public static int CalculateByUpperLettersAmount( ref string password)
        {
            var upperLettersAmount = password.Where((n) => n >= 'A' && n <= 'Z').Count();
            if (upperLettersAmount != 0)
            {
                return (password.Length - upperLettersAmount) * 2;
            }
            return 0;
        }

        public static int CalculateLowerCaseLettersAmount( ref string password)
        {
            var lowerLettersAmount = password.Where((n) => n >= 'a' && n <= 'z').Count();
            if (lowerLettersAmount != 0)
            {
                return (password.Length - lowerLettersAmount) * 2;
            }
            return 0;
        }

        public static int CalculateByOnlyDigits( ref string password)
        {
            var digits = password.Where((n) => n >= '0' && n <= '9').Count();
            if (digits == password.Length)
            {
                return -digits;
            }
            return 0;
        }

        public static int CalculateByOnlyLetters( ref string password)
        {
            var lettersAmount = password.Count(char.IsLetter);
            if (lettersAmount == password.Length)
            {
                return -lettersAmount;
            }
            return 0;
        }

        public static int CalculateByReapetedCharacters(ref string password)
        {
            int numberOfDuplicates = 0;
            Dictionary<char, int> dictionary = new Dictionary<char, int>();
            foreach (char ch in password)
            {
                if (dictionary.ContainsKey(ch))
                {
                    dictionary[ch]++;
                }
                else
                {
                    dictionary.Add(ch, 1);
                }
            }
            foreach (var item in dictionary)
            {
                if (item.Value > 1)
                {
                    numberOfDuplicates -= item.Value;
                }
            }
            return numberOfDuplicates;
        }

        public int PasswordStength( ref string password)
        {
            int passwordStength = 0;

            passwordStength += CalculateByLenght(ref password);
            passwordStength += CalculateByUpperLettersAmount(ref password);
            passwordStength += CalculateLowerCaseLettersAmount(ref password);
            passwordStength += CalculateByOnlyDigits(ref password);
            passwordStength += CalculateByOnlyLetters(ref password);
            passwordStength += CalculateByReapetedCharacters(ref password);

            return passwordStength;
        }

        public static int Main(string[] args)
        {
            if(args.Length != 1)
            {
                Console.WriteLine("Ошибка ввода комадной строки");
                Console.WriteLine("Параметры комадной строки: <name.exe> <parametr>");
                return 1;
            }

            string password = args[0];



            return 0;
        }
    }
}
