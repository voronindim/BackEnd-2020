using Microsoft.VisualStudio.TestTools.UnitTesting;
using CheckIdentifier;

namespace CheckIdentifierTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void CheckIdentifier_ValidIdentifier_TrueReturned()
        {
            Assert.AreEqual(true, Program.CheckIdentifier("abc1"));
            Assert.AreEqual(true, Program.CheckIdentifier("ABD"));
        }

        [TestMethod]
        public void CheckIdentifier_InvalidIdentifier_TrueReturned()
        {
            Assert.AreEqual(false, Program.CheckIdentifier("1abc1"));
            Assert.AreEqual(false, Program.CheckIdentifier("A*BD"));
        }

    }
}
