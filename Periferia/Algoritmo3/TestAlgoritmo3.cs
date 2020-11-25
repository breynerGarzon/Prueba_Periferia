using Xunit;

namespace Periferia.Algoritmo3
{
    public class TestAlgoritmo3
    {
        [Theory]
        [InlineData("el cielo es muy bonito", "bonito muy es cielo el")]
        [InlineData("prueba de lógica", "lógica de prueba")]
        [InlineData("pruebas para conocer el funcionamiento del algoritmo", "algoritmo del funcionamiento el conocer para pruebas")]
        public void Test_Bingo(string sentence, string expectedSentence)
        {
            CalculateSentence calculate = new CalculateSentence(sentence);
            string reverse = calculate.GetReverseSentence();
            Assert.True(reverse.Equals(expectedSentence));
        }
    }
}