using Xunit;

namespace Periferia.Algoritmo1
{
    public class Test_Algoritmo1
    {
        [Theory]
        [InlineData(10)]
        [InlineData(15)]
        public void Test_Bingo(int timesToPrint)
        {
            Printer printerValues =  new Printer(timesToPrint);
        }
    }
}