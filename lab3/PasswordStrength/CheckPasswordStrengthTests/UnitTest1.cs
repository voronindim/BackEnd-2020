using Microsoft.VisualStudio.TestTools.UnitTesting;
using PasswordStrength;

namespace CheckPasswordStrengthTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void CalculateByLength_with_correct_password()
        {
            string password = "ab1";
            int sum = 12;
            Assert.AreEqual(sum, Program.CalculateByLenght(ref password));

            password = "";
            sum = 0;
            Assert.AreEqual(sum, Program.CalculateByLenght(ref password));
        }

        [TestMethod]
        public void CalculateByDigitsAmount_()
        {
            string password = "abc11";
            int sum = 8;
            Assert.AreEqual(sum, Program.CalculateByDigitsAmount(ref password));


            password = "";
            sum = 0;
            Assert.AreEqual(sum, Program.CalculateByLenght(ref password));
        }

        [TestMethod]
        public void CalculateByUpperLettersAmount_()
        {
            string password = "aAc11";
            int sum = 8;
            Assert.AreEqual(sum, Program.CalculateByUpperLettersAmount(ref password));


            password = "";
            sum = 0;
            Assert.AreEqual(sum, Program.CalculateByUpperLettersAmount(ref password));
        }

        [TestMethod]
        public void CalculateLowerCaseLettersAmount_()
        {
            string password = "AcA11";
            int sum = 8;
            Assert.AreEqual(sum, Program.CalculateLowerCaseLettersAmount(ref password));


            password = "";
            sum = 0;
            Assert.AreEqual(sum, Program.CalculateLowerCaseLettersAmount(ref password));
        }


        [TestMethod]
        public void CalculateByOnlyDigits_()
        {
            string password = "1122";
            int sum = -4;
            Assert.AreEqual(sum, Program.CalculateByOnlyDigits(ref password));


            password = "";
            sum = 0;
            Assert.AreEqual(sum, Program.CalculateByOnlyDigits(ref password));
        }

        [TestMethod]
        public void CalculateByOnlyLetters_()
        {
            string password = "aabbcc";
            int sum = -6;
            Assert.AreEqual(sum, Program.CalculateByOnlyLetters(ref password));


            password = "";
            sum = 0;
            Assert.AreEqual(sum, Program.CalculateByOnlyLetters(ref password));
        }

        [TestMethod]
        public void CalculateByReapetedCharacters_()
        {
            string password = "abcd1a";
            int sum = -2;
            Assert.AreEqual(sum, Program.CalculateByReapetedCharacters(ref password));


            password = "";
            sum = 0;
            Assert.AreEqual(sum, Program.CalculateByReapetedCharacters(ref password));
        }
    }
}
