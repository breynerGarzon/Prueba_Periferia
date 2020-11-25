using System.Collections.Generic;

namespace Periferia.Algoritmo2
{
    public class CalculatePrimeNumbers
    {
        private List<long> Primes { get; set; }
        public CalculatePrimeNumbers(int expectedAmount)
        {
            Primes = CalculatePrime(3, expectedAmount, new List<long>() { 1, 2 });
        }

        private List<long> CalculatePrime(int number, int expectedAmount, List<long> listOfPrimes)
        {
            if (IsPrime(number))
            {
                listOfPrimes.Add(number);
                if (listOfPrimes.Count < expectedAmount)
                {
                    return CalculatePrime(number+1, expectedAmount, listOfPrimes);
                }
                else
                {
                    return listOfPrimes;
                }
            }
            else
            {
                return CalculatePrime(number+1, expectedAmount, listOfPrimes);
            }
        }

        private bool IsPrime(int number)
        {
            int quantityDivisors = 0;
            for (int i = 1; i <= number; i++)
            {
                if (number % i == 0)
                {
                    quantityDivisors++;
                    if (quantityDivisors > 2)
                    {
                        return false;
                    }
                }
            }
            if (quantityDivisors == 2)
            {
                return true;
            }
            return false;
        }

        public List<long> GetPrimes()
        {
            return this.Primes;
        }
    }
}