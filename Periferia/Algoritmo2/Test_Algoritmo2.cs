using Xunit;

namespace Periferia.Algoritmo2
{
    public class Test_Algoritmo2
    {
        [Theory]
        [InlineData(15)]
        [InlineData(50)]
        public void Test_Bingo(int expectedAmount)
        {
            CalculatePrimeNumbers calculate = new CalculatePrimeNumbers(expectedAmount);
            var primes = calculate.GetPrimes();
        }
    }
}