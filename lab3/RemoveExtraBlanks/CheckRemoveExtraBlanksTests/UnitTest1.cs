using Microsoft.VisualStudio.TestTools.UnitTesting;
using RemoveExtraBlanks;

namespace CheckRemoveExtraBlanksTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void RemoveExtraBlanks_String_WithExtraBlanks()
        {
            string str = "\tHello    World\t";
            string resultStr = "Hello World";
            Assert.AreEqual(resultStr, Program.RemoveExtraBlanks(ref str));
        }

        [TestMethod]
        public void RemoveExtraBlanks_String_WithoutExtraBlanks()
        {
            string str = "Hello World";
            string resultStr = "Hello World";
            Assert.AreEqual(resultStr, Program.RemoveExtraBlanks(ref str));
        }
    }
}
