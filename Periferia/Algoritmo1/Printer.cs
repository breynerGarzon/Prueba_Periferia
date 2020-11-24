using System;

namespace Periferia.Algoritmo1
{
    public class Printer
    {
        public Printer(int amountPrinter)
        {
            for (int i = 1; i <= amountPrinter; i++)
            {
                this.printValue(i);
            }
        }

        private void printValue(int value)
        {
            bool isMultipleOf3 = IsMultipleOf(value, 3);
            bool isMultipleOf5 = IsMultipleOf(value, 5);
            if (isMultipleOf3 || isMultipleOf5)
            {
                if (isMultipleOf3 && isMultipleOf5)
                {
                    Console.WriteLine("Bingo!");
                }
                else if (isMultipleOf3)
                {

                    Console.WriteLine("Bin");
                }
                else
                {
                    Console.WriteLine("Go");
                }
            }
            else
            {
                Console.WriteLine(value);
            }
        }

        private bool IsMultipleOf(int value, int multiple)
        {
            if (value % multiple == 0)
            {
                return true;
            }
            return false;
        }
    }
}